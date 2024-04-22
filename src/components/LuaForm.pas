(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaForm;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Forms;

procedure lua_push(L: Plua_State; const v: TCustomForm; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomForm = class(TCustomForm)
    end;
var
    CustomFormFuncs: TLuaVmt;
    CustomFormSets: TLuaVmt;

function CreateForm(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo = nil); overload; inline;

type
    TLuaForm = class(TForm)
    end;
var
    FormFuncs: TLuaVmt;
    FormSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaBitmap, LuaClassesEvents, LuaControl, LuaEvent, LuaFormsEvents, LuaMenu, LuaMonitor, LuaWinControl, Menus, LCLType;

function VCLua_CustomForm_AfterConstruction(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.AfterConstruction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'AfterConstruction', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_BigIconHandle(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:HICON;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.BigIconHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'BigIconHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_Close(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.Close();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'Close', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_CloseQuery(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.CloseQuery();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'CloseQuery', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_DefocusControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	Control:TWinControl;
	Removing:Boolean;
begin
	CheckArg(L, 3);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Control);
	luaL_check(L,3,@Removing);
	try
		lCustomForm.DefocusControl(Control,Removing);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'DefocusControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_DestroyWnd(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.DestroyWnd();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'DestroyWnd', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_EnsureVisible(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	AMoveToTop:Boolean;
begin
	CheckArg(L, 1, 2);
	lCustomForm := TLuaCustomForm(CheckLuaObjectPop(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @AMoveToTop, True);
	try
		lCustomForm.EnsureVisible(AMoveToTop);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'EnsureVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_FocusControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	WinControl:TWinControl;
begin
	CheckArg(L, 2);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	luaL_check(L,2,@WinControl);
	try
		lCustomForm.FocusControl(WinControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'FocusControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_GetFormImage(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TBitmap;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.GetFormImage();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetFormImage', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_GetRolesForControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	AControl:TControl;
	ret:TControlRolesForForm;
begin
	CheckArg(L, 2);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		ret := lCustomForm.GetRolesForControl(AControl);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetRolesForControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_GetRealPopupParent(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.GetRealPopupParent();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetRealPopupParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_Hide(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.Hide();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'Hide', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_IntfDropFiles(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	FileNames:array of String;
begin
	CheckArg(L, 2);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	TTrait<String>.luaL_checkArray(L, 2, @FileNames);
	try
		lCustomForm.IntfDropFiles(FileNames);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'IntfDropFiles', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_IntfHelp(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lCustomForm.IntfHelp(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'IntfHelp', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_MakeFullyVisible(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	AMonitor:TMonitor;
	UseWorkarea:Boolean;
begin
	CheckArg(L, 1, 3);
	lCustomForm := TLuaCustomForm(CheckLuaObjectPop(L, 1));
	TTrait<TMonitor>.luaL_optcheck(L, 2, @AMonitor, nil);
	TTrait<Boolean>.luaL_optcheck(L, 3, @UseWorkarea, False);
	try
		lCustomForm.MakeFullyVisible(AMonitor,UseWorkarea);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'MakeFullyVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_Release(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.Release();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'Release', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_SetFocusedControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	Control:TWinControl;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Control);
	try
		ret := lCustomForm.SetFocusedControl(Control);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetFocusedControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_SetRestoredBounds(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ALeft:integer;
	ATop:integer;
	AWidth:integer;
	AHeight:integer;
	ADefaultPosition:Boolean;
begin
	CheckArg(L, 5, 6);
	lCustomForm := TLuaCustomForm(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@ALeft);
	luaL_check(L,3,@ATop);
	luaL_check(L,4,@AWidth);
	luaL_check(L,5,@AHeight);
	TTrait<Boolean>.luaL_optcheck(L, 6, @ADefaultPosition, False);
	try
		lCustomForm.SetRestoredBounds(ALeft,ATop,AWidth,AHeight,ADefaultPosition);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetRestoredBounds', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_Show(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.Show();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'Show', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_ShowModal(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.ShowModal();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'ShowModal', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_ShowOnTop(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.ShowOnTop();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'ShowOnTop', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_SmallIconHandle(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:HICON;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.SmallIconHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SmallIconHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_ActiveMDIChild(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.ActiveMDIChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'ActiveMDIChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_GetMDIChildren(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	AIndex:Integer;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lCustomForm.GetMDIChildren(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetMDIChildren', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_MDIChildCount(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		ret := lCustomForm.MDIChildCount();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'MDIChildCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_AutoScale(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	CheckArg(L, 1);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	try
		lCustomForm.AutoScale();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'AutoScale', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetActive(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:Boolean;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.Active;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetActive', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetActiveControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TWinControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.ActiveControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetActiveControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetActiveControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TWinControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.ActiveControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetActiveControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetActiveDefaultControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.ActiveDefaultControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetActiveDefaultControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetActiveDefaultControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.ActiveDefaultControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetActiveDefaultControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetAllowDropFiles(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:Boolean;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.AllowDropFiles := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetAllowDropFiles', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetAllowDropFiles(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:Boolean;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.AllowDropFiles;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetAllowDropFiles', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetAlphaBlend(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:Boolean;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.AlphaBlend := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetAlphaBlend', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetAlphaBlend(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:Boolean;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.AlphaBlend;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetAlphaBlend', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetAlphaBlendValue(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:Byte;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.AlphaBlendValue := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetAlphaBlendValue', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetAlphaBlendValue(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:Byte;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.AlphaBlendValue;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetAlphaBlendValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TFormBorderStyle;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TFormBorderStyle));
	try
		lCustomForm.BorderStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetBorderStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TFormBorderStyle;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.BorderStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetBorderStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaSetCancelControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.CancelControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetCancelControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetCancelControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.CancelControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetCancelControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetDefaultControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.DefaultControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetDefaultControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetDefaultControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.DefaultControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetDefaultControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetDefaultMonitor(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TDefaultMonitor;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TDefaultMonitor));
	try
		lCustomForm.DefaultMonitor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetDefaultMonitor', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetDefaultMonitor(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TDefaultMonitor;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.DefaultMonitor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetDefaultMonitor', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaGetEffectiveShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TShowInTaskBar;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.EffectiveShowInTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetEffectiveShowInTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaGetFormState(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TFormState;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.FormState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetFormState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaSetFormStyle(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TFormStyle;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TFormStyle));
	try
		lCustomForm.FormStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetFormStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetFormStyle(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TFormStyle;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.FormStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetFormStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaSetHelpFile(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:string;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.HelpFile := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetHelpFile', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetHelpFile(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:string;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.HelpFile;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetHelpFile', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetIcon(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TIcon;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.Icon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetIcon(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TIcon;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.Icon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaSetKeyPreview(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:Boolean;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.KeyPreview := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetKeyPreview', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetKeyPreview(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:Boolean;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.KeyPreview;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetKeyPreview', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_MDIChildren(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	I:Integer;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lCustomForm := TLuaCustomForm(GetLuaObject(L, 1));
	luaL_check(L,2,@I);
	try
		ret := lCustomForm.MDIChildren[I];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'MDIChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaSetMenu(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TMainMenu;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.Menu := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetMenu', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetMenu(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TMainMenu;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.Menu;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetModalResult(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TModalResult;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.ModalResult := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetModalResult', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetModalResult(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TModalResult;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.ModalResult;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetModalResult', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaGetMonitor(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TMonitor;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.Monitor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetMonitor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaGetLastActiveControl(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TWinControl;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.LastActiveControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetLastActiveControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetPopupMode(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TPopupMode;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPopupMode));
	try
		lCustomForm.PopupMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetPopupMode', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetPopupMode(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TPopupMode;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.PopupMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetPopupMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaSetPopupParent(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomForm.PopupParent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetPopupParent', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetPopupParent(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.PopupParent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetPopupParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetOnActivate(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnActivate));
	lCustomForm.OnActivate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnClose(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnClose));
	lCustomForm.OnClose := TLuaEvent.Factory<TCloseEvent,TLuaCloseEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnCloseQuery(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnCloseQuery));
	lCustomForm.OnCloseQuery := TLuaEvent.Factory<TCloseQueryEvent,TLuaCloseQueryEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnCreate(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnCreate));
	lCustomForm.OnCreate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnDeactivate(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnDeactivate));
	lCustomForm.OnDeactivate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnDestroy(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnDestroy));
	lCustomForm.OnDestroy := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnDropFiles(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnDropFiles));
	lCustomForm.OnDropFiles := TLuaEvent.Factory<TDropFilesEvent,TLuaDropFilesEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnHide(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnHide));
	lCustomForm.OnHide := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnShow(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnShow));
	lCustomForm.OnShow := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnShowModalFinished(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnShowModalFinished));
	lCustomForm.OnShowModalFinished := TLuaEvent.Factory<TModalDialogFinished,TLuaModalDialogFinished>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetOnWindowStateChange(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomForm.OnWindowStateChange));
	lCustomForm.OnWindowStateChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomForm_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TPosition;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPosition));
	try
		lCustomForm.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TPosition;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaGetRestoredLeft(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:integer;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.RestoredLeft;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetRestoredLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaGetRestoredTop(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:integer;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.RestoredTop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetRestoredTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaGetRestoredWidth(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:integer;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.RestoredWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetRestoredWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaGetRestoredHeight(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:integer;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.RestoredHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetRestoredHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomForm_VCLuaSetShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TShowInTaskbar;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TShowInTaskbar));
	try
		lCustomForm.ShowInTaskBar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetShowInTaskBar', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetShowInTaskBar(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TShowInTaskbar;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.ShowInTaskBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetShowInTaskBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomForm_VCLuaSetWindowState(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	val:TWindowState;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TWindowState));
	try
		lCustomForm.WindowState := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'SetWindowState', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomForm_VCLuaGetWindowState(L: Plua_State): Integer; cdecl;
var
	lCustomForm:TLuaCustomForm;
	ret:TWindowState;
begin
	lCustomForm := TLuaCustomForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomForm.WindowState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomForm', 'GetWindowState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Form_Cascade(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Cascade();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Cascade', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_Next(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Next();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Next', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_Previous(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Previous();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Previous', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_Tile(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.Tile();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'Tile', E.ClassName, E.Message);
	end;
end;

function VCLua_Form_ArrangeIcons(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	try
		lForm.ArrangeIcons();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Form', 'ArrangeIcons', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TCustomForm; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomForm',v);
end;

procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TForm',v);
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
	CreateTableForKnownType(L,'TForm',lForm);
	InitControl(L,lForm,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'Form', E.ClassName, E.Message);
	end;
end;

begin
	CustomFormFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFormFuncs, 'AfterConstruction', @VCLua_CustomForm_AfterConstruction);
	TLuaMethodInfo.Create(CustomFormFuncs, 'BigIconHandle', @VCLua_CustomForm_BigIconHandle);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Close', @VCLua_CustomForm_Close);
	TLuaMethodInfo.Create(CustomFormFuncs, 'CloseQuery', @VCLua_CustomForm_CloseQuery);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DefocusControl', @VCLua_CustomForm_DefocusControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DestroyWnd', @VCLua_CustomForm_DestroyWnd);
	TLuaMethodInfo.Create(CustomFormFuncs, 'EnsureVisible', @VCLua_CustomForm_EnsureVisible);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FocusControl', @VCLua_CustomForm_FocusControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetFormImage', @VCLua_CustomForm_GetFormImage);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetRolesForControl', @VCLua_CustomForm_GetRolesForControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetRealPopupParent', @VCLua_CustomForm_GetRealPopupParent);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Hide', @VCLua_CustomForm_Hide);
	TLuaMethodInfo.Create(CustomFormFuncs, 'IntfDropFiles', @VCLua_CustomForm_IntfDropFiles);
	TLuaMethodInfo.Create(CustomFormFuncs, 'IntfHelp', @VCLua_CustomForm_IntfHelp);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MakeFullyVisible', @VCLua_CustomForm_MakeFullyVisible);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Release', @VCLua_CustomForm_Release);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SetFocusedControl', @VCLua_CustomForm_SetFocusedControl);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SetRestoredBounds', @VCLua_CustomForm_SetRestoredBounds);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Show', @VCLua_CustomForm_Show);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowModal', @VCLua_CustomForm_ShowModal);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowOnTop', @VCLua_CustomForm_ShowOnTop);
	TLuaMethodInfo.Create(CustomFormFuncs, 'SmallIconHandle', @VCLua_CustomForm_SmallIconHandle);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ActiveMDIChild', @VCLua_CustomForm_ActiveMDIChild);
	TLuaMethodInfo.Create(CustomFormFuncs, 'GetMDIChildren', @VCLua_CustomForm_GetMDIChildren);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MDIChildCount', @VCLua_CustomForm_MDIChildCount);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AutoScale', @VCLua_CustomForm_AutoScale);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Active', @VCLua_CustomForm_VCLuaGetActive, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ActiveControl', @VCLua_CustomForm_VCLuaGetActiveControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ActiveDefaultControl', @VCLua_CustomForm_VCLuaGetActiveDefaultControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AllowDropFiles', @VCLua_CustomForm_VCLuaGetAllowDropFiles, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AlphaBlend', @VCLua_CustomForm_VCLuaGetAlphaBlend, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'AlphaBlendValue', @VCLua_CustomForm_VCLuaGetAlphaBlendValue, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'BorderStyle', @VCLua_CustomForm_VCLuaGetBorderStyle, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'CancelControl', @VCLua_CustomForm_VCLuaGetCancelControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DefaultControl', @VCLua_CustomForm_VCLuaGetDefaultControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'DefaultMonitor', @VCLua_CustomForm_VCLuaGetDefaultMonitor, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'EffectiveShowInTaskBar', @VCLua_CustomForm_VCLuaGetEffectiveShowInTaskBar, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FormState', @VCLua_CustomForm_VCLuaGetFormState, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'FormStyle', @VCLua_CustomForm_VCLuaGetFormStyle, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'HelpFile', @VCLua_CustomForm_VCLuaGetHelpFile, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Icon', @VCLua_CustomForm_VCLuaGetIcon, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'KeyPreview', @VCLua_CustomForm_VCLuaGetKeyPreview, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'MDIChildren', @VCLua_CustomForm_MDIChildren);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Menu', @VCLua_CustomForm_VCLuaGetMenu, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ModalResult', @VCLua_CustomForm_VCLuaGetModalResult, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Monitor', @VCLua_CustomForm_VCLuaGetMonitor, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'LastActiveControl', @VCLua_CustomForm_VCLuaGetLastActiveControl, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'PopupMode', @VCLua_CustomForm_VCLuaGetPopupMode, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'PopupParent', @VCLua_CustomForm_VCLuaGetPopupParent, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'Position', @VCLua_CustomForm_VCLuaGetPosition, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredLeft', @VCLua_CustomForm_VCLuaGetRestoredLeft, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredTop', @VCLua_CustomForm_VCLuaGetRestoredTop, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredWidth', @VCLua_CustomForm_VCLuaGetRestoredWidth, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'RestoredHeight', @VCLua_CustomForm_VCLuaGetRestoredHeight, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'ShowInTaskBar', @VCLua_CustomForm_VCLuaGetShowInTaskBar, mfCall);
	TLuaMethodInfo.Create(CustomFormFuncs, 'WindowState', @VCLua_CustomForm_VCLuaGetWindowState, mfCall);
	CustomFormSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomFormSets, 'ActiveControl', @VCLua_CustomForm_VCLuaSetActiveControl, mfCall, TypeInfo(TWinControl));
	TLuaMethodInfo.Create(CustomFormSets, 'ActiveDefaultControl', @VCLua_CustomForm_VCLuaSetActiveDefaultControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(CustomFormSets, 'AllowDropFiles', @VCLua_CustomForm_VCLuaSetAllowDropFiles, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomFormSets, 'AlphaBlend', @VCLua_CustomForm_VCLuaSetAlphaBlend, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomFormSets, 'AlphaBlendValue', @VCLua_CustomForm_VCLuaSetAlphaBlendValue, mfCall, TypeInfo(Byte));
	TLuaMethodInfo.Create(CustomFormSets, 'BorderStyle', @VCLua_CustomForm_VCLuaSetBorderStyle, mfCall, TypeInfo(TFormBorderStyle));
	TLuaMethodInfo.Create(CustomFormSets, 'CancelControl', @VCLua_CustomForm_VCLuaSetCancelControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(CustomFormSets, 'DefaultControl', @VCLua_CustomForm_VCLuaSetDefaultControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(CustomFormSets, 'DefaultMonitor', @VCLua_CustomForm_VCLuaSetDefaultMonitor, mfCall, TypeInfo(TDefaultMonitor));
	TLuaMethodInfo.Create(CustomFormSets, 'FormStyle', @VCLua_CustomForm_VCLuaSetFormStyle, mfCall, TypeInfo(TFormStyle));
	TLuaMethodInfo.Create(CustomFormSets, 'HelpFile', @VCLua_CustomForm_VCLuaSetHelpFile, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(CustomFormSets, 'Icon', @VCLua_CustomForm_VCLuaSetIcon, mfCall, TypeInfo(TIcon));
	TLuaMethodInfo.Create(CustomFormSets, 'KeyPreview', @VCLua_CustomForm_VCLuaSetKeyPreview, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomFormSets, 'Menu', @VCLua_CustomForm_VCLuaSetMenu, mfCall, TypeInfo(TMainMenu));
	TLuaMethodInfo.Create(CustomFormSets, 'ModalResult', @VCLua_CustomForm_VCLuaSetModalResult, mfCall, TypeInfo(TModalResult));
	TLuaMethodInfo.Create(CustomFormSets, 'PopupMode', @VCLua_CustomForm_VCLuaSetPopupMode, mfCall, TypeInfo(TPopupMode));
	TLuaMethodInfo.Create(CustomFormSets, 'PopupParent', @VCLua_CustomForm_VCLuaSetPopupParent, mfCall, TypeInfo(TCustomForm));
	TLuaMethodInfo.Create(CustomFormSets, 'OnActivate', @VCLua_CustomForm_VCLuaSetOnActivate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnClose', @VCLua_CustomForm_VCLuaSetOnClose, mfCall, TypeInfo(TCloseEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnCloseQuery', @VCLua_CustomForm_VCLuaSetOnCloseQuery, mfCall, TypeInfo(TCloseQueryEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnCreate', @VCLua_CustomForm_VCLuaSetOnCreate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnDeactivate', @VCLua_CustomForm_VCLuaSetOnDeactivate, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnDestroy', @VCLua_CustomForm_VCLuaSetOnDestroy, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnDropFiles', @VCLua_CustomForm_VCLuaSetOnDropFiles, mfCall, TypeInfo(TDropFilesEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnHide', @VCLua_CustomForm_VCLuaSetOnHide, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnShow', @VCLua_CustomForm_VCLuaSetOnShow, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'OnShowModalFinished', @VCLua_CustomForm_VCLuaSetOnShowModalFinished, mfCall, TypeInfo(TModalDialogFinished));
	TLuaMethodInfo.Create(CustomFormSets, 'OnWindowStateChange', @VCLua_CustomForm_VCLuaSetOnWindowStateChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomFormSets, 'Position', @VCLua_CustomForm_VCLuaSetPosition, mfCall, TypeInfo(TPosition));
	TLuaMethodInfo.Create(CustomFormSets, 'ShowInTaskBar', @VCLua_CustomForm_VCLuaSetShowInTaskBar, mfCall, TypeInfo(TShowInTaskbar));
	TLuaMethodInfo.Create(CustomFormSets, 'WindowState', @VCLua_CustomForm_VCLuaSetWindowState, mfCall, TypeInfo(TWindowState));
	FormFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FormFuncs, 'Cascade', @VCLua_Form_Cascade);
	TLuaMethodInfo.Create(FormFuncs, 'Next', @VCLua_Form_Next);
	TLuaMethodInfo.Create(FormFuncs, 'Previous', @VCLua_Form_Previous);
	TLuaMethodInfo.Create(FormFuncs, 'Tile', @VCLua_Form_Tile);
	TLuaMethodInfo.Create(FormFuncs, 'ArrangeIcons', @VCLua_Form_ArrangeIcons);
	FormSets := TLuaVmt.Create;
	
end.
