unit LuaProperties;

{$mode Delphi}{$H+}

interface

Uses  Dialogs, Forms, Graphics, Classes, Controls, TypInfo, Lua, LuaHelper;

function LuaGetProperty(L: Plua_State): Integer; cdecl;
function LuaSetProperty(L: Plua_State): Integer; cdecl;
function SetPropertiesFromLuaTable(L: Plua_State; Obj:TObject; Index:Integer):Boolean;
procedure SetProperty(L:Plua_State; Index:Integer; Comp:TObject; PInfo:PPropInfo);
function LuaListProperties(L: Plua_State): Integer; cdecl;

implementation

Uses SysUtils,
     StdCtrls,
     LuaController,
     LuaObject,
     LuaProxy,
     LCLProc;
// ****************************************************************

function VCLua_Propinfo(Comp:TPersistent; PropName:String):PPropInfo;
begin
  if (Comp.InheritsFrom(TStrings)) then
      // TODO: TStringList doesn't publish anything so this is nil
      Result := GetPropInfo(TStringList.ClassInfo, PropName)
  else
      Result := GetPropInfo(Comp.ClassInfo, PropName);
end;
// ****************************************************************
procedure ListProperty(L: Plua_State; PName:String; PInfo: PPropInfo; idx:Integer);
var
     PropType: String;
begin
    try
        PropType := PInfo^.Proptype^.Name;
        if PropType[1] = 'T' then
           delete(Proptype,1,1);
        // lua_pushnumber(L,idx);
        // lua_newtable(L);
        lua_pushstring(L, PChar(PName));
        lua_pushstring(L, PChar(PropType));
        lua_rawset(L,-3);
        // lua_rawset(L,-3);
    except
    end;
end;

procedure ListObjectProperties(L: Plua_State; PObj:TObject);
var subObj, tmpObj:TObject;
    Count,Loop:Integer;
    PInfo: PPropInfo;
    PropInfos: PPropList;
    s,t:String;
    n:Integer;
begin
     Count := GetPropList(PObj.ClassInfo, tkAny, nil);
     GetMem(PropInfos, Count * SizeOf(PPropInfo));
     GetPropList(PObj.ClassInfo, tkAny, PropInfos, true);
     for Loop := 0 to Count - 1 do begin
         PInfo := GetPropInfo(PObj.ClassInfo, PropInfos^[Loop]^.Name);
         ListProperty(L, PropInfos^[Loop]^.Name, PInfo, Loop+1);
     end;
     FreeMem(PropInfos);
end;

function LuaListProperties(L: Plua_State): Integer; cdecl;
var
  PObj: TObject;
begin
  CheckArg(L, 1);
  PObj := GetLuaObject(L, 1);
  lua_newtable(L);
  ListObjectProperties(L, PObj);
  Result := 1;
end;

// ****************************************************************
(*
procedure SetObjectProperty(Obj:TObject; propName:String; value:TObject);
var
  PInfo: PPropInfo;
begin
  PInfo := GetPropInfo(Obj.ClassInfo, propName);
  if PInfo <> nil then
     SetInt64Prop(Obj, PInfo, Int64(Pointer(value)));
end;

function tabletotext(L:Plua_State; Index:Integer):String;
var n :integer;
begin
    result := '';
    if lua_istable(L,Index) then begin
        n := lua_gettop(L);
        lua_pushnil(L);
        while (lua_next(L, n) <> 0) do begin
              Result := Result + lua_tostring(L, -1) + #10;
              lua_pop(L, 1);
        end;
    end else if lua_isstring(L,Index) then
       Result := lua_tostring(L,Index);
end;

function SetTStringsProperty( L: Plua_State; Comp:TObject; PropName:String; index:Integer):boolean;
var target: TStrings;
begin
    result := false;
    target := TStrings( Pointer(GetInt64Prop(Comp,PropName)));
    if Assigned(target) then begin
      target.Clear;
      target.Text := tabletotext(L,index);
      result := true;
    end;
end;
*)

function ToColor(L: Plua_State; index: Integer):TColor;
begin
     result := 0;
     if lua_isstring(L,index) then
        result := StringToColor(lua_tostring(L,index))
     else if lua_isnumber(L,index) then
        result := TColor(lua_tointeger(L,index));
end;

// ****************************************************************

function isVcluaObject(L: Plua_State; index: Integer):boolean;
begin
    Result := (LuaGetTableLightUserData(L,Index,'Handle') <> nil);
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
(*
procedure LuaSetControlProperty(L:Plua_State; Comp: TObject; PropName:String; Index:Integer);
var
  PInfo: PPropInfo;
begin
  PInfo := GetPropInfo(TObject(Comp).ClassInfo, PropName);
  SetProperty(L,Index,Comp,PInfo);
end;
*)
procedure SetProperty(L:Plua_State; Index:Integer; Comp:TObject; PInfo:PPropInfo);
Var propVal:String;
    LuaFuncPInfo: PPropInfo;
    Str: String;
    tm: TMethod;
    cc: TVCLuaControl;
    // refrence!!!
    luafunc, top: Integer;
begin
     Str := PInfo^.Proptype^.Name;
       if (Str = 'TShortCut') and
          (ComponentShortCut(TComponent(Comp),lua_tostring(L, -1))) then
       else
       case PInfo^.Proptype^.Kind of
        tkMethod: begin
            // Property Name
            Str := lua_tostring(L,index-1);
            if (not (Comp is TComponent)) then
               LuaError(L,'Can only set methods on TComponent descendants!', Comp.ClassName + ' isn''t a TComponent, propname ' + Str);
            // omg watchout!
            cc := GetLuaControl(Comp);
            LuaFuncPInfo := GetPropInfo(cc, Str+'_Function');
	    if LuaFuncPInfo <> nil then begin
                // OnXxxx_Function
                if lua_isfunction(L,index) then begin
                  // store luafunc in component by LuaCtl
                  top := lua_gettop(L);
                  lua_settop(L,index);
                  luafunc := luaL_ref(L, LUA_REGISTRYINDEX);
                  SetOrdProp(cc, LuaFuncPInfo, luafunc);
                  lua_settop(L,top);
                  // setup luaeventhandler
                  LuaFuncPInfo := GetPropInfo(Comp.ClassInfo, Str);
                  // OnXxxx -->OnLuaXxxx
                  insert('Lua',Str,3);
                  if (LuaFuncPInfo<>nil) then begin
                      tm.Data := Pointer(cc);
                      tm.Code := cc.MethodAddress(Str);
                      SetMethodProp(Comp, LuaFuncPInfo, tm);
                   end
                end else begin
                    tm.Data:= nil;
                    tm.Code:= nil;
                    SetMethodProp(Comp, PInfo, tm);
                end
            end
	    else begin
                 LuaError(L,'Method not found or not supported!' , lua_tostring(L,index));
            end
          end;
          tkSet:
              begin
                 SetOrdProp(Comp, PInfo, StringToSet(PInfo,lua_tostring(L,index)));
              end;
	  tkClass:
             begin
      	         SetInt64Prop(Comp, PInfo, Int64(Pointer(GetLuaObject(L, index))));
             end;
	  tkInteger:
             begin
                     if ((Str='TGraphicsColor') or (Str='TColor' )) and lua_isstring(L, index) then
                        SetOrdProp(Comp, PInfo, ToColor(L, index))
                     else
                     if lua_isfunction(L,index) then begin
                         top := lua_gettop(L);
                         lua_settop(L,index);
                         luafunc := luaL_ref(L, LUA_REGISTRYINDEX);
                         SetOrdProp(Comp, PInfo, luafunc);
                         lua_settop(L,top);
                     end else begin
     	                 SetOrdProp(Comp, PInfo, lua_tointeger(L, index));
                     end;
             end;
	  tkChar, tkWChar:
            begin
              Str := lua_toStringCP(L, index);
              if length(Str)<1 then
                SetOrdProp(Comp, PInfo, 0)
              else
                SetOrdProp(Comp, PInfo, Ord(Str[1]));
            end;
          tkBool:
                 begin
		      // {$IFDEF UNIX}
                      // propval := BoolToStr(lua_toboolean(L,index));
                      // SetOrdProp(Comp, PInfo, GetEnumValue(PInfo^.PropType, PropVal));
		      // {$ELSE}
                      SetPropValue(Comp, PInfo^.Name, lua_toboolean(L,index));
		      // {$ENDIF}
                 end;
          tkEnumeration:
	           begin
	              if lua_type(L, index) = LUA_TBOOLEAN then
                         propval := BoolToStr(lua_toboolean(L,index))
		      else
		         propVal := lua_tostring(L, index);
                      SetOrdProp(Comp, PInfo, GetEnumValue(PInfo^.PropType, PropVal));
	           end;
          tkFloat:
	      	  SetFloatProp(Comp, PInfo, lua_tonumber(L, index));

          tkString, tkLString, tkWString:
	      	  SetStrProp(Comp, PInfo, lua_toStringCP(L, index));

          tkInt64:
                  SetInt64Prop(Comp, PInfo, lua_tointeger(L, index));
       else begin
                 Str := lua_toStringCP(L, index);
                 if (PInfo^.Proptype^.Name='TTranslateString') then
		      SetStrProp(Comp, PInfo, Str )
                 else if (PInfo^.Proptype^.Name='AnsiString') then
		      SetStrProp(Comp, PInfo, Str)
	         else if (PInfo^.Proptype^.Name='WideString') then
		      SetStrProp(Comp, PInfo, Str)
                 else
		      LuaError(L,'Property not supported!' , PInfo^.Proptype^.Name);
	      end;
        end;
end;

procedure CheckAndSetProperty(L: Plua_State; Obj:TObject; PInfo: PPropInfo; PName: String; Index:Integer);
begin
     if lua_istable(L,Index) then begin
        if  (PInfo.PropType.Kind<>TKCLASS) and (PInfo.PropType.Kind<>TKASTRING) and (TObject(GetInt64Prop(Obj,pName))=nil) then
            SetPropertiesFromLuaTable(L,TObject(GetInt64Prop(Obj,pName)),Index)
        else
        // set table properties if the property is not a vclobject
        if (PInfo.PropType^.Kind=tkClass)  and (not isVcluaObject(L,Index))  then begin
            if TObject(GetInt64Prop(Obj, PInfo.Name)).InheritsFrom(TStrings) then begin
                SetInt64Prop(TComponent(Obj), PInfo, Int64(Pointer(lua_toStringList(L, index))));
            end
            else
                SetPropertiesFromLuaTable(L,TObject(GetInt64Prop(Obj,pName)),Index);
        end else
            SetProperty(L, Index, TComponent(Obj), PInfo);
     end else
  	    SetProperty(L, Index, TComponent(Obj), PInfo);
end;

// ****************************************************************
// Sets Property Values from a Lua table
// ****************************************************************

function SetPropertiesFromLuaTable(L: Plua_State; Obj:TObject; Index:Integer):Boolean;
var n,d: Integer;
    PInfo: PPropInfo;
    pName: String;
begin
  result := false;
  // L,1 is the Object self
  if lua_istable(L,Index) then begin
        n := lua_gettop(L);
        lua_pushnil(L);
        while (lua_next(L, n) <> 0) do begin
          pName := lua_tostring(L, -2);
  	  PInfo := GetPropInfo(Obj.ClassInfo,lua_tostring(L, -2));
  	  if PInfo <> nil then begin
             // Result:=True;
             CheckAndSetProperty(L,Obj,PInfo,PName,-1);
          end else begin
              if (UpperCase(pName)='SHORTCUT') and (ComponentShortCut(TComponent(Obj),lua_tostring(L, -1))) then
              else
              if UpperCase(pName) = 'PARENT' then begin
                 TControl(Obj).Parent := TWinControl(GetLuaObject(L, -1));
              end else begin
                  // lua invalid key raised
                  LuaError(L,'Property not found! ', Obj.ClassName+'.'+PName);
              end;
          end;
          lua_pop(L, 1);
        end;
        result := true;
  end;
end;


// ****************************************************************
// Sets Property Value
// ****************************************************************
function LuaSetProperty(L: Plua_State): Integer; cdecl;
var
  PInfo: PPropInfo;
  Comp: TObject;
  propname: String;
  propType: String;
begin
  Result := 0;
  Comp := TObject(GetLuaObject(L, 1));
  if (Comp=nil) then begin
     LuaError(L, 'Can''t set null object property! ' , PropName );
     lua_pushnil(L);
     Exit;
  end;
  PropName := lua_tostring(L, 2);
  if (UpperCase(PropName)='SHORTCUT') and (ComponentShortCut(TComponent(Comp),lua_tostring(L, -1))) then
  else
  if (lua_gettop(L)=3) and (lua_istable(L,3)) and ((PropName='_')) then begin
     SetPropertiesFromLuaTable(L,Comp,3);
  end else begin
    PInfo := GetPropInfo(TComponent(Comp).ClassInfo, PropName);
    if (PInfo <> nil) and (lua_gettop(L)=3) then
      CheckAndSetProperty(L,Comp,PInfo,PropName,3)
    // else if (PInfo <> nil) and (PInfo^.Proptype^.Kind = tkArray) then
    //    lua_setArrayProperty(L)
    else begin
       case lua_type(L,3) of
  		LUA_TNIL: LuaRawSetTableNil(L,1,lua_tostring(L, 2));
  		LUA_TBOOLEAN: LuaRawSetTableBoolean(L,1,lua_tostring(L, 2),lua_toboolean(L, 3));
  		LUA_TLIGHTUSERDATA: LuaRawSetTableLightUserData(L,1,lua_tostring(L, 2),lua_touserdata(L, 3));
  		LUA_TNUMBER: LuaRawSetTableNumber(L,1,lua_tostring(L, 2),lua_tonumber(L, 3));
  		LUA_TSTRING: LuaRawSetTableString(L,1,lua_tostring(L, 2),lua_tostring(L, 3));
  		LUA_TTABLE: LuaRawSetTableValue(L,1,lua_tostring(L, 2), 3);
  		LUA_TFUNCTION: LuaRawSetTableFunction(L,1,lua_tostring(L, 2),lua_CFunction(lua_touserdata(L, 3)));
       else
           if lowercase(PropName) = 'parent' then begin
              TWinControl(Comp).Parent := TWinControl(GetLuaObject(L, 3));
           end else
                   LuaError(L,'Property not found!',PropName);
       end;
     end;
  end;
end;

// ****************************************************************
// Gets Property Value
// ****************************************************************
function GetPublishedProperty(L: Plua_State; Comp: TPersistent; PropName: String): boolean;
var
  PInfo, PPInfo: PPropInfo;
  Pcomp: TComponent;
  PropType: String;
begin
     PInfo := VCLua_Propinfo(Comp,PropName);
     Result := false;
     if PInfo <> nil then begin
        PropType := PInfo^.Proptype^.Name;
        PropName := PInfo^.Name;
        case PInfo^.Proptype^.Kind of
          tkMethod:
            begin
               // TODO: always nil
               PPInfo := GetPropInfo(Comp.ClassInfo, PropName + '_FunctionName');
               if PPInfo <> nil then
                  lua_pushstring(L,pchar(GetStrProp(Comp, PPInfo)))
               else begin
                  lua_pushnil(L);
               end;
            end;
          tkSet:
            lua_pushSet(L,GetOrdProp(Comp, PInfo),PInfo^.PropType);
          tkClass:
            begin
              pComp := TComponent(GetInt64Prop(Comp,PropName));
              if (pComp<>nil) then
                lua_pushobject(L, -1, pComp)
              else
                lua_pushnil(L);
            end;
          tkInteger,
          tkInt64,
          tkQWord:
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
            LuaError(L,'Property not supported!', PropName + ' of type ' + PInfo^.Proptype^.Name);
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
  end
  else if (o is TControl) and (PropNameLower = 'parent') then begin
    lua_push(L, TControl(o).Parent, nil);
  end
  else begin
    Result := (o is TStrings) and GetTStringsProperty(L,TStrings(o),PropNameLower);
  end;
end;

function LuaGetProperty(L: Plua_State): Integer; cdecl;
var
  o: TObject;
  PropName: String;
  ClassName: String;
begin
  // stackwise should resemble lua_gettable: pop key, then push result
  Result := 1;
  o := GetLuaObject(L, 1);
  PropName := lua_tostring(L, 2);
  // shouldn't really happen since we push nil instead of creating function tables with null handle
  if (o=nil) then begin
     lua_pop(L,1);
     lua_pushnil(L);
     LuaError(L, 'Can''t get null object property!', PropName);
     Exit;
  end;
  // since o<>nil here, that means that lua_type(L,1)=LUA_TTABLE
  if (o is TPersistent) and GetPublishedProperty(L, TPersistent(o), PropName) or GetSpecialProperty(L, o, lowercase(PropName)) then
    // those functions push on top without removing the key, since they don't know where that key came from
    lua_replace(L, 2)
  else
    lua_rawget(L, 1);
end;

end.
