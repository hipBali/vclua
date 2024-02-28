(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToolBar;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

function CreateToolButton(L: Plua_State): Integer; cdecl;
function IsToolButton(L: Plua_State): Integer; cdecl;
function AsToolButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToolButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaToolButton = class(TToolButton)
        LuaCtl: TVCLuaControl;
    end;
var
    ToolButtonFuncs: TLuaVmt;
    ToolButtonSets: TLuaVmt;

function CreateToolBar(L: Plua_State): Integer; cdecl;
function IsToolBar(L: Plua_State): Integer; cdecl;
function AsToolBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToolBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaToolBar = class(TToolBar)
        LuaCtl: TVCLuaControl;
    end;
var
    ToolBarFuncs: TLuaVmt;
    ToolBarSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, GraphType, ImgList, LuaImageList;

function VCLua_ToolButton_CheckMenuDropdown(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	try
		ret := lToolButton.CheckMenuDropdown();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'CheckMenuDropdown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ToolButton_Click(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	try
		lToolButton.Click();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'Click', E.ClassName, E.Message);
	end;
end;

function VCLua_ToolButton_ArrowClick(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	try
		lToolButton.ArrowClick();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'ArrowClick', E.ClassName, E.Message);
	end;
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
		Result := 3;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetCurrentIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ImageList,TypeInfo(ImageList));
	lua_push(L,TheIndex);
	lua_push(L,TheEffect,TypeInfo(TheEffect));
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
		Result := 3;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetCurrentIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ImageList,TypeInfo(ImageList));
	lua_push(L,TheIndex);
	lua_push(L,TheEffect,TypeInfo(TheEffect));
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetPreferredSize', E.ClassName, E.Message);
	end;
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'GetPreferredSize', E.ClassName, E.Message);
	end;
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
end;

function VCLua_ToolButton_VCLuaGetIndex(L: Plua_State): Integer; cdecl;
var
	lToolButton:TLuaToolButton;
	ret:Integer;
begin
	CheckArg(L, 1);
	lToolButton := TLuaToolButton(GetLuaObject(L, 1));
	try
		ret := lToolButton.Index;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'Index', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolButton', 'PointInArrow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ToolBar_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	try
		lToolBar.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'EndUpdate', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'FlipChildren', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'SetButtonSize', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'CanFocus', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ToolBar_VCLuaGetButtonCount(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	try
		ret := lToolBar.ButtonCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'ButtonCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ToolBar_Buttons(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
	Index:Integer;
	ret:TToolButton;
begin
	CheckArg(L, 2);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lToolBar.Buttons[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'Buttons', E.ClassName, E.Message);
	end;
end;

function VCLua_ToolBar_VCLuaGetRowCount(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	try
		ret := lToolBar.RowCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'RowCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ToolBar_VCLuaGetButtonDropWidth(L: Plua_State): Integer; cdecl;
var
	lToolBar:TLuaToolBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lToolBar := TLuaToolBar(GetLuaObject(L, 1));
	try
		ret := lToolBar.ButtonDropWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolBar', 'ButtonDropWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	ToolButtonFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ToolButtonFuncs, 'CheckMenuDropdown', @VCLua_ToolButton_CheckMenuDropdown);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'Click', @VCLua_ToolButton_Click);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'ArrowClick', @VCLua_ToolButton_ArrowClick);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'GetCurrentIcon', @VCLua_ToolButton_GetCurrentIcon);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'GetCurrentIcon2', @VCLua_ToolButton_GetCurrentIcon2);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'GetPreferredSize', @VCLua_ToolButton_GetPreferredSize);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'GetPreferredSize2', @VCLua_ToolButton_GetPreferredSize2);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'Index', @VCLua_ToolButton_VCLuaGetIndex, mfCall);
	TLuaMethodInfo.Create(ToolButtonFuncs, 'PointInArrow', @VCLua_ToolButton_PointInArrow);
	ToolButtonSets := TLuaVmt.Create;
	
	ToolBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ToolBarFuncs, 'EndUpdate', @VCLua_ToolBar_EndUpdate);
	TLuaMethodInfo.Create(ToolBarFuncs, 'FlipChildren', @VCLua_ToolBar_FlipChildren);
	TLuaMethodInfo.Create(ToolBarFuncs, 'SetButtonSize', @VCLua_ToolBar_SetButtonSize);
	TLuaMethodInfo.Create(ToolBarFuncs, 'CanFocus', @VCLua_ToolBar_CanFocus);
	TLuaMethodInfo.Create(ToolBarFuncs, 'ButtonCount', @VCLua_ToolBar_VCLuaGetButtonCount, mfCall);
	TLuaMethodInfo.Create(ToolBarFuncs, 'Buttons', @VCLua_ToolBar_Buttons);
	TLuaMethodInfo.Create(ToolBarFuncs, 'RowCount', @VCLua_ToolBar_VCLuaGetRowCount, mfCall);
	TLuaMethodInfo.Create(ToolBarFuncs, 'ButtonDropWidth', @VCLua_ToolBar_VCLuaGetButtonDropWidth, mfCall);
	ToolBarSets := TLuaVmt.Create;
	
end.
