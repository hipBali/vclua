(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaMenu;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Menus, Controls, ImgList, LuaImageList;

function CreateMenu(L: Plua_State): Integer; cdecl;
procedure MenuToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaMenu = class(TMenu)
        LuaCtl: TVCLuaControl;
    end;

function CreatePopupMenu(L: Plua_State): Integer; cdecl;
procedure PopupMenuToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPopupMenu = class(TPopupMenu)
        LuaCtl: TVCLuaControl;
    end;

function CreateMenuItem(L: Plua_State): Integer; cdecl;
procedure MenuItemToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaMenuItem = class(TMenuItem)
        LuaCtl: TVCLuaControl;
    end;

function CreateMainMenu(L: Plua_State): Integer; cdecl;
procedure MainMenuToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaMainMenu = class(TMainMenu)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_Menu_DestroyHandle(L: Plua_State): Integer; cdecl;
var 
	lMenu:TLuaMenu;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	lMenu.DestroyHandle();
	
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
	AValue := lua_tointeger(L,2);
	Kind := TFindItemKind(GetLuaObject(L,3));
	ret := lMenu.FindItem(AValue,Kind);
	MenuToTable(L,-1,ret);
	
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
	AValue := lua_tointeger(L,2);
	ByCommand := lua_toboolean(L,3);
	ret := lMenu.GetHelpContext(AValue,ByCommand);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Menu_HandleAllocated(L: Plua_State): Integer; cdecl;
var 
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	ret := lMenu.HandleAllocated();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Menu_IsRightToLeft(L: Plua_State): Integer; cdecl;
var 
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	ret := lMenu.IsRightToLeft();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Menu_UseRightToLeftAlignment(L: Plua_State): Integer; cdecl;
var 
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	ret := lMenu.UseRightToLeftAlignment();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Menu_UseRightToLeftReading(L: Plua_State): Integer; cdecl;
var 
	lMenu:TLuaMenu;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	ret := lMenu.UseRightToLeftReading();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Menu_HandleNeeded(L: Plua_State): Integer; cdecl;
var 
	lMenu:TLuaMenu;
begin
	CheckArg(L, 1);
	lMenu := TLuaMenu(GetLuaObject(L, 1));
	lMenu.HandleNeeded();
	
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
	ACommand := Word(lua_tointeger(L,2));
	ret := lMenu.DispatchCommand(ACommand);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_PopupMenu_PopUp(L: Plua_State): Integer; cdecl;
var 
	lPopupMenu:TLuaPopupMenu;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	lPopupMenu.PopUp();
	
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
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	lPopupMenu.PopUp(X,Y);
	
	Result := 0;
end;

function VCLua_PopupMenu_Close(L: Plua_State): Integer; cdecl;
var 
	lPopupMenu:TLuaPopupMenu;
begin
	CheckArg(L, 1);
	lPopupMenu := TLuaPopupMenu(GetLuaObject(L, 1));
	lPopupMenu.Close();
	
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
	ACaption := lua_tostring(L,2);
	ret := lMenuItem.Find(ACaption);
	MenuItemToTable(L,-1,ret);
	
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
	
	lMenuItem.GetImageList(aImages,aImagesWidth);
	ImageListToTable(L,-1,aImages);
	lua_pushinteger(L,aImagesWidth);
	Result := 2;
end;

function VCLua_MenuItem_GetImageList2(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.GetImageList();
	ImageListToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_GetParentComponent(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.GetParentComponent();
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_GetParentMenu(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:TMenu;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.GetParentMenu();
	MenuItemToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_GetMergedParentMenu(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:TMenu;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.GetMergedParentMenu();
	MenuItemToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_GetIsRightToLeft(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.GetIsRightToLeft();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_HandleAllocated(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.HandleAllocated();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_HasIcon(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.HasIcon();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_HasParent(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.HasParent();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_InitiateAction(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.InitiateAction();
	
	Result := 0;
end;

function VCLua_MenuItem_IntfDoSelect(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.IntfDoSelect();
	
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
	Item := TMenuItem(GetLuaObject(L,2));
	ret := lMenuItem.IndexOf(Item);
	lua_pushinteger(L,ret);
	
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
	ACaption := lua_tostring(L,2);
	ret := lMenuItem.IndexOfCaption(ACaption);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_InvalidateMergedItems(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.InvalidateMergedItems();
	
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
	Item := TMenuItem(GetLuaObject(L,2));
	ret := lMenuItem.VisibleIndexOf(Item);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_Add(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	Item:TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	Item := TMenuItem(GetLuaObject(L,2));
	lMenuItem.Add(Item);
	
	Result := 0;
end;

function VCLua_MenuItem_Add2(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	AItems:array of TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	AItems := lua_toTMenuItem(L,2);
	lMenuItem.Add(AItems);
	
	Result := 0;
end;

function VCLua_MenuItem_AddSeparator(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.AddSeparator();
	
	Result := 0;
end;

function VCLua_MenuItem_Click(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.Click();
	
	Result := 0;
end;

function VCLua_MenuItem_Delete(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	Index:Integer;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lMenuItem.Delete(Index);
	
	Result := 0;
end;

function VCLua_MenuItem_HandleNeeded(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.HandleNeeded();
	
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
	Index := lua_tointeger(L,2);
	Item := TMenuItem(GetLuaObject(L,3));
	lMenuItem.Insert(Index,Item);
	
	Result := 0;
end;

function VCLua_MenuItem_RecreateHandle(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.RecreateHandle();
	
	Result := 0;
end;

function VCLua_MenuItem_Remove(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	Item:TMenuItem;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	Item := TMenuItem(GetLuaObject(L,2));
	lMenuItem.Remove(Item);
	
	Result := 0;
end;

function VCLua_MenuItem_UpdateImage(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	forced:Boolean;
begin
	CheckArg(L, -1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	forced := luaL_optbool(L,2, false);
	lMenuItem.UpdateImage(forced);
	
	Result := 0;
end;

function VCLua_MenuItem_UpdateImages(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	forced:Boolean;
begin
	CheckArg(L, -1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	forced := luaL_optbool(L,2, false);
	lMenuItem.UpdateImages(forced);
	
	Result := 0;
end;

function VCLua_MenuItem_IsCheckItem(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.IsCheckItem();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_IsLine(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.IsLine();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_IsInMenuBar(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.IsInMenuBar();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_Clear(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	lMenuItem.Clear();
	
	Result := 0;
end;

function VCLua_MenuItem_HasBitmap(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:boolean;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.HasBitmap();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_MenuVisibleIndex(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	ret:integer;
begin
	CheckArg(L, 1);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	ret := lMenuItem.MenuVisibleIndex();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_MenuItem_WriteDebugReport(L: Plua_State): Integer; cdecl;
var 
	lMenuItem:TLuaMenuItem;
	Prefix:string;
begin
	CheckArg(L, 2);
	lMenuItem := TLuaMenuItem(GetLuaObject(L, 1));
	Prefix := lua_tostring(L,2);
	lMenuItem.WriteDebugReport(Prefix);
	
	Result := 0;
end;

function VCLua_MainMenu_Merge(L: Plua_State): Integer; cdecl;
var 
	lMainMenu:TLuaMainMenu;
	Menu:TMainMenu;
begin
	CheckArg(L, 2);
	lMainMenu := TLuaMainMenu(GetLuaObject(L, 1));
	Menu := TMainMenu(GetLuaObject(L,2));
	lMainMenu.Merge(Menu);
	
	Result := 0;
end;

function VCLua_MainMenu_Unmerge(L: Plua_State): Integer; cdecl;
var 
	lMainMenu:TLuaMainMenu;
	Menu:TMainMenu;
begin
	CheckArg(L, 2);
	lMainMenu := TLuaMainMenu(GetLuaObject(L, 1));
	Menu := TMainMenu(GetLuaObject(L,2));
	lMainMenu.Unmerge(Menu);
	
	Result := 0;
end;

procedure MenuToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'DestroyHandle', @VCLua_Menu_DestroyHandle);
	LuaSetTableFunction(L, Index, 'FindItem', @VCLua_Menu_FindItem);
	LuaSetTableFunction(L, Index, 'GetHelpContext', @VCLua_Menu_GetHelpContext);
	LuaSetTableFunction(L, Index, 'HandleAllocated', @VCLua_Menu_HandleAllocated);
	LuaSetTableFunction(L, Index, 'IsRightToLeft', @VCLua_Menu_IsRightToLeft);
	LuaSetTableFunction(L, Index, 'UseRightToLeftAlignment', @VCLua_Menu_UseRightToLeftAlignment);
	LuaSetTableFunction(L, Index, 'UseRightToLeftReading', @VCLua_Menu_UseRightToLeftReading);
	LuaSetTableFunction(L, Index, 'HandleNeeded', @VCLua_Menu_HandleNeeded);
	LuaSetTableFunction(L, Index, 'DispatchCommand', @VCLua_Menu_DispatchCommand);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lMenu.LuaCtl := TVCLuaControl.Create(TControl(lMenu),L,@MenuToTable);
	InitControl(L,lMenu,Name);
	MenuToTable(L, -1, lMenu);
	Result := 1;
end;

procedure PopupMenuToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'PopUp', @VCLua_PopupMenu_PopUp);
	LuaSetTableFunction(L, Index, 'PopUp2', @VCLua_PopupMenu_PopUp2);
	LuaSetTableFunction(L, Index, 'Close', @VCLua_PopupMenu_Close);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lPopupMenu.LuaCtl := TVCLuaControl.Create(TControl(lPopupMenu),L,@PopupMenuToTable);
	InitControl(L,lPopupMenu,Name);
	PopupMenuToTable(L, -1, lPopupMenu);
	Result := 1;
end;

procedure MenuItemToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Find', @VCLua_MenuItem_Find);
	LuaSetTableFunction(L, Index, 'GetImageList', @VCLua_MenuItem_GetImageList);
	LuaSetTableFunction(L, Index, 'GetImageList2', @VCLua_MenuItem_GetImageList2);
	LuaSetTableFunction(L, Index, 'GetParentComponent', @VCLua_MenuItem_GetParentComponent);
	LuaSetTableFunction(L, Index, 'GetParentMenu', @VCLua_MenuItem_GetParentMenu);
	LuaSetTableFunction(L, Index, 'GetMergedParentMenu', @VCLua_MenuItem_GetMergedParentMenu);
	LuaSetTableFunction(L, Index, 'GetIsRightToLeft', @VCLua_MenuItem_GetIsRightToLeft);
	LuaSetTableFunction(L, Index, 'HandleAllocated', @VCLua_MenuItem_HandleAllocated);
	LuaSetTableFunction(L, Index, 'HasIcon', @VCLua_MenuItem_HasIcon);
	LuaSetTableFunction(L, Index, 'HasParent', @VCLua_MenuItem_HasParent);
	LuaSetTableFunction(L, Index, 'InitiateAction', @VCLua_MenuItem_InitiateAction);
	LuaSetTableFunction(L, Index, 'IntfDoSelect', @VCLua_MenuItem_IntfDoSelect);
	LuaSetTableFunction(L, Index, 'IndexOf', @VCLua_MenuItem_IndexOf);
	LuaSetTableFunction(L, Index, 'IndexOfCaption', @VCLua_MenuItem_IndexOfCaption);
	LuaSetTableFunction(L, Index, 'InvalidateMergedItems', @VCLua_MenuItem_InvalidateMergedItems);
	LuaSetTableFunction(L, Index, 'VisibleIndexOf', @VCLua_MenuItem_VisibleIndexOf);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_MenuItem_Add);
	LuaSetTableFunction(L, Index, 'Add2', @VCLua_MenuItem_Add2);
	LuaSetTableFunction(L, Index, 'AddSeparator', @VCLua_MenuItem_AddSeparator);
	LuaSetTableFunction(L, Index, 'Click', @VCLua_MenuItem_Click);
	LuaSetTableFunction(L, Index, 'Delete', @VCLua_MenuItem_Delete);
	LuaSetTableFunction(L, Index, 'HandleNeeded', @VCLua_MenuItem_HandleNeeded);
	LuaSetTableFunction(L, Index, 'Insert', @VCLua_MenuItem_Insert);
	LuaSetTableFunction(L, Index, 'RecreateHandle', @VCLua_MenuItem_RecreateHandle);
	LuaSetTableFunction(L, Index, 'Remove', @VCLua_MenuItem_Remove);
	LuaSetTableFunction(L, Index, 'UpdateImage', @VCLua_MenuItem_UpdateImage);
	LuaSetTableFunction(L, Index, 'UpdateImages', @VCLua_MenuItem_UpdateImages);
	LuaSetTableFunction(L, Index, 'IsCheckItem', @VCLua_MenuItem_IsCheckItem);
	LuaSetTableFunction(L, Index, 'IsLine', @VCLua_MenuItem_IsLine);
	LuaSetTableFunction(L, Index, 'IsInMenuBar', @VCLua_MenuItem_IsInMenuBar);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_MenuItem_Clear);
	LuaSetTableFunction(L, Index, 'HasBitmap', @VCLua_MenuItem_HasBitmap);
	LuaSetTableFunction(L, Index, 'MenuVisibleIndex', @VCLua_MenuItem_MenuVisibleIndex);
	LuaSetTableFunction(L, Index, 'WriteDebugReport', @VCLua_MenuItem_WriteDebugReport);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lMenuItem.LuaCtl := TVCLuaControl.Create(TControl(lMenuItem),L,@MenuItemToTable);
	InitControl(L,lMenuItem,Name);
	MenuItemToTable(L, -1, lMenuItem);
	Result := 1;
end;

procedure MainMenuToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Merge', @VCLua_MainMenu_Merge);
	LuaSetTableFunction(L, Index, 'Unmerge', @VCLua_MainMenu_Unmerge);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_MenuItem_Add);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lMainMenu.LuaCtl := TVCLuaControl.Create(TControl(lMainMenu),L,@MainMenuToTable);
	InitControl(L,lMainMenu,Name);
	MainMenuToTable(L, -1, lMainMenu);
	Result := 1;
end;

end.
