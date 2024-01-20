(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFloatSpinEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Spin, Controls;

function CreateFloatSpinEdit(L: Plua_State): Integer; cdecl;
procedure FloatSpinEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFloatSpinEdit = class(TFloatSpinEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

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
	lua_pushnumber(L,ret);
	
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
	lua_pushStringCP(L,ret);
	
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
	lua_pushnumber(L,ret);
	
	Result := 1;
end;

procedure FloatSpinEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'GetLimitedValue', @VCLua_FloatSpinEdit_GetLimitedValue);
	LuaSetTableFunction(L, Index, 'ValueToStr', @VCLua_FloatSpinEdit_ValueToStr);
	LuaSetTableFunction(L, Index, 'StrToValue', @VCLua_FloatSpinEdit_StrToValue);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lFloatSpinEdit.LuaCtl := TVCLuaControl.Create(TControl(lFloatSpinEdit),L,@FloatSpinEditToTable);
	InitControl(L,lFloatSpinEdit,Name);
	FloatSpinEditToTable(L, -1, lFloatSpinEdit);
	Result := 1;
end;

end.
