(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaControl;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Controls, TypInfo;

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
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils, Graphics;

function VCLua_Control_DragDrop(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Source:TObject;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 4);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	luaL_check(L,3,@X);
	luaL_check(L,4,@Y);
	try
		lControl.DragDrop(Source,X,Y);
	except
		on E: Exception do
			CallError(L, 'Control', 'DragDrop', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@NewDockSite);
	luaL_check(L,3,@ARect);
	try
		lControl.Dock(NewDockSite,ARect);
	except
		on E: Exception do
			CallError(L, 'Control', 'Dock', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 2, 5);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@NewDockSite);
	TTrait<TControl>.luaL_optcheck(L, 3, @DropControl, nil);
	TTraitPti<TAlign>.luaL_optcheck(L, 4, @ControlSide, alNone, TypeInfo(TAlign));
	TTrait<Boolean>.luaL_optcheck(L, 5, @KeepDockSiteSize, true);
	try
		ret := lControl.ManualDock(NewDockSite,DropControl,ControlSide,KeepDockSiteSize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ManualDock', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 2, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@TheScreenRect);
	TTrait<Boolean>.luaL_optcheck(L, 3, @KeepDockSiteSize, true);
	try
		ret := lControl.ManualFloat(TheScreenRect,KeepDockSiteSize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ManualFloat', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Control);
	luaL_check(L,3,@NewDockSite);
	luaL_check(L,4,@DropControl);
	luaL_check(L,5,@ControlSide,TypeInfo(TAlign));
	try
		ret := lControl.ReplaceDockedControl(Control,NewDockSite,DropControl,ControlSide);
	except
		on E: Exception do
			CallError(L, 'Control', 'ReplaceDockedControl', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.Docked();
	except
		on E: Exception do
			CallError(L, 'Control', 'Docked', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.Dragging();
	except
		on E: Exception do
			CallError(L, 'Control', 'Dragging', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.ScaleDesignToForm(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleDesignToForm', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.ScaleFormToDesign(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFormToDesign', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.Scale96ToForm(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'Scale96ToForm', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.ScaleFormTo96(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFormTo96', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.Scale96ToFont(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'Scale96ToFont', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.ScaleFontTo96(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFontTo96', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.ScaleScreenToFont(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleScreenToFont', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.ScaleFontToScreen(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFontToScreen', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.Scale96ToScreen(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'Scale96ToScreen', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ASize);
	try
		ret := lControl.ScaleScreenTo96(ASize);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleScreenTo96', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Side,TypeInfo(TAnchorKind));
	luaL_check(L,3,@Space);
	luaL_check(L,4,@Sibling);
	try
		lControl.AnchorToNeighbour(Side,Space,Sibling);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorToNeighbour', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Side,TypeInfo(TAnchorKind));
	luaL_check(L,3,@Space);
	luaL_check(L,4,@Sibling);
	try
		lControl.AnchorParallel(Side,Space,Sibling);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorParallel', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_AnchorHorizontalCenterTo(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Sibling:TControl;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Sibling);
	try
		lControl.AnchorHorizontalCenterTo(Sibling);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorHorizontalCenterTo', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_AnchorVerticalCenterTo(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Sibling:TControl;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Sibling);
	try
		lControl.AnchorVerticalCenterTo(Sibling);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorVerticalCenterTo', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 4, 5);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Side,TypeInfo(TAnchorKind));
	luaL_check(L,3,@Space);
	luaL_check(L,4,@Sibling);
	TTrait<boolean>.luaL_optcheck(L, 5, @FreeCompositeSide, true);
	try
		lControl.AnchorToCompanion(Side,Space,Sibling,FreeCompositeSide);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorToCompanion', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Side,TypeInfo(TAnchorKind));
	luaL_check(L,3,@Sibling);
	try
		lControl.AnchorSame(Side,Sibling);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorSame', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@TheAlign,TypeInfo(TAlign));
	luaL_check(L,3,@Space);
	try
		lControl.AnchorAsAlign(TheAlign,Space);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorAsAlign', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_AnchorClient(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Space:TSpacingSize;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Space);
	try
		lControl.AnchorClient(Space);
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorClient', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_AnchoredControlCount(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		ret := lControl.AnchoredControlCount();
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchoredControlCount', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@aLeft);
	luaL_check(L,3,@aTop);
	luaL_check(L,4,@aWidth);
	luaL_check(L,5,@aHeight);
	try
		lControl.SetBounds(aLeft,aTop,aWidth,aHeight);
	except
		on E: Exception do
			CallError(L, 'Control', 'SetBounds', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@aLeft);
	luaL_check(L,3,@aTop);
	luaL_check(L,4,@aWidth);
	luaL_check(L,5,@aHeight);
	try
		lControl.SetInitialBounds(aLeft,aTop,aWidth,aHeight);
	except
		on E: Exception do
			CallError(L, 'Control', 'SetInitialBounds', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@aLeft);
	luaL_check(L,3,@aTop);
	luaL_check(L,4,@aWidth);
	luaL_check(L,5,@aHeight);
	try
		lControl.SetBoundsKeepBase(aLeft,aTop,aWidth,aHeight);
	except
		on E: Exception do
			CallError(L, 'Control', 'SetBoundsKeepBase', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 1, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	TTrait<boolean>.luaL_optcheck(L, 2, @Raw, false);
	TTrait<boolean>.luaL_optcheck(L, 3, @WithThemeSpace, true);
	try
		lControl.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	except
		on E: Exception do
			CallError(L, 'Control', 'GetPreferredSize', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 3, 5);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@PreferredWidth);
	luaL_check(L,3,@PreferredHeight);
	TTrait<boolean>.luaL_optcheck(L, 4, @Raw, false);
	TTrait<boolean>.luaL_optcheck(L, 5, @WithThemeSpace, true);
	try
		lControl.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	except
		on E: Exception do
			CallError(L, 'Control', 'GetPreferredSize', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetCanvasScaleFactor();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetCanvasScaleFactor', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetDefaultWidth();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetDefaultWidth', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetDefaultHeight();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetDefaultHeight', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@DefaultColorType,TypeInfo(TDefaultColorType));
	try
		ret := lControl.GetDefaultColor(DefaultColorType);
	except
		on E: Exception do
			CallError(L, 'Control', 'GetDefaultColor', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetColorResolvingParent();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetColorResolvingParent', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetRGBColorResolvingParent();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetRGBColorResolvingParent', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Side,TypeInfo(TAnchorKind));
	try
		ret := lControl.GetSidePosition(Side);
	except
		on E: Exception do
			CallError(L, 'Control', 'GetSidePosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Control_CNPreferredSizeChanged(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.CNPreferredSizeChanged();
	except
		on E: Exception do
			CallError(L, 'Control', 'CNPreferredSizeChanged', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_InvalidatePreferredSize(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.InvalidatePreferredSize();
	except
		on E: Exception do
			CallError(L, 'Control', 'InvalidatePreferredSize', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@StoreBounds);
	luaL_check(L,3,@StoreParentClientSize);
	luaL_check(L,4,@UseLoadedValues);
	try
		lControl.UpdateBaseBounds(StoreBounds,StoreParentClientSize,UseLoadedValues);
	except
		on E: Exception do
			CallError(L, 'Control', 'UpdateBaseBounds', E.ClassName, E.Message);
	end;
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
	try
		lControl.ShouldAutoAdjust(AWidth,AHeight);
	except
		on E: Exception do
			CallError(L, 'Control', 'ShouldAutoAdjust', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@AWidth);
	luaL_check(L,3,@AHeight);
	try
		lControl.ShouldAutoAdjust(AWidth,AHeight);
	except
		on E: Exception do
			CallError(L, 'Control', 'ShouldAutoAdjust', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ADesignTimePPI);
	try
		lControl.FixDesignFontsPPI(ADesignTimePPI);
	except
		on E: Exception do
			CallError(L, 'Control', 'FixDesignFontsPPI', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@AToPPI);
	luaL_check(L,3,@AProportion);
	try
		lControl.ScaleFontsPPI(AToPPI,AProportion);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFontsPPI', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_BeforeDestruction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.BeforeDestruction();
	except
		on E: Exception do
			CallError(L, 'Control', 'BeforeDestruction', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_EditingDone(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.EditingDone();
	except
		on E: Exception do
			CallError(L, 'Control', 'EditingDone', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_ExecuteDefaultAction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.ExecuteDefaultAction();
	except
		on E: Exception do
			CallError(L, 'Control', 'ExecuteDefaultAction', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_ExecuteCancelAction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.ExecuteCancelAction();
	except
		on E: Exception do
			CallError(L, 'Control', 'ExecuteCancelAction', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_BeginDrag(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Immediate:Boolean;
	Threshold:Integer;
begin
	CheckArg(L, 2, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Immediate);
	TTrait<Integer>.luaL_optcheck(L, 3, @Threshold, -1);
	try
		lControl.BeginDrag(Immediate,Threshold);
	except
		on E: Exception do
			CallError(L, 'Control', 'BeginDrag', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_EndDrag(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Drop:Boolean;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Drop);
	try
		lControl.EndDrag(Drop);
	except
		on E: Exception do
			CallError(L, 'Control', 'EndDrag', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_BringToFront(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.BringToFront();
	except
		on E: Exception do
			CallError(L, 'Control', 'BringToFront', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_HasParent(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		ret := lControl.HasParent();
	except
		on E: Exception do
			CallError(L, 'Control', 'HasParent', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetParentComponent();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetParentComponent', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@AControl);
	try
		ret := lControl.IsParentOf(AControl);
	except
		on E: Exception do
			CallError(L, 'Control', 'IsParentOf', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetTopParent();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetTopParent', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@AName);
	try
		ret := lControl.FindSubComponent(AName);
	except
		on E: Exception do
			CallError(L, 'Control', 'FindSubComponent', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.FormIsUpdating();
	except
		on E: Exception do
			CallError(L, 'Control', 'FormIsUpdating', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.IsProcessingPaintMsg();
	except
		on E: Exception do
			CallError(L, 'Control', 'IsProcessingPaintMsg', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Control_Hide(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Hide();
	except
		on E: Exception do
			CallError(L, 'Control', 'Hide', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_Refresh(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Refresh();
	except
		on E: Exception do
			CallError(L, 'Control', 'Refresh', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_Repaint(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Repaint();
	except
		on E: Exception do
			CallError(L, 'Control', 'Repaint', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_Invalidate(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Invalidate();
	except
		on E: Exception do
			CallError(L, 'Control', 'Invalidate', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_SendToBack(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.SendToBack();
	except
		on E: Exception do
			CallError(L, 'Control', 'SendToBack', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_SetTempCursor(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Value:TCursor;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Value);
	try
		lControl.SetTempCursor(Value);
	except
		on E: Exception do
			CallError(L, 'Control', 'SetTempCursor', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_UpdateRolesForForm(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.UpdateRolesForForm();
	except
		on E: Exception do
			CallError(L, 'Control', 'UpdateRolesForForm', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_ActiveDefaultControlChanged(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	NewControl:TControl;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@NewControl);
	try
		lControl.ActiveDefaultControlChanged(NewControl);
	except
		on E: Exception do
			CallError(L, 'Control', 'ActiveDefaultControlChanged', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Buffer);
	luaL_check(L,3,@BufSize);
	try
		ret := lControl.GetTextBuf(Buffer,BufSize);
	except
		on E: Exception do
			CallError(L, 'Control', 'GetTextBuf', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.GetTextLen();
	except
		on E: Exception do
			CallError(L, 'Control', 'GetTextLen', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Buffer);
	try
		lControl.SetTextBuf(Buffer);
	except
		on E: Exception do
			CallError(L, 'Control', 'SetTextBuf', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@APoint);
	try
		ret := lControl.ScreenToClient(APoint);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScreenToClient', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@APoint);
	try
		ret := lControl.ClientToScreen(APoint);
	except
		on E: Exception do
			CallError(L, 'Control', 'ClientToScreen', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@APoint);
	try
		ret := lControl.ScreenToControl(APoint);
	except
		on E: Exception do
			CallError(L, 'Control', 'ScreenToControl', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@APoint);
	try
		ret := lControl.ControlToScreen(APoint);
	except
		on E: Exception do
			CallError(L, 'Control', 'ControlToScreen', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 2, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Point);
	TTrait<TWinControl>.luaL_optcheck(L, 3, @AParent, nil);
	try
		ret := lControl.ClientToParent(Point,AParent);
	except
		on E: Exception do
			CallError(L, 'Control', 'ClientToParent', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 2, 3);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Point);
	TTrait<TWinControl>.luaL_optcheck(L, 3, @AParent, nil);
	try
		ret := lControl.ParentToClient(Point,AParent);
	except
		on E: Exception do
			CallError(L, 'Control', 'ParentToClient', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Scrolled);
	try
		ret := lControl.GetChildrenRect(Scrolled);
	except
		on E: Exception do
			CallError(L, 'Control', 'GetChildrenRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Control_Show(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Show();
	except
		on E: Exception do
			CallError(L, 'Control', 'Show', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_Update(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Update();
	except
		on E: Exception do
			CallError(L, 'Control', 'Update', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_HandleObjectShouldBeVisible(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		ret := lControl.HandleObjectShouldBeVisible();
	except
		on E: Exception do
			CallError(L, 'Control', 'HandleObjectShouldBeVisible', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.ParentDestroyingHandle();
	except
		on E: Exception do
			CallError(L, 'Control', 'ParentDestroyingHandle', E.ClassName, E.Message);
	end;
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
	try
		ret := lControl.ParentHandlesAllocated();
	except
		on E: Exception do
			CallError(L, 'Control', 'ParentHandlesAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Control_InitiateAction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.InitiateAction();
	except
		on E: Exception do
			CallError(L, 'Control', 'InitiateAction', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_ShowHelp(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.ShowHelp();
	except
		on E: Exception do
			CallError(L, 'Control', 'ShowHelp', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Control_HasHelp(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		ret := lControl.HasHelp();
	except
		on E: Exception do
			CallError(L, 'Control', 'HasHelp', E.ClassName, E.Message);
	end;
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
