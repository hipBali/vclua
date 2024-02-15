(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToolBar;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, ImgList, GraphType, LuaImageList, TypInfo;

function CreateToolButton(L: Plua_State): Integer; cdecl;
function IsToolButton(L: Plua_State): Integer; cdecl;
function AsToolButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToolButton; pti: PTypeInfo = nil); overload; inline;

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

type
    TLuaToolBar = class(TToolBar)
        LuaCtl: TVCLuaControl;
    end;
var
    ToolBarFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

function VCLua_ToolButton_CheckMenuDropdown(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	try
		ret := lToolButton.CheckMenuDropdown();
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'CheckMenuDropdown', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ToolButton_Click(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	try
		lToolButton.Click();
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'Click', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_ToolButton_ArrowClick(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	try
		lToolButton.ArrowClick();
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'ArrowClick', E.ClassName, E.Message);
	end;

	
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
	
	try
		lToolButton.GetCurrentIcon(ImageList,TheIndex,TheEffect);
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetCurrentIcon', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@ImageList);
	luaL_check(L,3,@TheIndex);
	luaL_check(L,4,@TheEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lToolButton.GetCurrentIcon(ImageList,TheIndex,TheEffect);
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetCurrentIcon', E.ClassName, E.Message);
	end;

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
	CheckArg(L, 1, 3);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	TTrait<boolean>.luaL_optcheck(L, 2, @Raw, false);
	TTrait<boolean>.luaL_optcheck(L, 3, @WithThemeSpace, true);
	try
		lToolButton.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetPreferredSize', E.ClassName, E.Message);
	end;

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
	CheckArg(L, 3, 5);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	luaL_check(L,2,@PreferredWidth);
	luaL_check(L,3,@PreferredHeight);
	TTrait<boolean>.luaL_optcheck(L, 4, @Raw, false);
	TTrait<boolean>.luaL_optcheck(L, 5, @WithThemeSpace, true);
	try
		lToolButton.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetPreferredSize', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lToolButton.PointInArrow(X,Y);
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'PointInArrow', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ToolBar_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	try
		lToolBar.EndUpdate();
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'EndUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_ToolBar_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@AllLevels);
	try
		lToolBar.FlipChildren(AllLevels);
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'FlipChildren', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@NewButtonWidth);
	luaL_check(L,3,@NewButtonHeight);
	try
		lToolBar.SetButtonSize(NewButtonWidth,NewButtonHeight);
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'SetButtonSize', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_ToolBar_CanFocus(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	try
		ret := lToolBar.CanFocus();
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'CanFocus', E.ClassName, E.Message);
	end;

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
	CreateTableForKnownType(L,'TToolButton',v);
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
	lToolButton.LuaCtl := TVCLuaControl.Create(lToolButton as TComponent,L,nil,'TToolButton');
	InitControl(L,lToolButton,Name);
	CreateTableForKnownType(L,'TToolButton',lToolButton);
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
	CreateTableForKnownType(L,'TToolBar',v);
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
	lToolBar.LuaCtl := TVCLuaControl.Create(lToolBar as TComponent,L,nil,'TToolBar');
	InitControl(L,lToolBar,Name);
	CreateTableForKnownType(L,'TToolBar',lToolBar);
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
