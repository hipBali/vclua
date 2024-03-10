(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTabControl;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

function CreateTabSheet(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabSheet; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTabSheet = class(TTabSheet)
        LuaCtl: TVCLuaControl;
    end;
var
    TabSheetFuncs: TLuaVmt;
    TabSheetSets: TLuaVmt;

function CreateTabControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTabControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTabControl = class(TTabControl)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomTabControlFuncs: TLuaVmt;
    CustomTabControlSets: TLuaVmt;

function CreatePageControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPageControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPageControl = class(TPageControl)
        LuaCtl: TVCLuaControl;
    end;
var
    PageControlFuncs: TLuaVmt;
    PageControlSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, ImgList, LuaClassesEvents, LuaComCtrlsEvents, LuaEvent, LuaImageList, LuaStrings;

function VCLua_TabSheet_VCLuaSetPageControl(L: Plua_State): Integer; cdecl;
var
	lTabSheet:TLuaTabSheet;
	val:TPageControl;
begin
	CheckArg(L, 2);
	lTabSheet := TLuaTabSheet(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabSheet.PageControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabSheet', 'PageControl', E.ClassName, E.Message);
	end;
end;

function VCLua_TabSheet_VCLuaGetPageControl(L: Plua_State): Integer; cdecl;
var
	lTabSheet:TLuaTabSheet;
	ret:TPageControl;
begin
	CheckArg(L, 1);
	lTabSheet := TLuaTabSheet(GetLuaObject(L, 1));
	try
		ret := lTabSheet.PageControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabSheet', 'PageControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabSheet_VCLuaGetTabIndex(L: Plua_State): Integer; cdecl;
var
	lTabSheet:TLuaTabSheet;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTabSheet := TLuaTabSheet(GetLuaObject(L, 1));
	try
		ret := lTabSheet.TabIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabSheet', 'TabIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTabControl.OnChange));
	lTabControl.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

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

function VCLua_TabControl_VCLuaSetHotTrack(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.HotTrack := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'HotTrack', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetHotTrack(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.HotTrack;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'HotTrack', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:TCustomImageList;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Images', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Images', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TabControl_VCLuaSetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.ImagesWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'ImagesWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.ImagesWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'ImagesWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetMultiLine(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.MultiLine := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'MultiLine', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetMultiLine(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.MultiLine;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'MultiLine', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.MultiSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'MultiSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.MultiSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'MultiSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetOnChanging(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTabControl.OnChanging));
	lTabControl.OnChanging := TLuaEvent.Factory<TTabChangingEvent,TLuaTabChangingEvent>(L);
	Result := 0;
end;

function VCLua_TabControl_VCLuaSetOnCloseTabClicked(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTabControl.OnCloseTabClicked));
	lTabControl.OnCloseTabClicked := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_TabControl_VCLuaSetOnGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTabControl.OnGetImageIndex));
	lTabControl.OnGetImageIndex := TLuaEvent.Factory<TTabGetImageEvent,TLuaTabGetImageEvent>(L);
	Result := 0;
end;

function VCLua_TabControl_VCLuaSetOptions(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:TCTabControlOptions;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TCTabControlOptions));
	try
		lTabControl.Options := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Options', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetOptions(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:TCTabControlOptions;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.Options;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Options', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TabControl_VCLuaSetOwnerDraw(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.OwnerDraw := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'OwnerDraw', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetOwnerDraw(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.OwnerDraw;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'OwnerDraw', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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

function VCLua_TabControl_VCLuaGetPageCount(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.PageCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'PageCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetPageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Integer;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.PageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'PageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetPageIndex(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Integer;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.PageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'PageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetPages(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:TStrings;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.Pages := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Pages', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetPages(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:TStrings;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.Pages;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Pages', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetRaggedRight(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.RaggedRight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'RaggedRight', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetRaggedRight(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.RaggedRight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'RaggedRight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetScrollOpposite(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.ScrollOpposite := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'ScrollOpposite', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetScrollOpposite(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.ScrollOpposite;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'ScrollOpposite', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetShowTabs(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Boolean;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.ShowTabs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'ShowTabs', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetShowTabs(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.ShowTabs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'ShowTabs', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetStyle(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:TTabStyle;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTabStyle));
	try
		lTabControl.Style := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Style', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetStyle(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:TTabStyle;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.Style;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'Style', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TabControl_VCLuaSetTabHeight(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Smallint;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.TabHeight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetTabHeight(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Smallint;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.TabHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TabControl_VCLuaSetTabPosition(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:TTabPosition;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTabPosition));
	try
		lTabControl.TabPosition := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetTabPosition(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:TTabPosition;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.TabPosition;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TabControl_VCLuaSetTabWidth(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	val:Smallint;
begin
	CheckArg(L, 2);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTabControl.TabWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_TabControl_VCLuaGetTabWidth(L: Plua_State): Integer; cdecl;
var
	lTabControl:TLuaTabControl;
	ret:Smallint;
begin
	CheckArg(L, 1);
	lTabControl := TLuaTabControl(GetLuaObject(L, 1));
	try
		ret := lTabControl.TabWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TabControl', 'TabWidth', E.ClassName, E.Message);
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
	CheckArg(L, 2);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lPageControl.ActivePageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'ActivePageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_PageControl_VCLuaGetActivePageIndex(L: Plua_State): Integer; cdecl;
var
	lPageControl:TLuaPageControl;
	ret:Integer;
begin
	CheckArg(L, 1);
	lPageControl := TLuaPageControl(GetLuaObject(L, 1));
	try
		ret := lPageControl.ActivePageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PageControl', 'ActivePageIndex', E.ClassName, E.Message);
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
	CreateTableForKnownType(L,'TTabSheet',lTabSheet);
	InitControl(L,lTabSheet,Name);
	Result := 1;
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
	CreateTableForKnownType(L,'TCustomTabControl',lTabControl);
	InitControl(L,lTabControl,Name);
	Result := 1;
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
	CreateTableForKnownType(L,'TPageControl',lPageControl);
	InitControl(L,lPageControl,Name);
	Result := 1;
end;

begin
	TabSheetFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TabSheetFuncs, 'PageControl', @VCLua_TabSheet_VCLuaGetPageControl, mfCall);
	TLuaMethodInfo.Create(TabSheetFuncs, 'TabIndex', @VCLua_TabSheet_VCLuaGetTabIndex, mfCall);
	TabSheetSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TabSheetSets, 'PageControl', @VCLua_TabSheet_VCLuaSetPageControl, mfCall, TypeInfo(TPageControl));
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
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'HotTrack', @VCLua_TabControl_VCLuaGetHotTrack, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Images', @VCLua_TabControl_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'ImagesWidth', @VCLua_TabControl_VCLuaGetImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'MultiLine', @VCLua_TabControl_VCLuaGetMultiLine, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'MultiSelect', @VCLua_TabControl_VCLuaGetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Options', @VCLua_TabControl_VCLuaGetOptions, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'OwnerDraw', @VCLua_TabControl_VCLuaGetOwnerDraw, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Page', @VCLua_TabControl_Page);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'PageCount', @VCLua_TabControl_VCLuaGetPageCount, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'PageIndex', @VCLua_TabControl_VCLuaGetPageIndex, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Pages', @VCLua_TabControl_VCLuaGetPages, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'RaggedRight', @VCLua_TabControl_VCLuaGetRaggedRight, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'ScrollOpposite', @VCLua_TabControl_VCLuaGetScrollOpposite, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'ShowTabs', @VCLua_TabControl_VCLuaGetShowTabs, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'Style', @VCLua_TabControl_VCLuaGetStyle, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabHeight', @VCLua_TabControl_VCLuaGetTabHeight, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabPosition', @VCLua_TabControl_VCLuaGetTabPosition, mfCall);
	TLuaMethodInfo.Create(CustomTabControlFuncs, 'TabWidth', @VCLua_TabControl_VCLuaGetTabWidth, mfCall);
	CustomTabControlSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnChange', @VCLua_TabControl_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'HotTrack', @VCLua_TabControl_VCLuaSetHotTrack, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Images', @VCLua_TabControl_VCLuaSetImages, mfCall, TypeInfo(TCustomImageList));
	TLuaMethodInfo.Create(CustomTabControlSets, 'ImagesWidth', @VCLua_TabControl_VCLuaSetImagesWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomTabControlSets, 'MultiLine', @VCLua_TabControl_VCLuaSetMultiLine, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'MultiSelect', @VCLua_TabControl_VCLuaSetMultiSelect, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnChanging', @VCLua_TabControl_VCLuaSetOnChanging, mfCall, TypeInfo(TTabChangingEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnCloseTabClicked', @VCLua_TabControl_VCLuaSetOnCloseTabClicked, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OnGetImageIndex', @VCLua_TabControl_VCLuaSetOnGetImageIndex, mfCall, TypeInfo(TTabGetImageEvent));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Options', @VCLua_TabControl_VCLuaSetOptions, mfCall, TypeInfo(TCTabControlOptions));
	TLuaMethodInfo.Create(CustomTabControlSets, 'OwnerDraw', @VCLua_TabControl_VCLuaSetOwnerDraw, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'PageIndex', @VCLua_TabControl_VCLuaSetPageIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Pages', @VCLua_TabControl_VCLuaSetPages, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(CustomTabControlSets, 'RaggedRight', @VCLua_TabControl_VCLuaSetRaggedRight, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'ScrollOpposite', @VCLua_TabControl_VCLuaSetScrollOpposite, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'ShowTabs', @VCLua_TabControl_VCLuaSetShowTabs, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomTabControlSets, 'Style', @VCLua_TabControl_VCLuaSetStyle, mfCall, TypeInfo(TTabStyle));
	TLuaMethodInfo.Create(CustomTabControlSets, 'TabHeight', @VCLua_TabControl_VCLuaSetTabHeight, mfCall, TypeInfo(Smallint));
	TLuaMethodInfo.Create(CustomTabControlSets, 'TabPosition', @VCLua_TabControl_VCLuaSetTabPosition, mfCall, TypeInfo(TTabPosition));
	TLuaMethodInfo.Create(CustomTabControlSets, 'TabWidth', @VCLua_TabControl_VCLuaSetTabWidth, mfCall, TypeInfo(Smallint));
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
