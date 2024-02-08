(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToolBar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, ImgList, GraphType, LuaImageList, TypInfo;

function CreateToolButton(L: Plua_State): Integer; cdecl;
function IsToolButton(L: Plua_State): Integer; cdecl;
function AsToolButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToolButton; pti: PTypeInfo = nil); overload; inline;
procedure ToolButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaToolButton = class(TToolButton)
        LuaCtl: TVCLuaControl;
    end;
var
    ToolButtonFuncs: aoluaL_Reg;

function CreateToolBar(L: Plua_State): Integer; cdecl;
function IsToolBar(L: Plua_State): Integer; cdecl;
function AsToolBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToolBar; pti: PTypeInfo = nil); overload; inline;
procedure ToolBarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaToolBar = class(TToolBar)
        LuaCtl: TVCLuaControl;
    end;
var
    ToolBarFuncs: aoluaL_Reg;


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
	lua_push(L,ret);
	
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

function VCLua_ToolButton_GetCurrentIcon(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
	ImageList:TCustomImageList;
	TheIndex:integer;
	TheEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	
	lToolButton.GetCurrentIcon(ImageList,TheIndex,TheEffect);
	lua_push(L,ImageList,TypeInfo(ImageList));
	lua_push(L,TheIndex);
	lua_push(L,TheEffect,TypeInfo(TheEffect));
	Result := 3;
end;

function VCLua_ToolButton_GetCurrentIcon2(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
	ImageList:TCustomImageList;
	TheIndex:integer;
	TheEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 4);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	ImageList := TCustomImageList(GetLuaObject(L,2));
	TheIndex := lua_tointeger(L,3);
	TheEffect := TGraphicsDrawEffect(GetLuaObject(L,4));
	lToolButton.GetCurrentIcon(ImageList,TheIndex,TheEffect);
	lua_push(L,ImageList,TypeInfo(ImageList));
	lua_push(L,TheIndex);
	lua_push(L,TheEffect,TypeInfo(TheEffect));
	Result := 3;
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
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
	Result := 2;
end;

function VCLua_ToolButton_GetPreferredSize2(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
	PreferredWidth:integer;
	PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, -1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	PreferredWidth := lua_tointeger(L,2);
	PreferredHeight := lua_tointeger(L,3);
	Raw := luaL_optbool(L,4,false);
	WithThemeSpace := luaL_optbool(L,5,true);
	lToolButton.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
	Result := 1;
end;

function IsToolButton(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TToolButton);
end;
function AsToolButton(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TToolButton then
    lua_push(L, TToolButton(o))
  else
    lua_pushnil(L);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TToolButton');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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

function IsToolBar(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TToolBar);
end;
function AsToolBar(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TToolBar then
    lua_push(L, TToolBar(o))
  else
    lua_pushnil(L);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TToolBar');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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

begin
	SetLength(ToolButtonFuncs, 8+1);
	ToolButtonFuncs[0].name:='CheckMenuDropdown';
	ToolButtonFuncs[0].func:=@VCLua_ToolButton_CheckMenuDropdown;
	ToolButtonFuncs[1].name:='Click';
	ToolButtonFuncs[1].func:=@VCLua_ToolButton_Click;
	ToolButtonFuncs[2].name:='ArrowClick';
	ToolButtonFuncs[2].func:=@VCLua_ToolButton_ArrowClick;
	ToolButtonFuncs[3].name:='GetCurrentIcon';
	ToolButtonFuncs[3].func:=@VCLua_ToolButton_GetCurrentIcon;
	ToolButtonFuncs[4].name:='GetCurrentIcon2';
	ToolButtonFuncs[4].func:=@VCLua_ToolButton_GetCurrentIcon2;
	ToolButtonFuncs[5].name:='GetPreferredSize';
	ToolButtonFuncs[5].func:=@VCLua_ToolButton_GetPreferredSize;
	ToolButtonFuncs[6].name:='GetPreferredSize2';
	ToolButtonFuncs[6].func:=@VCLua_ToolButton_GetPreferredSize2;
	ToolButtonFuncs[7].name:='PointInArrow';
	ToolButtonFuncs[7].func:=@VCLua_ToolButton_PointInArrow;
	ToolButtonFuncs[8].name:=nil;
	ToolButtonFuncs[8].func:=nil;

	SetLength(ToolBarFuncs, 4+1);
	ToolBarFuncs[0].name:='EndUpdate';
	ToolBarFuncs[0].func:=@VCLua_ToolBar_EndUpdate;
	ToolBarFuncs[1].name:='FlipChildren';
	ToolBarFuncs[1].func:=@VCLua_ToolBar_FlipChildren;
	ToolBarFuncs[2].name:='SetButtonSize';
	ToolBarFuncs[2].func:=@VCLua_ToolBar_SetButtonSize;
	ToolBarFuncs[3].name:='CanFocus';
	ToolBarFuncs[3].func:=@VCLua_ToolBar_CanFocus;
	ToolBarFuncs[4].name:=nil;
	ToolBarFuncs[4].func:=nil;

end.
