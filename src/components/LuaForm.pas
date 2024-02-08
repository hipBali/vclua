(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaForm;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Forms, LCLType, LMessages, Controls, Graphics, LuaBitmap, TypInfo;

function CreateForm(L: Plua_State): Integer; cdecl;
function IsForm(L: Plua_State): Integer; cdecl;
function AsForm(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TForm; pti: PTypeInfo = nil); overload; inline;
procedure FormToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaForm = class(TForm)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomFormFuncs: aoluaL_Reg;


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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret,TypeInfo(ret));
	
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
	lua_push(L,ret,TypeInfo(ret));
	
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
	lua_push(L,ret);
	
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
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
	Result := 2;
end;

function VCLua_Form_GetPreferredSize2(L: Plua_State): Integer; cdecl;
var
	lForm:TLuaForm;
	PreferredWidth:integer;
	PreferredHeight:integer;
	Raw:boolean;
	WithThemeSpace:boolean;
begin
	CheckArg(L, -1);
	lForm := TLuaForm(GetLuaObject(L, 1));
	PreferredWidth := lua_tointeger(L,2);
	PreferredHeight := lua_tointeger(L,3);
	Raw := luaL_optbool(L,4,false);
	WithThemeSpace := luaL_optbool(L,5,true);
	lForm.GetPreferredSize(PreferredWidth,PreferredHeight,Raw,WithThemeSpace);
	lua_push(L,PreferredWidth);
	lua_push(L,PreferredHeight);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret,TypeInfo(ret));
	
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
	lua_push(L,ret,TypeInfo(ret));
	
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
	lua_push(L,ret);
	
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
	FormToTable(L,-1,v);
end;
procedure FormToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomForm');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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

begin
	SetLength(CustomFormFuncs, 34+1);
	CustomFormFuncs[0].name:='AfterConstruction';
	CustomFormFuncs[0].func:=@VCLua_Form_AfterConstruction;
	CustomFormFuncs[1].name:='BeforeDestruction';
	CustomFormFuncs[1].func:=@VCLua_Form_BeforeDestruction;
	CustomFormFuncs[2].name:='BigIconHandle';
	CustomFormFuncs[2].func:=@VCLua_Form_BigIconHandle;
	CustomFormFuncs[3].name:='Close';
	CustomFormFuncs[3].func:=@VCLua_Form_Close;
	CustomFormFuncs[4].name:='CloseQuery';
	CustomFormFuncs[4].func:=@VCLua_Form_CloseQuery;
	CustomFormFuncs[5].name:='DefocusControl';
	CustomFormFuncs[5].func:=@VCLua_Form_DefocusControl;
	CustomFormFuncs[6].name:='DestroyWnd';
	CustomFormFuncs[6].func:=@VCLua_Form_DestroyWnd;
	CustomFormFuncs[7].name:='EnsureVisible';
	CustomFormFuncs[7].func:=@VCLua_Form_EnsureVisible;
	CustomFormFuncs[8].name:='FocusControl';
	CustomFormFuncs[8].func:=@VCLua_Form_FocusControl;
	CustomFormFuncs[9].name:='FormIsUpdating';
	CustomFormFuncs[9].func:=@VCLua_Form_FormIsUpdating;
	CustomFormFuncs[10].name:='GetFormImage';
	CustomFormFuncs[10].func:=@VCLua_Form_GetFormImage;
	CustomFormFuncs[11].name:='GetRolesForControl';
	CustomFormFuncs[11].func:=@VCLua_Form_GetRolesForControl;
	CustomFormFuncs[12].name:='GetRealPopupParent';
	CustomFormFuncs[12].func:=@VCLua_Form_GetRealPopupParent;
	CustomFormFuncs[13].name:='Hide';
	CustomFormFuncs[13].func:=@VCLua_Form_Hide;
	CustomFormFuncs[14].name:='IntfDropFiles';
	CustomFormFuncs[14].func:=@VCLua_Form_IntfDropFiles;
	CustomFormFuncs[15].name:='IntfHelp';
	CustomFormFuncs[15].func:=@VCLua_Form_IntfHelp;
	CustomFormFuncs[16].name:='MakeFullyVisible';
	CustomFormFuncs[16].func:=@VCLua_Form_MakeFullyVisible;
	CustomFormFuncs[17].name:='AutoSizeDelayedHandle';
	CustomFormFuncs[17].func:=@VCLua_Form_AutoSizeDelayedHandle;
	CustomFormFuncs[18].name:='GetPreferredSize';
	CustomFormFuncs[18].func:=@VCLua_Form_GetPreferredSize;
	CustomFormFuncs[19].name:='GetPreferredSize2';
	CustomFormFuncs[19].func:=@VCLua_Form_GetPreferredSize2;
	CustomFormFuncs[20].name:='Release';
	CustomFormFuncs[20].func:=@VCLua_Form_Release;
	CustomFormFuncs[21].name:='CanFocus';
	CustomFormFuncs[21].func:=@VCLua_Form_CanFocus;
	CustomFormFuncs[22].name:='SetFocus';
	CustomFormFuncs[22].func:=@VCLua_Form_SetFocus;
	CustomFormFuncs[23].name:='SetFocusedControl';
	CustomFormFuncs[23].func:=@VCLua_Form_SetFocusedControl;
	CustomFormFuncs[24].name:='SetRestoredBounds';
	CustomFormFuncs[24].func:=@VCLua_Form_SetRestoredBounds;
	CustomFormFuncs[25].name:='Show';
	CustomFormFuncs[25].func:=@VCLua_Form_Show;
	CustomFormFuncs[26].name:='ShowModal';
	CustomFormFuncs[26].func:=@VCLua_Form_ShowModal;
	CustomFormFuncs[27].name:='ShowOnTop';
	CustomFormFuncs[27].func:=@VCLua_Form_ShowOnTop;
	CustomFormFuncs[28].name:='SmallIconHandle';
	CustomFormFuncs[28].func:=@VCLua_Form_SmallIconHandle;
	CustomFormFuncs[29].name:='ActiveMDIChild';
	CustomFormFuncs[29].func:=@VCLua_Form_ActiveMDIChild;
	CustomFormFuncs[30].name:='GetMDIChildren';
	CustomFormFuncs[30].func:=@VCLua_Form_GetMDIChildren;
	CustomFormFuncs[31].name:='MDIChildCount';
	CustomFormFuncs[31].func:=@VCLua_Form_MDIChildCount;
	CustomFormFuncs[32].name:='Dock';
	CustomFormFuncs[32].func:=@VCLua_Form_Dock;
	CustomFormFuncs[33].name:='UpdateDockCaption';
	CustomFormFuncs[33].func:=@VCLua_Form_UpdateDockCaption;
	CustomFormFuncs[34].name:=nil;
	CustomFormFuncs[34].func:=nil;

end.
