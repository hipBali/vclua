unit LuaProperties;

{$mode Delphi}{$T+}

interface

Uses Lua;

function LuaGetProperty(L: Plua_State): Integer; cdecl;
function LuaSetProperty(L: Plua_State): Integer; cdecl;
function LuaListProperties(L: Plua_State): Integer; cdecl;
function LuaListMethods(L: Plua_State): Integer; cdecl;
function LuaGetCallable(L: Plua_State): Integer; cdecl;
procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: String; oindex,vindex: Integer; o: TObject);overload;

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
      PObj := GetLuaObject(L, 1);
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

function LuaGetCallable(L: Plua_State): Integer; cdecl;
var
  pti: PTypeInfo = nil;
  pvmt,pset: PLuaVmt;
  mi: TLuaMethodInfo;
begin
  CheckArg(L, 2, 3);
  Result := 1;
  LuaPtiHelper(L, 'GetCallable', pti);
  pvmt := vmts.GetVmt(pti);
  pset := propSets.GetVmt(pti);
  if lua_toboolean(L, 3) then
     pvmt := pset;
  mi := TLuaMethodInfo(pvmt^.Find(lua_tostring(L, 2)));
  if Assigned(mi) then
     lua_pushcfunction(L, mi.pf)
  else
      lua_pushnil(L);
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
procedure SetProperty(L:Plua_State; Index:Integer; Comp:TObject; PInfo:PPropInfo);
Var
  LuaFuncPInfo: PPropInfo;
  Str: String;
  tm: TMethod;
  cc: TVCLuaControl;
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
        Str := PInfo^.Name;
        if not (Comp is TComponent) then
           LuaError(L, 'Can only set methods on TComponent descendants!', string(Comp.ClassName) + ' isn''t a TComponent, propname ' + lua_tostring(L,index-1));
        // omg watchout!
        cc := GetLuaControl(Comp);
        // OnXxxx_Function
        LuaFuncPInfo := GetPropInfo(cc, Str+'_Function');
        if LuaFuncPInfo = nil then
           LuaError(L,'Method not found!', lua_tostring(L,index-1));
        if not lua_isfunction(L,index) then
           LuaTypeError(L, index, pti);
        // store luafunc in component by LuaCtl
        lua_pushvalue(L, index);
        SetOrdProp(cc, LuaFuncPInfo, luaL_ref(L, LUA_REGISTRYINDEX));
        // setup luaeventhandler
        // OnXxxx -->OnLuaXxxx
        insert('Lua',Str,3);
        tm.Code := cc.MethodAddress(Str);
        if tm.Code = nil then
           LuaError(L,'Method not supported!', Str);
        tm.Data := Pointer(cc);
        SetMethodProp(Comp, PInfo, tm);
      end;
    tkSet:
      begin
        luaL_checkSet(L, index, @ordValue, pti);
        SetOrdProp(Comp, PInfo, ordValue);
      end;
    tkClass:
      begin
        vo := GetLuaObject(L, index);
        if (vo = nil) and InheritsFrom(pti, 'TStrings') then begin
          vo := TObject(luaL_checkStringList(L, index));
          gotValue := true;
        end;
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
      SetStrProp(Comp, PInfo, luaL_checkCP(L, index, pti));
    tkInt64:
      SetInt64Prop(Comp, PInfo, luaL_checkInt64(L, index, pti));
  else
     LuaError(L, 'Setting published property not supported!', string(PInfo^.Name) + ' of type ' + pti^.Name);
  end;
end;

// ****************************************************************
// Sets Property Values from a Lua table
// ****************************************************************
function SetOrUpdateGeneratedProperty(L: Plua_State; oindex,vindex: Integer; const PropName: String): boolean;forward;
function SetOrUpdatePublishedProperty(L: Plua_State; o: TObject; vindex: Integer; const PropName: String): boolean;forward;

procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: String; oindex,vindex: Integer; o: TObject);overload;
var
  pName: String;
  kindex,pvindex: Integer;
begin
  if o = nil then
     LuaError(L, 'Can''t update properties of a null property', UpdatedPropName);
  lua_pushnil(L);
  kindex := lua_gettop(L);
  pvindex := kindex + 1;
  while lua_next(L, vindex) <> 0 do begin
    if lua_type(L, kindex) = LUA_TSTRING then begin
      pName := lua_tostring(L, kindex);
      if not SetOrUpdateGeneratedProperty(L, oindex, pvindex, pName) and not SetOrUpdatePublishedProperty(L, o, pvindex, pName) then
         LuaError(L,'Property not found!', o.ClassName+'.'+pName);
    end;
    lua_settop(L, kindex);
  end;
end;

procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: String; oindex, vindex: Integer);overload;inline;
begin
  UpdatePropertiesFromLuaTable(L, UpdatedPropName, oindex, vindex, GetLuaObject(L, oindex));
end;
procedure UpdatePropertiesFromLuaTable(L: Plua_State; const UpdatedPropName: String; o: TObject; vindex: Integer);overload;inline;
begin
  lua_push(L, o, nil);
  UpdatePropertiesFromLuaTable(L, UpdatedPropName, lua_gettop(L), vindex, o);
end;

function IsPropertyTable(L: Plua_State; absindex: Integer):boolean;
begin
  result := false;
  if lua_istable(L, absindex) then begin
    lua_pushstring(L, HandleStr);
    lua_rawget(L, absindex);
    if lua_touserdata(L, -1) = nil then begin
      lua_rawgeti(L, absindex, 1);
      result := lua_isnil(L, -1);
    end;
  end;
end;

function SetOrUpdatePublishedProperty(L: Plua_State; o: TObject; vindex: Integer; const PropName: String): boolean;
var
  PInfo:PPropInfo;
begin
  PInfo := GetPropInfo(o.ClassInfo, PropName);
  if (PInfo = nil) or (not lua_checkstack(L, 2)) then Exit(false);
  if (PInfo^.PropType^.Kind = tkClass) and IsPropertyTable(L, vindex) then
    UpdatePropertiesFromLuaTable(L, PropName, GetObjectProp(o, PInfo), vindex)
  else begin
    SetProperty(L, vindex, o, PInfo);
  end;
  result := true;
end;

function SetOrUpdateGeneratedProperty(L: Plua_State; oindex,vindex: Integer; const PropName: String): boolean;
var
  pvmt: PLuaVmt;
  mi: TLuaMethodInfo;
begin
  if not lua_checkstack(L, 6) then Exit(false);
  pvmt := GetPropSets(L, oindex);
  if HasMethod(pvmt, PropName, mi) then begin
    if mi.isObj and IsPropertyTable(L, vindex) then begin
      lua_pushliteral(L, 'vmt');
      lua_rawget(L, oindex);
      pvmt := lua_touserdata(L, -1);
      if HasMethod(pvmt, PropName, mi) then begin
        lua_pushcfunction(L, mi.pf);
        lua_pushvalue(L, oindex);
        lua_call(L, 1, 1);
        UpdatePropertiesFromLuaTable(L, PropName, lua_gettop(L), vindex);
      end else
        LuaError(L, 'Can''t update properties of a property which is only settable', PropName);
    end else
       CallSetter(L, mi, oindex, vindex);
    Exit(true);
  end;
  lua_pop(L, 1);
  result := false;
end;

function LuaSetProperty(L: Plua_State): Integer; cdecl;
var
  o: TObject;
  propname: String;
begin
  Result := 0;
  o := GetLuaObject(L, 1);
  PropName := lua_tostring(L, 2);
  if o = nil then
     LuaError(L, 'Can''t set null object property!', PropName);
  if not SetOrUpdateGeneratedProperty(L, 1, 3, PropName) and not SetOrUpdatePublishedProperty(L, o, 3, PropName) then
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
function GetPublishedProperty(L: Plua_State; Comp: TPersistent; PropName: String): boolean;
var
  PInfo: PPropInfo;
  m: TMethod;
  ref:Integer = -1;
begin
     PInfo := GetPropInfo(Comp.ClassInfo, PropName);
     Result := false;
     if PInfo <> nil then begin
        case PInfo^.Proptype^.Kind of
          tkMethod:
            begin
              m := GetMethodProp(Comp, PInfo);
              if TObject(m.Data) is TVCLuaControl then
                 ref := GetOrdProp(TVCLuaControl(m.Data), PropName + '_Function')
              else if TObject(m.Data) is TLuaEvent then
                 ref := TLuaEvent(m.Data).ref;
              lua_rawgeti(L, LUA_REGISTRYINDEX, ref);
            end;
          tkSet:
            lua_pushSet(L,GetOrdProp(Comp, PInfo),PInfo^.PropType);
          tkClass:
            lua_pushobject(L, -1, GetObjectProp(Comp, PInfo));
          tkInteger,
          tkInt64,
          tkQWord:
            if PInfo^.Proptype^.Name='TShortCut' then
               lua_pushShortCut(L,GetOrdProp(Comp, PInfo))
            else
                lua_push(L,GetOrdProp(Comp, PInfo));
          tkChar,
          tkWChar: // noone cares about WChar, right?
            lua_push(L,Char(GetOrdProp(Comp, PInfo)));
          tkBool:
            lua_push(L,boolean(GetOrdProp(Comp, PInfo)));
          tkEnumeration:
            lua_pushEnum(L,GetOrdProp(Comp, PInfo),PInfo^.PropType);
          tkFloat:
            lua_push(L,GetFloatProp(Comp, PInfo));
          tkSString,
          tkLString,
          tkAString,
          tkWString:
            lua_push(L,GetStrProp(Comp, PInfo));
        else
            LuaError(L, 'Getting published property not supported!', PropName + ' of type ' + PInfo^.Proptype^.Name);
        end;
        Result := true;
     end;
end;

// here go either non-published properties or not properties at all (procedures and class procedures)
// begin+end left for easier 'debugln' insertion
function GetSpecialProperty(L: Plua_State; o: TObject; PropNameLower: String): boolean;
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
  PropName: String;
  pvmt: PLuaVmt;
  mi: TLuaMethodInfo;
begin
  Result := 1;
  o := GetLuaObject(L, 1);
  PropName := lua_tostring(L, 2);
  // shouldn't really happen since we push nil instead of creating function tables with null handle
  if o = nil then
     LuaError(L, 'Can''t get null object property!', PropName);
  // since o<>nil here, that means that lua_type(L,1)=LUA_TTABLE
  // first try to get as generated method
  lua_pushliteral(L,'vmt');
  lua_rawget(L,1);
  pvmt := lua_touserdata(L,3);
  if HasMethod(pvmt, PropName, mi) then begin
    lua_pushcfunction(L, mi.pf);
    if mi.mf = mfCall then begin
      lua_pushvalue(L, 1);
      lua_call(L, 1, 1);
    end;
    Exit;
  end;
  lua_pop(L,1);
  // now try to get as property
  if not ((o is TPersistent) and GetPublishedProperty(L, TPersistent(o), PropName) or GetSpecialProperty(L, o, lowercase(PropName))) then begin
     // no rawget needed since it's the first thing Lua tried
     lua_pushnil(L);
  end;
end;

end.
