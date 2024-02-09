(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaControl;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Controls, Graphics, TypInfo;

function CreateControl(L: Plua_State): Integer; cdecl;
function IsControl(L: Plua_State): Integer; cdecl;
function AsControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaControl = class(TControl)
        LuaCtl: TVCLuaControl;
    end;
var
    ControlFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	KeepDockSiteSize := luaL_optbool(L,5,true);
	ret := lControl.ManualDock(NewDockSite,DropControl,ControlSide,KeepDockSiteSize);
	lua_push(L,ret);
	
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
	KeepDockSiteSize := luaL_optbool(L,3,true);
	ret := lControl.ManualFloat(TheScreenRect,KeepDockSiteSize);
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	FreeCompositeSide := luaL_optbool(L,5,true);
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
	lua_push(L,ret);
	
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
	Raw := luaL_optbool(L,2,false);
	WithThemeSpace := luaL_optbool(L,3,true);
	lControl.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
	Result := 2;
end;

function VCLua_Control_GetPreferredSize2(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	PreferredWidth:integer;
	PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, -1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	PreferredWidth := lua_tointeger(L,2);
	PreferredHeight := lua_tointeger(L,3);
	Raw := luaL_optbool(L,4,false);
	WithThemeSpace := luaL_optbool(L,5,true);
	lControl.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	
	lControl.ShouldAutoAdjust(AWidth,AHeight);
	lua_push(L,AWidth);
	lua_push(L,AHeight);
	Result := 2;
end;

function VCLua_Control_ShouldAutoAdjust2(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	AWidth:Boolean;
	AHeight:Boolean;
begin
	CheckArg(L, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	AWidth := lua_toboolean(L,2);
	AHeight := lua_toboolean(L,3);
	lControl.ShouldAutoAdjust(AWidth,AHeight);
	lua_push(L,AWidth);
	lua_push(L,AHeight);
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
	Threshold := luaL_optint(L,3,-1);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret,TypeInfo(ret));
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret,TypeInfo(ret));
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	Buffer := PChar(lua_toStringCP(L,2));
	BufSize := lua_tointeger(L,3);
	ret := lControl.GetTextBuf(Buffer,BufSize);
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Control_SetTextBuf(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Buffer:PChar;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	Buffer := PChar(lua_toStringCP(L,2));
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
	Result := 1;
end;

function IsControl(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TControl);
end;
function AsControl(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TControl then
    lua_push(L, TControl(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TControl',v);
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
	lControl.LuaCtl := TVCLuaControl.Create(lControl as TComponent,L,nil,'TControl');
	InitControl(L,lControl,Name);
	CreateTableForKnownType(L,'TControl',lControl);
	Result := 1;
end;

begin
	SetLength(ControlFuncs, 85+1);
	ControlFuncs[0].name:='DragDrop';
	ControlFuncs[0].func:=@VCLua_Control_DragDrop;
	ControlFuncs[1].name:='Dock';
	ControlFuncs[1].func:=@VCLua_Control_Dock;
	ControlFuncs[2].name:='ManualDock';
	ControlFuncs[2].func:=@VCLua_Control_ManualDock;
	ControlFuncs[3].name:='ManualFloat';
	ControlFuncs[3].func:=@VCLua_Control_ManualFloat;
	ControlFuncs[4].name:='ReplaceDockedControl';
	ControlFuncs[4].func:=@VCLua_Control_ReplaceDockedControl;
	ControlFuncs[5].name:='Docked';
	ControlFuncs[5].func:=@VCLua_Control_Docked;
	ControlFuncs[6].name:='Dragging';
	ControlFuncs[6].func:=@VCLua_Control_Dragging;
	ControlFuncs[7].name:='ScaleDesignToForm';
	ControlFuncs[7].func:=@VCLua_Control_ScaleDesignToForm;
	ControlFuncs[8].name:='ScaleFormToDesign';
	ControlFuncs[8].func:=@VCLua_Control_ScaleFormToDesign;
	ControlFuncs[9].name:='Scale96ToForm';
	ControlFuncs[9].func:=@VCLua_Control_Scale96ToForm;
	ControlFuncs[10].name:='ScaleFormTo96';
	ControlFuncs[10].func:=@VCLua_Control_ScaleFormTo96;
	ControlFuncs[11].name:='Scale96ToFont';
	ControlFuncs[11].func:=@VCLua_Control_Scale96ToFont;
	ControlFuncs[12].name:='ScaleFontTo96';
	ControlFuncs[12].func:=@VCLua_Control_ScaleFontTo96;
	ControlFuncs[13].name:='ScaleScreenToFont';
	ControlFuncs[13].func:=@VCLua_Control_ScaleScreenToFont;
	ControlFuncs[14].name:='ScaleFontToScreen';
	ControlFuncs[14].func:=@VCLua_Control_ScaleFontToScreen;
	ControlFuncs[15].name:='Scale96ToScreen';
	ControlFuncs[15].func:=@VCLua_Control_Scale96ToScreen;
	ControlFuncs[16].name:='ScaleScreenTo96';
	ControlFuncs[16].func:=@VCLua_Control_ScaleScreenTo96;
	ControlFuncs[17].name:='AnchorToNeighbour';
	ControlFuncs[17].func:=@VCLua_Control_AnchorToNeighbour;
	ControlFuncs[18].name:='AnchorParallel';
	ControlFuncs[18].func:=@VCLua_Control_AnchorParallel;
	ControlFuncs[19].name:='AnchorHorizontalCenterTo';
	ControlFuncs[19].func:=@VCLua_Control_AnchorHorizontalCenterTo;
	ControlFuncs[20].name:='AnchorVerticalCenterTo';
	ControlFuncs[20].func:=@VCLua_Control_AnchorVerticalCenterTo;
	ControlFuncs[21].name:='AnchorToCompanion';
	ControlFuncs[21].func:=@VCLua_Control_AnchorToCompanion;
	ControlFuncs[22].name:='AnchorSame';
	ControlFuncs[22].func:=@VCLua_Control_AnchorSame;
	ControlFuncs[23].name:='AnchorAsAlign';
	ControlFuncs[23].func:=@VCLua_Control_AnchorAsAlign;
	ControlFuncs[24].name:='AnchorClient';
	ControlFuncs[24].func:=@VCLua_Control_AnchorClient;
	ControlFuncs[25].name:='AnchoredControlCount';
	ControlFuncs[25].func:=@VCLua_Control_AnchoredControlCount;
	ControlFuncs[26].name:='SetBounds';
	ControlFuncs[26].func:=@VCLua_Control_SetBounds;
	ControlFuncs[27].name:='SetInitialBounds';
	ControlFuncs[27].func:=@VCLua_Control_SetInitialBounds;
	ControlFuncs[28].name:='SetBoundsKeepBase';
	ControlFuncs[28].func:=@VCLua_Control_SetBoundsKeepBase;
	ControlFuncs[29].name:='GetPreferredSize';
	ControlFuncs[29].func:=@VCLua_Control_GetPreferredSize;
	ControlFuncs[30].name:='GetPreferredSize2';
	ControlFuncs[30].func:=@VCLua_Control_GetPreferredSize2;
	ControlFuncs[31].name:='GetCanvasScaleFactor';
	ControlFuncs[31].func:=@VCLua_Control_GetCanvasScaleFactor;
	ControlFuncs[32].name:='GetDefaultWidth';
	ControlFuncs[32].func:=@VCLua_Control_GetDefaultWidth;
	ControlFuncs[33].name:='GetDefaultHeight';
	ControlFuncs[33].func:=@VCLua_Control_GetDefaultHeight;
	ControlFuncs[34].name:='GetDefaultColor';
	ControlFuncs[34].func:=@VCLua_Control_GetDefaultColor;
	ControlFuncs[35].name:='GetColorResolvingParent';
	ControlFuncs[35].func:=@VCLua_Control_GetColorResolvingParent;
	ControlFuncs[36].name:='GetRGBColorResolvingParent';
	ControlFuncs[36].func:=@VCLua_Control_GetRGBColorResolvingParent;
	ControlFuncs[37].name:='GetSidePosition';
	ControlFuncs[37].func:=@VCLua_Control_GetSidePosition;
	ControlFuncs[38].name:='CNPreferredSizeChanged';
	ControlFuncs[38].func:=@VCLua_Control_CNPreferredSizeChanged;
	ControlFuncs[39].name:='InvalidatePreferredSize';
	ControlFuncs[39].func:=@VCLua_Control_InvalidatePreferredSize;
	ControlFuncs[40].name:='UpdateBaseBounds';
	ControlFuncs[40].func:=@VCLua_Control_UpdateBaseBounds;
	ControlFuncs[41].name:='ShouldAutoAdjust';
	ControlFuncs[41].func:=@VCLua_Control_ShouldAutoAdjust;
	ControlFuncs[42].name:='ShouldAutoAdjust2';
	ControlFuncs[42].func:=@VCLua_Control_ShouldAutoAdjust2;
	ControlFuncs[43].name:='FixDesignFontsPPI';
	ControlFuncs[43].func:=@VCLua_Control_FixDesignFontsPPI;
	ControlFuncs[44].name:='ScaleFontsPPI';
	ControlFuncs[44].func:=@VCLua_Control_ScaleFontsPPI;
	ControlFuncs[45].name:='BeforeDestruction';
	ControlFuncs[45].func:=@VCLua_Control_BeforeDestruction;
	ControlFuncs[46].name:='EditingDone';
	ControlFuncs[46].func:=@VCLua_Control_EditingDone;
	ControlFuncs[47].name:='ExecuteDefaultAction';
	ControlFuncs[47].func:=@VCLua_Control_ExecuteDefaultAction;
	ControlFuncs[48].name:='ExecuteCancelAction';
	ControlFuncs[48].func:=@VCLua_Control_ExecuteCancelAction;
	ControlFuncs[49].name:='BeginDrag';
	ControlFuncs[49].func:=@VCLua_Control_BeginDrag;
	ControlFuncs[50].name:='EndDrag';
	ControlFuncs[50].func:=@VCLua_Control_EndDrag;
	ControlFuncs[51].name:='BringToFront';
	ControlFuncs[51].func:=@VCLua_Control_BringToFront;
	ControlFuncs[52].name:='HasParent';
	ControlFuncs[52].func:=@VCLua_Control_HasParent;
	ControlFuncs[53].name:='GetParentComponent';
	ControlFuncs[53].func:=@VCLua_Control_GetParentComponent;
	ControlFuncs[54].name:='IsParentOf';
	ControlFuncs[54].func:=@VCLua_Control_IsParentOf;
	ControlFuncs[55].name:='GetTopParent';
	ControlFuncs[55].func:=@VCLua_Control_GetTopParent;
	ControlFuncs[56].name:='FindSubComponent';
	ControlFuncs[56].func:=@VCLua_Control_FindSubComponent;
	ControlFuncs[57].name:='FormIsUpdating';
	ControlFuncs[57].func:=@VCLua_Control_FormIsUpdating;
	ControlFuncs[58].name:='IsProcessingPaintMsg';
	ControlFuncs[58].func:=@VCLua_Control_IsProcessingPaintMsg;
	ControlFuncs[59].name:='Hide';
	ControlFuncs[59].func:=@VCLua_Control_Hide;
	ControlFuncs[60].name:='Refresh';
	ControlFuncs[60].func:=@VCLua_Control_Refresh;
	ControlFuncs[61].name:='Repaint';
	ControlFuncs[61].func:=@VCLua_Control_Repaint;
	ControlFuncs[62].name:='Invalidate';
	ControlFuncs[62].func:=@VCLua_Control_Invalidate;
	ControlFuncs[63].name:='SendToBack';
	ControlFuncs[63].func:=@VCLua_Control_SendToBack;
	ControlFuncs[64].name:='SetTempCursor';
	ControlFuncs[64].func:=@VCLua_Control_SetTempCursor;
	ControlFuncs[65].name:='UpdateRolesForForm';
	ControlFuncs[65].func:=@VCLua_Control_UpdateRolesForForm;
	ControlFuncs[66].name:='ActiveDefaultControlChanged';
	ControlFuncs[66].func:=@VCLua_Control_ActiveDefaultControlChanged;
	ControlFuncs[67].name:='GetTextBuf';
	ControlFuncs[67].func:=@VCLua_Control_GetTextBuf;
	ControlFuncs[68].name:='GetTextLen';
	ControlFuncs[68].func:=@VCLua_Control_GetTextLen;
	ControlFuncs[69].name:='SetTextBuf';
	ControlFuncs[69].func:=@VCLua_Control_SetTextBuf;
	ControlFuncs[70].name:='ScreenToClient';
	ControlFuncs[70].func:=@VCLua_Control_ScreenToClient;
	ControlFuncs[71].name:='ClientToScreen';
	ControlFuncs[71].func:=@VCLua_Control_ClientToScreen;
	ControlFuncs[72].name:='ScreenToControl';
	ControlFuncs[72].func:=@VCLua_Control_ScreenToControl;
	ControlFuncs[73].name:='ControlToScreen';
	ControlFuncs[73].func:=@VCLua_Control_ControlToScreen;
	ControlFuncs[74].name:='ClientToParent';
	ControlFuncs[74].func:=@VCLua_Control_ClientToParent;
	ControlFuncs[75].name:='ParentToClient';
	ControlFuncs[75].func:=@VCLua_Control_ParentToClient;
	ControlFuncs[76].name:='GetChildrenRect';
	ControlFuncs[76].func:=@VCLua_Control_GetChildrenRect;
	ControlFuncs[77].name:='Show';
	ControlFuncs[77].func:=@VCLua_Control_Show;
	ControlFuncs[78].name:='Update';
	ControlFuncs[78].func:=@VCLua_Control_Update;
	ControlFuncs[79].name:='HandleObjectShouldBeVisible';
	ControlFuncs[79].func:=@VCLua_Control_HandleObjectShouldBeVisible;
	ControlFuncs[80].name:='ParentDestroyingHandle';
	ControlFuncs[80].func:=@VCLua_Control_ParentDestroyingHandle;
	ControlFuncs[81].name:='ParentHandlesAllocated';
	ControlFuncs[81].func:=@VCLua_Control_ParentHandlesAllocated;
	ControlFuncs[82].name:='InitiateAction';
	ControlFuncs[82].func:=@VCLua_Control_InitiateAction;
	ControlFuncs[83].name:='ShowHelp';
	ControlFuncs[83].func:=@VCLua_Control_ShowHelp;
	ControlFuncs[84].name:='HasHelp';
	ControlFuncs[84].func:=@VCLua_Control_HasHelp;
	ControlFuncs[85].name:=nil;
	ControlFuncs[85].func:=nil;

end.
