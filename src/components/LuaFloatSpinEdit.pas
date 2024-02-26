(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFloatSpinEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Spin, TypInfo, LuaVmt;

function CreateFloatSpinEdit(L: Plua_State): Integer; cdecl;
function IsFloatSpinEdit(L: Plua_State): Integer; cdecl;
function AsFloatSpinEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFloatSpinEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFloatSpinEdit = class(TFloatSpinEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomFloatSpinEditFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_FloatSpinEdit_GetLimitedValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	AValue:Double;
	ret:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lFloatSpinEdit.GetLimitedValue(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'GetLimitedValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_ValueToStr(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	AValue:Double;
	ret:String;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lFloatSpinEdit.ValueToStr(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'ValueToStr', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_StrToValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	S:String;
	ret:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lFloatSpinEdit.StrToValue(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'StrToValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	CustomFloatSpinEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'GetLimitedValue', @VCLua_FloatSpinEdit_GetLimitedValue);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'ValueToStr', @VCLua_FloatSpinEdit_ValueToStr);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'StrToValue', @VCLua_FloatSpinEdit_StrToValue);
end.
