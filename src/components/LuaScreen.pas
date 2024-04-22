(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaScreen;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Forms;

procedure lua_push(L: Plua_State; const v: TScreen; pti: PTypeInfo = nil); overload; inline;

type
    TLuaScreen = class(TScreen)
    end;
var
    ScreenFuncs: TLuaVmt;
    ScreenSets: TLuaVmt;

function TheScreen(L: Plua_State): Integer; cdecl;

implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaClassesEvents, LuaEvent, LuaFont, LuaForm, LuaMonitor, LuaStrings, LuaWinControl, LCLType;

function VCLua_Screen_CustomFormIndex(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	AForm:TCustomForm;
	ret:integer;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@AForm);
	try
		ret := lScreen.CustomFormIndex(AForm);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'CustomFormIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_FormIndex(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	AForm:TForm;
	ret:integer;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@AForm);
	try
		ret := lScreen.FormIndex(AForm);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'FormIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_CustomFormZIndex(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	AForm:TCustomForm;
	ret:integer;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@AForm);
	try
		ret := lScreen.CustomFormZIndex(AForm);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'CustomFormZIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_MoveFormToFocusFront(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ACustomForm:TCustomForm;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@ACustomForm);
	try
		lScreen.MoveFormToFocusFront(ACustomForm);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'MoveFormToFocusFront', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_MoveFormToZFront(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ACustomForm:TCustomForm;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@ACustomForm);
	try
		lScreen.MoveFormToZFront(ACustomForm);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'MoveFormToZFront', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_GetCurrentModalForm(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	try
		ret := lScreen.GetCurrentModalForm();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetCurrentModalForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_GetCurrentModalFormZIndex(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	CheckArg(L, 1);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	try
		ret := lScreen.GetCurrentModalFormZIndex();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetCurrentModalFormZIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_CustomFormBelongsToActiveGroup(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	AForm:TCustomForm;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@AForm);
	try
		ret := lScreen.CustomFormBelongsToActiveGroup(AForm);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'CustomFormBelongsToActiveGroup', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_FindNonDesignerForm(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	FormName:string;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@FormName);
	try
		ret := lScreen.FindNonDesignerForm(FormName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'FindNonDesignerForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_FindForm(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	FormName:string;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@FormName);
	try
		ret := lScreen.FindForm(FormName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'FindForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_UpdateMonitors(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
begin
	CheckArg(L, 1);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	try
		lScreen.UpdateMonitors();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'UpdateMonitors', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_UpdateScreen(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
begin
	CheckArg(L, 1);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	try
		lScreen.UpdateScreen();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'UpdateScreen', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_MonitorFromPoint(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Point:TPoint;
	MonitorDefault:TMonitorDefaultTo;
	ret:TMonitor;
begin
	CheckArg(L, 2, 3);
	lScreen := TLuaScreen(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Point);
	TTraitPti<TMonitorDefaultTo>.luaL_optcheck(L, 3, @MonitorDefault, mdNearest, TypeInfo(TMonitorDefaultTo));
	try
		ret := lScreen.MonitorFromPoint(Point,MonitorDefault);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'MonitorFromPoint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_MonitorFromRect(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Rect:TRect;
	MonitorDefault:TMonitorDefaultTo;
	ret:TMonitor;
begin
	CheckArg(L, 2, 3);
	lScreen := TLuaScreen(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Rect);
	TTraitPti<TMonitorDefaultTo>.luaL_optcheck(L, 3, @MonitorDefault, mdNearest, TypeInfo(TMonitorDefaultTo));
	try
		ret := lScreen.MonitorFromRect(Rect,MonitorDefault);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'MonitorFromRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_MonitorFromWindow(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Handle:THandle;
	MonitorDefault:TMonitorDefaultTo;
	ret:TMonitor;
begin
	CheckArg(L, 2, 3);
	lScreen := TLuaScreen(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Handle);
	TTraitPti<TMonitorDefaultTo>.luaL_optcheck(L, 3, @MonitorDefault, mdNearest, TypeInfo(TMonitorDefaultTo));
	try
		ret := lScreen.MonitorFromWindow(Handle,MonitorDefault);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'MonitorFromWindow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_BeginTempCursor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	aCursor:TCursor;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@aCursor);
	try
		lScreen.BeginTempCursor(aCursor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'BeginTempCursor', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_EndTempCursor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	aCursor:TCursor;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@aCursor);
	try
		lScreen.EndTempCursor(aCursor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'EndTempCursor', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_BeginWaitCursor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
begin
	CheckArg(L, 1);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	try
		lScreen.BeginWaitCursor();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'BeginWaitCursor', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_EndWaitCursor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
begin
	CheckArg(L, 1);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	try
		lScreen.EndWaitCursor();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'EndWaitCursor', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetActiveControl(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TWinControl;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.ActiveControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetActiveControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetActiveCustomForm(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TCustomForm;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.ActiveCustomForm;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetActiveCustomForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetActiveForm(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TForm;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.ActiveForm;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetActiveForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaSetCursor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	val:TCursor;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lScreen.Cursor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'SetCursor', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetCursor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TCursor;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.Cursor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetCursor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetRealCursor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TCursor;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.RealCursor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetRealCursor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_Cursors(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Index:Integer;
	ret:HCURSOR;
begin
	CheckArg(L, 2, 3);
	lScreen := TLuaScreen(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lScreen.Cursors[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lScreen.Cursors[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'Screen', 'Cursors', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetCustomFormCount(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.CustomFormCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetCustomFormCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_CustomForms(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Index:Integer;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lScreen.CustomForms[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'CustomForms', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetCustomFormZOrderCount(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.CustomFormZOrderCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetCustomFormZOrderCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_CustomFormsZOrdered(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Index:Integer;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lScreen.CustomFormsZOrdered[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'CustomFormsZOrdered', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetDesktopLeft(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.DesktopLeft;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetDesktopLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetDesktopTop(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.DesktopTop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetDesktopTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetDesktopHeight(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.DesktopHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetDesktopHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetDesktopWidth(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.DesktopWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetDesktopWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetDesktopRect(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TRect;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.DesktopRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetDesktopRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetFocusedForm(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TCustomForm;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.FocusedForm;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetFocusedForm', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetFormCount(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.FormCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetFormCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_Forms(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Index:Integer;
	ret:TForm;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lScreen.Forms[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'Forms', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetDataModuleCount(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.DataModuleCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetDataModuleCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaSetHintFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	val:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lScreen.HintFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'SetHintFont', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetHintFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.HintFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetHintFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaSetIconFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	val:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lScreen.IconFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'SetIconFont', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetIconFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.IconFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetIconFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaSetMenuFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	val:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lScreen.MenuFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'SetMenuFont', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetMenuFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.MenuFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetMenuFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaSetSystemFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	val:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lScreen.SystemFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Screen', 'SetSystemFont', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetSystemFont(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TFont;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.SystemFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetSystemFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetFonts(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TStrings;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.Fonts;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetFonts', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetMonitorCount(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.MonitorCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetMonitorCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_Monitors(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	Index:Integer;
	ret:TMonitor;
begin
	CheckArg(L, 2);
	lScreen := TLuaScreen(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lScreen.Monitors[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'Monitors', E.ClassName, E.Message);
	end;
end;

function VCLua_Screen_VCLuaGetPixelsPerInch(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.PixelsPerInch;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetPixelsPerInch', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetPrimaryMonitor(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TMonitor;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.PrimaryMonitor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetPrimaryMonitor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetWidth(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.Width;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetWorkAreaRect(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:TRect;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.WorkAreaRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetWorkAreaRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetWorkAreaHeight(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.WorkAreaHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetWorkAreaHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetWorkAreaLeft(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.WorkAreaLeft;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetWorkAreaLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetWorkAreaTop(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.WorkAreaTop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetWorkAreaTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaGetWorkAreaWidth(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
	ret:Integer;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	try
		ret := lScreen.WorkAreaWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Screen', 'GetWorkAreaWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Screen_VCLuaSetOnActiveControlChange(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lScreen.OnActiveControlChange));
	lScreen.OnActiveControlChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Screen_VCLuaSetOnActiveFormChange(L: Plua_State): Integer; cdecl;
var
	lScreen:TLuaScreen;
begin
	lScreen := TLuaScreen(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lScreen.OnActiveFormChange));
	lScreen.OnActiveFormChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function TheScreen(L: Plua_State): Integer; cdecl;
begin
	lua_push(L,Screen);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TScreen; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TScreen',v);
end;

begin
	ScreenFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ScreenFuncs, 'CustomFormIndex', @VCLua_Screen_CustomFormIndex);
	TLuaMethodInfo.Create(ScreenFuncs, 'FormIndex', @VCLua_Screen_FormIndex);
	TLuaMethodInfo.Create(ScreenFuncs, 'CustomFormZIndex', @VCLua_Screen_CustomFormZIndex);
	TLuaMethodInfo.Create(ScreenFuncs, 'MoveFormToFocusFront', @VCLua_Screen_MoveFormToFocusFront);
	TLuaMethodInfo.Create(ScreenFuncs, 'MoveFormToZFront', @VCLua_Screen_MoveFormToZFront);
	TLuaMethodInfo.Create(ScreenFuncs, 'GetCurrentModalForm', @VCLua_Screen_GetCurrentModalForm);
	TLuaMethodInfo.Create(ScreenFuncs, 'GetCurrentModalFormZIndex', @VCLua_Screen_GetCurrentModalFormZIndex);
	TLuaMethodInfo.Create(ScreenFuncs, 'CustomFormBelongsToActiveGroup', @VCLua_Screen_CustomFormBelongsToActiveGroup);
	TLuaMethodInfo.Create(ScreenFuncs, 'FindNonDesignerForm', @VCLua_Screen_FindNonDesignerForm);
	TLuaMethodInfo.Create(ScreenFuncs, 'FindForm', @VCLua_Screen_FindForm);
	TLuaMethodInfo.Create(ScreenFuncs, 'UpdateMonitors', @VCLua_Screen_UpdateMonitors);
	TLuaMethodInfo.Create(ScreenFuncs, 'UpdateScreen', @VCLua_Screen_UpdateScreen);
	TLuaMethodInfo.Create(ScreenFuncs, 'MonitorFromPoint', @VCLua_Screen_MonitorFromPoint);
	TLuaMethodInfo.Create(ScreenFuncs, 'MonitorFromRect', @VCLua_Screen_MonitorFromRect);
	TLuaMethodInfo.Create(ScreenFuncs, 'MonitorFromWindow', @VCLua_Screen_MonitorFromWindow);
	TLuaMethodInfo.Create(ScreenFuncs, 'BeginTempCursor', @VCLua_Screen_BeginTempCursor);
	TLuaMethodInfo.Create(ScreenFuncs, 'EndTempCursor', @VCLua_Screen_EndTempCursor);
	TLuaMethodInfo.Create(ScreenFuncs, 'BeginWaitCursor', @VCLua_Screen_BeginWaitCursor);
	TLuaMethodInfo.Create(ScreenFuncs, 'EndWaitCursor', @VCLua_Screen_EndWaitCursor);
	TLuaMethodInfo.Create(ScreenFuncs, 'ActiveControl', @VCLua_Screen_VCLuaGetActiveControl, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'ActiveCustomForm', @VCLua_Screen_VCLuaGetActiveCustomForm, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'ActiveForm', @VCLua_Screen_VCLuaGetActiveForm, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'Cursor', @VCLua_Screen_VCLuaGetCursor, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'RealCursor', @VCLua_Screen_VCLuaGetRealCursor, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'Cursors', @VCLua_Screen_Cursors);
	TLuaMethodInfo.Create(ScreenFuncs, 'CustomFormCount', @VCLua_Screen_VCLuaGetCustomFormCount, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'CustomForms', @VCLua_Screen_CustomForms);
	TLuaMethodInfo.Create(ScreenFuncs, 'CustomFormZOrderCount', @VCLua_Screen_VCLuaGetCustomFormZOrderCount, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'CustomFormsZOrdered', @VCLua_Screen_CustomFormsZOrdered);
	TLuaMethodInfo.Create(ScreenFuncs, 'DesktopLeft', @VCLua_Screen_VCLuaGetDesktopLeft, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'DesktopTop', @VCLua_Screen_VCLuaGetDesktopTop, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'DesktopHeight', @VCLua_Screen_VCLuaGetDesktopHeight, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'DesktopWidth', @VCLua_Screen_VCLuaGetDesktopWidth, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'DesktopRect', @VCLua_Screen_VCLuaGetDesktopRect, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'FocusedForm', @VCLua_Screen_VCLuaGetFocusedForm, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'FormCount', @VCLua_Screen_VCLuaGetFormCount, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'Forms', @VCLua_Screen_Forms);
	TLuaMethodInfo.Create(ScreenFuncs, 'DataModuleCount', @VCLua_Screen_VCLuaGetDataModuleCount, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'HintFont', @VCLua_Screen_VCLuaGetHintFont, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'IconFont', @VCLua_Screen_VCLuaGetIconFont, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'MenuFont', @VCLua_Screen_VCLuaGetMenuFont, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'SystemFont', @VCLua_Screen_VCLuaGetSystemFont, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'Fonts', @VCLua_Screen_VCLuaGetFonts, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'Height', @VCLua_Screen_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'MonitorCount', @VCLua_Screen_VCLuaGetMonitorCount, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'Monitors', @VCLua_Screen_Monitors);
	TLuaMethodInfo.Create(ScreenFuncs, 'PixelsPerInch', @VCLua_Screen_VCLuaGetPixelsPerInch, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'PrimaryMonitor', @VCLua_Screen_VCLuaGetPrimaryMonitor, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'Width', @VCLua_Screen_VCLuaGetWidth, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'WorkAreaRect', @VCLua_Screen_VCLuaGetWorkAreaRect, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'WorkAreaHeight', @VCLua_Screen_VCLuaGetWorkAreaHeight, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'WorkAreaLeft', @VCLua_Screen_VCLuaGetWorkAreaLeft, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'WorkAreaTop', @VCLua_Screen_VCLuaGetWorkAreaTop, mfCall);
	TLuaMethodInfo.Create(ScreenFuncs, 'WorkAreaWidth', @VCLua_Screen_VCLuaGetWorkAreaWidth, mfCall);
	ScreenSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ScreenSets, 'Cursor', @VCLua_Screen_VCLuaSetCursor, mfCall, TypeInfo(TCursor));
	TLuaMethodInfo.Create(ScreenSets, 'HintFont', @VCLua_Screen_VCLuaSetHintFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(ScreenSets, 'IconFont', @VCLua_Screen_VCLuaSetIconFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(ScreenSets, 'MenuFont', @VCLua_Screen_VCLuaSetMenuFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(ScreenSets, 'SystemFont', @VCLua_Screen_VCLuaSetSystemFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(ScreenSets, 'OnActiveControlChange', @VCLua_Screen_VCLuaSetOnActiveControlChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(ScreenSets, 'OnActiveFormChange', @VCLua_Screen_VCLuaSetOnActiveFormChange, mfCall, TypeInfo(TNotifyEvent));
end.
