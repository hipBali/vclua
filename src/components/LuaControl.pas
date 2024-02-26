(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaControl;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Controls, TypInfo, LuaVmt;

function CreateControl(L: Plua_State): Integer; cdecl;
function IsControl(L: Plua_State): Integer; cdecl;
function AsControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaControl = class(TControl)
        LuaCtl: TVCLuaControl;
    end;
var
    ControlFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Graphics;

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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'DragDrop', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'Dock', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ManualDock', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ManualFloat', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ReplaceDockedControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'Docked', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'Dragging', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleDesignToForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFormToDesign', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'Scale96ToForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFormTo96', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'Scale96ToFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFontTo96', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleScreenToFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFontToScreen', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'Scale96ToScreen', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleScreenTo96', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorToNeighbour', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorParallel', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorHorizontalCenterTo', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorVerticalCenterTo', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorToCompanion', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorSame', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorAsAlign', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorClient', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchoredControlCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Control_AnchoredControls(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Index:integer;
	ret:TControl;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lControl.AnchoredControls[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchoredControls', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'SetBounds', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'SetInitialBounds', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'SetBoundsKeepBase', E.ClassName, E.Message);
	end;
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetPreferredSize', E.ClassName, E.Message);
	end;
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetPreferredSize', E.ClassName, E.Message);
	end;
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetCanvasScaleFactor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetDefaultWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetDefaultHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetDefaultColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetColorResolvingParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetRGBColorResolvingParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetSidePosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Control_CNPreferredSizeChanged(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.CNPreferredSizeChanged();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'CNPreferredSizeChanged', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_InvalidatePreferredSize(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.InvalidatePreferredSize();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'InvalidatePreferredSize', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'UpdateBaseBounds', E.ClassName, E.Message);
	end;
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Control', 'ShouldAutoAdjust', E.ClassName, E.Message);
	end;
	lua_push(L,AWidth);
	lua_push(L,AHeight);
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Control', 'ShouldAutoAdjust', E.ClassName, E.Message);
	end;
	lua_push(L,AWidth);
	lua_push(L,AHeight);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'FixDesignFontsPPI', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScaleFontsPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_BeforeDestruction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.BeforeDestruction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'BeforeDestruction', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_EditingDone(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.EditingDone();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'EditingDone', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_ExecuteDefaultAction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.ExecuteDefaultAction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'ExecuteDefaultAction', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_ExecuteCancelAction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.ExecuteCancelAction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'ExecuteCancelAction', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'BeginDrag', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'EndDrag', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_BringToFront(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.BringToFront();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'BringToFront', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'HasParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetParentComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'IsParentOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetTopParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'FindSubComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'FormIsUpdating', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'IsProcessingPaintMsg', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Control_Hide(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Hide();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'Hide', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_Refresh(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Refresh();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'Refresh', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_Repaint(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Repaint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'Repaint', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_Invalidate(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Invalidate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'Invalidate', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_SendToBack(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.SendToBack();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'SendToBack', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'SetTempCursor', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_UpdateRolesForForm(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.UpdateRolesForForm();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'UpdateRolesForForm', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'ActiveDefaultControlChanged', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetTextBuf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetTextLen', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'SetTextBuf', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScreenToClient', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ClientToScreen', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ScreenToControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ControlToScreen', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ClientToParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ParentToClient', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'GetChildrenRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Control_Show(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Show();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'Show', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_Update(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.Update();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'Update', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'HandleObjectShouldBeVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ParentDestroyingHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'ParentHandlesAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Control_InitiateAction(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.InitiateAction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'InitiateAction', E.ClassName, E.Message);
	end;
end;

function VCLua_Control_ShowHelp(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
begin
	CheckArg(L, 1);
	lControl := TLuaControl(GetLuaObject(L, 1));
	try
		lControl.ShowHelp();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Control', 'ShowHelp', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'HasHelp', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Control_AnchorSide(L: Plua_State): Integer; cdecl;
var
	lControl:TLuaControl;
	Kind:TAnchorKind;
	ret:TAnchorSide;
begin
	CheckArg(L, 2);
	lControl := TLuaControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Kind,TypeInfo(TAnchorKind));
	try
		ret := lControl.AnchorSide[Kind];
		lua_push(L,ret,TypeInfo(ret));
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Control', 'AnchorSide', E.ClassName, E.Message);
	end;
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
	ControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ControlFuncs, 'DragDrop', @VCLua_Control_DragDrop);
	TLuaMethodInfo.Create(ControlFuncs, 'Dock', @VCLua_Control_Dock);
	TLuaMethodInfo.Create(ControlFuncs, 'ManualDock', @VCLua_Control_ManualDock);
	TLuaMethodInfo.Create(ControlFuncs, 'ManualFloat', @VCLua_Control_ManualFloat);
	TLuaMethodInfo.Create(ControlFuncs, 'ReplaceDockedControl', @VCLua_Control_ReplaceDockedControl);
	TLuaMethodInfo.Create(ControlFuncs, 'Docked', @VCLua_Control_Docked);
	TLuaMethodInfo.Create(ControlFuncs, 'Dragging', @VCLua_Control_Dragging);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleDesignToForm', @VCLua_Control_ScaleDesignToForm);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleFormToDesign', @VCLua_Control_ScaleFormToDesign);
	TLuaMethodInfo.Create(ControlFuncs, 'Scale96ToForm', @VCLua_Control_Scale96ToForm);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleFormTo96', @VCLua_Control_ScaleFormTo96);
	TLuaMethodInfo.Create(ControlFuncs, 'Scale96ToFont', @VCLua_Control_Scale96ToFont);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleFontTo96', @VCLua_Control_ScaleFontTo96);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleScreenToFont', @VCLua_Control_ScaleScreenToFont);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleFontToScreen', @VCLua_Control_ScaleFontToScreen);
	TLuaMethodInfo.Create(ControlFuncs, 'Scale96ToScreen', @VCLua_Control_Scale96ToScreen);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleScreenTo96', @VCLua_Control_ScaleScreenTo96);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorToNeighbour', @VCLua_Control_AnchorToNeighbour);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorParallel', @VCLua_Control_AnchorParallel);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorHorizontalCenterTo', @VCLua_Control_AnchorHorizontalCenterTo);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorVerticalCenterTo', @VCLua_Control_AnchorVerticalCenterTo);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorToCompanion', @VCLua_Control_AnchorToCompanion);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorSame', @VCLua_Control_AnchorSame);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorAsAlign', @VCLua_Control_AnchorAsAlign);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorClient', @VCLua_Control_AnchorClient);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchoredControlCount', @VCLua_Control_AnchoredControlCount);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchoredControls', @VCLua_Control_AnchoredControls);
	TLuaMethodInfo.Create(ControlFuncs, 'SetBounds', @VCLua_Control_SetBounds);
	TLuaMethodInfo.Create(ControlFuncs, 'SetInitialBounds', @VCLua_Control_SetInitialBounds);
	TLuaMethodInfo.Create(ControlFuncs, 'SetBoundsKeepBase', @VCLua_Control_SetBoundsKeepBase);
	TLuaMethodInfo.Create(ControlFuncs, 'GetPreferredSize', @VCLua_Control_GetPreferredSize);
	TLuaMethodInfo.Create(ControlFuncs, 'GetPreferredSize2', @VCLua_Control_GetPreferredSize2);
	TLuaMethodInfo.Create(ControlFuncs, 'GetCanvasScaleFactor', @VCLua_Control_GetCanvasScaleFactor);
	TLuaMethodInfo.Create(ControlFuncs, 'GetDefaultWidth', @VCLua_Control_GetDefaultWidth);
	TLuaMethodInfo.Create(ControlFuncs, 'GetDefaultHeight', @VCLua_Control_GetDefaultHeight);
	TLuaMethodInfo.Create(ControlFuncs, 'GetDefaultColor', @VCLua_Control_GetDefaultColor);
	TLuaMethodInfo.Create(ControlFuncs, 'GetColorResolvingParent', @VCLua_Control_GetColorResolvingParent);
	TLuaMethodInfo.Create(ControlFuncs, 'GetRGBColorResolvingParent', @VCLua_Control_GetRGBColorResolvingParent);
	TLuaMethodInfo.Create(ControlFuncs, 'GetSidePosition', @VCLua_Control_GetSidePosition);
	TLuaMethodInfo.Create(ControlFuncs, 'CNPreferredSizeChanged', @VCLua_Control_CNPreferredSizeChanged);
	TLuaMethodInfo.Create(ControlFuncs, 'InvalidatePreferredSize', @VCLua_Control_InvalidatePreferredSize);
	TLuaMethodInfo.Create(ControlFuncs, 'UpdateBaseBounds', @VCLua_Control_UpdateBaseBounds);
	TLuaMethodInfo.Create(ControlFuncs, 'ShouldAutoAdjust', @VCLua_Control_ShouldAutoAdjust);
	TLuaMethodInfo.Create(ControlFuncs, 'ShouldAutoAdjust2', @VCLua_Control_ShouldAutoAdjust2);
	TLuaMethodInfo.Create(ControlFuncs, 'FixDesignFontsPPI', @VCLua_Control_FixDesignFontsPPI);
	TLuaMethodInfo.Create(ControlFuncs, 'ScaleFontsPPI', @VCLua_Control_ScaleFontsPPI);
	TLuaMethodInfo.Create(ControlFuncs, 'BeforeDestruction', @VCLua_Control_BeforeDestruction);
	TLuaMethodInfo.Create(ControlFuncs, 'EditingDone', @VCLua_Control_EditingDone);
	TLuaMethodInfo.Create(ControlFuncs, 'ExecuteDefaultAction', @VCLua_Control_ExecuteDefaultAction);
	TLuaMethodInfo.Create(ControlFuncs, 'ExecuteCancelAction', @VCLua_Control_ExecuteCancelAction);
	TLuaMethodInfo.Create(ControlFuncs, 'BeginDrag', @VCLua_Control_BeginDrag);
	TLuaMethodInfo.Create(ControlFuncs, 'EndDrag', @VCLua_Control_EndDrag);
	TLuaMethodInfo.Create(ControlFuncs, 'BringToFront', @VCLua_Control_BringToFront);
	TLuaMethodInfo.Create(ControlFuncs, 'HasParent', @VCLua_Control_HasParent);
	TLuaMethodInfo.Create(ControlFuncs, 'GetParentComponent', @VCLua_Control_GetParentComponent);
	TLuaMethodInfo.Create(ControlFuncs, 'IsParentOf', @VCLua_Control_IsParentOf);
	TLuaMethodInfo.Create(ControlFuncs, 'GetTopParent', @VCLua_Control_GetTopParent);
	TLuaMethodInfo.Create(ControlFuncs, 'FindSubComponent', @VCLua_Control_FindSubComponent);
	TLuaMethodInfo.Create(ControlFuncs, 'FormIsUpdating', @VCLua_Control_FormIsUpdating);
	TLuaMethodInfo.Create(ControlFuncs, 'IsProcessingPaintMsg', @VCLua_Control_IsProcessingPaintMsg);
	TLuaMethodInfo.Create(ControlFuncs, 'Hide', @VCLua_Control_Hide);
	TLuaMethodInfo.Create(ControlFuncs, 'Refresh', @VCLua_Control_Refresh);
	TLuaMethodInfo.Create(ControlFuncs, 'Repaint', @VCLua_Control_Repaint);
	TLuaMethodInfo.Create(ControlFuncs, 'Invalidate', @VCLua_Control_Invalidate);
	TLuaMethodInfo.Create(ControlFuncs, 'SendToBack', @VCLua_Control_SendToBack);
	TLuaMethodInfo.Create(ControlFuncs, 'SetTempCursor', @VCLua_Control_SetTempCursor);
	TLuaMethodInfo.Create(ControlFuncs, 'UpdateRolesForForm', @VCLua_Control_UpdateRolesForForm);
	TLuaMethodInfo.Create(ControlFuncs, 'ActiveDefaultControlChanged', @VCLua_Control_ActiveDefaultControlChanged);
	TLuaMethodInfo.Create(ControlFuncs, 'GetTextBuf', @VCLua_Control_GetTextBuf);
	TLuaMethodInfo.Create(ControlFuncs, 'GetTextLen', @VCLua_Control_GetTextLen);
	TLuaMethodInfo.Create(ControlFuncs, 'SetTextBuf', @VCLua_Control_SetTextBuf);
	TLuaMethodInfo.Create(ControlFuncs, 'ScreenToClient', @VCLua_Control_ScreenToClient);
	TLuaMethodInfo.Create(ControlFuncs, 'ClientToScreen', @VCLua_Control_ClientToScreen);
	TLuaMethodInfo.Create(ControlFuncs, 'ScreenToControl', @VCLua_Control_ScreenToControl);
	TLuaMethodInfo.Create(ControlFuncs, 'ControlToScreen', @VCLua_Control_ControlToScreen);
	TLuaMethodInfo.Create(ControlFuncs, 'ClientToParent', @VCLua_Control_ClientToParent);
	TLuaMethodInfo.Create(ControlFuncs, 'ParentToClient', @VCLua_Control_ParentToClient);
	TLuaMethodInfo.Create(ControlFuncs, 'GetChildrenRect', @VCLua_Control_GetChildrenRect);
	TLuaMethodInfo.Create(ControlFuncs, 'Show', @VCLua_Control_Show);
	TLuaMethodInfo.Create(ControlFuncs, 'Update', @VCLua_Control_Update);
	TLuaMethodInfo.Create(ControlFuncs, 'HandleObjectShouldBeVisible', @VCLua_Control_HandleObjectShouldBeVisible);
	TLuaMethodInfo.Create(ControlFuncs, 'ParentDestroyingHandle', @VCLua_Control_ParentDestroyingHandle);
	TLuaMethodInfo.Create(ControlFuncs, 'ParentHandlesAllocated', @VCLua_Control_ParentHandlesAllocated);
	TLuaMethodInfo.Create(ControlFuncs, 'InitiateAction', @VCLua_Control_InitiateAction);
	TLuaMethodInfo.Create(ControlFuncs, 'ShowHelp', @VCLua_Control_ShowHelp);
	TLuaMethodInfo.Create(ControlFuncs, 'HasHelp', @VCLua_Control_HasHelp);
	TLuaMethodInfo.Create(ControlFuncs, 'AnchorSide', @VCLua_Control_AnchorSide);
end.
