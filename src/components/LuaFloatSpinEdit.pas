(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFloatSpinEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Spin;

function CreateFloatSpinEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFloatSpinEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFloatSpinEdit = class(TFloatSpinEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomFloatSpinEditFuncs: TLuaVmt;
    CustomFloatSpinEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

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

function VCLua_FloatSpinEdit_VCLuaSetDecimalPlaces(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	val:Integer;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFloatSpinEdit.DecimalPlaces := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'DecimalPlaces', E.ClassName, E.Message);
	end;
end;

function VCLua_FloatSpinEdit_VCLuaGetDecimalPlaces(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	ret:Integer;
begin
	CheckArg(L, 1);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	try
		ret := lFloatSpinEdit.DecimalPlaces;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'DecimalPlaces', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_VCLuaSetEditorEnabled(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	val:Boolean;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFloatSpinEdit.EditorEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'EditorEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_FloatSpinEdit_VCLuaGetEditorEnabled(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	try
		ret := lFloatSpinEdit.EditorEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'EditorEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_VCLuaSetIncrement(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	val:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFloatSpinEdit.Increment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'Increment', E.ClassName, E.Message);
	end;
end;

function VCLua_FloatSpinEdit_VCLuaGetIncrement(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	ret:Double;
begin
	CheckArg(L, 1);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	try
		ret := lFloatSpinEdit.Increment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'Increment', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_VCLuaSetMinValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	val:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFloatSpinEdit.MinValue := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'MinValue', E.ClassName, E.Message);
	end;
end;

function VCLua_FloatSpinEdit_VCLuaGetMinValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	ret:Double;
begin
	CheckArg(L, 1);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	try
		ret := lFloatSpinEdit.MinValue;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'MinValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_VCLuaSetMaxValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	val:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFloatSpinEdit.MaxValue := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'MaxValue', E.ClassName, E.Message);
	end;
end;

function VCLua_FloatSpinEdit_VCLuaGetMaxValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	ret:Double;
begin
	CheckArg(L, 1);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	try
		ret := lFloatSpinEdit.MaxValue;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'MaxValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_VCLuaSetValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	val:Double;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFloatSpinEdit.Value := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'Value', E.ClassName, E.Message);
	end;
end;

function VCLua_FloatSpinEdit_VCLuaGetValue(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	ret:Double;
begin
	CheckArg(L, 1);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	try
		ret := lFloatSpinEdit.Value;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'Value', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FloatSpinEdit_VCLuaSetValueEmpty(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	val:Boolean;
begin
	CheckArg(L, 2);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFloatSpinEdit.ValueEmpty := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'ValueEmpty', E.ClassName, E.Message);
	end;
end;

function VCLua_FloatSpinEdit_VCLuaGetValueEmpty(L: Plua_State): Integer; cdecl;
var
	lFloatSpinEdit:TLuaFloatSpinEdit;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lFloatSpinEdit := TLuaFloatSpinEdit(GetLuaObject(L, 1));
	try
		ret := lFloatSpinEdit.ValueEmpty;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FloatSpinEdit', 'ValueEmpty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	CreateTableForKnownType(L,'TCustomFloatSpinEdit',lFloatSpinEdit);
	InitControl(L,lFloatSpinEdit,Name);
	Result := 1;
end;

begin
	CustomFloatSpinEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'GetLimitedValue', @VCLua_FloatSpinEdit_GetLimitedValue);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'ValueToStr', @VCLua_FloatSpinEdit_ValueToStr);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'StrToValue', @VCLua_FloatSpinEdit_StrToValue);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'DecimalPlaces', @VCLua_FloatSpinEdit_VCLuaGetDecimalPlaces, mfCall);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'EditorEnabled', @VCLua_FloatSpinEdit_VCLuaGetEditorEnabled, mfCall);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'Increment', @VCLua_FloatSpinEdit_VCLuaGetIncrement, mfCall);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'MinValue', @VCLua_FloatSpinEdit_VCLuaGetMinValue, mfCall);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'MaxValue', @VCLua_FloatSpinEdit_VCLuaGetMaxValue, mfCall);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'Value', @VCLua_FloatSpinEdit_VCLuaGetValue, mfCall);
	TLuaMethodInfo.Create(CustomFloatSpinEditFuncs, 'ValueEmpty', @VCLua_FloatSpinEdit_VCLuaGetValueEmpty, mfCall);
	CustomFloatSpinEditSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFloatSpinEditSets, 'DecimalPlaces', @VCLua_FloatSpinEdit_VCLuaSetDecimalPlaces, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomFloatSpinEditSets, 'EditorEnabled', @VCLua_FloatSpinEdit_VCLuaSetEditorEnabled, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomFloatSpinEditSets, 'Increment', @VCLua_FloatSpinEdit_VCLuaSetIncrement, mfCall, TypeInfo(Double));
	TLuaMethodInfo.Create(CustomFloatSpinEditSets, 'MinValue', @VCLua_FloatSpinEdit_VCLuaSetMinValue, mfCall, TypeInfo(Double));
	TLuaMethodInfo.Create(CustomFloatSpinEditSets, 'MaxValue', @VCLua_FloatSpinEdit_VCLuaSetMaxValue, mfCall, TypeInfo(Double));
	TLuaMethodInfo.Create(CustomFloatSpinEditSets, 'Value', @VCLua_FloatSpinEdit_VCLuaSetValue, mfCall, TypeInfo(Double));
	TLuaMethodInfo.Create(CustomFloatSpinEditSets, 'ValueEmpty', @VCLua_FloatSpinEdit_VCLuaSetValueEmpty, mfCall, TypeInfo(Boolean));
end.
