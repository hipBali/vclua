(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaForm;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Forms, TypInfo, LuaVmt;

function CreateForm(L: Plua_State): Integer; cdecl;
function IsForm(L: Plua_State): Integer; cdecl;
function AsForm(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo = nil); overload; inline;

type
    TLuaForm = class(TForm)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomFormFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, Graphics, LCLType, LuaBitmap;

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

function IsForm(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TForm);
end;
function AsForm(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TForm then
    lua_push(L, TForm(o))
  else
    lua_pushnil(L);
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
	TLuaMethodInfo.Create(CustomFormFuncs, 'MDIChildren', @VCLua_Form_MDIChildren);
end.
