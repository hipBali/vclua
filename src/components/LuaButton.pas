(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaButton;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaButton = class(TButton)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomButtonFuncs: TLuaVmt;
    CustomButtonSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Forms;

function VCLua_Button_Click(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		lButton.Click();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'Click', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_ExecuteDefaultAction(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		lButton.ExecuteDefaultAction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'ExecuteDefaultAction', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_ExecuteCancelAction(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		lButton.ExecuteCancelAction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'ExecuteCancelAction', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_ActiveDefaultControlChanged(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	NewControl:TControl;
begin
	CheckArg(L, 2);
	lButton := TLuaButton(GetLuaObject(L, 1));
	luaL_check(L,2,@NewControl);
	try
		lButton.ActiveDefaultControlChanged(NewControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'ActiveDefaultControlChanged', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_UpdateRolesForForm(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		lButton.UpdateRolesForForm();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'UpdateRolesForForm', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_UseRightToLeftAlignment(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		ret := lButton.UseRightToLeftAlignment();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Button', 'UseRightToLeftAlignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Button_VCLuaGetActive(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	ret:boolean;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		ret := lButton.Active;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Button', 'Active', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Button_VCLuaSetDefault(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	val:Boolean;
begin
	CheckArg(L, 2);
	lButton := TLuaButton(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lButton.Default := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'Default', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_VCLuaGetDefault(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		ret := lButton.Default;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Button', 'Default', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Button_VCLuaSetModalResult(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	val:TModalResult;
begin
	CheckArg(L, 2);
	lButton := TLuaButton(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lButton.ModalResult := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'ModalResult', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_VCLuaGetModalResult(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	ret:TModalResult;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		ret := lButton.ModalResult;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Button', 'ModalResult', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Button_VCLuaGetShortCut(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	ret:TShortcut;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		ret := lButton.ShortCut;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Button', 'ShortCut', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Button_VCLuaGetShortCutKey2(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	ret:TShortcut;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		ret := lButton.ShortCutKey2;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Button', 'ShortCutKey2', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Button_VCLuaSetCancel(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	val:Boolean;
begin
	CheckArg(L, 2);
	lButton := TLuaButton(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lButton.Cancel := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Button', 'Cancel', E.ClassName, E.Message);
	end;
end;

function VCLua_Button_VCLuaGetCancel(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	try
		ret := lButton.Cancel;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Button', 'Cancel', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomButton',v);
end;
function CreateButton(L: Plua_State): Integer; cdecl;
var
	lButton:TLuaButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lButton := TLuaButton.Create(Parent);
	lButton.Parent := TWinControl(Parent);
	lButton.LuaCtl := TVCLuaControl.Create(lButton as TComponent,L,nil,'TCustomButton');
	InitControl(L,lButton,Name);
	CreateTableForKnownType(L,'TCustomButton',lButton);
	Result := 1;
end;

begin
	CustomButtonFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomButtonFuncs, 'Click', @VCLua_Button_Click);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'ExecuteDefaultAction', @VCLua_Button_ExecuteDefaultAction);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'ExecuteCancelAction', @VCLua_Button_ExecuteCancelAction);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'ActiveDefaultControlChanged', @VCLua_Button_ActiveDefaultControlChanged);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'UpdateRolesForForm', @VCLua_Button_UpdateRolesForForm);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'UseRightToLeftAlignment', @VCLua_Button_UseRightToLeftAlignment);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'Active', @VCLua_Button_VCLuaGetActive, mfCall);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'Default', @VCLua_Button_VCLuaGetDefault, mfCall);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'ModalResult', @VCLua_Button_VCLuaGetModalResult, mfCall);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'ShortCut', @VCLua_Button_VCLuaGetShortCut, mfCall);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'ShortCutKey2', @VCLua_Button_VCLuaGetShortCutKey2, mfCall);
	TLuaMethodInfo.Create(CustomButtonFuncs, 'Cancel', @VCLua_Button_VCLuaGetCancel, mfCall);
	CustomButtonSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomButtonSets, 'Default', @VCLua_Button_VCLuaSetDefault, mfCall);
	TLuaMethodInfo.Create(CustomButtonSets, 'ModalResult', @VCLua_Button_VCLuaSetModalResult, mfCall);
	TLuaMethodInfo.Create(CustomButtonSets, 'Cancel', @VCLua_Button_VCLuaSetCancel, mfCall);
end.
