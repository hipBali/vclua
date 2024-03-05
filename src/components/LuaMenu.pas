(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMenu;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Menus;

function CreateMenu(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMenu; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMenu = class(TMenu)
        LuaCtl: TVCLuaControl;
    end;
var
    MenuFuncs: TLuaVmt;
    MenuSets: TLuaVmt;

function CreatePopupMenu(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPopupMenu; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPopupMenu = class(TPopupMenu)
        LuaCtl: TVCLuaControl;
    end;
var
    PopupMenuFuncs: TLuaVmt;
    PopupMenuSets: TLuaVmt;

function CreateMenuItem(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMenuItem; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMenuItem = class(TMenuItem)
        LuaCtl: TVCLuaControl;
    end;
var
    MenuItemFuncs: TLuaVmt;
    MenuItemSets: TLuaVmt;

function CreateMainMenu(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMainMenu; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMainMenu = class(TMainMenu)
        LuaCtl: TVCLuaControl;
    end;
var
    MainMenuFuncs: TLuaVmt;
    MainMenuSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, ImgList, LuaImageList, LCLType;

function VCLua_Menu_DestroyHandle(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		lMenu.DestroyHandle();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Menu', 'DestroyHandle', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'FindItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'GetHelpContext', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'IsRightToLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'UseRightToLeftAlignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'UseRightToLeftReading', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Menu_HandleNeeded(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		lMenu.HandleNeeded();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Menu', 'HandleNeeded', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'DispatchCommand', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Menu_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ret:HMenu;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		ret := lMenu.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'Handle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Menu_VCLuaSetParent(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	val:TComponent;
begin
	CheckArg(L, 2);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMenu.Parent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Menu', 'Parent', E.ClassName, E.Message);
	end;
end;

function VCLua_Menu_VCLuaGetParent(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		ret := lMenu.Parent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'Parent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Menu_VCLuaSetShortcutHandled(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	val:boolean;
begin
	CheckArg(L, 2);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMenu.ShortcutHandled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Menu', 'ShortcutHandled', E.ClassName, E.Message);
	end;
end;

function VCLua_Menu_VCLuaGetShortcutHandled(L: Plua_State): Integer; cdecl;
var
	lMenu:TLuaMenu;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	try
		ret := lMenu.ShortcutHandled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Menu', 'ShortcutHandled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PopupMenu_PopUp(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	try
		lPopupMenu.PopUp();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'PopUp', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'PopUp', E.ClassName, E.Message);
	end;
end;

function VCLua_PopupMenu_VCLuaSetPopupComponent(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
	val:TComponent;
begin
	CheckArg(L, 2);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lPopupMenu.PopupComponent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'PopupComponent', E.ClassName, E.Message);
	end;
end;

function VCLua_PopupMenu_VCLuaGetPopupComponent(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	try
		ret := lPopupMenu.PopupComponent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'PopupComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_PopupMenu_VCLuaGetPopupPoint(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	try
		ret := lPopupMenu.PopupPoint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'PopupPoint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PopupMenu_Close(L: Plua_State): Integer; cdecl;
var
	lPopupMenu:TLuaPopupMenu;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	try
		lPopupMenu.Close();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PopupMenu', 'Close', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Find', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetImageList', E.ClassName, E.Message);
	end;
	lua_push(L,aImages,TypeInfo(aImages));
	lua_push(L,aImagesWidth);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetImageList', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetParentComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetParentMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetMergedParentMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'GetIsRightToLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HasIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HasParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_InitiateAction(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.InitiateAction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'InitiateAction', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_IntfDoSelect(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.IntfDoSelect();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IntfDoSelect', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IndexOfCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_InvalidateMergedItems(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.InvalidateMergedItems();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'InvalidateMergedItems', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'VisibleIndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Add', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Add', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_AddSeparator(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.AddSeparator();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'AddSeparator', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_Click(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.Click();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Click', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_HandleNeeded(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.HandleNeeded();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HandleNeeded', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Insert', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_RecreateHandle(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.RecreateHandle();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'RecreateHandle', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Remove', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'UpdateImage', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'UpdateImages', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IsCheckItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IsLine', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'IsInMenuBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_Clear(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		lMenuItem.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Clear', E.ClassName, E.Message);
	end;
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'HasBitmap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaGetMerged(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.Merged;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Merged', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaGetMergedWith(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.MergedWith;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'MergedWith', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaGetCount(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:Integer;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.Count;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Count', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaSetHandle(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	val:HMenu;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMenuItem.Handle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Handle', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:HMenu;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Handle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_Items(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	Index:Integer;
	ret:TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lMenuItem.Items[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_VCLuaGetMergedItems(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMergedMenuItems;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.MergedItems;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'MergedItems', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_MenuItem_VCLuaSetMenuIndex(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	val:Integer;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMenuItem.MenuIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'MenuIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_MenuItem_VCLuaGetMenuIndex(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:Integer;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.MenuIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'MenuIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaGetMenu(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMenu;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.Menu;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Menu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaGetParent(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.Parent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Parent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaGetMergedParent(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:TMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.MergedParent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'MergedParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MenuItem_VCLuaGetCommand(L: Plua_State): Integer; cdecl;
var
	lMenuItem:TLuaMenuItem;
	ret:Word;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	try
		ret := lMenuItem.Command;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'Command', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'MenuVisibleIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MenuItem', 'WriteDebugReport', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MainMenu', 'Merge', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MainMenu', 'Unmerge', E.ClassName, E.Message);
	end;
end;

function VCLua_MainMenu_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lMainMenu:TLuaMainMenu;
	ret:Integer;
begin
	CheckArg(L, 1);
	lMainMenu := TLuaMainMenu(GetLuaObject(L, 1));
	try
		ret := lMainMenu.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MainMenu', 'Height', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MainMenu_VCLuaSetWindowHandle(L: Plua_State): Integer; cdecl;
var
	lMainMenu:TLuaMainMenu;
	val:HWND;
begin
	CheckArg(L, 2);
	lMainMenu := TLuaMainMenu(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMainMenu.WindowHandle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MainMenu', 'WindowHandle', E.ClassName, E.Message);
	end;
end;

function VCLua_MainMenu_VCLuaGetWindowHandle(L: Plua_State): Integer; cdecl;
var
	lMainMenu:TLuaMainMenu;
	ret:HWND;
begin
	CheckArg(L, 1);
	lMainMenu := TLuaMainMenu(GetLuaObject(L, 1));
	try
		ret := lMainMenu.WindowHandle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MainMenu', 'WindowHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	MenuFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(MenuFuncs, 'DestroyHandle', @VCLua_Menu_DestroyHandle);
	TLuaMethodInfo.Create(MenuFuncs, 'FindItem', @VCLua_Menu_FindItem);
	TLuaMethodInfo.Create(MenuFuncs, 'GetHelpContext', @VCLua_Menu_GetHelpContext);
	TLuaMethodInfo.Create(MenuFuncs, 'HandleAllocated', @VCLua_Menu_HandleAllocated);
	TLuaMethodInfo.Create(MenuFuncs, 'IsRightToLeft', @VCLua_Menu_IsRightToLeft);
	TLuaMethodInfo.Create(MenuFuncs, 'UseRightToLeftAlignment', @VCLua_Menu_UseRightToLeftAlignment);
	TLuaMethodInfo.Create(MenuFuncs, 'UseRightToLeftReading', @VCLua_Menu_UseRightToLeftReading);
	TLuaMethodInfo.Create(MenuFuncs, 'HandleNeeded', @VCLua_Menu_HandleNeeded);
	TLuaMethodInfo.Create(MenuFuncs, 'DispatchCommand', @VCLua_Menu_DispatchCommand);
	TLuaMethodInfo.Create(MenuFuncs, 'Handle', @VCLua_Menu_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(MenuFuncs, 'Parent', @VCLua_Menu_VCLuaGetParent, mfCall);
	TLuaMethodInfo.Create(MenuFuncs, 'ShortcutHandled', @VCLua_Menu_VCLuaGetShortcutHandled, mfCall);
	MenuSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(MenuSets, 'Parent', @VCLua_Menu_VCLuaSetParent, mfCall);
	TLuaMethodInfo.Create(MenuSets, 'ShortcutHandled', @VCLua_Menu_VCLuaSetShortcutHandled, mfCall);
	PopupMenuFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PopupMenuFuncs, 'PopUp', @VCLua_PopupMenu_PopUp);
	TLuaMethodInfo.Create(PopupMenuFuncs, 'PopUp2', @VCLua_PopupMenu_PopUp2);
	TLuaMethodInfo.Create(PopupMenuFuncs, 'PopupComponent', @VCLua_PopupMenu_VCLuaGetPopupComponent, mfCall);
	TLuaMethodInfo.Create(PopupMenuFuncs, 'PopupPoint', @VCLua_PopupMenu_VCLuaGetPopupPoint, mfCall);
	TLuaMethodInfo.Create(PopupMenuFuncs, 'Close', @VCLua_PopupMenu_Close);
	PopupMenuSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(PopupMenuSets, 'PopupComponent', @VCLua_PopupMenu_VCLuaSetPopupComponent, mfCall);
	MenuItemFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(MenuItemFuncs, 'Find', @VCLua_MenuItem_Find);
	TLuaMethodInfo.Create(MenuItemFuncs, 'GetImageList', @VCLua_MenuItem_GetImageList);
	TLuaMethodInfo.Create(MenuItemFuncs, 'GetImageList2', @VCLua_MenuItem_GetImageList2);
	TLuaMethodInfo.Create(MenuItemFuncs, 'GetParentComponent', @VCLua_MenuItem_GetParentComponent);
	TLuaMethodInfo.Create(MenuItemFuncs, 'GetParentMenu', @VCLua_MenuItem_GetParentMenu);
	TLuaMethodInfo.Create(MenuItemFuncs, 'GetMergedParentMenu', @VCLua_MenuItem_GetMergedParentMenu);
	TLuaMethodInfo.Create(MenuItemFuncs, 'GetIsRightToLeft', @VCLua_MenuItem_GetIsRightToLeft);
	TLuaMethodInfo.Create(MenuItemFuncs, 'HandleAllocated', @VCLua_MenuItem_HandleAllocated);
	TLuaMethodInfo.Create(MenuItemFuncs, 'HasIcon', @VCLua_MenuItem_HasIcon);
	TLuaMethodInfo.Create(MenuItemFuncs, 'HasParent', @VCLua_MenuItem_HasParent);
	TLuaMethodInfo.Create(MenuItemFuncs, 'InitiateAction', @VCLua_MenuItem_InitiateAction);
	TLuaMethodInfo.Create(MenuItemFuncs, 'IntfDoSelect', @VCLua_MenuItem_IntfDoSelect);
	TLuaMethodInfo.Create(MenuItemFuncs, 'IndexOf', @VCLua_MenuItem_IndexOf);
	TLuaMethodInfo.Create(MenuItemFuncs, 'IndexOfCaption', @VCLua_MenuItem_IndexOfCaption);
	TLuaMethodInfo.Create(MenuItemFuncs, 'InvalidateMergedItems', @VCLua_MenuItem_InvalidateMergedItems);
	TLuaMethodInfo.Create(MenuItemFuncs, 'VisibleIndexOf', @VCLua_MenuItem_VisibleIndexOf);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Add', @VCLua_MenuItem_Add);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Add2', @VCLua_MenuItem_Add2);
	TLuaMethodInfo.Create(MenuItemFuncs, 'AddSeparator', @VCLua_MenuItem_AddSeparator);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Click', @VCLua_MenuItem_Click);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Delete', @VCLua_MenuItem_Delete);
	TLuaMethodInfo.Create(MenuItemFuncs, 'HandleNeeded', @VCLua_MenuItem_HandleNeeded);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Insert', @VCLua_MenuItem_Insert);
	TLuaMethodInfo.Create(MenuItemFuncs, 'RecreateHandle', @VCLua_MenuItem_RecreateHandle);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Remove', @VCLua_MenuItem_Remove);
	TLuaMethodInfo.Create(MenuItemFuncs, 'UpdateImage', @VCLua_MenuItem_UpdateImage);
	TLuaMethodInfo.Create(MenuItemFuncs, 'UpdateImages', @VCLua_MenuItem_UpdateImages);
	TLuaMethodInfo.Create(MenuItemFuncs, 'IsCheckItem', @VCLua_MenuItem_IsCheckItem);
	TLuaMethodInfo.Create(MenuItemFuncs, 'IsLine', @VCLua_MenuItem_IsLine);
	TLuaMethodInfo.Create(MenuItemFuncs, 'IsInMenuBar', @VCLua_MenuItem_IsInMenuBar);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Clear', @VCLua_MenuItem_Clear);
	TLuaMethodInfo.Create(MenuItemFuncs, 'HasBitmap', @VCLua_MenuItem_HasBitmap);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Merged', @VCLua_MenuItem_VCLuaGetMerged, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'MergedWith', @VCLua_MenuItem_VCLuaGetMergedWith, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Count', @VCLua_MenuItem_VCLuaGetCount, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Handle', @VCLua_MenuItem_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Items', @VCLua_MenuItem_Items);
	TLuaMethodInfo.Create(MenuItemFuncs, 'MergedItems', @VCLua_MenuItem_VCLuaGetMergedItems, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'MenuIndex', @VCLua_MenuItem_VCLuaGetMenuIndex, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Menu', @VCLua_MenuItem_VCLuaGetMenu, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Parent', @VCLua_MenuItem_VCLuaGetParent, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'MergedParent', @VCLua_MenuItem_VCLuaGetMergedParent, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'Command', @VCLua_MenuItem_VCLuaGetCommand, mfCall);
	TLuaMethodInfo.Create(MenuItemFuncs, 'MenuVisibleIndex', @VCLua_MenuItem_MenuVisibleIndex);
	TLuaMethodInfo.Create(MenuItemFuncs, 'WriteDebugReport', @VCLua_MenuItem_WriteDebugReport);
	MenuItemSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(MenuItemSets, 'Handle', @VCLua_MenuItem_VCLuaSetHandle, mfCall);
	TLuaMethodInfo.Create(MenuItemSets, 'MenuIndex', @VCLua_MenuItem_VCLuaSetMenuIndex, mfCall);
	MainMenuFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(MainMenuFuncs, 'Merge', @VCLua_MainMenu_Merge);
	TLuaMethodInfo.Create(MainMenuFuncs, 'Unmerge', @VCLua_MainMenu_Unmerge);
	TLuaMethodInfo.Create(MainMenuFuncs, 'Height', @VCLua_MainMenu_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(MainMenuFuncs, 'WindowHandle', @VCLua_MainMenu_VCLuaGetWindowHandle, mfCall);
	MainMenuSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(MainMenuSets, 'WindowHandle', @VCLua_MainMenu_VCLuaSetWindowHandle, mfCall);
end.
