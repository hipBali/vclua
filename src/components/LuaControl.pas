(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaControl;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Controls, Graphics;

function CreateControl(L: Plua_State): Integer; cdecl;
procedure ControlToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaControl = class(TControl)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_Control_DragDrop(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Source:TObject;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 4);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Source := TObject(GetLuaObject(L,2));
	X := lua_tointeger(L,3);
	Y := lua_tointeger(L,4);
	lControl.DragDrop(Source,X,Y);
	
	Result := 0;
end;

function VCLua_Control_Dock(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	NewDockSite:TWinControl;
	ARect:TRect;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	NewDockSite := TWinControl(GetLuaObject(L,2));
	ARect := lua_toTRect(L,3);
	lControl.Dock(NewDockSite,ARect);
	
	Result := 0;
end;

function VCLua_Control_ManualDock(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	NewDockSite:TWinControl;
	DropControl:TControl;
	ControlSide:TAlign;
	KeepDockSiteSize:Boolean;
	ret:Boolean;
begin
	CheckArg(L, -1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	NewDockSite := TWinControl(GetLuaObject(L,2));
	DropControl := TControl(GetLuaObject(L,3));
	ControlSide := TAlign(GetLuaObject(L,4));
	KeepDockSiteSize := luaL_optbool(L,5, true);
	ret := lControl.ManualDock(NewDockSite,DropControl,ControlSide,KeepDockSiteSize);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ManualFloat(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	TheScreenRect:TRect;
	KeepDockSiteSize:Boolean;
	ret:Boolean;
begin
	CheckArg(L, -1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	TheScreenRect := lua_toTRect(L,2);
	KeepDockSiteSize := luaL_optbool(L,3, true);
	ret := lControl.ManualFloat(TheScreenRect,KeepDockSiteSize);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ReplaceDockedControl(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Control:TControl;
	NewDockSite:TWinControl;
	DropControl:TControl;
	ControlSide:TAlign;
	ret:Boolean;
begin
	CheckArg(L, 5);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Control := TControl(GetLuaObject(L,2));
	NewDockSite := TWinControl(GetLuaObject(L,3));
	DropControl := TControl(GetLuaObject(L,4));
	ControlSide := TAlign(GetLuaObject(L,5));
	ret := lControl.ReplaceDockedControl(Control,NewDockSite,DropControl,ControlSide);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_Docked(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.Docked();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_Dragging(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.Dragging();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScaleDesignToForm(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.ScaleDesignToForm(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScaleFormToDesign(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.ScaleFormToDesign(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_Scale96ToForm(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.Scale96ToForm(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScaleFormTo96(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.ScaleFormTo96(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_Scale96ToFont(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.Scale96ToFont(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScaleFontTo96(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.ScaleFontTo96(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScaleScreenToFont(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.ScaleScreenToFont(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScaleFontToScreen(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.ScaleFontToScreen(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_Scale96ToScreen(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.Scale96ToScreen(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScaleScreenTo96(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ASize:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ASize := lua_tointeger(L,2);
	ret := lControl.ScaleScreenTo96(ASize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_AnchorToNeighbour(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Side:TAnchorKind;
	Space:TSpacingSize;
	Sibling:TControl;
begin
	CheckArg(L, 4);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Side := TAnchorKind(GetLuaObject(L,2));
	Space := TSpacingSize(GetLuaObject(L,3));
	Sibling := TControl(GetLuaObject(L,4));
	lControl.AnchorToNeighbour(Side,Space,Sibling);
	
	Result := 0;
end;

function VCLua_Control_AnchorParallel(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Side:TAnchorKind;
	Space:TSpacingSize;
	Sibling:TControl;
begin
	CheckArg(L, 4);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Side := TAnchorKind(GetLuaObject(L,2));
	Space := TSpacingSize(GetLuaObject(L,3));
	Sibling := TControl(GetLuaObject(L,4));
	lControl.AnchorParallel(Side,Space,Sibling);
	
	Result := 0;
end;

function VCLua_Control_AnchorHorizontalCenterTo(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Sibling:TControl;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Sibling := TControl(GetLuaObject(L,2));
	lControl.AnchorHorizontalCenterTo(Sibling);
	
	Result := 0;
end;

function VCLua_Control_AnchorVerticalCenterTo(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Sibling:TControl;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Sibling := TControl(GetLuaObject(L,2));
	lControl.AnchorVerticalCenterTo(Sibling);
	
	Result := 0;
end;

function VCLua_Control_AnchorToCompanion(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Side:TAnchorKind;
	Space:TSpacingSize;
	Sibling:TControl;
	FreeCompositeSide:boolean;
begin
	CheckArg(L, -1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Side := TAnchorKind(GetLuaObject(L,2));
	Space := TSpacingSize(GetLuaObject(L,3));
	Sibling := TControl(GetLuaObject(L,4));
	FreeCompositeSide := luaL_optbool(L,5, true);
	lControl.AnchorToCompanion(Side,Space,Sibling,FreeCompositeSide);
	
	Result := 0;
end;

function VCLua_Control_AnchorSame(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Side:TAnchorKind;
	Sibling:TControl;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Side := TAnchorKind(GetLuaObject(L,2));
	Sibling := TControl(GetLuaObject(L,3));
	lControl.AnchorSame(Side,Sibling);
	
	Result := 0;
end;

function VCLua_Control_AnchorAsAlign(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	TheAlign:TAlign;
	Space:TSpacingSize;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	TheAlign := TAlign(GetLuaObject(L,2));
	Space := TSpacingSize(GetLuaObject(L,3));
	lControl.AnchorAsAlign(TheAlign,Space);
	
	Result := 0;
end;

function VCLua_Control_AnchorClient(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Space:TSpacingSize;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Space := TSpacingSize(GetLuaObject(L,2));
	lControl.AnchorClient(Space);
	
	Result := 0;
end;

function VCLua_Control_AnchoredControlCount(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.AnchoredControlCount();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_SetBounds(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	aLeft:integer;
	aTop:integer;
	aWidth:integer;
	aHeight:integer;
begin
	CheckArg(L, 5);
	lControl := TLuaControl(GetLuaObject(L, 1));
	aLeft := lua_tointeger(L,2);
	aTop := lua_tointeger(L,3);
	aWidth := lua_tointeger(L,4);
	aHeight := lua_tointeger(L,5);
	lControl.SetBounds(aLeft,aTop,aWidth,aHeight);
	
	Result := 0;
end;

function VCLua_Control_SetInitialBounds(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	aLeft:integer;
	aTop:integer;
	aWidth:integer;
	aHeight:integer;
begin
	CheckArg(L, 5);
	lControl := TLuaControl(GetLuaObject(L, 1));
	aLeft := lua_tointeger(L,2);
	aTop := lua_tointeger(L,3);
	aWidth := lua_tointeger(L,4);
	aHeight := lua_tointeger(L,5);
	lControl.SetInitialBounds(aLeft,aTop,aWidth,aHeight);
	
	Result := 0;
end;

function VCLua_Control_SetBoundsKeepBase(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	aLeft:integer;
	aTop:integer;
	aWidth:integer;
	aHeight:integer;
begin
	CheckArg(L, 5);
	lControl := TLuaControl(GetLuaObject(L, 1));
	aLeft := lua_tointeger(L,2);
	aTop := lua_tointeger(L,3);
	aWidth := lua_tointeger(L,4);
	aHeight := lua_tointeger(L,5);
	lControl.SetBoundsKeepBase(aLeft,aTop,aWidth,aHeight);
	
	Result := 0;
end;

function VCLua_Control_GetPreferredSize(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	PreferredWidth:integer;
	 PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, -1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Raw := luaL_optbool(L,2, false);
	WithThemeSpace := luaL_optbool(L,3, true);
	lControl.GetPreferredSize(PreferredWidth, PreferredHeight,Raw,WithThemeSpace);
	lua_pushinteger(L,PreferredWidth);
	lua_pushinteger(L, PreferredHeight);
	Result := 2;
end;

function VCLua_Control_GetCanvasScaleFactor(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:Double;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetCanvasScaleFactor();
	lua_pushnumber(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetDefaultWidth(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetDefaultWidth();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetDefaultHeight(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetDefaultHeight();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetDefaultColor(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	DefaultColorType:TDefaultColorType;
	ret:TColor;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	DefaultColorType := TDefaultColorType(GetLuaObject(L,2));
	ret := lControl.GetDefaultColor(DefaultColorType);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetColorResolvingParent(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:TColor;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetColorResolvingParent();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetRGBColorResolvingParent(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:TColor;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetRGBColorResolvingParent();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetSidePosition(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Side:TAnchorKind;
	ret:integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Side := TAnchorKind(GetLuaObject(L,2));
	ret := lControl.GetSidePosition(Side);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_CNPreferredSizeChanged(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.CNPreferredSizeChanged();
	
	Result := 0;
end;

function VCLua_Control_InvalidatePreferredSize(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.InvalidatePreferredSize();
	
	Result := 0;
end;

function VCLua_Control_UpdateBaseBounds(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	StoreBounds:boolean;
	StoreParentClientSize:boolean;
	UseLoadedValues:boolean;
begin
	CheckArg(L, 4);
	lControl := TLuaControl(GetLuaObject(L, 1));
	StoreBounds := lua_toboolean(L,2);
	StoreParentClientSize := lua_toboolean(L,3);
	UseLoadedValues := lua_toboolean(L,4);
	lControl.UpdateBaseBounds(StoreBounds,StoreParentClientSize,UseLoadedValues);
	
	Result := 0;
end;

function VCLua_Control_ShouldAutoAdjust(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	AWidth:Boolean;
	 AHeight:Boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	
	lControl.ShouldAutoAdjust(AWidth, AHeight);
	lua_pushboolean(L,AWidth);
	lua_pushboolean(L, AHeight);
	Result := 2;
end;

function VCLua_Control_FixDesignFontsPPI(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ADesignTimePPI:Integer;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ADesignTimePPI := lua_tointeger(L,2);
	lControl.FixDesignFontsPPI(ADesignTimePPI);
	
	Result := 0;
end;

function VCLua_Control_ScaleFontsPPI(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	AToPPI:Integer;
	AProportion:Double;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	AToPPI := lua_tointeger(L,2);
	AProportion := lua_tonumber(L,3);
	lControl.ScaleFontsPPI(AToPPI,AProportion);
	
	Result := 0;
end;

function VCLua_Control_BeforeDestruction(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.BeforeDestruction();
	
	Result := 0;
end;

function VCLua_Control_EditingDone(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.EditingDone();
	
	Result := 0;
end;

function VCLua_Control_ExecuteDefaultAction(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.ExecuteDefaultAction();
	
	Result := 0;
end;

function VCLua_Control_ExecuteCancelAction(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.ExecuteCancelAction();
	
	Result := 0;
end;

function VCLua_Control_BeginDrag(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Immediate:Boolean;
	Threshold:Integer;
begin
	CheckArg(L, -1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Immediate := lua_toboolean(L,2);
	Threshold := luaL_optint(L,3, -1);
	lControl.BeginDrag(Immediate,Threshold);
	
	Result := 0;
end;

function VCLua_Control_EndDrag(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Drop:Boolean;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Drop := lua_toboolean(L,2);
	lControl.EndDrag(Drop);
	
	Result := 0;
end;

function VCLua_Control_BringToFront(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.BringToFront();
	
	Result := 0;
end;

function VCLua_Control_HasParent(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.HasParent();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetParentComponent(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetParentComponent();
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_Control_IsParentOf(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	AControl:TControl;
	ret:boolean;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	ret := lControl.IsParentOf(AControl);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetTopParent(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:TControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetTopParent();
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_Control_FindSubComponent(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	AName:string;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	AName := lua_toStringCP(L,2);
	ret := lControl.FindSubComponent(AName);
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_Control_FormIsUpdating(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.FormIsUpdating();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_IsProcessingPaintMsg(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.IsProcessingPaintMsg();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_Hide(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.Hide();
	
	Result := 0;
end;

function VCLua_Control_Refresh(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.Refresh();
	
	Result := 0;
end;

function VCLua_Control_Repaint(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.Repaint();
	
	Result := 0;
end;

function VCLua_Control_Invalidate(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.Invalidate();
	
	Result := 0;
end;

function VCLua_Control_SendToBack(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.SendToBack();
	
	Result := 0;
end;

function VCLua_Control_SetTempCursor(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Value:TCursor;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Value := TCursor(lua_tointeger(L,2));
	lControl.SetTempCursor(Value);
	
	Result := 0;
end;

function VCLua_Control_UpdateRolesForForm(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.UpdateRolesForForm();
	
	Result := 0;
end;

function VCLua_Control_ActiveDefaultControlChanged(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	NewControl:TControl;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	NewControl := TControl(GetLuaObject(L,2));
	lControl.ActiveDefaultControlChanged(NewControl);
	
	Result := 0;
end;

function VCLua_Control_GetTextBuf(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Buffer:PChar;
	BufSize:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Buffer := PChar(lua_tostring(L,2));
	BufSize := lua_tointeger(L,3);
	ret := lControl.GetTextBuf(Buffer,BufSize);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetTextLen(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:Integer;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.GetTextLen();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Control_SetTextBuf(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Buffer:PChar;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Buffer := PChar(lua_tostring(L,2));
	lControl.SetTextBuf(Buffer);
	
	Result := 0;
end;

function VCLua_Control_ScreenToClient(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	APoint:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	APoint := lua_toTPoint(L,2);
	ret := lControl.ScreenToClient(APoint);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ClientToScreen(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	APoint:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	APoint := lua_toTPoint(L,2);
	ret := lControl.ClientToScreen(APoint);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ScreenToControl(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	APoint:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	APoint := lua_toTPoint(L,2);
	ret := lControl.ScreenToControl(APoint);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ControlToScreen(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	APoint:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	APoint := lua_toTPoint(L,2);
	ret := lControl.ControlToScreen(APoint);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ClientToParent(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Point:TPoint;
	AParent:TWinControl;
	ret:TPoint;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Point := lua_toTPoint(L,2);
	AParent := TWinControl(GetLuaObject(L,3));
	ret := lControl.ClientToParent(Point,AParent);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ParentToClient(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Point:TPoint;
	AParent:TWinControl;
	ret:TPoint;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Point := lua_toTPoint(L,2);
	AParent := TWinControl(GetLuaObject(L,3));
	ret := lControl.ParentToClient(Point,AParent);
	lua_pushTPoint(L,ret);
	
	Result := 1;
end;

function VCLua_Control_GetChildrenRect(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	Scrolled:boolean;
	ret:TRect;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Scrolled := lua_toboolean(L,2);
	ret := lControl.GetChildrenRect(Scrolled);
	lua_pushTRect(L,ret);
	
	Result := 1;
end;

function VCLua_Control_Show(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.Show();
	
	Result := 0;
end;

function VCLua_Control_Update(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.Update();
	
	Result := 0;
end;

function VCLua_Control_HandleObjectShouldBeVisible(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.HandleObjectShouldBeVisible();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ParentDestroyingHandle(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.ParentDestroyingHandle();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_ParentHandlesAllocated(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.ParentHandlesAllocated();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Control_InitiateAction(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.InitiateAction();
	
	Result := 0;
end;

function VCLua_Control_ShowHelp(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	lControl.ShowHelp();
	
	Result := 0;
end;

function VCLua_Control_HasHelp(L: Plua_State): Integer; cdecl;
var 
	lControl:TLuaControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	ret := lControl.HasHelp();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

procedure ControlToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'DragDrop', @VCLua_Control_DragDrop);
	LuaSetTableFunction(L, Index, 'Dock', @VCLua_Control_Dock);
	LuaSetTableFunction(L, Index, 'ManualDock', @VCLua_Control_ManualDock);
	LuaSetTableFunction(L, Index, 'ManualFloat', @VCLua_Control_ManualFloat);
	LuaSetTableFunction(L, Index, 'ReplaceDockedControl', @VCLua_Control_ReplaceDockedControl);
	LuaSetTableFunction(L, Index, 'Docked', @VCLua_Control_Docked);
	LuaSetTableFunction(L, Index, 'Dragging', @VCLua_Control_Dragging);
	LuaSetTableFunction(L, Index, 'ScaleDesignToForm', @VCLua_Control_ScaleDesignToForm);
	LuaSetTableFunction(L, Index, 'ScaleFormToDesign', @VCLua_Control_ScaleFormToDesign);
	LuaSetTableFunction(L, Index, 'Scale96ToForm', @VCLua_Control_Scale96ToForm);
	LuaSetTableFunction(L, Index, 'ScaleFormTo96', @VCLua_Control_ScaleFormTo96);
	LuaSetTableFunction(L, Index, 'Scale96ToFont', @VCLua_Control_Scale96ToFont);
	LuaSetTableFunction(L, Index, 'ScaleFontTo96', @VCLua_Control_ScaleFontTo96);
	LuaSetTableFunction(L, Index, 'ScaleScreenToFont', @VCLua_Control_ScaleScreenToFont);
	LuaSetTableFunction(L, Index, 'ScaleFontToScreen', @VCLua_Control_ScaleFontToScreen);
	LuaSetTableFunction(L, Index, 'Scale96ToScreen', @VCLua_Control_Scale96ToScreen);
	LuaSetTableFunction(L, Index, 'ScaleScreenTo96', @VCLua_Control_ScaleScreenTo96);
	LuaSetTableFunction(L, Index, 'AnchorToNeighbour', @VCLua_Control_AnchorToNeighbour);
	LuaSetTableFunction(L, Index, 'AnchorParallel', @VCLua_Control_AnchorParallel);
	LuaSetTableFunction(L, Index, 'AnchorHorizontalCenterTo', @VCLua_Control_AnchorHorizontalCenterTo);
	LuaSetTableFunction(L, Index, 'AnchorVerticalCenterTo', @VCLua_Control_AnchorVerticalCenterTo);
	LuaSetTableFunction(L, Index, 'AnchorToCompanion', @VCLua_Control_AnchorToCompanion);
	LuaSetTableFunction(L, Index, 'AnchorSame', @VCLua_Control_AnchorSame);
	LuaSetTableFunction(L, Index, 'AnchorAsAlign', @VCLua_Control_AnchorAsAlign);
	LuaSetTableFunction(L, Index, 'AnchorClient', @VCLua_Control_AnchorClient);
	LuaSetTableFunction(L, Index, 'AnchoredControlCount', @VCLua_Control_AnchoredControlCount);
	LuaSetTableFunction(L, Index, 'SetBounds', @VCLua_Control_SetBounds);
	LuaSetTableFunction(L, Index, 'SetInitialBounds', @VCLua_Control_SetInitialBounds);
	LuaSetTableFunction(L, Index, 'SetBoundsKeepBase', @VCLua_Control_SetBoundsKeepBase);
	LuaSetTableFunction(L, Index, 'GetPreferredSize', @VCLua_Control_GetPreferredSize);
	LuaSetTableFunction(L, Index, 'GetCanvasScaleFactor', @VCLua_Control_GetCanvasScaleFactor);
	LuaSetTableFunction(L, Index, 'GetDefaultWidth', @VCLua_Control_GetDefaultWidth);
	LuaSetTableFunction(L, Index, 'GetDefaultHeight', @VCLua_Control_GetDefaultHeight);
	LuaSetTableFunction(L, Index, 'GetDefaultColor', @VCLua_Control_GetDefaultColor);
	LuaSetTableFunction(L, Index, 'GetColorResolvingParent', @VCLua_Control_GetColorResolvingParent);
	LuaSetTableFunction(L, Index, 'GetRGBColorResolvingParent', @VCLua_Control_GetRGBColorResolvingParent);
	LuaSetTableFunction(L, Index, 'GetSidePosition', @VCLua_Control_GetSidePosition);
	LuaSetTableFunction(L, Index, 'CNPreferredSizeChanged', @VCLua_Control_CNPreferredSizeChanged);
	LuaSetTableFunction(L, Index, 'InvalidatePreferredSize', @VCLua_Control_InvalidatePreferredSize);
	LuaSetTableFunction(L, Index, 'UpdateBaseBounds', @VCLua_Control_UpdateBaseBounds);
	LuaSetTableFunction(L, Index, 'ShouldAutoAdjust', @VCLua_Control_ShouldAutoAdjust);
	LuaSetTableFunction(L, Index, 'FixDesignFontsPPI', @VCLua_Control_FixDesignFontsPPI);
	LuaSetTableFunction(L, Index, 'ScaleFontsPPI', @VCLua_Control_ScaleFontsPPI);
	LuaSetTableFunction(L, Index, 'BeforeDestruction', @VCLua_Control_BeforeDestruction);
	LuaSetTableFunction(L, Index, 'EditingDone', @VCLua_Control_EditingDone);
	LuaSetTableFunction(L, Index, 'ExecuteDefaultAction', @VCLua_Control_ExecuteDefaultAction);
	LuaSetTableFunction(L, Index, 'ExecuteCancelAction', @VCLua_Control_ExecuteCancelAction);
	LuaSetTableFunction(L, Index, 'BeginDrag', @VCLua_Control_BeginDrag);
	LuaSetTableFunction(L, Index, 'EndDrag', @VCLua_Control_EndDrag);
	LuaSetTableFunction(L, Index, 'BringToFront', @VCLua_Control_BringToFront);
	LuaSetTableFunction(L, Index, 'HasParent', @VCLua_Control_HasParent);
	LuaSetTableFunction(L, Index, 'GetParentComponent', @VCLua_Control_GetParentComponent);
	LuaSetTableFunction(L, Index, 'IsParentOf', @VCLua_Control_IsParentOf);
	LuaSetTableFunction(L, Index, 'GetTopParent', @VCLua_Control_GetTopParent);
	LuaSetTableFunction(L, Index, 'FindSubComponent', @VCLua_Control_FindSubComponent);
	LuaSetTableFunction(L, Index, 'FormIsUpdating', @VCLua_Control_FormIsUpdating);
	LuaSetTableFunction(L, Index, 'IsProcessingPaintMsg', @VCLua_Control_IsProcessingPaintMsg);
	LuaSetTableFunction(L, Index, 'Hide', @VCLua_Control_Hide);
	LuaSetTableFunction(L, Index, 'Refresh', @VCLua_Control_Refresh);
	LuaSetTableFunction(L, Index, 'Repaint', @VCLua_Control_Repaint);
	LuaSetTableFunction(L, Index, 'Invalidate', @VCLua_Control_Invalidate);
	LuaSetTableFunction(L, Index, 'SendToBack', @VCLua_Control_SendToBack);
	LuaSetTableFunction(L, Index, 'SetTempCursor', @VCLua_Control_SetTempCursor);
	LuaSetTableFunction(L, Index, 'UpdateRolesForForm', @VCLua_Control_UpdateRolesForForm);
	LuaSetTableFunction(L, Index, 'ActiveDefaultControlChanged', @VCLua_Control_ActiveDefaultControlChanged);
	LuaSetTableFunction(L, Index, 'GetTextBuf', @VCLua_Control_GetTextBuf);
	LuaSetTableFunction(L, Index, 'GetTextLen', @VCLua_Control_GetTextLen);
	LuaSetTableFunction(L, Index, 'SetTextBuf', @VCLua_Control_SetTextBuf);
	LuaSetTableFunction(L, Index, 'ScreenToClient', @VCLua_Control_ScreenToClient);
	LuaSetTableFunction(L, Index, 'ClientToScreen', @VCLua_Control_ClientToScreen);
	LuaSetTableFunction(L, Index, 'ScreenToControl', @VCLua_Control_ScreenToControl);
	LuaSetTableFunction(L, Index, 'ControlToScreen', @VCLua_Control_ControlToScreen);
	LuaSetTableFunction(L, Index, 'ClientToParent', @VCLua_Control_ClientToParent);
	LuaSetTableFunction(L, Index, 'ParentToClient', @VCLua_Control_ParentToClient);
	LuaSetTableFunction(L, Index, 'GetChildrenRect', @VCLua_Control_GetChildrenRect);
	LuaSetTableFunction(L, Index, 'Show', @VCLua_Control_Show);
	LuaSetTableFunction(L, Index, 'Update', @VCLua_Control_Update);
	LuaSetTableFunction(L, Index, 'HandleObjectShouldBeVisible', @VCLua_Control_HandleObjectShouldBeVisible);
	LuaSetTableFunction(L, Index, 'ParentDestroyingHandle', @VCLua_Control_ParentDestroyingHandle);
	LuaSetTableFunction(L, Index, 'ParentHandlesAllocated', @VCLua_Control_ParentHandlesAllocated);
	LuaSetTableFunction(L, Index, 'InitiateAction', @VCLua_Control_InitiateAction);
	LuaSetTableFunction(L, Index, 'ShowHelp', @VCLua_Control_ShowHelp);
	LuaSetTableFunction(L, Index, 'HasHelp', @VCLua_Control_HasHelp);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateControl(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lControl := TLuaControl.Create(Parent);
	lControl.Parent := TWinControl(Parent);
	lControl.LuaCtl := TVCLuaControl.Create(TControl(lControl),L,@ControlToTable);
	InitControl(L,lControl,Name);
	ControlToTable(L, -1, lControl);
	Result := 1;
end;

end.
