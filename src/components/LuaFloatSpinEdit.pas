(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFloatSpinEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Spin, Controls, TypInfo;

function CreateFloatSpinEdit(L: Plua_State): Integer; cdecl;
function IsFloatSpinEdit(L: Plua_State): Integer; cdecl;
function AsFloatSpinEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFloatSpinEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFloatSpinEdit = class(TFloatSpinEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomFloatSpinEditFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_FloatSpinEdit_GetLimitedValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	AValue:Double;
	ret:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	AValue := lua_tonumber(L,2);
	ret := lFloatSpinEdit.GetLimitedValue(AValue);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_FloatSpinEdit_ValueToStr(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	AValue:Double;
	ret:String;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	AValue := lua_tonumber(L,2);
	ret := lFloatSpinEdit.ValueToStr(AValue);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_FloatSpinEdit_StrToValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	S:String;
	ret:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lFloatSpinEdit.StrToValue(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function IsFloatSpinEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TFloatSpinEdit);
end;
function AsFloatSpinEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TFloatSpinEdit then
    lua_push(L, TFloatSpinEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TFloatSpinEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomFloatSpinEdit',v);
end;
function CreateFloatSpinEdit(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lFloatSpinEdit := TLuaFloatSpinEdit.Create(Parent);
	lFloatSpinEdit.Parent := TWinControl(Parent);
	lFloatSpinEdit.LuaCtl := TVCLuaControl.Create(lFloatSpinEdit as TComponent,L,nil,'TCustomFloatSpinEdit');
	InitControl(L,lFloatSpinEdit,Name);
	CreateTableForKnownType(L,'TCustomFloatSpinEdit',lFloatSpinEdit);
	Result := 1;
end;

begin
	SetLength(CustomFloatSpinEditFuncs, 3+1);
	CustomFloatSpinEditFuncs[0].name:='GetLimitedValue';
	CustomFloatSpinEditFuncs[0].func:=@VCLua_FloatSpinEdit_GetLimitedValue;
	CustomFloatSpinEditFuncs[1].name:='ValueToStr';
	CustomFloatSpinEditFuncs[1].func:=@VCLua_FloatSpinEdit_ValueToStr;
	CustomFloatSpinEditFuncs[2].name:='StrToValue';
	CustomFloatSpinEditFuncs[2].func:=@VCLua_FloatSpinEdit_StrToValue;
	CustomFloatSpinEditFuncs[3].name:=nil;
	CustomFloatSpinEditFuncs[3].func:=nil;

end.
