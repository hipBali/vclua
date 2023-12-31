(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaButton;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateButton(L: Plua_State): Integer; cdecl;
procedure ButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaButton = class(TButton)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_Button_Click(L: Plua_State): Integer; cdecl;
var 
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	lButton.Click();
	
	Result := 0;
end;

function VCLua_Button_ExecuteDefaultAction(L: Plua_State): Integer; cdecl;
var 
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	lButton.ExecuteDefaultAction();
	
	Result := 0;
end;

function VCLua_Button_ExecuteCancelAction(L: Plua_State): Integer; cdecl;
var 
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	lButton.ExecuteCancelAction();
	
	Result := 0;
end;

function VCLua_Button_ActiveDefaultControlChanged(L: Plua_State): Integer; cdecl;
var 
	lButton:TLuaButton;
	NewControl:TControl;
begin
	CheckArg(L, 2);
	lButton := TLuaButton(GetLuaObject(L, 1));
	NewControl := TControl(GetLuaObject(L,2));
	lButton.ActiveDefaultControlChanged(NewControl);
	
	Result := 0;
end;

function VCLua_Button_UpdateRolesForForm(L: Plua_State): Integer; cdecl;
var 
	lButton:TLuaButton;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	lButton.UpdateRolesForForm();
	
	Result := 0;
end;

function VCLua_Button_UseRightToLeftAlignment(L: Plua_State): Integer; cdecl;
var 
	lButton:TLuaButton;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lButton := TLuaButton(GetLuaObject(L, 1));
	ret := lButton.UseRightToLeftAlignment();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

procedure ButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Click', @VCLua_Button_Click);
	LuaSetTableFunction(L, Index, 'ExecuteDefaultAction', @VCLua_Button_ExecuteDefaultAction);
	LuaSetTableFunction(L, Index, 'ExecuteCancelAction', @VCLua_Button_ExecuteCancelAction);
	LuaSetTableFunction(L, Index, 'ActiveDefaultControlChanged', @VCLua_Button_ActiveDefaultControlChanged);
	LuaSetTableFunction(L, Index, 'UpdateRolesForForm', @VCLua_Button_UpdateRolesForForm);
	LuaSetTableFunction(L, Index, 'UseRightToLeftAlignment', @VCLua_Button_UseRightToLeftAlignment);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lButton.LuaCtl := TVCLuaControl.Create(TControl(lButton),L,@ButtonToTable);
	InitControl(L,lButton,Name);
	ButtonToTable(L, -1, lButton);
	Result := 1;
end;

end.
