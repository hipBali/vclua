(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaWinControl;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Controls;

procedure lua_push(L: Plua_State; const v: TWinControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaWinControl = class(TWinControl)
    end;
var
    WinControlFuncs: TLuaVmt;
    WinControlSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Graphics, LCLType, LuaBrush, LuaClassesEvents, LuaControl, LuaControlChildSizing, LuaControlsEvents, LuaEvent, LuaDrag;

function VCLua_WinControl_VCLuaSetOnGetSiteInfo(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnGetSiteInfo));
	lWinControl.OnGetSiteInfo := TLuaEvent.Factory<TGetSiteInfoEvent,TLuaGetSiteInfoEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnGetDockCaption(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnGetDockCaption));
	lWinControl.OnGetDockCaption := TLuaEvent.Factory<TGetDockCaptionEvent,TLuaGetDockCaptionEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetBorderWidth(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:TBorderWidth;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.BorderWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetBorderWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetBorderWidth(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:TBorderWidth;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.BorderWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetBorderWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetBoundsLockCount(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:integer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.BoundsLockCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetBoundsLockCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetBrush(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:TBrush;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.Brush;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetBrush', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetCachedClientHeight(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:integer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.CachedClientHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetCachedClientHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetCachedClientWidth(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:integer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.CachedClientWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetCachedClientWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetChildSizing(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:TControlChildSizing;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.ChildSizing := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetChildSizing', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetChildSizing(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:TControlChildSizing;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.ChildSizing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetChildSizing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetControlCount(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Integer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.ControlCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetControlCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_Controls(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Index:Integer;
	ret:TControl;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lWinControl.Controls[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'Controls', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaSetDefWndProc(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:Pointer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	val := lua_touserdata(L,2);
	try
		lWinControl.DefWndProc := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetDefWndProc', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetDefWndProc(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Pointer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.DefWndProc;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetDefWndProc', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ret);
end;

function VCLua_WinControl_VCLuaGetDockClientCount(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Integer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.DockClientCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetDockClientCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_DockClients(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Index:Integer;
	ret:TControl;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lWinControl.DockClients[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'DockClients', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaSetDockManager(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:TDockManager;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.DockManager := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetDockManager', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetDockManager(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:TDockManager;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.DockManager;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetDockManager', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetDockSite(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.DockSite := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetDockSite', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetDockSite(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.DockSite;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetDockSite', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.DoubleBuffered := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetDoubleBuffered', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.DoubleBuffered;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetDoubleBuffered', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetHandle(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:HWND;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.Handle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetHandle', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:HWND;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetIsFlipped(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.IsFlipped;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetIsFlipped', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetIsResizing(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.IsResizing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetIsResizing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetTabOrder(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:TTabOrder;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.TabOrder := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetTabOrder', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetTabOrder(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:TTabOrder;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.TabOrder;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetTabOrder', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetTabStop(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.TabStop := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetTabStop', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetTabStop(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.TabStop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetTabStop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetOnDockDrop(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnDockDrop));
	lWinControl.OnDockDrop := TLuaEvent.Factory<TDockDropEvent,TLuaDockDropEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnDockOver(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnDockOver));
	lWinControl.OnDockOver := TLuaEvent.Factory<TDockOverEvent,TLuaDockOverEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnEnter(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnEnter));
	lWinControl.OnEnter := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnExit(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnExit));
	lWinControl.OnExit := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnKeyDown(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnKeyDown));
	lWinControl.OnKeyDown := TLuaEvent.Factory<TKeyEvent,TLuaKeyEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnKeyPress(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnKeyPress));
	lWinControl.OnKeyPress := TLuaEvent.Factory<TKeyPressEvent,TLuaKeyPressEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnKeyUp(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnKeyUp));
	lWinControl.OnKeyUp := TLuaEvent.Factory<TKeyEvent,TLuaKeyEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnUnDock(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnUnDock));
	lWinControl.OnUnDock := TLuaEvent.Factory<TUnDockEvent,TLuaUnDockEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetOnUTF8KeyPress(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lWinControl.OnUTF8KeyPress));
	lWinControl.OnUTF8KeyPress := TLuaEvent.Factory<TUTF8KeyPressEvent,TLuaUTF8KeyPressEvent>(L);
	Result := 0;
end;

function VCLua_WinControl_VCLuaSetParentDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.ParentDoubleBuffered := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetParentDoubleBuffered', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetParentDoubleBuffered(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.ParentDoubleBuffered;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetParentDoubleBuffered', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetParentWindow(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:HWND;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.ParentWindow := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetParentWindow', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetParentWindow(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:HWND;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.ParentWindow;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetParentWindow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetShowing(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.Showing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetShowing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetUseDockManager(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.UseDockManager := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetUseDockManager', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetUseDockManager(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.UseDockManager;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetUseDockManager', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaSetDesignerDeleting(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	val:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lWinControl.DesignerDeleting := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetDesignerDeleting', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_VCLuaGetIsSpecialSubControl(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.IsSpecialSubControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetIsSpecialSubControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_VCLuaGetVisibleDockClientCount(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Integer;
begin
	lWinControl := TLuaWinControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lWinControl.VisibleDockClientCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetVisibleDockClientCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_BeginUpdateBounds(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.BeginUpdateBounds();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'BeginUpdateBounds', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_EndUpdateBounds(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.EndUpdateBounds();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'EndUpdateBounds', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_LockRealizeBounds(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.LockRealizeBounds();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'LockRealizeBounds', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_UnlockRealizeBounds(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.UnlockRealizeBounds();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'UnlockRealizeBounds', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_ControlAtPos(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Pos:TPoint;
	AllowDisabled:Boolean;
	ret:TControl;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Pos);
	luaL_check(L,3,@AllowDisabled);
	try
		ret := lWinControl.ControlAtPos(Pos,AllowDisabled);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ControlAtPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_ControlAtPos2(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Pos:TPoint;
	AllowDisabled:Boolean;
	AllowWinControls:Boolean;
	ret:TControl;
begin
	CheckArg(L, 4);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Pos);
	luaL_check(L,3,@AllowDisabled);
	luaL_check(L,4,@AllowWinControls);
	try
		ret := lWinControl.ControlAtPos(Pos,AllowDisabled,AllowWinControls);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ControlAtPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_ControlAtPos3(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Pos:TPoint;
	Flags:TControlAtPosFlags;
	ret:TControl;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Pos);
	luaL_checkSet(L,3,@Flags,TypeInfo(TControlAtPosFlags));
	try
		ret := lWinControl.ControlAtPos(Pos,Flags);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ControlAtPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_ContainsControl(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Control:TControl;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Control);
	try
		ret := lWinControl.ContainsControl(Control);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ContainsControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_DoAdjustClientRectChange(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	InvalidateRect:Boolean;
begin
	CheckArg(L, 1, 2);
	lWinControl := TLuaWinControl(CheckLuaObjectPop(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @InvalidateRect, True);
	try
		lWinControl.DoAdjustClientRectChange(InvalidateRect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'DoAdjustClientRectChange', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_InvalidateClientRectCache(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	WithChildControls:boolean;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@WithChildControls);
	try
		lWinControl.InvalidateClientRectCache(WithChildControls);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'InvalidateClientRectCache', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_ClientRectNeedsInterfaceUpdate(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		ret := lWinControl.ClientRectNeedsInterfaceUpdate();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ClientRectNeedsInterfaceUpdate', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_DisableAlign(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.DisableAlign();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'DisableAlign', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_EnableAlign(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.EnableAlign();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'EnableAlign', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_ReAlign(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.ReAlign();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ReAlign', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_ScrollBy(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	DeltaX:Integer;
	DeltaY:Integer;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@DeltaX);
	luaL_check(L,3,@DeltaY);
	try
		lWinControl.ScrollBy(DeltaX,DeltaY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ScrollBy', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_ScrollBy2(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	DeltaX:Integer;
	DeltaY:Integer;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@DeltaX);
	luaL_check(L,3,@DeltaY);
	try
		lWinControl.ScrollBy(DeltaX,DeltaY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ScrollBy', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_WriteLayoutDebugReport(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Prefix:string;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Prefix);
	try
		lWinControl.WriteLayoutDebugReport(Prefix);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'WriteLayoutDebugReport', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_AutoAdjustLayout(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AMode:TLayoutAdjustmentPolicy;
	AFromPPI:Integer;
	AToPPI:Integer;
	AOldFormWidth:Integer;
	ANewFormWidth:Integer;
begin
	CheckArg(L, 6);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AMode,TypeInfo(TLayoutAdjustmentPolicy));
	luaL_check(L,3,@AFromPPI);
	luaL_check(L,4,@AToPPI);
	luaL_check(L,5,@AOldFormWidth);
	luaL_check(L,6,@ANewFormWidth);
	try
		lWinControl.AutoAdjustLayout(AMode,AFromPPI,AToPPI,AOldFormWidth,ANewFormWidth);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'AutoAdjustLayout', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_FixDesignFontsPPIWithChildren(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ADesignTimePPI:Integer;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@ADesignTimePPI);
	try
		lWinControl.FixDesignFontsPPIWithChildren(ADesignTimePPI);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'FixDesignFontsPPIWithChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_CreateParentedControl(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AParentWindow:HWND;
	ret:TWinControl;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AParentWindow);
	try
		ret := lWinControl.CreateParentedControl(AParentWindow);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'CreateParentedControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_DockDrop(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	DragDockObject:TDragDockObject;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 4);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@DragDockObject);
	luaL_check(L,3,@X);
	luaL_check(L,4,@Y);
	try
		lWinControl.DockDrop(DragDockObject,X,Y);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'DockDrop', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_CanFocus(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		ret := lWinControl.CanFocus();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'CanFocus', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_CanSetFocus(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		ret := lWinControl.CanSetFocus();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'CanSetFocus', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_GetControlIndex(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AControl:TControl;
	ret:integer;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		ret := lWinControl.GetControlIndex(AControl);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetControlIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_SetControlIndex(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AControl:TControl;
	NewIndex:integer;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	luaL_check(L,3,@NewIndex);
	try
		lWinControl.SetControlIndex(AControl,NewIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetControlIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_Focused(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		ret := lWinControl.Focused();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'Focused', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_PerformTab(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ForwardTab:boolean;
	ret:boolean;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@ForwardTab);
	try
		ret := lWinControl.PerformTab(ForwardTab);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'PerformTab', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_FindChildControl(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ControlName:String;
	ret:TControl;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@ControlName);
	try
		ret := lWinControl.FindChildControl(ControlName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'FindChildControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_SelectNext(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	CurControl:TWinControl;
	GoForward:Boolean;
	CheckTabStop:Boolean;
begin
	CheckArg(L, 4);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@CurControl);
	luaL_check(L,3,@GoForward);
	luaL_check(L,4,@CheckTabStop);
	try
		lWinControl.SelectNext(CurControl,GoForward,CheckTabStop);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SelectNext', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_BroadCast(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ToAllMessage:Pointer;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.BroadCast(ToAllMessage);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'BroadCast', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ToAllMessage);
end;

function VCLua_WinControl_BroadCast2(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ToAllMessage:Pointer;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	ToAllMessage := lua_touserdata(L,2);
	try
		lWinControl.BroadCast(ToAllMessage);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'BroadCast', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ToAllMessage);
end;

function VCLua_WinControl_NotifyControls(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Msg:Word;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Msg);
	try
		lWinControl.NotifyControls(Msg);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'NotifyControls', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_DefaultHandler(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AMessage:Pointer;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.DefaultHandler(AMessage);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'DefaultHandler', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,AMessage);
end;

function VCLua_WinControl_DefaultHandler2(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AMessage:Pointer;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	AMessage := lua_touserdata(L,2);
	try
		lWinControl.DefaultHandler(AMessage);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'DefaultHandler', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,AMessage);
end;

function VCLua_WinControl_AddControl(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.AddControl();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'AddControl', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_InsertControl(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lWinControl.InsertControl(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'InsertControl', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_InsertControl2(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AControl:TControl;
	Index:integer;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	luaL_check(L,3,@Index);
	try
		lWinControl.InsertControl(AControl,Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'InsertControl', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_RemoveControl(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lWinControl.RemoveControl(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'RemoveControl', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_SetFocus(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.SetFocus();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetFocus', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AllLevels);
	try
		lWinControl.FlipChildren(AllLevels);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'FlipChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_ScaleBy(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Multiplier:Integer;
	Divider:Integer;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Multiplier);
	luaL_check(L,3,@Divider);
	try
		lWinControl.ScaleBy(Multiplier,Divider);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'ScaleBy', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_GetDockCaption(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AControl:TControl;
	ret:String;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		ret := lWinControl.GetDockCaption(AControl);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetDockCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_UpdateDockCaption(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	Exclude:TControl;
begin
	CheckArg(L, 1, 2);
	lWinControl := TLuaWinControl(CheckLuaObjectPop(L, 1));
	TTrait<TControl>.luaL_optcheck(L, 2, @Exclude, nil);
	try
		lWinControl.UpdateDockCaption(Exclude);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'UpdateDockCaption', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_GetTabOrderList(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	List:TFPList;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@List);
	try
		lWinControl.GetTabOrderList(List);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'GetTabOrderList', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		ret := lWinControl.HandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_HandleNeeded(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		lWinControl.HandleNeeded();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'HandleNeeded', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_BrushCreated(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		ret := lWinControl.BrushCreated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'BrushCreated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_IntfUTF8KeyPress(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	UTF8Key:TUTF8Char;
	RepeatCount:integer;
	SystemKey:boolean;
	ret:boolean;
begin
	CheckArg(L, 3);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@RepeatCount);
	luaL_check(L,3,@SystemKey);
	try
		ret := lWinControl.IntfUTF8KeyPress(UTF8Key,RepeatCount,SystemKey);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'IntfUTF8KeyPress', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,UTF8Key);
end;

function VCLua_WinControl_IntfUTF8KeyPress2(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	UTF8Key:TUTF8Char;
	RepeatCount:integer;
	SystemKey:boolean;
	ret:boolean;
begin
	CheckArg(L, 4);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@UTF8Key);
	luaL_check(L,3,@RepeatCount);
	luaL_check(L,4,@SystemKey);
	try
		ret := lWinControl.IntfUTF8KeyPress(UTF8Key,RepeatCount,SystemKey);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'IntfUTF8KeyPress', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,UTF8Key);
end;

function VCLua_WinControl_IntfGetDropFilesTarget(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ret:TWinControl;
begin
	CheckArg(L, 1);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	try
		ret := lWinControl.IntfGetDropFilesTarget();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'IntfGetDropFilesTarget', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_WinControl_PaintTo(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	ACanvas:TCanvas;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 4);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@X);
	luaL_check(L,4,@Y);
	try
		lWinControl.PaintTo(ACanvas,X,Y);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'PaintTo', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_SetShape(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AShape:TBitmap;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AShape);
	try
		lWinControl.SetShape(AShape);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetShape', E.ClassName, E.Message);
	end;
end;

function VCLua_WinControl_SetShape2(L: Plua_State): Integer; cdecl;
var
	lWinControl:TLuaWinControl;
	AShape:TRegion;
begin
	CheckArg(L, 2);
	lWinControl := TLuaWinControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AShape);
	try
		lWinControl.SetShape(AShape);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'WinControl', 'SetShape', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TWinControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TWinControl',v);
end;

begin
	WinControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(WinControlFuncs, 'BorderWidth', @VCLua_WinControl_VCLuaGetBorderWidth, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'BoundsLockCount', @VCLua_WinControl_VCLuaGetBoundsLockCount, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'Brush', @VCLua_WinControl_VCLuaGetBrush, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'CachedClientHeight', @VCLua_WinControl_VCLuaGetCachedClientHeight, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'CachedClientWidth', @VCLua_WinControl_VCLuaGetCachedClientWidth, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'ChildSizing', @VCLua_WinControl_VCLuaGetChildSizing, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'ControlCount', @VCLua_WinControl_VCLuaGetControlCount, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'Controls', @VCLua_WinControl_Controls);
	TLuaMethodInfo.Create(WinControlFuncs, 'DefWndProc', @VCLua_WinControl_VCLuaGetDefWndProc, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'DockClientCount', @VCLua_WinControl_VCLuaGetDockClientCount, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'DockClients', @VCLua_WinControl_DockClients);
	TLuaMethodInfo.Create(WinControlFuncs, 'DockManager', @VCLua_WinControl_VCLuaGetDockManager, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'DockSite', @VCLua_WinControl_VCLuaGetDockSite, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'DoubleBuffered', @VCLua_WinControl_VCLuaGetDoubleBuffered, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'Handle', @VCLua_WinControl_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'IsFlipped', @VCLua_WinControl_VCLuaGetIsFlipped, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'IsResizing', @VCLua_WinControl_VCLuaGetIsResizing, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'TabOrder', @VCLua_WinControl_VCLuaGetTabOrder, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'TabStop', @VCLua_WinControl_VCLuaGetTabStop, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'ParentDoubleBuffered', @VCLua_WinControl_VCLuaGetParentDoubleBuffered, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'ParentWindow', @VCLua_WinControl_VCLuaGetParentWindow, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'Showing', @VCLua_WinControl_VCLuaGetShowing, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'UseDockManager', @VCLua_WinControl_VCLuaGetUseDockManager, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'IsSpecialSubControl', @VCLua_WinControl_VCLuaGetIsSpecialSubControl, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'VisibleDockClientCount', @VCLua_WinControl_VCLuaGetVisibleDockClientCount, mfCall);
	TLuaMethodInfo.Create(WinControlFuncs, 'BeginUpdateBounds', @VCLua_WinControl_BeginUpdateBounds);
	TLuaMethodInfo.Create(WinControlFuncs, 'EndUpdateBounds', @VCLua_WinControl_EndUpdateBounds);
	TLuaMethodInfo.Create(WinControlFuncs, 'LockRealizeBounds', @VCLua_WinControl_LockRealizeBounds);
	TLuaMethodInfo.Create(WinControlFuncs, 'UnlockRealizeBounds', @VCLua_WinControl_UnlockRealizeBounds);
	TLuaMethodInfo.Create(WinControlFuncs, 'ControlAtPos', @VCLua_WinControl_ControlAtPos);
	TLuaMethodInfo.Create(WinControlFuncs, 'ControlAtPos2', @VCLua_WinControl_ControlAtPos2);
	TLuaMethodInfo.Create(WinControlFuncs, 'ControlAtPos3', @VCLua_WinControl_ControlAtPos3);
	TLuaMethodInfo.Create(WinControlFuncs, 'ContainsControl', @VCLua_WinControl_ContainsControl);
	TLuaMethodInfo.Create(WinControlFuncs, 'DoAdjustClientRectChange', @VCLua_WinControl_DoAdjustClientRectChange);
	TLuaMethodInfo.Create(WinControlFuncs, 'InvalidateClientRectCache', @VCLua_WinControl_InvalidateClientRectCache);
	TLuaMethodInfo.Create(WinControlFuncs, 'ClientRectNeedsInterfaceUpdate', @VCLua_WinControl_ClientRectNeedsInterfaceUpdate);
	TLuaMethodInfo.Create(WinControlFuncs, 'DisableAlign', @VCLua_WinControl_DisableAlign);
	TLuaMethodInfo.Create(WinControlFuncs, 'EnableAlign', @VCLua_WinControl_EnableAlign);
	TLuaMethodInfo.Create(WinControlFuncs, 'ReAlign', @VCLua_WinControl_ReAlign);
	TLuaMethodInfo.Create(WinControlFuncs, 'ScrollBy', @VCLua_WinControl_ScrollBy);
	TLuaMethodInfo.Create(WinControlFuncs, 'ScrollBy2', @VCLua_WinControl_ScrollBy2);
	TLuaMethodInfo.Create(WinControlFuncs, 'WriteLayoutDebugReport', @VCLua_WinControl_WriteLayoutDebugReport);
	TLuaMethodInfo.Create(WinControlFuncs, 'AutoAdjustLayout', @VCLua_WinControl_AutoAdjustLayout);
	TLuaMethodInfo.Create(WinControlFuncs, 'FixDesignFontsPPIWithChildren', @VCLua_WinControl_FixDesignFontsPPIWithChildren);
	TLuaMethodInfo.Create(WinControlFuncs, 'CreateParentedControl', @VCLua_WinControl_CreateParentedControl);
	TLuaMethodInfo.Create(WinControlFuncs, 'DockDrop', @VCLua_WinControl_DockDrop);
	TLuaMethodInfo.Create(WinControlFuncs, 'CanFocus', @VCLua_WinControl_CanFocus);
	TLuaMethodInfo.Create(WinControlFuncs, 'CanSetFocus', @VCLua_WinControl_CanSetFocus);
	TLuaMethodInfo.Create(WinControlFuncs, 'GetControlIndex', @VCLua_WinControl_GetControlIndex);
	TLuaMethodInfo.Create(WinControlFuncs, 'SetControlIndex', @VCLua_WinControl_SetControlIndex);
	TLuaMethodInfo.Create(WinControlFuncs, 'Focused', @VCLua_WinControl_Focused);
	TLuaMethodInfo.Create(WinControlFuncs, 'PerformTab', @VCLua_WinControl_PerformTab);
	TLuaMethodInfo.Create(WinControlFuncs, 'FindChildControl', @VCLua_WinControl_FindChildControl);
	TLuaMethodInfo.Create(WinControlFuncs, 'SelectNext', @VCLua_WinControl_SelectNext);
	TLuaMethodInfo.Create(WinControlFuncs, 'BroadCast', @VCLua_WinControl_BroadCast);
	TLuaMethodInfo.Create(WinControlFuncs, 'BroadCast2', @VCLua_WinControl_BroadCast2);
	TLuaMethodInfo.Create(WinControlFuncs, 'NotifyControls', @VCLua_WinControl_NotifyControls);
	TLuaMethodInfo.Create(WinControlFuncs, 'DefaultHandler', @VCLua_WinControl_DefaultHandler);
	TLuaMethodInfo.Create(WinControlFuncs, 'DefaultHandler2', @VCLua_WinControl_DefaultHandler2);
	TLuaMethodInfo.Create(WinControlFuncs, 'AddControl', @VCLua_WinControl_AddControl);
	TLuaMethodInfo.Create(WinControlFuncs, 'InsertControl', @VCLua_WinControl_InsertControl);
	TLuaMethodInfo.Create(WinControlFuncs, 'InsertControl2', @VCLua_WinControl_InsertControl2);
	TLuaMethodInfo.Create(WinControlFuncs, 'RemoveControl', @VCLua_WinControl_RemoveControl);
	TLuaMethodInfo.Create(WinControlFuncs, 'SetFocus', @VCLua_WinControl_SetFocus);
	TLuaMethodInfo.Create(WinControlFuncs, 'FlipChildren', @VCLua_WinControl_FlipChildren);
	TLuaMethodInfo.Create(WinControlFuncs, 'ScaleBy', @VCLua_WinControl_ScaleBy);
	TLuaMethodInfo.Create(WinControlFuncs, 'GetDockCaption', @VCLua_WinControl_GetDockCaption);
	TLuaMethodInfo.Create(WinControlFuncs, 'UpdateDockCaption', @VCLua_WinControl_UpdateDockCaption);
	TLuaMethodInfo.Create(WinControlFuncs, 'GetTabOrderList', @VCLua_WinControl_GetTabOrderList);
	TLuaMethodInfo.Create(WinControlFuncs, 'HandleAllocated', @VCLua_WinControl_HandleAllocated);
	TLuaMethodInfo.Create(WinControlFuncs, 'HandleNeeded', @VCLua_WinControl_HandleNeeded);
	TLuaMethodInfo.Create(WinControlFuncs, 'BrushCreated', @VCLua_WinControl_BrushCreated);
	TLuaMethodInfo.Create(WinControlFuncs, 'IntfUTF8KeyPress', @VCLua_WinControl_IntfUTF8KeyPress);
	TLuaMethodInfo.Create(WinControlFuncs, 'IntfUTF8KeyPress2', @VCLua_WinControl_IntfUTF8KeyPress2);
	TLuaMethodInfo.Create(WinControlFuncs, 'IntfGetDropFilesTarget', @VCLua_WinControl_IntfGetDropFilesTarget);
	TLuaMethodInfo.Create(WinControlFuncs, 'PaintTo', @VCLua_WinControl_PaintTo);
	TLuaMethodInfo.Create(WinControlFuncs, 'SetShape', @VCLua_WinControl_SetShape);
	TLuaMethodInfo.Create(WinControlFuncs, 'SetShape2', @VCLua_WinControl_SetShape2);
	WinControlSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(WinControlSets, 'OnGetSiteInfo', @VCLua_WinControl_VCLuaSetOnGetSiteInfo, mfCall, TypeInfo(TGetSiteInfoEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnGetDockCaption', @VCLua_WinControl_VCLuaSetOnGetDockCaption, mfCall, TypeInfo(TGetDockCaptionEvent));
	TLuaMethodInfo.Create(WinControlSets, 'BorderWidth', @VCLua_WinControl_VCLuaSetBorderWidth, mfCall, TypeInfo(TBorderWidth));
	TLuaMethodInfo.Create(WinControlSets, 'ChildSizing', @VCLua_WinControl_VCLuaSetChildSizing, mfCall, TypeInfo(TControlChildSizing));
	TLuaMethodInfo.Create(WinControlSets, 'DefWndProc', @VCLua_WinControl_VCLuaSetDefWndProc, mfCall, TypeInfo(Pointer));
	TLuaMethodInfo.Create(WinControlSets, 'DockManager', @VCLua_WinControl_VCLuaSetDockManager, mfCall, TypeInfo(TDockManager));
	TLuaMethodInfo.Create(WinControlSets, 'DockSite', @VCLua_WinControl_VCLuaSetDockSite, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(WinControlSets, 'DoubleBuffered', @VCLua_WinControl_VCLuaSetDoubleBuffered, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(WinControlSets, 'Handle', @VCLua_WinControl_VCLuaSetHandle, mfCall, TypeInfo(HWND));
	TLuaMethodInfo.Create(WinControlSets, 'TabOrder', @VCLua_WinControl_VCLuaSetTabOrder, mfCall, TypeInfo(TTabOrder));
	TLuaMethodInfo.Create(WinControlSets, 'TabStop', @VCLua_WinControl_VCLuaSetTabStop, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(WinControlSets, 'OnDockDrop', @VCLua_WinControl_VCLuaSetOnDockDrop, mfCall, TypeInfo(TDockDropEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnDockOver', @VCLua_WinControl_VCLuaSetOnDockOver, mfCall, TypeInfo(TDockOverEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnEnter', @VCLua_WinControl_VCLuaSetOnEnter, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnExit', @VCLua_WinControl_VCLuaSetOnExit, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnKeyDown', @VCLua_WinControl_VCLuaSetOnKeyDown, mfCall, TypeInfo(TKeyEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnKeyPress', @VCLua_WinControl_VCLuaSetOnKeyPress, mfCall, TypeInfo(TKeyPressEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnKeyUp', @VCLua_WinControl_VCLuaSetOnKeyUp, mfCall, TypeInfo(TKeyEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnUnDock', @VCLua_WinControl_VCLuaSetOnUnDock, mfCall, TypeInfo(TUnDockEvent));
	TLuaMethodInfo.Create(WinControlSets, 'OnUTF8KeyPress', @VCLua_WinControl_VCLuaSetOnUTF8KeyPress, mfCall, TypeInfo(TUTF8KeyPressEvent));
	TLuaMethodInfo.Create(WinControlSets, 'ParentDoubleBuffered', @VCLua_WinControl_VCLuaSetParentDoubleBuffered, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(WinControlSets, 'ParentWindow', @VCLua_WinControl_VCLuaSetParentWindow, mfCall, TypeInfo(HWND));
	TLuaMethodInfo.Create(WinControlSets, 'UseDockManager', @VCLua_WinControl_VCLuaSetUseDockManager, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(WinControlSets, 'DesignerDeleting', @VCLua_WinControl_VCLuaSetDesignerDeleting, mfCall, TypeInfo(Boolean));
end.
