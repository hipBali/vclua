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
    end;
var
    CustomFormFuncs: TLuaVmt;
    CustomFormSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaBitmap, LuaClassesEvents, LuaControl, LuaEvent, LuaFormsEvents, LuaMenu, LuaMonitor, LuaWinControl, Menus, Types, LCLType;

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

function VCLua_Form_GetControlClassDefaultSize(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TSize;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		ret := lForm.GetControlClassDefaultSize();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetControlClassDefaultSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	lForm := TLuaForm(CheckLuaObjectPop(L, 1));
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
	lForm := TLuaForm(CheckLuaObjectPop(L, 1));
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
	lForm := TLuaForm(CheckLuaObjectPop(L, 1));
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

function VCLua_Form_AutoScale(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.AutoScale();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'AutoScale', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetActive(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.Active;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetActive', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetActiveControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TWinControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.ActiveControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetActiveControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetActiveControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TWinControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.ActiveControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetActiveControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetActiveDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.ActiveDefaultControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetActiveDefaultControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetActiveDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.ActiveDefaultControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetActiveDefaultControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetAllowDropFiles(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Boolean;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.AllowDropFiles := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetAllowDropFiles', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetAllowDropFiles(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.AllowDropFiles;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetAllowDropFiles', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetAlphaBlend(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Boolean;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.AlphaBlend := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetAlphaBlend', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetAlphaBlend(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.AlphaBlend;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetAlphaBlend', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetAlphaBlendValue(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Byte;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.AlphaBlendValue := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetAlphaBlendValue', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetAlphaBlendValue(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Byte;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.AlphaBlendValue;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetAlphaBlendValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TFormBorderStyle;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TFormBorderStyle));
	try
		lForm.BorderStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetBorderStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TFormBorderStyle;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.BorderStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetBorderStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetCancelControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.CancelControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetCancelControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetCancelControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.CancelControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetCancelControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.DefaultControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetDefaultControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetDefaultControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.DefaultControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetDefaultControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetDefaultMonitor(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TDefaultMonitor;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TDefaultMonitor));
	try
		lForm.DefaultMonitor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetDefaultMonitor', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetDefaultMonitor(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TDefaultMonitor;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.DefaultMonitor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetDefaultMonitor', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaGetEffectiveShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TShowInTaskBar;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.EffectiveShowInTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetEffectiveShowInTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaGetFormState(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TFormState;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.FormState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetFormState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetFormStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TFormStyle;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TFormStyle));
	try
		lForm.FormStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetFormStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetFormStyle(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TFormStyle;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.FormStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetFormStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetHelpFile(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:string;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.HelpFile := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetHelpFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetHelpFile(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:string;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.HelpFile;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetHelpFile', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetIcon(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TIcon;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.Icon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetIcon(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TIcon;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.Icon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetKeyPreview(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:Boolean;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.KeyPreview := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetKeyPreview', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetKeyPreview(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:Boolean;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.KeyPreview;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetKeyPreview', E.ClassName, E.Message);
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
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.Menu := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetMenu', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetMenu(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TMainMenu;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.Menu;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetModalResult(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TModalResult;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.ModalResult := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetModalResult', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetModalResult(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TModalResult;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.ModalResult;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetModalResult', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetMonitor(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TMonitor;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.Monitor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetMonitor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetLastActiveControl(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TWinControl;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.LastActiveControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetLastActiveControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetPopupMode(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TPopupMode;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPopupMode));
	try
		lForm.PopupMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetPopupMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetPopupMode(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TPopupMode;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.PopupMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetPopupMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetPopupParent(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TCustomForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lForm.PopupParent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetPopupParent', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetPopupParent(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TCustomForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.PopupParent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetPopupParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetOnActivate(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnActivate));
	lForm.OnActivate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnClose(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnClose));
	lForm.OnClose := TLuaEvent.Factory<TCloseEvent,TLuaCloseEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnCloseQuery(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnCloseQuery));
	lForm.OnCloseQuery := TLuaEvent.Factory<TCloseQueryEvent,TLuaCloseQueryEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnCreate(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnCreate));
	lForm.OnCreate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnDeactivate(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnDeactivate));
	lForm.OnDeactivate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnDestroy(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnDestroy));
	lForm.OnDestroy := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnDropFiles(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnDropFiles));
	lForm.OnDropFiles := TLuaEvent.Factory<TDropFilesEvent,TLuaDropFilesEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnHide(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnHide));
	lForm.OnHide := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnShow(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnShow));
	lForm.OnShow := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnShowModalFinished(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnShowModalFinished));
	lForm.OnShowModalFinished := TLuaEvent.Factory<TModalDialogFinished,TLuaModalDialogFinished>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetOnWindowStateChange(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lForm.OnWindowStateChange));
	lForm.OnWindowStateChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Form_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TPosition;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPosition));
	try
		lForm.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TPosition;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaGetRestoredLeft(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.RestoredLeft;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetRestoredLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetRestoredTop(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.RestoredTop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetRestoredTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetRestoredWidth(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.RestoredWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetRestoredWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaGetRestoredHeight(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:integer;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.RestoredHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetRestoredHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Form_VCLuaSetShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TShowInTaskbar;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TShowInTaskbar));
	try
		lForm.ShowInTaskBar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetShowInTaskBar', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TShowInTaskbar;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.ShowInTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetShowInTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_VCLuaSetWindowState(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	val:TWindowState;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TWindowState));
	try
		lForm.WindowState := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'SetWindowState', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_VCLuaGetWindowState(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	ret:TWindowState;
begin
	lForm := TLuaForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lForm.WindowState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Form', 'GetWindowState', E.ClassName, E.Message);
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lForm := TLuaForm.CreateNew(Parent);
	lForm.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomForm',lForm);
	InitControl(L,lForm,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'Form', E.ClassName, E.Message);
	end;
end;

begin
	CustomFormFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFormFuncs, 'AfterConstruction', @VCLua_Form_AfterConstruction);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetControlClassDefaultSize', @VCLua_Form_GetControlClassDefaultSize);
	TLuaMethodInfo.Create(CustomFormFuncs, 'BigIconHandle', @VCLua_Form_BigIconHandle);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Close', @VCLua_Form_Close);
	TLuaMethodInfo.Create(CustomFormFuncs, 'CloseQuery', @VCLua_Form_CloseQuery);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DefocusControl', @VCLua_Form_DefocusControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DestroyWnd', @VCLua_Form_DestroyWnd);
	TLuaMethodInfo.Create(CustomFormFuncs, 'EnsureVisible', @VCLua_Form_EnsureVisible);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FocusControl', @VCLua_Form_FocusControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetFormImage', @VCLua_Form_GetFormImage);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetRolesForControl', @VCLua_Form_GetRolesForControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetRealPopupParent', @VCLua_Form_GetRealPopupParent);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Hide', @VCLua_Form_Hide);
	TLuaMethodInfo.Create(CustomFormFuncs, 'IntfDropFiles', @VCLua_Form_IntfDropFiles);
	TLuaMethodInfo.Create(CustomFormFuncs, 'IntfHelp', @VCLua_Form_IntfHelp);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MakeFullyVisible', @VCLua_Form_MakeFullyVisible);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Release', @VCLua_Form_Release);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SetFocusedControl', @VCLua_Form_SetFocusedControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SetRestoredBounds', @VCLua_Form_SetRestoredBounds);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Show', @VCLua_Form_Show);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowModal', @VCLua_Form_ShowModal);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowOnTop', @VCLua_Form_ShowOnTop);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SmallIconHandle', @VCLua_Form_SmallIconHandle);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ActiveMDIChild', @VCLua_Form_ActiveMDIChild);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetMDIChildren', @VCLua_Form_GetMDIChildren);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MDIChildCount', @VCLua_Form_MDIChildCount);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AutoScale', @VCLua_Form_AutoScale);
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
	TLuaMethodInfo.Create(CustomFormSets, 'ActiveControl', @VCLua_Form_VCLuaSetActiveControl, mfCall, TypeInfo(TWinControl));
	TLuaMethodInfo.Create(CustomFormSets, 'ActiveDefaultControl', @VCLua_Form_VCLuaSetActiveDefaultControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(CustomFormSets, 'AllowDropFiles', @VCLua_Form_VCLuaSetAllowDropFiles, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomFormSets, 'AlphaBlend', @VCLua_Form_VCLuaSetAlphaBlend, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomFormSets, 'AlphaBlendValue', @VCLua_Form_VCLuaSetAlphaBlendValue, mfCall, TypeInfo(Byte));
	TLuaMethodInfo.Create(CustomFormSets, 'BorderStyle', @VCLua_Form_VCLuaSetBorderStyle, mfCall, TypeInfo(TFormBorderStyle));
	TLuaMethodInfo.Create(CustomFormSets, 'CancelControl', @VCLua_Form_VCLuaSetCancelControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(CustomFormSets, 'DefaultControl', @VCLua_Form_VCLuaSetDefaultControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(CustomFormSets, 'DefaultMonitor', @VCLua_Form_VCLuaSetDefaultMonitor, mfCall, TypeInfo(TDefaultMonitor));
	TLuaMethodInfo.Create(CustomFormSets, 'FormStyle', @VCLua_Form_VCLuaSetFormStyle, mfCall, TypeInfo(TFormStyle));
	TLuaMethodInfo.Create(CustomFormSets, 'HelpFile', @VCLua_Form_VCLuaSetHelpFile, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(CustomFormSets, 'Icon', @VCLua_Form_VCLuaSetIcon, mfCall, TypeInfo(TIcon));
	TLuaMethodInfo.Create(CustomFormSets, 'KeyPreview', @VCLua_Form_VCLuaSetKeyPreview, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomFormSets, 'Menu', @VCLua_Form_VCLuaSetMenu, mfCall, TypeInfo(TMainMenu));
	TLuaMethodInfo.Create(CustomFormSets, 'ModalResult', @VCLua_Form_VCLuaSetModalResult, mfCall, TypeInfo(TModalResult));
	TLuaMethodInfo.Create(CustomFormSets, 'PopupMode', @VCLua_Form_VCLuaSetPopupMode, mfCall, TypeInfo(TPopupMode));
	TLuaMethodInfo.Create(CustomFormSets, 'PopupParent', @VCLua_Form_VCLuaSetPopupParent, mfCall, TypeInfo(TCustomForm));
	TLuaMethodInfo.Create(CustomFormSets, 'OnActivate', @VCLua_Form_VCLuaSetOnActivate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnClose', @VCLua_Form_VCLuaSetOnClose, mfCall, TypeInfo(TCloseEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnCloseQuery', @VCLua_Form_VCLuaSetOnCloseQuery, mfCall, TypeInfo(TCloseQueryEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnCreate', @VCLua_Form_VCLuaSetOnCreate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnDeactivate', @VCLua_Form_VCLuaSetOnDeactivate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnDestroy', @VCLua_Form_VCLuaSetOnDestroy, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnDropFiles', @VCLua_Form_VCLuaSetOnDropFiles, mfCall, TypeInfo(TDropFilesEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnHide', @VCLua_Form_VCLuaSetOnHide, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnShow', @VCLua_Form_VCLuaSetOnShow, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnShowModalFinished', @VCLua_Form_VCLuaSetOnShowModalFinished, mfCall, TypeInfo(TModalDialogFinished));
	TLuaMethodInfo.Create(CustomFormSets, 'OnWindowStateChange', @VCLua_Form_VCLuaSetOnWindowStateChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'Position', @VCLua_Form_VCLuaSetPosition, mfCall, TypeInfo(TPosition));
	TLuaMethodInfo.Create(CustomFormSets, 'ShowInTaskBar', @VCLua_Form_VCLuaSetShowInTaskBar, mfCall, TypeInfo(TShowInTaskbar));
	TLuaMethodInfo.Create(CustomFormSets, 'WindowState', @VCLua_Form_VCLuaSetWindowState, mfCall, TypeInfo(TWindowState));
end.
