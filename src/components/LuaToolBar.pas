(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToolBar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, ImgList, LuaImageList, TypInfo;

function CreateToolButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToolButton; pti: PTypeInfo = nil); overload; inline;
procedure ToolButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaToolButton = class(TToolButton)
        LuaCtl: TVCLuaControl;
    end;

function CreateToolBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToolBar; pti: PTypeInfo = nil); overload; inline;
procedure ToolBarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaToolBar = class(TToolBar)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_ToolButton_CheckMenuDropdown(L: Plua_State): Integer; cdecl;
var 
	lToolButton:TLuaToolButton;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	ret := lToolButton.CheckMenuDropdown();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ToolButton_Click(L: Plua_State): Integer; cdecl;
var 
	lToolButton:TLuaToolButton;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	lToolButton.Click();
	
	Result := 0;
end;

function VCLua_ToolButton_ArrowClick(L: Plua_State): Integer; cdecl;
var 
	lToolButton:TLuaToolButton;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	lToolButton.ArrowClick();
	
	Result := 0;
end;

function VCLua_ToolButton_GetPreferredSize(L: Plua_State): Integer; cdecl;
var 
	lToolButton:TLuaToolButton;
	PreferredWidth:integer;
	PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, -1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	Raw := luaL_optbool(L,2,false);
	WithThemeSpace := luaL_optbool(L,3,true);
	lToolButton.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	lua_pushinteger(L,PreferredWidth);
	lua_pushinteger(L,PreferredHeight);
	Result := 2;
end;

function VCLua_ToolButton_PointInArrow(L: Plua_State): Integer; cdecl;
var 
	lToolButton:TLuaToolButton;
	X:Integer;
	Y:Integer;
	ret:Boolean;
begin
	CheckArg(L, 3);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lToolButton.PointInArrow(X,Y);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ToolBar_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lToolBar:TLuaToolBar;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	lToolBar.EndUpdate();
	
	Result := 0;
end;

function VCLua_ToolBar_FlipChildren(L: Plua_State): Integer; cdecl;
var 
	lToolBar:TLuaToolBar;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	AllLevels := lua_toboolean(L,2);
	lToolBar.FlipChildren(AllLevels);
	
	Result := 0;
end;

function VCLua_ToolBar_GetEnumerator(L: Plua_State): Integer; cdecl;
var 
	lToolBar:TLuaToolBar;
	ret:TToolBarEnumerator;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	ret := lToolBar.GetEnumerator();
	ToolBarToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ToolBar_SetButtonSize(L: Plua_State): Integer; cdecl;
var 
	lToolBar:TLuaToolBar;
	NewButtonWidth:integer;
	NewButtonHeight:integer;
begin
	CheckArg(L, 3);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	NewButtonWidth := lua_tointeger(L,2);
	NewButtonHeight := lua_tointeger(L,3);
	lToolBar.SetButtonSize(NewButtonWidth,NewButtonHeight);
	
	Result := 0;
end;

function VCLua_ToolBar_CanFocus(L: Plua_State): Integer; cdecl;
var 
	lToolBar:TLuaToolBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	ret := lToolBar.CanFocus();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TToolButton; pti: PTypeInfo);
begin
	ToolButtonToTable(L,-1,v);
end;
procedure ToolButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'CheckMenuDropdown', @VCLua_ToolButton_CheckMenuDropdown);
	LuaSetTableFunction(L, Index, 'Click', @VCLua_ToolButton_Click);
	LuaSetTableFunction(L, Index, 'ArrowClick', @VCLua_ToolButton_ArrowClick);
	LuaSetTableFunction(L, Index, 'GetPreferredSize', @VCLua_ToolButton_GetPreferredSize);
	LuaSetTableFunction(L, Index, 'PointInArrow', @VCLua_ToolButton_PointInArrow);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateToolButton(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lToolButton := TLuaToolButton.Create(Parent);
	lToolButton.Parent := TWinControl(Parent);
	lToolButton.LuaCtl := TVCLuaControl.Create(lToolButton as TComponent,L,@ToolButtonToTable);
	InitControl(L,lToolButton,Name);
	ToolButtonToTable(L, -1, lToolButton);
	Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TToolBar; pti: PTypeInfo);
begin
	ToolBarToTable(L,-1,v);
end;
procedure ToolBarToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_ToolBar_EndUpdate);
	LuaSetTableFunction(L, Index, 'FlipChildren', @VCLua_ToolBar_FlipChildren);
	LuaSetTableFunction(L, Index, 'GetEnumerator', @VCLua_ToolBar_GetEnumerator);
	LuaSetTableFunction(L, Index, 'SetButtonSize', @VCLua_ToolBar_SetButtonSize);
	LuaSetTableFunction(L, Index, 'CanFocus', @VCLua_ToolBar_CanFocus);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateToolBar(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lToolBar := TLuaToolBar.Create(Parent);
	lToolBar.Parent := TWinControl(Parent);
	lToolBar.LuaCtl := TVCLuaControl.Create(lToolBar as TComponent,L,@ToolBarToTable);
	InitControl(L,lToolBar,Name);
	ToolBarToTable(L, -1, lToolBar);
	Result := 1;
end;

end.
