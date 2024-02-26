(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaButton;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateButton(L: Plua_State): Integer; cdecl;
function IsButton(L: Plua_State): Integer; cdecl;
function AsButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaButton = class(TButton)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomButtonFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

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

function IsButton(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TButton);
end;
function AsButton(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TButton then
    lua_push(L, TButton(o))
  else
    lua_pushnil(L);
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
end.
