(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTabControl;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

function CreateTabSheet(L: Plua_State): Integer; cdecl;
function IsTabSheet(L: Plua_State): Integer; cdecl;
function AsTabSheet(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabSheet; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTabSheet = class(TTabSheet)
        LuaCtl: TVCLuaControl;
    end;
var
    TabSheetFuncs: TLuaVmt;

function CreateTabControl(L: Plua_State): Integer; cdecl;
function IsTabControl(L: Plua_State): Integer; cdecl;
function AsTabControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTabControl = class(TTabControl)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomTabControlFuncs: TLuaVmt;

function CreatePageControl(L: Plua_State): Integer; cdecl;
function IsPageControl(L: Plua_State): Integer; cdecl;
function AsPageControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPageControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPageControl = class(TPageControl)
        LuaCtl: TVCLuaControl;
    end;
var
    PageControlFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function VCLua_TabControl_TabRect(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	AIndex:Integer;
	ret:TRect;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lTabControl.TabRect(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_GetImageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ThePageIndex:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@ThePageIndex);
	try
		ret := lTabControl.GetImageIndex(ThePageIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'GetImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_IndexOf(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	APage:TPersistent;
	ret:integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@APage);
	try
		ret := lTabControl.IndexOf(APage);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_CustomPage(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	Index:integer;
	ret:TCustomPage;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTabControl.CustomPage(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'CustomPage', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TabControl_CanChangePageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.CanChangePageIndex();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'CanChangePageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_GetMinimumTabWidth(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.GetMinimumTabWidth();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'GetMinimumTabWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_GetMinimumTabHeight(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.GetMinimumTabHeight();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'GetMinimumTabHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_TabToPageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	AIndex:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lTabControl.TabToPageIndex(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabToPageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_PageToTabIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	AIndex:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lTabControl.PageToTabIndex(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'PageToTabIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_DoCloseTabClicked(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	APage:TCustomPage;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@APage);
	try
		lTabControl.DoCloseTabClicked(APage);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'DoCloseTabClicked', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_Page(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	Index:Integer;
	ret:TCustomPage;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTabControl.Page[Index];
		lua_push(L,ret,TypeInfo(ret));
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Page', E.ClassName, E.Message);
	end;
end;

function VCLua_PageControl_Clear(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
begin
	CheckArg(L, 1);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	try
		lPageControl.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_PageControl_FindNextPage(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	CurPage:TTabSheet;
	GoForward:Boolean;
	CheckTabVisible:Boolean;
	ret:TTabSheet;
begin
	CheckArg(L, 4);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@CurPage);
	luaL_check(L,3,@GoForward);
	luaL_check(L,4,@CheckTabVisible);
	try
		ret := lPageControl.FindNextPage(CurPage,GoForward,CheckTabVisible);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'FindNextPage', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PageControl_SelectNextPage(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	GoForward:Boolean;
begin
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@GoForward);
	try
		lPageControl.SelectNextPage(GoForward);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'SelectNextPage', E.ClassName, E.Message);
	end;
end;

function VCLua_PageControl_SelectNextPage2(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	GoForward:Boolean;
	CheckTabVisible:Boolean;
begin
	CheckArg(L, 3);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@GoForward);
	luaL_check(L,3,@CheckTabVisible);
	try
		lPageControl.SelectNextPage(GoForward,CheckTabVisible);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'SelectNextPage', E.ClassName, E.Message);
	end;
end;

function VCLua_PageControl_IndexOfTabAt(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	X:Integer;
	Y:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lPageControl.IndexOfTabAt(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'IndexOfTabAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PageControl_IndexOfTabAt2(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	P:TPoint;
	ret:Integer;
begin
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@P);
	try
		ret := lPageControl.IndexOfTabAt(P);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'IndexOfTabAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PageControl_IndexOfPageAt(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	X:Integer;
	Y:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lPageControl.IndexOfPageAt(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'IndexOfPageAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PageControl_IndexOfPageAt2(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	P:TPoint;
	ret:Integer;
begin
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@P);
	try
		ret := lPageControl.IndexOfPageAt(P);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'IndexOfPageAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PageControl_AddTabSheet(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	ret:TTabSheet;
begin
	CheckArg(L, 1);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	try
		ret := lPageControl.AddTabSheet();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'AddTabSheet', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PageControl_Pages(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	Index:Integer;
	ret:TTabSheet;
begin
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPageControl.Pages[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'Pages', E.ClassName, E.Message);
	end;
end;

function IsTabSheet(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTabSheet);
end;
function AsTabSheet(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTabSheet then
    lua_push(L, TTabSheet(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTabSheet; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTabSheet',v);
end;
function CreateTabSheet(L: Plua_State): Integer; cdecl;
var
	lTabSheet:TLuaTabSheet;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTabSheet := TLuaTabSheet.Create(Parent);
	lTabSheet.Parent := TWinControl(Parent);
	lTabSheet.LuaCtl := TVCLuaControl.Create(lTabSheet as TComponent,L,nil,'TTabSheet');
	InitControl(L,lTabSheet,Name);
	CreateTableForKnownType(L,'TTabSheet',lTabSheet);
	Result := 1;
end;

function IsTabControl(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTabControl);
end;
function AsTabControl(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTabControl then
    lua_push(L, TTabControl(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTabControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomTabControl',v);
end;
function CreateTabControl(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTabControl := TLuaTabControl.Create(Parent);
	lTabControl.Parent := TWinControl(Parent);
	lTabControl.LuaCtl := TVCLuaControl.Create(lTabControl as TComponent,L,nil,'TCustomTabControl');
	InitControl(L,lTabControl,Name);
	CreateTableForKnownType(L,'TCustomTabControl',lTabControl);
	Result := 1;
end;

function IsPageControl(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TPageControl);
end;
function AsPageControl(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TPageControl then
    lua_push(L, TPageControl(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TPageControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPageControl',v);
end;
function CreatePageControl(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPageControl := TLuaPageControl.Create(Parent);
	lPageControl.Parent := TWinControl(Parent);
	lPageControl.LuaCtl := TVCLuaControl.Create(lPageControl as TComponent,L,nil,'TPageControl');
	InitControl(L,lPageControl,Name);
	CreateTableForKnownType(L,'TPageControl',lPageControl);
	Result := 1;
end;

begin
	TabSheetFuncs := TLuaVmt.Create;
	
	CustomTabControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabRect', @VCLua_TabControl_TabRect);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'GetImageIndex', @VCLua_TabControl_GetImageIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'IndexOf', @VCLua_TabControl_IndexOf);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'CustomPage', @VCLua_TabControl_CustomPage);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'CanChangePageIndex', @VCLua_TabControl_CanChangePageIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'GetMinimumTabWidth', @VCLua_TabControl_GetMinimumTabWidth);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'GetMinimumTabHeight', @VCLua_TabControl_GetMinimumTabHeight);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabToPageIndex', @VCLua_TabControl_TabToPageIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'PageToTabIndex', @VCLua_TabControl_PageToTabIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'DoCloseTabClicked', @VCLua_TabControl_DoCloseTabClicked);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Page', @VCLua_TabControl_Page);
	PageControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PageControlFuncs, 'Clear', @VCLua_PageControl_Clear);
	TLuaMethodInfo.Create(PageControlFuncs, 'FindNextPage', @VCLua_PageControl_FindNextPage);
	TLuaMethodInfo.Create(PageControlFuncs, 'SelectNextPage', @VCLua_PageControl_SelectNextPage);
	TLuaMethodInfo.Create(PageControlFuncs, 'SelectNextPage2', @VCLua_PageControl_SelectNextPage2);
	TLuaMethodInfo.Create(PageControlFuncs, 'IndexOfTabAt', @VCLua_PageControl_IndexOfTabAt);
	TLuaMethodInfo.Create(PageControlFuncs, 'IndexOfTabAt2', @VCLua_PageControl_IndexOfTabAt2);
	TLuaMethodInfo.Create(PageControlFuncs, 'IndexOfPageAt', @VCLua_PageControl_IndexOfPageAt);
	TLuaMethodInfo.Create(PageControlFuncs, 'IndexOfPageAt2', @VCLua_PageControl_IndexOfPageAt2);
	TLuaMethodInfo.Create(PageControlFuncs, 'AddTabSheet', @VCLua_PageControl_AddTabSheet);
	TLuaMethodInfo.Create(PageControlFuncs, 'Pages', @VCLua_PageControl_Pages);
end.
