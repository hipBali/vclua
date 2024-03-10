(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateCheckBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCheckBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCheckBox = class(TCheckBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCheckBoxFuncs: TLuaVmt;
    CustomCheckBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_CheckBox_VCLuaSetAlignment(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	val:TLeftRight;
begin
	CheckArg(L, 2);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TLeftRight));
	try
		lCheckBox.Alignment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'Alignment', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckBox_VCLuaGetAlignment(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	ret:TLeftRight;
begin
	CheckArg(L, 1);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	try
		ret := lCheckBox.Alignment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'Alignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CheckBox_VCLuaSetAllowGrayed(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCheckBox.AllowGrayed := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'AllowGrayed', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckBox_VCLuaGetAllowGrayed(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	try
		ret := lCheckBox.AllowGrayed;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'AllowGrayed', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckBox_VCLuaSetState(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	val:TCheckBoxState;
begin
	CheckArg(L, 2);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TCheckBoxState));
	try
		lCheckBox.State := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'State', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckBox_VCLuaGetState(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	ret:TCheckBoxState;
begin
	CheckArg(L, 1);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	try
		ret := lCheckBox.State;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'State', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CheckBox_VCLuaGetShortCut(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	ret:TShortcut;
begin
	CheckArg(L, 1);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	try
		ret := lCheckBox.ShortCut;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'ShortCut', E.ClassName, E.Message);
	end;
	lua_pushShortCut(L,ret);
end;

function VCLua_CheckBox_VCLuaGetShortCutKey2(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	ret:TShortcut;
begin
	CheckArg(L, 1);
	lCheckBox := TLuaCheckBox(GetLuaObject(L, 1));
	try
		ret := lCheckBox.ShortCutKey2;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckBox', 'ShortCutKey2', E.ClassName, E.Message);
	end;
	lua_pushShortCut(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TCheckBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCheckBox',v);
end;
function CreateCheckBox(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckBox := TLuaCheckBox.Create(Parent);
	lCheckBox.Parent := TWinControl(Parent);
	lCheckBox.LuaCtl := TVCLuaControl.Create(lCheckBox as TComponent,L,nil,'TCustomCheckBox');
	CreateTableForKnownType(L,'TCustomCheckBox',lCheckBox);
	InitControl(L,lCheckBox,Name);
	Result := 1;
end;

begin
	CustomCheckBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckBoxFuncs, 'Alignment', @VCLua_CheckBox_VCLuaGetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomCheckBoxFuncs, 'AllowGrayed', @VCLua_CheckBox_VCLuaGetAllowGrayed, mfCall);
	TLuaMethodInfo.Create(CustomCheckBoxFuncs, 'State', @VCLua_CheckBox_VCLuaGetState, mfCall);
	TLuaMethodInfo.Create(CustomCheckBoxFuncs, 'ShortCut', @VCLua_CheckBox_VCLuaGetShortCut, mfCall);
	TLuaMethodInfo.Create(CustomCheckBoxFuncs, 'ShortCutKey2', @VCLua_CheckBox_VCLuaGetShortCutKey2, mfCall);
	CustomCheckBoxSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckBoxSets, 'Alignment', @VCLua_CheckBox_VCLuaSetAlignment, mfCall, TypeInfo(TLeftRight));
	TLuaMethodInfo.Create(CustomCheckBoxSets, 'AllowGrayed', @VCLua_CheckBox_VCLuaSetAllowGrayed, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomCheckBoxSets, 'State', @VCLua_CheckBox_VCLuaSetState, mfCall, TypeInfo(TCheckBoxState));
end.
