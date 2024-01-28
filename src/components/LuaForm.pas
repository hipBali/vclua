(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaForm;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Forms, LCLType, LMessages, Controls, Graphics, LuaBitmap, TypInfo;

function CreateForm(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo = nil); overload; inline;
procedure FormToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaForm = class(TForm)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Form_AfterConstruction(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.AfterConstruction();
	
	Result := 0;
end;

function VCLua_Form_BeforeDestruction(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.BeforeDestruction();
	
	Result := 0;
end;

function VCLua_Form_BigIconHandle(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:HICON;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.BigIconHandle();
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Form_Close(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.Close();
	
	Result := 0;
end;

function VCLua_Form_CloseQuery(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.CloseQuery();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Form_DefocusControl(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	Control:TWinControl;
	Removing:Boolean;
begin
	CheckArg(L, 3);
	lForm := TLuaForm(GetLuaObject(L, 1));
	Control := TWinControl(GetLuaObject(L,2));
	Removing := lua_toboolean(L,3);
	lForm.DefocusControl(Control,Removing);
	
	Result := 0;
end;

function VCLua_Form_DestroyWnd(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.DestroyWnd();
	
	Result := 0;
end;

function VCLua_Form_EnsureVisible(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	AMoveToTop:Boolean;
begin
	CheckArg(L, -1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	AMoveToTop := luaL_optbool(L,2,True);
	lForm.EnsureVisible(AMoveToTop);
	
	Result := 0;
end;

function VCLua_Form_FocusControl(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	WinControl:TWinControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	WinControl := TWinControl(GetLuaObject(L,2));
	lForm.FocusControl(WinControl);
	
	Result := 0;
end;

function VCLua_Form_FormIsUpdating(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.FormIsUpdating();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Form_GetFormImage(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:TBitmap;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.GetFormImage();
	FormToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_Form_GetRolesForControl(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	AControl:TControl;
	ret:TControlRolesForForm;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	ret := lForm.GetRolesForControl(AControl);
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Form_GetRealPopupParent(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.GetRealPopupParent();
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Form_Hide(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.Hide();
	
	Result := 0;
end;

function VCLua_Form_IntfDropFiles(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	FileNames:array of String;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	FileNames := lua_toStringArray(L,2);
	lForm.IntfDropFiles(FileNames);
	
	Result := 0;
end;

function VCLua_Form_IntfHelp(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	AComponent := TComponent(GetLuaObject(L,2));
	lForm.IntfHelp(AComponent);
	
	Result := 0;
end;

function VCLua_Form_MakeFullyVisible(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	AMonitor:TMonitor;
	UseWorkarea:Boolean;
begin
	CheckArg(L, -1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	AMonitor := TMonitor(GetLuaObject(L,2));
	UseWorkarea := luaL_optbool(L,3,False);
	lForm.MakeFullyVisible(AMonitor,UseWorkarea);
	
	Result := 0;
end;

function VCLua_Form_AutoSizeDelayedHandle(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.AutoSizeDelayedHandle();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Form_GetPreferredSize(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	PreferredWidth:integer;
	PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, -1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	Raw := luaL_optbool(L,2,false);
	WithThemeSpace := luaL_optbool(L,3,true);
	lForm.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	lua_pushinteger(L,PreferredWidth);
	lua_pushinteger(L,PreferredHeight);
	Result := 2;
end;

function VCLua_Form_Release(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.Release();
	
	Result := 0;
end;

function VCLua_Form_CanFocus(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.CanFocus();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Form_SetFocus(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.SetFocus();
	
	Result := 0;
end;

function VCLua_Form_SetFocusedControl(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	Control:TWinControl;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	Control := TWinControl(GetLuaObject(L,2));
	ret := lForm.SetFocusedControl(Control);
	lua_pushboolean(L,ret);
	
	Result := 1;
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
	CheckArg(L, -1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ALeft := lua_tointeger(L,2);
	ATop := lua_tointeger(L,3);
	AWidth := lua_tointeger(L,4);
	AHeight := lua_tointeger(L,5);
	ADefaultPosition := luaL_optbool(L,6,False);
	lForm.SetRestoredBounds(ALeft,ATop,AWidth,AHeight,ADefaultPosition);
	
	Result := 0;
end;

function VCLua_Form_Show(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.Show();
	
	Result := 0;
end;

function VCLua_Form_ShowModal(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:Integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.ShowModal();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Form_ShowOnTop(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	lForm.ShowOnTop();
	
	Result := 0;
end;

function VCLua_Form_SmallIconHandle(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:HICON;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.SmallIconHandle();
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Form_ActiveMDIChild(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:TCustomForm;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.ActiveMDIChild();
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Form_GetMDIChildren(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	AIndex:Integer;
	ret:TCustomForm;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	ret := lForm.GetMDIChildren(AIndex);
	lua_pushlightuserdata(L,@ret);
	
	Result := 1;
end;

function VCLua_Form_MDIChildCount(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	ret:Integer;
begin
	CheckArg(L, 1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	ret := lForm.MDIChildCount();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Form_Dock(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	NewDockSite:TWinControl;
	ARect:TRect;
begin
	CheckArg(L, 3);
	lForm := TLuaForm(GetLuaObject(L, 1));
	NewDockSite := TWinControl(GetLuaObject(L,2));
	ARect := lua_toTRect(L,3);
	lForm.Dock(NewDockSite,ARect);
	
	Result := 0;
end;

function VCLua_Form_UpdateDockCaption(L: Plua_State): Integer; cdecl;
var 
	lForm:TLuaForm;
	Exclude:TControl;
begin
	CheckArg(L, 2);
	lForm := TLuaForm(GetLuaObject(L, 1));
	Exclude := TControl(GetLuaObject(L,2));
	lForm.UpdateDockCaption(Exclude);
	
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo);
begin
	FormToTable(L,-1,v);
end;
procedure FormToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AfterConstruction', @VCLua_Form_AfterConstruction);
	LuaSetTableFunction(L, Index, 'BeforeDestruction', @VCLua_Form_BeforeDestruction);
	LuaSetTableFunction(L, Index, 'BigIconHandle', @VCLua_Form_BigIconHandle);
	LuaSetTableFunction(L, Index, 'Close', @VCLua_Form_Close);
	LuaSetTableFunction(L, Index, 'CloseQuery', @VCLua_Form_CloseQuery);
	LuaSetTableFunction(L, Index, 'DefocusControl', @VCLua_Form_DefocusControl);
	LuaSetTableFunction(L, Index, 'DestroyWnd', @VCLua_Form_DestroyWnd);
	LuaSetTableFunction(L, Index, 'EnsureVisible', @VCLua_Form_EnsureVisible);
	LuaSetTableFunction(L, Index, 'FocusControl', @VCLua_Form_FocusControl);
	LuaSetTableFunction(L, Index, 'FormIsUpdating', @VCLua_Form_FormIsUpdating);
	LuaSetTableFunction(L, Index, 'GetFormImage', @VCLua_Form_GetFormImage);
	LuaSetTableFunction(L, Index, 'GetRolesForControl', @VCLua_Form_GetRolesForControl);
	LuaSetTableFunction(L, Index, 'GetRealPopupParent', @VCLua_Form_GetRealPopupParent);
	LuaSetTableFunction(L, Index, 'Hide', @VCLua_Form_Hide);
	LuaSetTableFunction(L, Index, 'IntfDropFiles', @VCLua_Form_IntfDropFiles);
	LuaSetTableFunction(L, Index, 'IntfHelp', @VCLua_Form_IntfHelp);
	LuaSetTableFunction(L, Index, 'MakeFullyVisible', @VCLua_Form_MakeFullyVisible);
	LuaSetTableFunction(L, Index, 'AutoSizeDelayedHandle', @VCLua_Form_AutoSizeDelayedHandle);
	LuaSetTableFunction(L, Index, 'GetPreferredSize', @VCLua_Form_GetPreferredSize);
	LuaSetTableFunction(L, Index, 'Release', @VCLua_Form_Release);
	LuaSetTableFunction(L, Index, 'CanFocus', @VCLua_Form_CanFocus);
	LuaSetTableFunction(L, Index, 'SetFocus', @VCLua_Form_SetFocus);
	LuaSetTableFunction(L, Index, 'SetFocusedControl', @VCLua_Form_SetFocusedControl);
	LuaSetTableFunction(L, Index, 'SetRestoredBounds', @VCLua_Form_SetRestoredBounds);
	LuaSetTableFunction(L, Index, 'Show', @VCLua_Form_Show);
	LuaSetTableFunction(L, Index, 'ShowModal', @VCLua_Form_ShowModal);
	LuaSetTableFunction(L, Index, 'ShowOnTop', @VCLua_Form_ShowOnTop);
	LuaSetTableFunction(L, Index, 'SmallIconHandle', @VCLua_Form_SmallIconHandle);
	LuaSetTableFunction(L, Index, 'ActiveMDIChild', @VCLua_Form_ActiveMDIChild);
	LuaSetTableFunction(L, Index, 'GetMDIChildren', @VCLua_Form_GetMDIChildren);
	LuaSetTableFunction(L, Index, 'MDIChildCount', @VCLua_Form_MDIChildCount);
	LuaSetTableFunction(L, Index, 'Dock', @VCLua_Form_Dock);
	LuaSetTableFunction(L, Index, 'UpdateDockCaption', @VCLua_Form_UpdateDockCaption);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lForm.LuaCtl := TVCLuaControl.Create(lForm as TComponent,L,@FormToTable);
	InitControl(L,lForm,Name);
	FormToTable(L, -1, lForm);
	Result := 1;
end;

end.
