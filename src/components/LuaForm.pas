(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaForm;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Forms;

function CreateForm(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo = nil); overload; inline;

type
    TLuaForm = class(TForm)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomFormFuncs: TLuaVmt;
    CustomFormSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaBitmap, LuaControl, LuaMenu, Menus, LCLType;

function VCLua_Form_AfterConstruction(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.AfterConstruction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'AfterConstruction', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_BeforeDestruction(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.BeforeDestruction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'BeforeDestruction', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_BigIconHandle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:HICON;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.BigIconHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'BigIconHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_Close(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Close();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Close', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_CloseQuery(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.CloseQuery();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'CloseQuery', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_DefocusControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	Control:TWinControl;
	Removing:Boolean;
begin
	CheckArg(L, 3);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Control);
	luaL_check(L,3,@Removing);
	try
		lForm.DefocusControl(Control,Removing);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'DefocusControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_DestroyWnd(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.DestroyWnd();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'DestroyWnd', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_EnsureVisible(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	AMoveToTop:Boolean;
begin
	CheckArg(L, 1, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @AMoveToTop, True);
	try
		lForm.EnsureVisible(AMoveToTop);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'EnsureVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_FocusControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	WinControl:TWinControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@WinControl);
	try
		lForm.FocusControl(WinControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'FocusControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_FormIsUpdating(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.FormIsUpdating();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'FormIsUpdating', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_GetFormImage(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TBitmap;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.GetFormImage();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetFormImage', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_GetRolesForControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	AControl:TControl;
	ret:TControlRolesForForm;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		ret := lForm.GetRolesForControl(AControl);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetRolesForControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_GetRealPopupParent(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.GetRealPopupParent();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetRealPopupParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_Hide(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Hide();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Hide', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_IntfDropFiles(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	FileNames:array of String;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	TTrait<String>.luaL_checkArray(L, 2, @FileNames);
	try
		lForm.IntfDropFiles(FileNames);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'IntfDropFiles', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_IntfHelp(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lForm.IntfHelp(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'IntfHelp', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_MakeFullyVisible(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	AMonitor:TMonitor;
	UseWorkarea:Boolean;
begin
	CheckArg(L, 1, 3);
	lForm := TLuaForm(GetLuaObject(L, 1));
	TTrait<TMonitor>.luaL_optcheck(L, 2, @AMonitor, nil);
	TTrait<Boolean>.luaL_optcheck(L, 3, @UseWorkarea, False);
	try
		lForm.MakeFullyVisible(AMonitor,UseWorkarea);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'MakeFullyVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_AutoSizeDelayedHandle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.AutoSizeDelayedHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'AutoSizeDelayedHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_GetPreferredSize(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	PreferredWidth:integer;
	PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, 1, 3);
	lForm := TLuaForm(GetLuaObject(L, 1));
	TTrait<boolean>.luaL_optcheck(L, 2, @Raw, false);
	TTrait<boolean>.luaL_optcheck(L, 3, @WithThemeSpace, true);
	try
		lForm.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetPreferredSize', E.ClassName, E.Message);
	end;
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
end;

function VCLua_Form_GetPreferredSize2(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	PreferredWidth:integer;
	PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, 3, 5);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@PreferredWidth);
	luaL_check(L,3,@PreferredHeight);
	TTrait<boolean>.luaL_optcheck(L, 4, @Raw, false);
	TTrait<boolean>.luaL_optcheck(L, 5, @WithThemeSpace, true);
	try
		lForm.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetPreferredSize', E.ClassName, E.Message);
	end;
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
end;

function VCLua_Form_Release(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Release();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Release', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_CanFocus(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.CanFocus();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'CanFocus', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_SetFocus(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.SetFocus();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetFocus', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_SetFocusedControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	Control:TWinControl;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Control);
	try
		ret := lForm.SetFocusedControl(Control);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetFocusedControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_SetRestoredBounds(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ALeft:integer;
	ATop:integer;
	AWidth:integer;
	AHeight:integer;
	ADefaultPosition:Boolean;
begin
	CheckArg(L, 5, 6);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@ALeft);
	luaL_check(L,3,@ATop);
	luaL_check(L,4,@AWidth);
	luaL_check(L,5,@AHeight);
	TTrait<Boolean>.luaL_optcheck(L, 6, @ADefaultPosition, False);
	try
		lForm.SetRestoredBounds(ALeft,ATop,AWidth,AHeight,ADefaultPosition);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetRestoredBounds', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_Show(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Show();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Show', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_ShowModal(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.ShowModal();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'ShowModal', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_ShowOnTop(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.ShowOnTop();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'ShowOnTop', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_SmallIconHandle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:HICON;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.SmallIconHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'SmallIconHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_ActiveMDIChild(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.ActiveMDIChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'ActiveMDIChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_GetMDIChildren(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	AIndex:Integer;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lForm.GetMDIChildren(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetMDIChildren', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_MDIChildCount(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.MDIChildCount();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'MDIChildCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_Dock(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	NewDockSite:TWinControl;
	ARect:TRect;
begin
	CheckArg(L, 3);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@NewDockSite);
	luaL_check(L,3,@ARect);
	try
		lForm.Dock(NewDockSite,ARect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Dock', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_UpdateDockCaption(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	Exclude:TControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Exclude);
	try
		lForm.UpdateDockCaption(Exclude);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'UpdateDockCaption', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetActive(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.Active;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'Active', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetActiveControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TWinControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.ActiveControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'ActiveControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetActiveControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TWinControl;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.ActiveControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'ActiveControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetActiveDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.ActiveDefaultControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'ActiveDefaultControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetActiveDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TControl;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.ActiveDefaultControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'ActiveDefaultControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetAllowDropFiles(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Boolean;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.AllowDropFiles := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'AllowDropFiles', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetAllowDropFiles(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.AllowDropFiles;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'AllowDropFiles', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetAlphaBlend(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Boolean;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.AlphaBlend := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'AlphaBlend', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetAlphaBlend(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.AlphaBlend;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'AlphaBlend', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetAlphaBlendValue(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Byte;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.AlphaBlendValue := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'AlphaBlendValue', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetAlphaBlendValue(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Byte;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.AlphaBlendValue;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'AlphaBlendValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TFormBorderStyle;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TFormBorderStyle));
	try
		lForm.BorderStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'BorderStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TFormBorderStyle;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.BorderStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'BorderStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetCancelControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.CancelControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'CancelControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetCancelControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TControl;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.CancelControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'CancelControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.DefaultControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'DefaultControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TControl;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.DefaultControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'DefaultControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetDefaultMonitor(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TDefaultMonitor;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TDefaultMonitor));
	try
		lForm.DefaultMonitor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'DefaultMonitor', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetDefaultMonitor(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TDefaultMonitor;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.DefaultMonitor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'DefaultMonitor', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaGetEffectiveShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TShowInTaskBar;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.EffectiveShowInTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'EffectiveShowInTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaGetFormState(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TFormState;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.FormState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'FormState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetFormStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TFormStyle;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TFormStyle));
	try
		lForm.FormStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'FormStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetFormStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TFormStyle;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.FormStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'FormStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetHelpFile(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:string;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.HelpFile := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'HelpFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetHelpFile(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:string;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.HelpFile;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'HelpFile', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetIcon(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TIcon;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.Icon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Icon', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetIcon(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TIcon;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.Icon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'Icon', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetKeyPreview(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Boolean;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.KeyPreview := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'KeyPreview', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetKeyPreview(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.KeyPreview;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'KeyPreview', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_MDIChildren(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	I:Integer;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@I);
	try
		ret := lForm.MDIChildren[I];
		lua_push(L,ret,TypeInfo(ret));
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'MDIChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaSetMenu(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TMainMenu;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.Menu := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Menu', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetMenu(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TMainMenu;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.Menu;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'Menu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetModalResult(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TModalResult;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.ModalResult := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'ModalResult', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetModalResult(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TModalResult;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.ModalResult;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'ModalResult', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetMonitor(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TMonitor;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.Monitor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'Monitor', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaGetLastActiveControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TWinControl;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.LastActiveControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'LastActiveControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetPopupMode(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TPopupMode;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPopupMode));
	try
		lForm.PopupMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'PopupMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetPopupMode(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TPopupMode;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.PopupMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'PopupMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetPopupParent(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TCustomForm;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.PopupParent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'PopupParent', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetPopupParent(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.PopupParent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'PopupParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TPosition;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPosition));
	try
		lForm.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Position', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TPosition;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'Position', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaGetRestoredLeft(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.RestoredLeft;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'RestoredLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetRestoredTop(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.RestoredTop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'RestoredTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetRestoredWidth(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.RestoredWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'RestoredWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetRestoredHeight(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.RestoredHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'RestoredHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TShowInTaskbar;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TShowInTaskbar));
	try
		lForm.ShowInTaskBar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'ShowInTaskBar', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TShowInTaskbar;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.ShowInTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'ShowInTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetWindowState(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TWindowState;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TWindowState));
	try
		lForm.WindowState := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'WindowState', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetWindowState(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TWindowState;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.WindowState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'WindowState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomForm',v);
end;
function CreateForm(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lForm := TLuaForm.CreateNew(Parent);
	lForm.Parent := TWinControl(Parent);
	lForm.LuaCtl := TVCLuaControl.Create(lForm as TComponent,L,nil,'TCustomForm');
	InitControl(L,lForm,Name);
	CreateTableForKnownType(L,'TCustomForm',lForm);
	Result := 1;
end;

begin
	CustomFormFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFormFuncs, 'AfterConstruction', @VCLua_Form_AfterConstruction);
	TLuaMethodInfo.Create(CustomFormFuncs, 'BeforeDestruction', @VCLua_Form_BeforeDestruction);
	TLuaMethodInfo.Create(CustomFormFuncs, 'BigIconHandle', @VCLua_Form_BigIconHandle);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Close', @VCLua_Form_Close);
	TLuaMethodInfo.Create(CustomFormFuncs, 'CloseQuery', @VCLua_Form_CloseQuery);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DefocusControl', @VCLua_Form_DefocusControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DestroyWnd', @VCLua_Form_DestroyWnd);
	TLuaMethodInfo.Create(CustomFormFuncs, 'EnsureVisible', @VCLua_Form_EnsureVisible);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FocusControl', @VCLua_Form_FocusControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FormIsUpdating', @VCLua_Form_FormIsUpdating);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetFormImage', @VCLua_Form_GetFormImage);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetRolesForControl', @VCLua_Form_GetRolesForControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetRealPopupParent', @VCLua_Form_GetRealPopupParent);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Hide', @VCLua_Form_Hide);
	TLuaMethodInfo.Create(CustomFormFuncs, 'IntfDropFiles', @VCLua_Form_IntfDropFiles);
	TLuaMethodInfo.Create(CustomFormFuncs, 'IntfHelp', @VCLua_Form_IntfHelp);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MakeFullyVisible', @VCLua_Form_MakeFullyVisible);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AutoSizeDelayedHandle', @VCLua_Form_AutoSizeDelayedHandle);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetPreferredSize', @VCLua_Form_GetPreferredSize);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetPreferredSize2', @VCLua_Form_GetPreferredSize2);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Release', @VCLua_Form_Release);
	TLuaMethodInfo.Create(CustomFormFuncs, 'CanFocus', @VCLua_Form_CanFocus);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SetFocus', @VCLua_Form_SetFocus);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SetFocusedControl', @VCLua_Form_SetFocusedControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SetRestoredBounds', @VCLua_Form_SetRestoredBounds);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Show', @VCLua_Form_Show);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowModal', @VCLua_Form_ShowModal);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowOnTop', @VCLua_Form_ShowOnTop);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SmallIconHandle', @VCLua_Form_SmallIconHandle);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ActiveMDIChild', @VCLua_Form_ActiveMDIChild);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetMDIChildren', @VCLua_Form_GetMDIChildren);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MDIChildCount', @VCLua_Form_MDIChildCount);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Dock', @VCLua_Form_Dock);
	TLuaMethodInfo.Create(CustomFormFuncs, 'UpdateDockCaption', @VCLua_Form_UpdateDockCaption);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Active', @VCLua_Form_VCLuaGetActive, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ActiveControl', @VCLua_Form_VCLuaGetActiveControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ActiveDefaultControl', @VCLua_Form_VCLuaGetActiveDefaultControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AllowDropFiles', @VCLua_Form_VCLuaGetAllowDropFiles, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AlphaBlend', @VCLua_Form_VCLuaGetAlphaBlend, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AlphaBlendValue', @VCLua_Form_VCLuaGetAlphaBlendValue, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'BorderStyle', @VCLua_Form_VCLuaGetBorderStyle, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'CancelControl', @VCLua_Form_VCLuaGetCancelControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DefaultControl', @VCLua_Form_VCLuaGetDefaultControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DefaultMonitor', @VCLua_Form_VCLuaGetDefaultMonitor, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'EffectiveShowInTaskBar', @VCLua_Form_VCLuaGetEffectiveShowInTaskBar, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FormState', @VCLua_Form_VCLuaGetFormState, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FormStyle', @VCLua_Form_VCLuaGetFormStyle, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'HelpFile', @VCLua_Form_VCLuaGetHelpFile, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Icon', @VCLua_Form_VCLuaGetIcon, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'KeyPreview', @VCLua_Form_VCLuaGetKeyPreview, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MDIChildren', @VCLua_Form_MDIChildren);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Menu', @VCLua_Form_VCLuaGetMenu, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ModalResult', @VCLua_Form_VCLuaGetModalResult, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Monitor', @VCLua_Form_VCLuaGetMonitor, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'LastActiveControl', @VCLua_Form_VCLuaGetLastActiveControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'PopupMode', @VCLua_Form_VCLuaGetPopupMode, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'PopupParent', @VCLua_Form_VCLuaGetPopupParent, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Position', @VCLua_Form_VCLuaGetPosition, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredLeft', @VCLua_Form_VCLuaGetRestoredLeft, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredTop', @VCLua_Form_VCLuaGetRestoredTop, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredWidth', @VCLua_Form_VCLuaGetRestoredWidth, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredHeight', @VCLua_Form_VCLuaGetRestoredHeight, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowInTaskBar', @VCLua_Form_VCLuaGetShowInTaskBar, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'WindowState', @VCLua_Form_VCLuaGetWindowState, mfCall);
	CustomFormSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFormSets, 'ActiveControl', @VCLua_Form_VCLuaSetActiveControl, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'ActiveDefaultControl', @VCLua_Form_VCLuaSetActiveDefaultControl, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'AllowDropFiles', @VCLua_Form_VCLuaSetAllowDropFiles, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'AlphaBlend', @VCLua_Form_VCLuaSetAlphaBlend, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'AlphaBlendValue', @VCLua_Form_VCLuaSetAlphaBlendValue, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'BorderStyle', @VCLua_Form_VCLuaSetBorderStyle, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'CancelControl', @VCLua_Form_VCLuaSetCancelControl, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'DefaultControl', @VCLua_Form_VCLuaSetDefaultControl, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'DefaultMonitor', @VCLua_Form_VCLuaSetDefaultMonitor, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'FormStyle', @VCLua_Form_VCLuaSetFormStyle, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'HelpFile', @VCLua_Form_VCLuaSetHelpFile, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'Icon', @VCLua_Form_VCLuaSetIcon, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'KeyPreview', @VCLua_Form_VCLuaSetKeyPreview, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'Menu', @VCLua_Form_VCLuaSetMenu, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'ModalResult', @VCLua_Form_VCLuaSetModalResult, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'PopupMode', @VCLua_Form_VCLuaSetPopupMode, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'PopupParent', @VCLua_Form_VCLuaSetPopupParent, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'Position', @VCLua_Form_VCLuaSetPosition, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'ShowInTaskBar', @VCLua_Form_VCLuaSetShowInTaskBar, mfCall);
	TLuaMethodInfo.Create(CustomFormSets, 'WindowState', @VCLua_Form_VCLuaSetWindowState, mfCall);
end.
