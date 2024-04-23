unit LuaProperties;

{$mode Delphi}{$T+}

interface

Uses Lua;

function LuaGetProperty(L: Plua_State): Integer; cdecl;
function LuaSetProperty(L: Plua_State): Integer; cdecl;
function LuaListProperties(L: Plua_State): Integer; cdecl;
function LuaListMethods(L: Plua_State): Integer; cdecl;
function LuaGetCallable(L: Plua_State): Integer; cdecl;
procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: shortstring; oindex,vindex: Integer; o: TObject);overload;

implementation

Uses SysUtils,
     Classes,
     Math,
     LuaController,
     LuaObject,
     LuaProxy,
     LuaHelper,
     LuaEvent,
     LuaVmt,
     TypInfo;
// ****************************************************************

procedure ListProperty(L: Plua_State; const PName: string; PropType: String);
begin
  UniqueString(PropType);
  if PropType[1] = 'T' then
     delete(Proptype,1,1);
  lua_pushstring(L, PName);
  lua_pushstring(L, PropType);
  lua_rawset(L,-3);
end;

type
  TParams = record
    Count: Integer;
    PropInfos: PPropList;
    L: Plua_State;
  end;
  PParams = ^TParams;

procedure MaybeListOne(Item: TObject; arg: pointer);
var
  Loop,len:Integer;
  p:PParams;
begin
  if TLuaMethodInfo(Item).mf = mfNone then Exit;
  p := PParams(arg);
  len := Length(TLuaMethodInfo(Item).Name);
  for Loop := 0 to p^.Count - 1 do
      if CompareChar(TLuaMethodInfo(Item).Name, p^.PropInfos^[Loop]^.Name, Min(len, Length(p^.PropInfos^[Loop]^.Name))) = 0 then
         Exit;
  ListProperty(p.L, TLuaMethodInfo(Item).Name, 'Unknown');
end;

procedure ListNonPublishedProperties(L: Plua_State; pti: PTypeInfo);
var
  PInfo: PPropInfo;
  pvmt:PLuaVmt;
  p:TParams;
begin
  pvmt := vmts.GetVmt(pti);
  if pvmt = nil then Exit;
  propSets.GetVmt(pti);
  p.L := L;
  p.Count := GetPropList(pti, tkAny, nil);
  GetMem(p.PropInfos, p.Count * SizeOf(PPropInfo));
  GetPropList(pti, tkAny, p.PropInfos, true);
  pvmt^.ForEachCall(MaybeListOne,@p);
  FreeMem(p.PropInfos);
end;

procedure ListObjectProperties(L: Plua_State; pti: PTypeInfo);
var
  Count,Loop:Integer;
  PInfo: PPropInfo;
  PropInfos: PPropList;
begin
     Count := GetPropList(pti, tkAny, nil);
     GetMem(PropInfos, Count * SizeOf(PPropInfo));
     GetPropList(pti, tkAny, PropInfos, true);
     for Loop := 0 to Count - 1 do begin
         PInfo := GetPropInfo(pti, PropInfos^[Loop]^.Name);
         ListProperty(L, PropInfos^[Loop]^.Name, PInfo^.Proptype^.Name);
     end;
     FreeMem(PropInfos);
end;

function LuaPtiHelper(L: Plua_State; const pname: string; var pti: PTypeInfo):Integer;
var
  PObj: TObject;
  cName: string;
begin
  Result := lua_type(L, 1);
  case Result of
    LUA_TSTRING: begin
      cName := lua_tostring(L, 1);
      pti := apiPtis.Find(cName);
    end;
    LUA_TTABLE: begin
      PObj := GetLuaObjectUnsafePop(L, 1); // pop not to confuse CheckArg later
      if PObj <> nil then
          pti := PObj.ClassInfo;
    end;
  end;
  if pti = nil then
      LuaError(L, pname + ' expects API object or Free Pascal classname (don''t remove first ''T'') as first argument', lua_typename(L, Result));
end;

function LuaListProperties(L: Plua_State): Integer; cdecl;
var
  np: Boolean;
  pti: PTypeInfo = nil;
begin
  CheckArg(L, 1, 2);
  LuaPtiHelper(L, 'ListProperties', pti);
  np := lua_toboolean(L, 2);
  lua_newtable(L);
  if not np then
    ListObjectProperties(L, pti)
  else
    ListNonPublishedProperties(L, pti);
  Result := 1;
end;

procedure PushOne(Item: TObject; arg: pointer);
var
  mi: TLuaMethodInfo;
begin
  mi := TLuaMethodInfo(Item);
  if mi.mf = mfNone then begin
    lua_pushstring(Plua_State(arg), mi.Name);
    lua_pushcfunction(Plua_State(arg), mi.pf);
    lua_rawset(Plua_State(arg), -3);
  end;
end;

function LuaListMethods(L: Plua_State): Integer; cdecl;
var
  doInline: Boolean = False;
  pti: PTypeInfo = nil;
  pvmt: PLuaVmt;
begin
  Result := 1;
  case LuaPtiHelper(L, 'ListMethods', pti) of
    LUA_TSTRING:
      CheckArg(L, 1);
    LUA_TTABLE: begin
      CheckArg(L, 1, 2);
      doInline := lua_toboolean(L, 2);
    end;
  end;
  if doInline then
     lua_settop(L, 1)
  else
      lua_newtable(L);
  pvmt := vmts.GetVmt(pti);
  propSets.GetVmt(pti);
  pvmt^.ForEachCall(PushOne, L);
end;

procedure PushPropertyGetter(L: Plua_State; ao: TObject; aPInfo: PPropInfo); forward;

function LuaGetCallable(L: Plua_State): Integer; cdecl;
var
  pName: string;
  pti: PTypeInfo = nil;
  pvmt,pset: PLuaVmt;
  mi: TLuaMethodInfo;
  isSet: boolean;
begin
  CheckArg(L, 2, 4);
  Result := 1;
  LuaPtiHelper(L, 'GetCallable', pti);
  pName := luaL_checkPChar(L, 2, TypeInfo(pName));
  isSet := lua_toboolean(L, 3);
  if not lua_toboolean(L, 4) then begin
    pvmt := vmts.GetVmt(pti);
    pset := propSets.GetVmt(pti);
    if isSet then
       pvmt := pset;
    mi := TLuaMethodInfo(pvmt^.Find(pName));
    if Assigned(mi) then
       lua_pushcfunction(L, mi.pf)
    else
      lua_pushnil(L);
  end else begin
    if not lua_istable(L, 1) then
       LuaError(L, '', 'GetCallable for published properties needs VCLua object');
    if isSet then
       LuaError(L, '', 'Getting callable for set published property is unsupported yet');
    PushPropertyGetter(L, GetLuaObjectUnsafe(L, 1), GetPropInfo(pti, pName));
  end;
end;

// ****************************************************************

type
  TPropertyEnumProc = procedure(Sender: TObject; PropInfo: PPropInfo;
    Storage: TStrings);

procedure EnumProps(Obj: TObject; WithStorage: TStrings;
  Proc: TPropertyEnumProc);
const
  CValidKinds = [tkMethod];
var
  PropList: PPropList;
  PropInfo: PPropInfo;
  PropCount, i: Integer;
begin
  if (Obj = nil) or (WithStorage = nil) or not Assigned(Proc) then
    Exit;
  PropCount := GetPropList(Obj, PropList);
  if PropCount > 0 then
  try
    for i := 0 to PropCount - 1 do
    begin
      PropInfo := PropList^[i];
      if (PropInfo <> nil) and (PropInfo^.PropType^.Kind in CValidKinds) then
        Proc(Obj, PropInfo, WithStorage);
    end;
  finally
    FreeMem(PropList);
  end;
end;

function ExtractName(var Buf: Pointer): ShortString;
begin
  SetLength(Result, Byte(Buf^));
  Inc(Buf, 1);
  if Length(Result) > 0 then
  begin
    Move(Buf^, Result[1], Length(Result));
    Inc(Buf, Length(Result));
  end;
end;

function ExtractParam(var Buf: Pointer): string;
var
  ParamType: record
    Flags: TParamFlags;
    ParamName: ShortString;
    TypeName: ShortString;
  end;
begin
  ParamType.Flags := TParamFlags(Pointer(Buf)^);
  Inc(Buf, SizeOf(TParamFlags));
  ParamType.ParamName := ExtractName(Buf);
  ParamType.TypeName := ExtractName(Buf);
  Result := '';
  if pfVar in ParamType.Flags then
    Result := 'var '
  else
    if pfConst in ParamType.Flags then
      Result := 'const '
    else
      if pfOut in ParamType.Flags then
        Result := 'out '
      else
        if pfArray in ParamType.Flags then
          Result := ' array of ';
  Result := Result + ParamType.ParamName + ': ' + ParamType.TypeName;
end;

procedure WritePropValueToStorage(Sender: TObject; PropInfo: PPropInfo;
  Storage: TStrings);
const
  CMethodKind: array[mkProcedure..mkFunction] of string =
    ('procedure ', 'function ');
var
  TypeData: PTypeData;
  S: string;
  i, ParamCount: Integer;
  Buf: Pointer;
begin
  if not Assigned(PropInfo^.GetProc) then
    Exit;
  case PropInfo^.PropType^.Kind of
    tkMethod:
      begin
        TypeData := GetTypeData(PropInfo^.PropType);
        if TypeData^.MethodKind in [Low(CMethodKind)..High(CMethodKind)] then
        begin
          S := CMethodKind[TypeData^.MethodKind];
          S := S + PropInfo^.Name;
          Buf := @TypeData^.ParamList;
          ParamCount := TypeData^.ParamCount;
          if ParamCount > 0 then
          begin
            S := S + '(';
            for i := 1 to ParamCount - 1 do
              S := S + ExtractParam(Buf) + '; ';
            S := S + ExtractParam(Buf) + ')';
            if TypeData^.MethodKind = mkFunction then
              S := S + ': ' + ExtractName(Buf);
            S := S + ';';
          end;
          Storage.Append(S);
        end;
      end;
  end;
end;

// ****************************************************************
// Sets Property Value
// ****************************************************************
// index is absolute
procedure SetProperty(L:Plua_State; Index:Integer; Comp:TObject; PInfo:PPropInfo; TempPti: PTypeInfo = nil);
Var
  tm: TMethod;
  gotValue:boolean = false;
  vo:TObject;
  ordValue: Int64;
  charValue: Char;
  pti: PTypeInfo;
begin
  pti := PInfo^.Proptype;
  case pti^.Kind of
    tkMethod:
      begin
        TLuaEvent.MaybeFree(GetMethodProp(Comp,PInfo));
        tm := Default(TMethod);
        if not lua_isnil(L,index) then begin
          // yes, we create TLuaEvent and use a method of one of its descendants. Probably they must not have any additional fields
          tm.Data := Pointer(TLuaEvent.Create(L, index));
          tm.Code := eventPtrs.Find(pti^.Name);
          if tm.Code = nil then
             LuaError(L,'Method type not supported!', pti^.Name);
        end;
        SetMethodProp(Comp, PInfo, tm);
      end;
    tkSet:
      begin
        luaL_checkSet(L, index, @ordValue, pti);
        SetOrdProp(Comp, PInfo, ordValue);
      end;
    tkClass:
      begin
        if TempPti = TypeInfo(TStrings) then begin
          vo := TObject(luaL_checkStringList(L, index));
          gotValue := true;
        end else
            luaL_check(L, index, @vo, pti);
        SetObjectProp(Comp, PInfo, vo);
        if gotValue then vo.Free;
      end;
    tkInteger:
      begin
         if lua_type(L, index) <> LUA_TNUMBER then begin
           gotValue := true;
           if pti^.Name='TGraphicsColor' then ordValue := luaL_checkColor(L, index)   // no need to check for TColor
           else if pti^.Name='TShortCut' then ordValue := luaL_checkShortCut(L, index)
           else gotValue := false;
         end;
         if not gotValue then
            luaL_check(L, index, @ordValue, pti);
         SetOrdProp(Comp, PInfo, ordValue);
      end;
    tkChar:
      begin
         luaL_check(L, index, @charValue, pti);
         SetOrdProp(Comp, PInfo, Ord(charValue));
      end;
    tkBool:
      SetOrdProp(Comp, PInfo, Int64(lua_toboolean(L,index)));
    tkEnumeration:
      SetOrdProp(Comp, PInfo, luaL_checkEnum(L, index, pti));
    tkFloat:
      SetFloatProp(Comp, PInfo, luaL_checkDouble(L, index, pti));
    tkString, tkLString, tkAString, tkWString:
      SetStrProp(Comp, PInfo, luaL_checkPChar(L, index, pti));
    tkInt64:
      SetInt64Prop(Comp, PInfo, luaL_checkInt64(L, index, pti));
  else
     LuaError(L, 'Setting published property not supported!', PInfo^.Name + ' of type ' + pti^.Name);
  end;
end;

// ****************************************************************
// Sets Property Values from a Lua table
// ****************************************************************
function SetOrUpdateGeneratedProperty(L: Plua_State; o: TObject; oindex,vindex: Integer; const PropName: shortstring): boolean;forward;
function SetOrUpdatePublishedProperty(L: Plua_State; o: TObject; vindex: Integer; const PropName: shortstring): boolean;forward;

procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: shortstring; oindex, vindex: Integer);overload;inline;
begin
  UpdatePropertiesFromLuaTable(L, UpdatedPropName, oindex, vindex, GetLuaObject(L, oindex));
end;
procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: shortstring; o: TObject; vindex: Integer);overload;inline;
begin
  lua_push(L, o, nil);
  UpdatePropertiesFromLuaTable(L, UpdatedPropName, lua_gettop(L), vindex, o);
end;

function IsUnusualTable(L: Plua_State; absindex: Integer):boolean;
begin
  result := lua_istable(L, absindex) and (GetLuaObjectUnsafe(L, absindex) = nil);
end;

procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: shortstring; oindex,vindex: Integer; o: TObject);overload;
var
  pName: shortstring;
  i,colCount,kindex,pvindex: Integer;
  vo: TObject;
begin
  lua_rawgeti(L, vindex, 1);
  kindex := lua_gettop(L);
  if lua_isnil(L, kindex) then begin
    if o = nil then
       LuaError(L, 'Can''t update properties of a null property', UpdatedPropName);
    // hash table of properties
    // rawgeti result also serves as input to lua_next
    pvindex := kindex + 1;
    while lua_next(L, vindex) <> 0 do begin
      if lua_type(L, kindex) = LUA_TSTRING then begin
        pName := lua_tostring(L, kindex); // important to be typed shortstring, not just PChar, otherwise access violation after exiting SetOrUpdate*
        if not SetOrUpdateGeneratedProperty(L, o, oindex, pvindex, pName) and not SetOrUpdatePublishedProperty(L, o, pvindex, pName) then
           LuaError(L,'Property not found!', o.ClassName+'.'+string(lua_tostring(L, kindex))); // another read for the case of length>255
      end;
      lua_settop(L, kindex);
    end;
  end else if o is TCollection then begin
    // array table of either collection objects or array tables with their properties
    // other collections-with-objects classes should also go here
    // collection-with-nonobjects classes like TStrings are meant to be handled in SetProperty or near CallSetter
    i := 0; // collection index i corresponds to table index i+1
    colCount := TCollection(o).Count;
    pvindex := kindex;
    Dec(kindex);
    repeat
      if IsUnusualTable(L, pvindex) then begin
        if not lua_checkstack(L, 3) then Exit;
        if i < colCount then vo := TCollection(o).Items[i] else vo := TCollection(o).Add();
        UpdatePropertiesFromLuaTable(L, IntToStr(i), vo, pvindex);
      end else begin
        luaL_check(L, pvindex, @vo, GetTypeData(TypeInfo(TCollection(o).ItemClass))^.InstanceTypeRef^);
        if not (vo is TCollectionItem) then LuaTypeError(L, pvindex, GetTypeData(TypeInfo(TCollection(o).ItemClass))^.InstanceTypeRef^);
        if i >= colCount then TCollection(o).Add();
        TCollection(o).Items[i] := TCollectionItem(vo);
      end;
      Inc(i);
      lua_settop(L, kindex);
      {$ifndef LUA51}
      lua_geti(L, vindex, i + 1); // allow meta call
      {$else}
      lua_pushinteger(L, i + 1);
      lua_gettable(L, vindex);
      {$endif}
    until lua_isnil(L, pvindex);
  end else
      LuaError(L, 'Can''t update property from array table, or collection is nil', UpdatedPropName);
end;

function SetOrUpdatePublishedProperty(L: Plua_State; o: TObject; vindex: Integer; const PropName: shortstring): boolean;
var
  PInfo:PPropInfo;
  TempPti: PTypeInfo = nil;
begin
  PInfo := GetPropInfo(o.ClassInfo, PropName);
  if (PInfo = nil) or (not lua_checkstack(L, 2)) then Exit(false);
  if (PInfo^.PropType^.Kind = tkClass) and IsUnusualTable(L, vindex) and not InheritsFrom(PInfo^.PropType, 'TStrings', @TempPti) then
    UpdatePropertiesFromLuaTable(L, PropName, GetObjectProp(o, PInfo), vindex)
  else try
    SetProperty(L, vindex, o, PInfo, TempPti);
    except
      on E: EExternalException do
         raise;
      on E: Exception do
         CallError(L, 'VCL', 'SetPublishedProperty', E.ClassName, E.Message);
    end;
  result := true;
end;

function SetOrUpdateGeneratedProperty(L: Plua_State; o: TObject; oindex,vindex: Integer; const PropName: shortstring): boolean;
var
  pvmt: PLuaVmt;
  mi: TLuaMethodInfo;
  TempPti: PTypeInfo = nil;
begin
  if not lua_checkstack(L, 6) then Exit(false);
  if HasMethod(propSets.GetVmt(o.ClassInfo), PropName, mi) then begin
    if mi.isObj and IsUnusualTable(L, vindex) and not InheritsFrom(mi.pti, 'TStrings', @TempPti) then begin
      if HasMethod(vmts.GetVmt(o.ClassInfo), PropName, mi) then begin
        lua_pushcfunction(L, mi.pf);
        lua_pushvalue(L, oindex);
        lua_call(L, 1, 1);
        UpdatePropertiesFromLuaTable(L, PropName, lua_gettop(L), vindex);
      end else
        LuaError(L, 'Can''t update properties of a property which is only settable', PropName);
    end else if TempPti = nil then
      CallSetter(L, mi, oindex, vindex)
    else begin
      if TempPti = TypeInfo(TStrings) then
         o := luaL_checkStringList(L, vindex)
      else
          LuaTypeError(L, vindex, TempPti);
      lua_push(L, o, TempPti);
      CallSetter(L, mi, oindex, lua_gettop(L));
      o.Free;
    end;
    Exit(true);
  end;
  result := false;
end;

function LuaSetProperty(L: Plua_State): Integer; cdecl;
var
  o: TObject;
  PropName: shortstring;
  len: size_t;
begin
  Result := 0;
  o := GetLuaObjectUnsafe(L, 1);
  PropName := lua_tolstring(L, 2, @len);
  if (len > 255) or (not SetOrUpdateGeneratedProperty(L, o, 1, 3, PropName) and not SetOrUpdatePublishedProperty(L, o, 3, PropName)) then
    if PropName = '_' then
       UpdatePropertiesFromLuaTable(L, PropName, 1, 3, o)
    else begin
      lua_settop(L, 3);
      lua_rawset(L, 1);
    end;
end;

// ****************************************************************
// Gets Property Value
// ****************************************************************
type
  TPropertyPusherProc = procedure(L: Plua_State; o: TObject; PInfo: PPropInfo);
  TPropertyGetter = class
    public
      PInfo: PPropInfo;
      proc: TPropertyPusherProc;
      o: TObject;
      constructor Create(L: Plua_State; ao: TObject; aPInfo: PPropInfo);
  end;

procedure lua_pushPropMethod(L: Plua_State; o: TObject; PInfo: PPropInfo);
var
  m: TMethod;
  ref:Integer = -1;
begin
  m := GetMethodProp(o, PInfo);
  if TObject(m.Data) is TLuaEvent then
     ref := TLuaEvent(m.Data).ref;
  lua_rawgeti(L, LUA_REGISTRYINDEX, ref);
end;
procedure lua_pushPropSet(L: Plua_State; o: TObject; PInfo: PPropInfo);     begin lua_pushSet(L,GetOrdProp(o, PInfo),PInfo^.PropType); end;
procedure lua_pushPropClass(L: Plua_State; o: TObject; PInfo: PPropInfo);   begin CreateTableForKnownType(L, PInfo^.PropType^.Name, GetObjectProp(o, PInfo)); end;
procedure lua_pushPropShortCut(L: Plua_State; o: TObject; PInfo: PPropInfo);begin lua_pushShortCut(L,GetOrdProp(o, PInfo)); end;
procedure lua_pushPropInteger(L: Plua_State; o: TObject; PInfo: PPropInfo); begin lua_push(L,GetOrdProp(o, PInfo)); end;
procedure lua_pushPropChar(L: Plua_State; o: TObject; PInfo: PPropInfo);    begin lua_push(L,Char(GetOrdProp(o, PInfo))); end;
procedure lua_pushPropBool(L: Plua_State; o: TObject; PInfo: PPropInfo);    begin lua_push(L,boolean(GetOrdProp(o, PInfo))); end;
procedure lua_pushPropEnum(L: Plua_State; o: TObject; PInfo: PPropInfo);    begin lua_pushEnum(L,GetOrdProp(o, PInfo),PInfo^.PropType); end;
procedure lua_pushPropFloat(L: Plua_State; o: TObject; PInfo: PPropInfo);   begin lua_push(L,GetFloatProp(o, PInfo)); end;
procedure lua_pushPropString(L: Plua_State; o: TObject; PInfo: PPropInfo);  begin lua_push(L,GetStrProp(o, PInfo)); end;

function GetPublishedPropertyGetter(L: Plua_State; PInfo: PPropInfo): TPropertyPusherProc;
begin
  if PInfo = nil then Exit(nil);
  case PInfo^.Proptype^.Kind of
    tkMethod: Exit(lua_pushPropMethod);
    tkSet: Exit(lua_pushPropSet);
    tkClass: Exit(lua_pushPropClass);
    tkInteger,
    tkInt64,
    tkQWord:
      if PInfo^.Proptype^.Name<>'TShortCut' then
         Exit(lua_pushPropInteger)
      else
          Exit(lua_pushPropShortCut);
    tkChar,
    tkWChar: // noone cares about WChar, right?
      Exit(lua_pushPropChar);
    tkBool: Exit(lua_pushPropBool);
    tkEnumeration: Exit(lua_pushPropEnum);
    tkFloat: Exit(lua_pushPropFloat);
    tkSString,
    tkLString,
    tkAString,
    tkWString:
      Exit(lua_pushPropString);
  else
      LuaError(L, 'Getting published property not supported!', PInfo^.Name + ' of type ' + PInfo^.Proptype^.Name);
  end;
end;

constructor TPropertyGetter.Create(L: Plua_State; ao: TObject; aPInfo: PPropInfo);
begin
  PInfo := aPInfo;
  proc := GetPublishedPropertyGetter(L, PInfo);
  o := ao;
end;

function LuaCallGetter(L: Plua_State): Integer; cdecl;
var
  pg: TPropertyGetter;
begin
  pg := TPropertyGetter(PPointer(lua_touserdata(L, 1))^);
  result := 1;
  pg.proc(L, pg.o, pg.PInfo);
end;

procedure PushPropertyGetter(L: Plua_State; ao: TObject; aPInfo: PPropInfo);
var
  pg: TPropertyGetter;
  top: integer;
begin
  pg := TPropertyGetter.Create(L, ao, aPInfo);
  if pg.PInfo = nil then begin
    pg.Free;
    lua_pushnil(L);
    Exit;
  end;
  ppointer(lua_newuserdata(L, SizeOf(pointer)))^ := pointer(pg);
  top := lua_gettop(L);
  if luaL_newmetatable(L, 'TPropertyGetter') = 1 then begin
    lua_pushliteral(L, '__gc');
    lua_pushcfunction(L, @LuaFpGc);
    lua_rawset(L, top+1);
    lua_pushliteral(L, '__call');
    lua_pushcfunction(L, @LuaCallGetter);
    lua_rawset(L, top+1);
  end;
  lua_setmetatable(L, top);
end;

function GetPublishedProperty(L: Plua_State; Comp: TObject; PropName: shortstring): boolean;
var
  PInfo: PPropInfo;
  getter: TPropertyPusherProc;
begin
  PInfo := GetPropInfo(Comp.ClassInfo, PropName);
  getter := GetPublishedPropertyGetter(L, PInfo);
  Result := Assigned(getter);
  if Result then
    getter(L, Comp, PInfo);
end;

// here go either non-published properties or not properties at all (procedures and class procedures)
// begin+end left for easier 'debugln' insertion
function GetSpecialProperty(L: Plua_State; o: TObject; PropNameLower: shortstring): boolean;
begin
  Result := true;
  if PropNameLower = 'classname' then begin
    // no need for CP conversion
    lua_pushstring(L,o.ClassName);
  end else
    Result := false;
end;

function LuaGetProperty(L: Plua_State): Integer; cdecl;
var
  o: TObject;
  PropName: shortstring;
  mi: TLuaMethodInfo;
begin
  Result := 1;
  o := GetLuaObjectUnsafe(L, 1);
  PropName := lua_tostring(L, 2);
  // first try to get as generated method
  if HasMethod(vmts.GetVmt(o.ClassInfo), PropName, mi) then begin
    lua_pushcfunction(L, mi.pf);
    if mi.mf = mfCall then begin
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
    end;
    Exit;
  end;
  // now try to get as property
  if not (GetPublishedProperty(L, o, PropName) or GetSpecialProperty(L, o, lowercase(PropName))) then begin
    // no rawget needed since it's the first thing Lua tried, also silently return nil for props of length>255
    lua_pushnil(L);
  end;
end;

end.
