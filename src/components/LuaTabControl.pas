(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTabControl;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateTabSheet(L: Plua_State): Integer; cdecl;
function IsTabSheet(L: Plua_State): Integer; cdecl;
function AsTabSheet(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabSheet; pti: PTypeInfo = nil); overload; inline;
procedure TabSheetToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTabSheet = class(TTabSheet)
        LuaCtl: TVCLuaControl;
    end;
var
    TabSheetFuncs: aoluaL_Reg;

function CreateTabControl(L: Plua_State): Integer; cdecl;
function IsTabControl(L: Plua_State): Integer; cdecl;
function AsTabControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabControl; pti: PTypeInfo = nil); overload; inline;
procedure TabControlToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTabControl = class(TTabControl)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomTabControlFuncs: aoluaL_Reg;

function CreatePageControl(L: Plua_State): Integer; cdecl;
function IsPageControl(L: Plua_State): Integer; cdecl;
function AsPageControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPageControl; pti: PTypeInfo = nil); overload; inline;
procedure PageControlToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPageControl = class(TPageControl)
        LuaCtl: TVCLuaControl;
    end;
var
    PageControlFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function VCLua_TabControl_TabRect(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	AIndex:Integer;
	ret:TRect;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	ret := lTabControl.TabRect(AIndex);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_GetImageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ThePageIndex:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	ThePageIndex := lua_tointeger(L,2);
	ret := lTabControl.GetImageIndex(ThePageIndex);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_IndexOf(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	APage:TPersistent;
	ret:integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	APage := TPersistent(GetLuaObject(L,2));
	ret := lTabControl.IndexOf(APage);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_CustomPage(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	Index:integer;
	ret:TCustomPage;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	ret := lTabControl.CustomPage(Index);
	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function VCLua_TabControl_CanChangePageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	ret := lTabControl.CanChangePageIndex();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_GetMinimumTabWidth(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	ret := lTabControl.GetMinimumTabWidth();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_GetMinimumTabHeight(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	ret := lTabControl.GetMinimumTabHeight();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_TabToPageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	AIndex:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	ret := lTabControl.TabToPageIndex(AIndex);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_PageToTabIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	AIndex:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	ret := lTabControl.PageToTabIndex(AIndex);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TabControl_DoCloseTabClicked(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	APage:TCustomPage;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	APage := TCustomPage(GetLuaObject(L,2));
	lTabControl.DoCloseTabClicked(APage);
	
	Result := 0;
end;

function VCLua_PageControl_Clear(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
begin
	CheckArg(L, 1);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	lPageControl.Clear();
	
	Result := 0;
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
	CurPage := TTabSheet(GetLuaObject(L,2));
	GoForward := lua_toboolean(L,3);
	CheckTabVisible := lua_toboolean(L,4);
	ret := lPageControl.FindNextPage(CurPage,GoForward,CheckTabVisible);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_PageControl_SelectNextPage(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	GoForward:Boolean;
begin
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	GoForward := lua_toboolean(L,2);
	lPageControl.SelectNextPage(GoForward);
	
	Result := 0;
end;

function VCLua_PageControl_SelectNextPage2(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	GoForward:Boolean;
	CheckTabVisible:Boolean;
begin
	CheckArg(L, 3);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	GoForward := lua_toboolean(L,2);
	CheckTabVisible := lua_toboolean(L,3);
	lPageControl.SelectNextPage(GoForward,CheckTabVisible);
	
	Result := 0;
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
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lPageControl.IndexOfTabAt(X,Y);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_PageControl_IndexOfTabAt2(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	P:TPoint;
	ret:Integer;
begin
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	P := lua_toTPoint(L,2);
	ret := lPageControl.IndexOfTabAt(P);
	lua_push(L,ret);
	
	Result := 1;
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
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lPageControl.IndexOfPageAt(X,Y);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_PageControl_IndexOfPageAt2(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	P:TPoint;
	ret:Integer;
begin
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	P := lua_toTPoint(L,2);
	ret := lPageControl.IndexOfPageAt(P);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_PageControl_AddTabSheet(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	ret:TTabSheet;
begin
	CheckArg(L, 1);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	ret := lPageControl.AddTabSheet();
	lua_push(L,ret);
	
	Result := 1;
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
	TabSheetToTable(L,-1,v);
end;
procedure TabSheetToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TTabSheet');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lTabSheet.LuaCtl := TVCLuaControl.Create(lTabSheet as TComponent,L,@TabSheetToTable);
	InitControl(L,lTabSheet,Name);
	TabSheetToTable(L, -1, lTabSheet);
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
	TabControlToTable(L,-1,v);
end;
procedure TabControlToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomTabControl');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lTabControl.LuaCtl := TVCLuaControl.Create(lTabControl as TComponent,L,@TabControlToTable);
	InitControl(L,lTabControl,Name);
	TabControlToTable(L, -1, lTabControl);
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
	PageControlToTable(L,-1,v);
end;
procedure PageControlToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TPageControl');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lPageControl.LuaCtl := TVCLuaControl.Create(lPageControl as TComponent,L,@PageControlToTable);
	InitControl(L,lPageControl,Name);
	PageControlToTable(L, -1, lPageControl);
	Result := 1;
end;

begin
	SetLength(TabSheetFuncs, 0+1);
	
	TabSheetFuncs[0].name:=nil;
	TabSheetFuncs[0].func:=nil;

	SetLength(CustomTabControlFuncs, 10+1);
	CustomTabControlFuncs[0].name:='TabRect';
	CustomTabControlFuncs[0].func:=@VCLua_TabControl_TabRect;
	CustomTabControlFuncs[1].name:='GetImageIndex';
	CustomTabControlFuncs[1].func:=@VCLua_TabControl_GetImageIndex;
	CustomTabControlFuncs[2].name:='IndexOf';
	CustomTabControlFuncs[2].func:=@VCLua_TabControl_IndexOf;
	CustomTabControlFuncs[3].name:='CustomPage';
	CustomTabControlFuncs[3].func:=@VCLua_TabControl_CustomPage;
	CustomTabControlFuncs[4].name:='CanChangePageIndex';
	CustomTabControlFuncs[4].func:=@VCLua_TabControl_CanChangePageIndex;
	CustomTabControlFuncs[5].name:='GetMinimumTabWidth';
	CustomTabControlFuncs[5].func:=@VCLua_TabControl_GetMinimumTabWidth;
	CustomTabControlFuncs[6].name:='GetMinimumTabHeight';
	CustomTabControlFuncs[6].func:=@VCLua_TabControl_GetMinimumTabHeight;
	CustomTabControlFuncs[7].name:='TabToPageIndex';
	CustomTabControlFuncs[7].func:=@VCLua_TabControl_TabToPageIndex;
	CustomTabControlFuncs[8].name:='PageToTabIndex';
	CustomTabControlFuncs[8].func:=@VCLua_TabControl_PageToTabIndex;
	CustomTabControlFuncs[9].name:='DoCloseTabClicked';
	CustomTabControlFuncs[9].func:=@VCLua_TabControl_DoCloseTabClicked;
	CustomTabControlFuncs[10].name:=nil;
	CustomTabControlFuncs[10].func:=nil;

	SetLength(PageControlFuncs, 9+1);
	PageControlFuncs[0].name:='Clear';
	PageControlFuncs[0].func:=@VCLua_PageControl_Clear;
	PageControlFuncs[1].name:='FindNextPage';
	PageControlFuncs[1].func:=@VCLua_PageControl_FindNextPage;
	PageControlFuncs[2].name:='SelectNextPage';
	PageControlFuncs[2].func:=@VCLua_PageControl_SelectNextPage;
	PageControlFuncs[3].name:='SelectNextPage2';
	PageControlFuncs[3].func:=@VCLua_PageControl_SelectNextPage2;
	PageControlFuncs[4].name:='IndexOfTabAt';
	PageControlFuncs[4].func:=@VCLua_PageControl_IndexOfTabAt;
	PageControlFuncs[5].name:='IndexOfTabAt2';
	PageControlFuncs[5].func:=@VCLua_PageControl_IndexOfTabAt2;
	PageControlFuncs[6].name:='IndexOfPageAt';
	PageControlFuncs[6].func:=@VCLua_PageControl_IndexOfPageAt;
	PageControlFuncs[7].name:='IndexOfPageAt2';
	PageControlFuncs[7].func:=@VCLua_PageControl_IndexOfPageAt2;
	PageControlFuncs[8].name:='AddTabSheet';
	PageControlFuncs[8].func:=@VCLua_PageControl_AddTabSheet;
	PageControlFuncs[9].name:=nil;
	PageControlFuncs[9].func:=nil;

end.
