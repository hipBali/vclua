(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTabControl;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

procedure lua_push(L: Plua_State; const v: TCustomPage; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomPage = class(TCustomPage)
    end;
var
    CustomPageFuncs: TLuaVmt;
    CustomPageSets: TLuaVmt;

function CreateTabSheet(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabSheet; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTabSheet = class(TTabSheet)
    end;
var
    TabSheetFuncs: TLuaVmt;
    TabSheetSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TCustomTabControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomTabControl = class(TCustomTabControl)
    end;
var
    CustomTabControlFuncs: TLuaVmt;
    CustomTabControlSets: TLuaVmt;

function CreateTabControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTabControl = class(TTabControl)
    end;
var
    TabControlFuncs: TLuaVmt;
    TabControlSets: TLuaVmt;

function CreatePageControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPageControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPageControl = class(TPageControl)
    end;
var
    PageControlFuncs: TLuaVmt;
    PageControlSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, ImgList, LuaClassesEvents, LuaComCtrlsEvents, LuaEvent, LuaImageList, LuaStrings;

function VCLua_CustomPage_CanTab(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomPage := TLuaCustomPage(GetLuaObject(L, 1));
	try
		ret := lCustomPage.CanTab();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'CanTab', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPage_VisibleIndex(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	ret:integer;
begin
	CheckArg(L, 1);
	lCustomPage := TLuaCustomPage(GetLuaObject(L, 1));
	try
		ret := lCustomPage.VisibleIndex();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'VisibleIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPage_VCLuaSetPageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	val:Integer;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomPage.PageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'SetPageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomPage_VCLuaGetPageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	ret:Integer;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomPage.PageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'GetPageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPage_VCLuaSetTabVisible(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	val:Boolean;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomPage.TabVisible := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'SetTabVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomPage_VCLuaGetTabVisible(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	ret:Boolean;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomPage.TabVisible;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'GetTabVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPage_VCLuaSetImageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	val:TImageIndex;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomPage.ImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'SetImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomPage_VCLuaGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
	ret:TImageIndex;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomPage.ImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPage', 'GetImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPage_VCLuaSetOnHide(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomPage.OnHide));
	lCustomPage.OnHide := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomPage_VCLuaSetOnShow(L: Plua_State): Integer; cdecl;
var
	lCustomPage:TLuaCustomPage;
begin
	lCustomPage := TLuaCustomPage(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomPage.OnShow));
	lCustomPage.OnShow := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_TabSheet_VCLuaSetPageControl(L: Plua_State): Integer; cdecl;
var
	lTabSheet:TLuaTabSheet;
	val:TPageControl;
begin
	lTabSheet := TLuaTabSheet(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTabSheet.PageControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabSheet', 'SetPageControl', E.ClassName, E.Message);
	end;
end;

function VCLua_TabSheet_VCLuaGetPageControl(L: Plua_State): Integer; cdecl;
var
	lTabSheet:TLuaTabSheet;
	ret:TPageControl;
begin
	lTabSheet := TLuaTabSheet(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTabSheet.PageControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabSheet', 'GetPageControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabSheet_VCLuaGetTabIndex(L: Plua_State): Integer; cdecl;
var
	lTabSheet:TLuaTabSheet;
	ret:Integer;
begin
	lTabSheet := TLuaTabSheet(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTabSheet.TabIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabSheet', 'GetTabIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomTabControl.OnChange));
	lCustomTabControl.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomTabControl_TabRect(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	AIndex:Integer;
	ret:TRect;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lCustomTabControl.TabRect(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'TabRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_GetImageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ThePageIndex:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@ThePageIndex);
	try
		ret := lCustomTabControl.GetImageIndex(ThePageIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_IndexOf(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	APage:TPersistent;
	ret:integer;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@APage);
	try
		ret := lCustomTabControl.IndexOf(APage);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_CustomPage(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	Index:integer;
	ret:TCustomPage;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lCustomTabControl.CustomPage(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'CustomPage', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_CanChangePageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	try
		ret := lCustomTabControl.CanChangePageIndex();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'CanChangePageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_GetMinimumTabWidth(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	try
		ret := lCustomTabControl.GetMinimumTabWidth();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetMinimumTabWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_GetMinimumTabHeight(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	try
		ret := lCustomTabControl.GetMinimumTabHeight();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetMinimumTabHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_GetCapabilities(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:TCTabControlCapabilities;
begin
	CheckArg(L, 1);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	try
		ret := lCustomTabControl.GetCapabilities();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetCapabilities', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomTabControl_TabToPageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	AIndex:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lCustomTabControl.TabToPageIndex(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'TabToPageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_PageToTabIndex(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	AIndex:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lCustomTabControl.PageToTabIndex(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'PageToTabIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_DoCloseTabClicked(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	APage:TCustomPage;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@APage);
	try
		lCustomTabControl.DoCloseTabClicked(APage);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'DoCloseTabClicked', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaSetHotTrack(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.HotTrack := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetHotTrack', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetHotTrack(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.HotTrack;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetHotTrack', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:TCustomImageList;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetImages', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:TCustomImageList;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomTabControl_VCLuaSetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Integer;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.ImagesWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetImagesWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Integer;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.ImagesWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetImagesWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetMultiLine(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.MultiLine := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetMultiLine', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetMultiLine(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.MultiLine;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetMultiLine', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.MultiSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetMultiSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.MultiSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetMultiSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetOnChanging(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomTabControl.OnChanging));
	lCustomTabControl.OnChanging := TLuaEvent.Factory<TTabChangingEvent,TLuaTabChangingEvent>(L);
	Result := 0;
end;

function VCLua_CustomTabControl_VCLuaSetOnCloseTabClicked(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomTabControl.OnCloseTabClicked));
	lCustomTabControl.OnCloseTabClicked := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomTabControl_VCLuaSetOnGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomTabControl.OnGetImageIndex));
	lCustomTabControl.OnGetImageIndex := TLuaEvent.Factory<TTabGetImageEvent,TLuaTabGetImageEvent>(L);
	Result := 0;
end;

function VCLua_CustomTabControl_VCLuaSetOptions(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:TCTabControlOptions;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TCTabControlOptions));
	try
		lCustomTabControl.Options := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetOptions', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetOptions(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:TCTabControlOptions;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.Options;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomTabControl_VCLuaSetOwnerDraw(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.OwnerDraw := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetOwnerDraw', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetOwnerDraw(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.OwnerDraw;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetOwnerDraw', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_Page(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	Index:Integer;
	ret:TCustomPage;
begin
	CheckArg(L, 2);
	lCustomTabControl := TLuaCustomTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lCustomTabControl.Page[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'Page', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetPageCount(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:integer;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.PageCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetPageCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetPageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Integer;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.PageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetPageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetPageIndex(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Integer;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.PageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetPageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetPages(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList,TypeInfo(val));
	try
		lCustomTabControl.Pages := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetPages', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_CustomTabControl_VCLuaGetPages(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:TStrings;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.Pages;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetPages', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetRaggedRight(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.RaggedRight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetRaggedRight', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetRaggedRight(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.RaggedRight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetRaggedRight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetScrollOpposite(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.ScrollOpposite := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetScrollOpposite', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetScrollOpposite(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.ScrollOpposite;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetScrollOpposite', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetShowTabs(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.ShowTabs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetShowTabs', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetShowTabs(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Boolean;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.ShowTabs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetShowTabs', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetStyle(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:TTabStyle;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTabStyle));
	try
		lCustomTabControl.Style := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetStyle(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:TTabStyle;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.Style;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomTabControl_VCLuaSetTabHeight(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Smallint;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.TabHeight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetTabHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetTabHeight(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Smallint;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.TabHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetTabHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomTabControl_VCLuaSetTabPosition(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:TTabPosition;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTabPosition));
	try
		lCustomTabControl.TabPosition := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetTabPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetTabPosition(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:TTabPosition;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.TabPosition;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetTabPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomTabControl_VCLuaSetTabWidth(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	val:Smallint;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomTabControl.TabWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'SetTabWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomTabControl_VCLuaGetTabWidth(L: Plua_State): Integer; cdecl;
var
	lCustomTabControl:TLuaCustomTabControl;
	ret:Smallint;
begin
	lCustomTabControl := TLuaCustomTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomTabControl.TabWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomTabControl', 'GetTabWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_IndexOfTabAt(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	X:Integer;
	Y:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lTabControl.IndexOfTabAt(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'IndexOfTabAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_IndexOfTabAt2(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	P:TPoint;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@P);
	try
		ret := lTabControl.IndexOfTabAt(P);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'IndexOfTabAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_GetHitTestInfoAt(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	X:Integer;
	Y:Integer;
	ret:THitTests;
begin
	CheckArg(L, 3);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lTabControl.GetHitTestInfoAt(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'GetHitTestInfoAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TabControl_IndexOfTabWithCaption(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	TabCaption:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@TabCaption);
	try
		ret := lTabControl.IndexOfTabWithCaption(TabCaption);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'IndexOfTabWithCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_TabRect(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	Index:Integer;
	ret:TRect;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTabControl.TabRect(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_RowCount(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.RowCount();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'RowCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_ScrollTabs(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	Delta:Integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Delta);
	try
		lTabControl.ScrollTabs(Delta);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'ScrollTabs', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		lTabControl.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		lTabControl.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_IsUpdating(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.IsUpdating();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'IsUpdating', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaGetDisplayRect(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:TRect;
begin
	lTabControl := TLuaTabControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTabControl.DisplayRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'GetDisplayRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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

function VCLua_PageControl_VCLuaSetActivePageIndex(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	val:Integer;
begin
	lPageControl := TLuaPageControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPageControl.ActivePageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'SetActivePageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_PageControl_VCLuaGetActivePageIndex(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	ret:Integer;
begin
	lPageControl := TLuaPageControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPageControl.ActivePageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'GetActivePageIndex', E.ClassName, E.Message);
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

procedure lua_push(L: Plua_State; const v: TCustomPage; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomPage',v);
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lTabSheet := TLuaTabSheet.Create(Parent);
	lTabSheet.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TTabSheet',lTabSheet);
	InitControl(L,lTabSheet,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TabSheet', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TCustomTabControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomTabControl',v);
end;

procedure lua_push(L: Plua_State; const v: TTabControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTabControl',v);
end;
function CreateTabControl(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lTabControl := TLuaTabControl.Create(Parent);
	lTabControl.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TTabControl',lTabControl);
	InitControl(L,lTabControl,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TabControl', E.ClassName, E.Message);
	end;
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lPageControl := TLuaPageControl.Create(Parent);
	lPageControl.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TPageControl',lPageControl);
	InitControl(L,lPageControl,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'PageControl', E.ClassName, E.Message);
	end;
end;

begin
	CustomPageFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomPageFuncs, 'CanTab', @VCLua_CustomPage_CanTab);
	TLuaMethodInfo.Create(CustomPageFuncs, 'VisibleIndex', @VCLua_CustomPage_VisibleIndex);
	TLuaMethodInfo.Create(CustomPageFuncs, 'PageIndex', @VCLua_CustomPage_VCLuaGetPageIndex, mfCall);
	TLuaMethodInfo.Create(CustomPageFuncs, 'TabVisible', @VCLua_CustomPage_VCLuaGetTabVisible, mfCall);
	TLuaMethodInfo.Create(CustomPageFuncs, 'ImageIndex', @VCLua_CustomPage_VCLuaGetImageIndex, mfCall);
	CustomPageSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomPageSets, 'PageIndex', @VCLua_CustomPage_VCLuaSetPageIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomPageSets, 'TabVisible', @VCLua_CustomPage_VCLuaSetTabVisible, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomPageSets, 'ImageIndex', @VCLua_CustomPage_VCLuaSetImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomPageSets, 'OnHide', @VCLua_CustomPage_VCLuaSetOnHide, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomPageSets, 'OnShow', @VCLua_CustomPage_VCLuaSetOnShow, mfCall, TypeInfo(TNotifyEvent));
	TabSheetFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TabSheetFuncs, 'PageControl', @VCLua_TabSheet_VCLuaGetPageControl, mfCall);
	TLuaMethodInfo.Create(TabSheetFuncs, 'TabIndex', @VCLua_TabSheet_VCLuaGetTabIndex, mfCall);
	TabSheetSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TabSheetSets, 'PageControl', @VCLua_TabSheet_VCLuaSetPageControl, mfCall, TypeInfo(TPageControl));
	CustomTabControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabRect', @VCLua_CustomTabControl_TabRect);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'GetImageIndex', @VCLua_CustomTabControl_GetImageIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'IndexOf', @VCLua_CustomTabControl_IndexOf);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'CustomPage', @VCLua_CustomTabControl_CustomPage);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'CanChangePageIndex', @VCLua_CustomTabControl_CanChangePageIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'GetMinimumTabWidth', @VCLua_CustomTabControl_GetMinimumTabWidth);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'GetMinimumTabHeight', @VCLua_CustomTabControl_GetMinimumTabHeight);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'GetCapabilities', @VCLua_CustomTabControl_GetCapabilities);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabToPageIndex', @VCLua_CustomTabControl_TabToPageIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'PageToTabIndex', @VCLua_CustomTabControl_PageToTabIndex);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'DoCloseTabClicked', @VCLua_CustomTabControl_DoCloseTabClicked);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'HotTrack', @VCLua_CustomTabControl_VCLuaGetHotTrack, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Images', @VCLua_CustomTabControl_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'ImagesWidth', @VCLua_CustomTabControl_VCLuaGetImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'MultiLine', @VCLua_CustomTabControl_VCLuaGetMultiLine, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'MultiSelect', @VCLua_CustomTabControl_VCLuaGetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Options', @VCLua_CustomTabControl_VCLuaGetOptions, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'OwnerDraw', @VCLua_CustomTabControl_VCLuaGetOwnerDraw, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Page', @VCLua_CustomTabControl_Page);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'PageCount', @VCLua_CustomTabControl_VCLuaGetPageCount, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'PageIndex', @VCLua_CustomTabControl_VCLuaGetPageIndex, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Pages', @VCLua_CustomTabControl_VCLuaGetPages, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'RaggedRight', @VCLua_CustomTabControl_VCLuaGetRaggedRight, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'ScrollOpposite', @VCLua_CustomTabControl_VCLuaGetScrollOpposite, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'ShowTabs', @VCLua_CustomTabControl_VCLuaGetShowTabs, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Style', @VCLua_CustomTabControl_VCLuaGetStyle, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabHeight', @VCLua_CustomTabControl_VCLuaGetTabHeight, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabPosition', @VCLua_CustomTabControl_VCLuaGetTabPosition, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabWidth', @VCLua_CustomTabControl_VCLuaGetTabWidth, mfCall);
	CustomTabControlSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnChange', @VCLua_CustomTabControl_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'HotTrack', @VCLua_CustomTabControl_VCLuaSetHotTrack, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Images', @VCLua_CustomTabControl_VCLuaSetImages, mfCall, TypeInfo(TCustomImageList));
	TLuaMethodInfo.Create(CustomTabControlSets, 'ImagesWidth', @VCLua_CustomTabControl_VCLuaSetImagesWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomTabControlSets, 'MultiLine', @VCLua_CustomTabControl_VCLuaSetMultiLine, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'MultiSelect', @VCLua_CustomTabControl_VCLuaSetMultiSelect, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnChanging', @VCLua_CustomTabControl_VCLuaSetOnChanging, mfCall, TypeInfo(TTabChangingEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnCloseTabClicked', @VCLua_CustomTabControl_VCLuaSetOnCloseTabClicked, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnGetImageIndex', @VCLua_CustomTabControl_VCLuaSetOnGetImageIndex, mfCall, TypeInfo(TTabGetImageEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Options', @VCLua_CustomTabControl_VCLuaSetOptions, mfCall, TypeInfo(TCTabControlOptions));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OwnerDraw', @VCLua_CustomTabControl_VCLuaSetOwnerDraw, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'PageIndex', @VCLua_CustomTabControl_VCLuaSetPageIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Pages', @VCLua_CustomTabControl_VCLuaSetPages, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(CustomTabControlSets, 'RaggedRight', @VCLua_CustomTabControl_VCLuaSetRaggedRight, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'ScrollOpposite', @VCLua_CustomTabControl_VCLuaSetScrollOpposite, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'ShowTabs', @VCLua_CustomTabControl_VCLuaSetShowTabs, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Style', @VCLua_CustomTabControl_VCLuaSetStyle, mfCall, TypeInfo(TTabStyle));
	TLuaMethodInfo.Create(CustomTabControlSets, 'TabHeight', @VCLua_CustomTabControl_VCLuaSetTabHeight, mfCall, TypeInfo(Smallint));
	TLuaMethodInfo.Create(CustomTabControlSets, 'TabPosition', @VCLua_CustomTabControl_VCLuaSetTabPosition, mfCall, TypeInfo(TTabPosition));
	TLuaMethodInfo.Create(CustomTabControlSets, 'TabWidth', @VCLua_CustomTabControl_VCLuaSetTabWidth, mfCall, TypeInfo(Smallint));
	TabControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TabControlFuncs, 'IndexOfTabAt', @VCLua_TabControl_IndexOfTabAt);
	TLuaMethodInfo.Create(TabControlFuncs, 'IndexOfTabAt2', @VCLua_TabControl_IndexOfTabAt2);
	TLuaMethodInfo.Create(TabControlFuncs, 'GetHitTestInfoAt', @VCLua_TabControl_GetHitTestInfoAt);
	TLuaMethodInfo.Create(TabControlFuncs, 'IndexOfTabWithCaption', @VCLua_TabControl_IndexOfTabWithCaption);
	TLuaMethodInfo.Create(TabControlFuncs, 'TabRect', @VCLua_TabControl_TabRect);
	TLuaMethodInfo.Create(TabControlFuncs, 'RowCount', @VCLua_TabControl_RowCount);
	TLuaMethodInfo.Create(TabControlFuncs, 'ScrollTabs', @VCLua_TabControl_ScrollTabs);
	TLuaMethodInfo.Create(TabControlFuncs, 'BeginUpdate', @VCLua_TabControl_BeginUpdate);
	TLuaMethodInfo.Create(TabControlFuncs, 'EndUpdate', @VCLua_TabControl_EndUpdate);
	TLuaMethodInfo.Create(TabControlFuncs, 'IsUpdating', @VCLua_TabControl_IsUpdating);
	TLuaMethodInfo.Create(TabControlFuncs, 'DisplayRect', @VCLua_TabControl_VCLuaGetDisplayRect, mfCall);
	TabControlSets := TLuaVmt.Create;
	
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
	TLuaMethodInfo.Create(PageControlFuncs, 'ActivePageIndex', @VCLua_PageControl_VCLuaGetActivePageIndex, mfCall);
	TLuaMethodInfo.Create(PageControlFuncs, 'Pages', @VCLua_PageControl_Pages);
	PageControlSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(PageControlSets, 'ActivePageIndex', @VCLua_PageControl_VCLuaSetActivePageIndex, mfCall, TypeInfo(Integer));
end.
