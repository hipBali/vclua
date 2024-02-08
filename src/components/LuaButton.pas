(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaButton;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateButton(L: Plua_State): Integer; cdecl;
function IsButton(L: Plua_State): Integer; cdecl;
function AsButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TButton; pti: PTypeInfo = nil); overload; inline;
procedure ButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaButton = class(TButton)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomButtonFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,ret);
	
	Result := 1;
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
	ButtonToTable(L,-1,v);
end;
procedure ButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomButton');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lButton.LuaCtl := TVCLuaControl.Create(lButton as TComponent,L,@ButtonToTable);
	InitControl(L,lButton,Name);
	ButtonToTable(L, -1, lButton);
	Result := 1;
end;

begin
	SetLength(CustomButtonFuncs, 6+1);
	CustomButtonFuncs[0].name:='Click';
	CustomButtonFuncs[0].func:=@VCLua_Button_Click;
	CustomButtonFuncs[1].name:='ExecuteDefaultAction';
	CustomButtonFuncs[1].func:=@VCLua_Button_ExecuteDefaultAction;
	CustomButtonFuncs[2].name:='ExecuteCancelAction';
	CustomButtonFuncs[2].func:=@VCLua_Button_ExecuteCancelAction;
	CustomButtonFuncs[3].name:='ActiveDefaultControlChanged';
	CustomButtonFuncs[3].func:=@VCLua_Button_ActiveDefaultControlChanged;
	CustomButtonFuncs[4].name:='UpdateRolesForForm';
	CustomButtonFuncs[4].func:=@VCLua_Button_UpdateRolesForForm;
	CustomButtonFuncs[5].name:='UseRightToLeftAlignment';
	CustomButtonFuncs[5].func:=@VCLua_Button_UseRightToLeftAlignment;
	CustomButtonFuncs[6].name:=nil;
	CustomButtonFuncs[6].func:=nil;

end.
