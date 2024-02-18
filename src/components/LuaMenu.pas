(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMenu;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Menus, TypInfo;

function CreateMenu(L: Plua_State): Integer; cdecl;
function IsMenu(L: Plua_State): Integer; cdecl;
function AsMenu(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMenu; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMenu = class(TMenu)
        LuaCtl: TVCLuaControl;
    end;
var
    MenuFuncs: aoluaL_Reg;

function CreatePopupMenu(L: Plua_State): Integer; cdecl;
function IsPopupMenu(L: Plua_State): Integer; cdecl;
function AsPopupMenu(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPopupMenu; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPopupMenu = class(TPopupMenu)
        LuaCtl: TVCLuaControl;
    end;
var
    PopupMenuFuncs: aoluaL_Reg;

function CreateMenuItem(L: Plua_State): Integer; cdecl;
function IsMenuItem(L: Plua_State): Integer; cdecl;
function AsMenuItem(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMenuItem; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMenuItem = class(TMenuItem)
        LuaCtl: TVCLuaControl;
    end;
var
    MenuItemFuncs: aoluaL_Reg;

function CreateMainMenu(L: Plua_State): Integer; cdecl;
function IsMainMenu(L: Plua_State): Integer; cdecl;
function AsMainMenu(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMainMenu; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMainMenu = class(TMainMenu)
        LuaCtl: TVCLuaControl;
    end;
var
    MainMenuFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, ImgList, LuaImageList;

function VCLua_Menu_DestroyHandle(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		lMenu.DestroyHandle();
	except
		on E: Exception do
			CallError(L, 'Menu', 'DestroyHandle', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Menu_FindItem(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	AValue:PtrInt;
	Kind:TFindItemKind;
	ret:TMenuItem;
begin
	CheckArg(L, 3);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	luaL_check(L,3,@Kind,TypeInfo(TFindItemKind));
	try
		ret := lMenu.FindItem(AValue,Kind);
	except
		on E: Exception do
			CallError(L, 'Menu', 'FindItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Menu_GetHelpContext(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	AValue:PtrInt;
	ByCommand:Boolean;
	ret:THelpContext;
begin
	CheckArg(L, 3);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	luaL_check(L,3,@ByCommand);
	try
		ret := lMenu.GetHelpContext(AValue,ByCommand);
	except
		on E: Exception do
			CallError(L, 'Menu', 'GetHelpContext', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Menu_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		ret := lMenu.HandleAllocated();
	except
		on E: Exception do
			CallError(L, 'Menu', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Menu_IsRightToLeft(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		ret := lMenu.IsRightToLeft();
	except
		on E: Exception do
			CallError(L, 'Menu', 'IsRightToLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Menu_UseRightToLeftAlignment(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		ret := lMenu.UseRightToLeftAlignment();
	except
		on E: Exception do
			CallError(L, 'Menu', 'UseRightToLeftAlignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Menu_UseRightToLeftReading(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		ret := lMenu.UseRightToLeftReading();
	except
		on E: Exception do
			CallError(L, 'Menu', 'UseRightToLeftReading', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Menu_HandleNeeded(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		lMenu.HandleNeeded();
	except
		on E: Exception do
			CallError(L, 'Menu', 'HandleNeeded', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_Menu_DispatchCommand(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ACommand:Word;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@ACommand);
	try
		ret := lMenu.DispatchCommand(ACommand);
	except
		on E: Exception do
			CallError(L, 'Menu', 'DispatchCommand', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_PopupMenu_PopUp(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	try
		lPopupMenu.PopUp();
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'PopUp', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_PopupMenu_PopUp2(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 3);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		lPopupMenu.PopUp(X,Y);
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'PopUp', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_PopupMenu_Close(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	try
		lPopupMenu.Close();
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'Close', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_Find(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ACaption:string;
	ret:TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@ACaption);
	try
		ret := lMenuItem.Find(ACaption);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Find', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_GetImageList(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	aImages:TCustomImageList;
	aImagesWidth:Integer;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.GetImageList(aImages,aImagesWidth);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetImageList', E.ClassName, E.Message);
	end;
	lua_push(L,aImages,TypeInfo(aImages));
	lua_push(L,aImagesWidth);
	Result := 2;
end;

function VCLua_MenuItem_GetImageList2(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.GetImageList();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetImageList', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
	Result := 1;
end;

function VCLua_MenuItem_GetParentComponent(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.GetParentComponent();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetParentComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
	Result := 1;
end;

function VCLua_MenuItem_GetParentMenu(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMenu;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.GetParentMenu();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetParentMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_GetMergedParentMenu(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMenu;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.GetMergedParentMenu();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetMergedParentMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_GetIsRightToLeft(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.GetIsRightToLeft();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetIsRightToLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.HandleAllocated();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_HasIcon(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.HasIcon();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HasIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_HasParent(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.HasParent();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HasParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_InitiateAction(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.InitiateAction();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'InitiateAction', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_IntfDoSelect(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.IntfDoSelect();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IntfDoSelect', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_IndexOf(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Item:TMenuItem;
	ret:Integer;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Item);
	try
		ret := lMenuItem.IndexOf(Item);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_IndexOfCaption(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ACaption:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@ACaption);
	try
		ret := lMenuItem.IndexOfCaption(ACaption);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IndexOfCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_InvalidateMergedItems(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.InvalidateMergedItems();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'InvalidateMergedItems', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_VisibleIndexOf(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Item:TMenuItem;
	ret:Integer;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Item);
	try
		ret := lMenuItem.VisibleIndexOf(Item);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'VisibleIndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_Add(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Item:TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Item);
	try
		lMenuItem.Add(Item);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Add', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_Add2(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	AItems:array of TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	TTrait<TMenuItem>.luaL_checkArray(L, 2, @AItems);
	try
		lMenuItem.Add(AItems);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Add', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_AddSeparator(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.AddSeparator();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'AddSeparator', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_Click(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.Click();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Click', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_Delete(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Index:Integer;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lMenuItem.Delete(Index);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Delete', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_HandleNeeded(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.HandleNeeded();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HandleNeeded', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_Insert(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Index:Integer;
	Item:TMenuItem;
begin
	CheckArg(L, 3);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@Item);
	try
		lMenuItem.Insert(Index,Item);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Insert', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_RecreateHandle(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.RecreateHandle();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'RecreateHandle', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_Remove(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Item:TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Item);
	try
		lMenuItem.Remove(Item);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Remove', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_UpdateImage(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	forced:Boolean;
begin
	CheckArg(L, 1, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @forced, false);
	try
		lMenuItem.UpdateImage(forced);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'UpdateImage', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_UpdateImages(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	forced:Boolean;
begin
	CheckArg(L, 1, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @forced, false);
	try
		lMenuItem.UpdateImages(forced);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'UpdateImages', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_IsCheckItem(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.IsCheckItem();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IsCheckItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_IsLine(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.IsLine();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IsLine', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_IsInMenuBar(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.IsInMenuBar();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IsInMenuBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_Clear(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.Clear();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Clear', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MenuItem_HasBitmap(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.HasBitmap();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HasBitmap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_MenuVisibleIndex(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:integer;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.MenuVisibleIndex();
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'MenuVisibleIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_MenuItem_WriteDebugReport(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Prefix:string;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Prefix);
	try
		lMenuItem.WriteDebugReport(Prefix);
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'WriteDebugReport', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MainMenu_Merge(L: Plua_State): Integer; cdecl;
var
	lMainMenu:TLuaMainMenu;
	Menu:TMainMenu;
begin
	CheckArg(L, 2);
	lMainMenu := TLuaMainMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@Menu);
	try
		lMainMenu.Merge(Menu);
	except
		on E: Exception do
			CallError(L, 'MainMenu', 'Merge', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_MainMenu_Unmerge(L: Plua_State): Integer; cdecl;
var
	lMainMenu:TLuaMainMenu;
	Menu:TMainMenu;
begin
	CheckArg(L, 2);
	lMainMenu := TLuaMainMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@Menu);
	try
		lMainMenu.Unmerge(Menu);
	except
		on E: Exception do
			CallError(L, 'MainMenu', 'Unmerge', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function IsMenu(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TMenu);
end;
function AsMenu(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TMenu then
    lua_push(L, TMenu(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TMenu; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TMenu',v);
end;
function CreateMenu(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMenu := TLuaMenu.Create(Parent);
	lMenu.Parent := TWinControl(Parent);
	lMenu.LuaCtl := TVCLuaControl.Create(lMenu as TComponent,L,nil,'TMenu');
	InitControl(L,lMenu,Name);
	CreateTableForKnownType(L,'TMenu',lMenu);
	Result := 1;
end;

function IsPopupMenu(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TPopupMenu);
end;
function AsPopupMenu(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TPopupMenu then
    lua_push(L, TPopupMenu(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TPopupMenu; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPopupMenu',v);
end;
function CreatePopupMenu(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPopupMenu := TLuaPopupMenu.Create(Parent);
	lPopupMenu.Parent := TWinControl(Parent);
	lPopupMenu.LuaCtl := TVCLuaControl.Create(lPopupMenu as TComponent,L,nil,'TPopupMenu');
	InitControl(L,lPopupMenu,Name);
	CreateTableForKnownType(L,'TPopupMenu',lPopupMenu);
	Result := 1;
end;

function IsMenuItem(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TMenuItem);
end;
function AsMenuItem(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TMenuItem then
    lua_push(L, TMenuItem(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TMenuItem; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TMenuItem',v);
end;
function CreateMenuItem(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMenuItem := TLuaMenuItem.Create(Parent);
	// := TWinControl(Parent);
	lMenuItem.LuaCtl := TVCLuaControl.Create(lMenuItem as TComponent,L,nil,'TMenuItem');
	InitControl(L,lMenuItem,Name);
	CreateTableForKnownType(L,'TMenuItem',lMenuItem);
	Result := 1;
end;

function IsMainMenu(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TMainMenu);
end;
function AsMainMenu(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TMainMenu then
    lua_push(L, TMainMenu(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TMainMenu; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TMainMenu',v);
end;
function CreateMainMenu(L: Plua_State): Integer; cdecl;
var
	lMainMenu:TLuaMainMenu;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMainMenu := TLuaMainMenu.Create(Parent);
	lMainMenu.Parent := TWinControl(Parent);
	lMainMenu.LuaCtl := TVCLuaControl.Create(lMainMenu as TComponent,L,nil,'TMainMenu');
	InitControl(L,lMainMenu,Name);
	CreateTableForKnownType(L,'TMainMenu',lMainMenu);
	Result := 1;
end;

begin
	SetLength(MenuFuncs, 9+1);
	MenuFuncs[0].name:='DestroyHandle';
	MenuFuncs[0].func:=@VCLua_Menu_DestroyHandle;
	MenuFuncs[1].name:='FindItem';
	MenuFuncs[1].func:=@VCLua_Menu_FindItem;
	MenuFuncs[2].name:='GetHelpContext';
	MenuFuncs[2].func:=@VCLua_Menu_GetHelpContext;
	MenuFuncs[3].name:='HandleAllocated';
	MenuFuncs[3].func:=@VCLua_Menu_HandleAllocated;
	MenuFuncs[4].name:='IsRightToLeft';
	MenuFuncs[4].func:=@VCLua_Menu_IsRightToLeft;
	MenuFuncs[5].name:='UseRightToLeftAlignment';
	MenuFuncs[5].func:=@VCLua_Menu_UseRightToLeftAlignment;
	MenuFuncs[6].name:='UseRightToLeftReading';
	MenuFuncs[6].func:=@VCLua_Menu_UseRightToLeftReading;
	MenuFuncs[7].name:='HandleNeeded';
	MenuFuncs[7].func:=@VCLua_Menu_HandleNeeded;
	MenuFuncs[8].name:='DispatchCommand';
	MenuFuncs[8].func:=@VCLua_Menu_DispatchCommand;
	MenuFuncs[9].name:=nil;
	MenuFuncs[9].func:=nil;

	SetLength(PopupMenuFuncs, 3+1);
	PopupMenuFuncs[0].name:='PopUp';
	PopupMenuFuncs[0].func:=@VCLua_PopupMenu_PopUp;
	PopupMenuFuncs[1].name:='PopUp2';
	PopupMenuFuncs[1].func:=@VCLua_PopupMenu_PopUp2;
	PopupMenuFuncs[2].name:='Close';
	PopupMenuFuncs[2].func:=@VCLua_PopupMenu_Close;
	PopupMenuFuncs[3].name:=nil;
	PopupMenuFuncs[3].func:=nil;

	SetLength(MenuItemFuncs, 34+1);
	MenuItemFuncs[0].name:='Find';
	MenuItemFuncs[0].func:=@VCLua_MenuItem_Find;
	MenuItemFuncs[1].name:='GetImageList';
	MenuItemFuncs[1].func:=@VCLua_MenuItem_GetImageList;
	MenuItemFuncs[2].name:='GetImageList2';
	MenuItemFuncs[2].func:=@VCLua_MenuItem_GetImageList2;
	MenuItemFuncs[3].name:='GetParentComponent';
	MenuItemFuncs[3].func:=@VCLua_MenuItem_GetParentComponent;
	MenuItemFuncs[4].name:='GetParentMenu';
	MenuItemFuncs[4].func:=@VCLua_MenuItem_GetParentMenu;
	MenuItemFuncs[5].name:='GetMergedParentMenu';
	MenuItemFuncs[5].func:=@VCLua_MenuItem_GetMergedParentMenu;
	MenuItemFuncs[6].name:='GetIsRightToLeft';
	MenuItemFuncs[6].func:=@VCLua_MenuItem_GetIsRightToLeft;
	MenuItemFuncs[7].name:='HandleAllocated';
	MenuItemFuncs[7].func:=@VCLua_MenuItem_HandleAllocated;
	MenuItemFuncs[8].name:='HasIcon';
	MenuItemFuncs[8].func:=@VCLua_MenuItem_HasIcon;
	MenuItemFuncs[9].name:='HasParent';
	MenuItemFuncs[9].func:=@VCLua_MenuItem_HasParent;
	MenuItemFuncs[10].name:='InitiateAction';
	MenuItemFuncs[10].func:=@VCLua_MenuItem_InitiateAction;
	MenuItemFuncs[11].name:='IntfDoSelect';
	MenuItemFuncs[11].func:=@VCLua_MenuItem_IntfDoSelect;
	MenuItemFuncs[12].name:='IndexOf';
	MenuItemFuncs[12].func:=@VCLua_MenuItem_IndexOf;
	MenuItemFuncs[13].name:='IndexOfCaption';
	MenuItemFuncs[13].func:=@VCLua_MenuItem_IndexOfCaption;
	MenuItemFuncs[14].name:='InvalidateMergedItems';
	MenuItemFuncs[14].func:=@VCLua_MenuItem_InvalidateMergedItems;
	MenuItemFuncs[15].name:='VisibleIndexOf';
	MenuItemFuncs[15].func:=@VCLua_MenuItem_VisibleIndexOf;
	MenuItemFuncs[16].name:='Add';
	MenuItemFuncs[16].func:=@VCLua_MenuItem_Add;
	MenuItemFuncs[17].name:='Add2';
	MenuItemFuncs[17].func:=@VCLua_MenuItem_Add2;
	MenuItemFuncs[18].name:='AddSeparator';
	MenuItemFuncs[18].func:=@VCLua_MenuItem_AddSeparator;
	MenuItemFuncs[19].name:='Click';
	MenuItemFuncs[19].func:=@VCLua_MenuItem_Click;
	MenuItemFuncs[20].name:='Delete';
	MenuItemFuncs[20].func:=@VCLua_MenuItem_Delete;
	MenuItemFuncs[21].name:='HandleNeeded';
	MenuItemFuncs[21].func:=@VCLua_MenuItem_HandleNeeded;
	MenuItemFuncs[22].name:='Insert';
	MenuItemFuncs[22].func:=@VCLua_MenuItem_Insert;
	MenuItemFuncs[23].name:='RecreateHandle';
	MenuItemFuncs[23].func:=@VCLua_MenuItem_RecreateHandle;
	MenuItemFuncs[24].name:='Remove';
	MenuItemFuncs[24].func:=@VCLua_MenuItem_Remove;
	MenuItemFuncs[25].name:='UpdateImage';
	MenuItemFuncs[25].func:=@VCLua_MenuItem_UpdateImage;
	MenuItemFuncs[26].name:='UpdateImages';
	MenuItemFuncs[26].func:=@VCLua_MenuItem_UpdateImages;
	MenuItemFuncs[27].name:='IsCheckItem';
	MenuItemFuncs[27].func:=@VCLua_MenuItem_IsCheckItem;
	MenuItemFuncs[28].name:='IsLine';
	MenuItemFuncs[28].func:=@VCLua_MenuItem_IsLine;
	MenuItemFuncs[29].name:='IsInMenuBar';
	MenuItemFuncs[29].func:=@VCLua_MenuItem_IsInMenuBar;
	MenuItemFuncs[30].name:='Clear';
	MenuItemFuncs[30].func:=@VCLua_MenuItem_Clear;
	MenuItemFuncs[31].name:='HasBitmap';
	MenuItemFuncs[31].func:=@VCLua_MenuItem_HasBitmap;
	MenuItemFuncs[32].name:='MenuVisibleIndex';
	MenuItemFuncs[32].func:=@VCLua_MenuItem_MenuVisibleIndex;
	MenuItemFuncs[33].name:='WriteDebugReport';
	MenuItemFuncs[33].func:=@VCLua_MenuItem_WriteDebugReport;
	MenuItemFuncs[34].name:=nil;
	MenuItemFuncs[34].func:=nil;

	SetLength(MainMenuFuncs, 2+1);
	MainMenuFuncs[0].name:='Merge';
	MainMenuFuncs[0].func:=@VCLua_MainMenu_Merge;
	MainMenuFuncs[1].name:='Unmerge';
	MainMenuFuncs[1].func:=@VCLua_MainMenu_Unmerge;
	MainMenuFuncs[2].name:=nil;
	MainMenuFuncs[2].func:=nil;

end.
