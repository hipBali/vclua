(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaListView;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls;

procedure ListItemToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaListItem = class(TListItem)
		public
			L:Plua_State;   
    end;

procedure ListItemsToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaListItems = class(TListItems)
		public
			L:Plua_State;   
    end;

function CreateListView(L: Plua_State): Integer; cdecl;
procedure ListViewToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaListView = class(TListView)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_ListItem_Assign(L: Plua_State): Integer; cdecl;
var 
	lListItem:TLuaListItem;
	ASource:TPersistent;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	ASource := TPersistent(GetLuaObject(L,2));
	lListItem.Assign(ASource);
	
	Result := 0;
end;

function VCLua_ListItem_Delete(L: Plua_State): Integer; cdecl;
var 
	lListItem:TLuaListItem;
begin
	CheckArg(L, 1);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	lListItem.Delete();
	
	Result := 0;
end;

function VCLua_ListItem_MakeVisible(L: Plua_State): Integer; cdecl;
var 
	lListItem:TLuaListItem;
	PartialOK:Boolean;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	PartialOK := lua_toboolean(L,2);
	lListItem.MakeVisible(PartialOK);
	
	Result := 0;
end;

function VCLua_ListItem_DisplayRect(L: Plua_State): Integer; cdecl;
var 
	lListItem:TLuaListItem;
	Code:TDisplayCode;
	ret:TRect;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	Code := TDisplayCode(GetLuaObject(L,2));
	ret := lListItem.DisplayRect(Code);
	lua_pushTRect(L,ret);
	
	Result := 1;
end;

function VCLua_ListItem_DisplayRectSubItem(L: Plua_State): Integer; cdecl;
var 
	lListItem:TLuaListItem;
	subItem:integer;
	Code:TDisplayCode;
	ret:TRect;
begin
	CheckArg(L, 3);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	subItem := lua_tointeger(L,2);
	Code := TDisplayCode(GetLuaObject(L,3));
	ret := lListItem.DisplayRectSubItem(subItem,Code);
	lua_pushTRect(L,ret);
	
	Result := 1;
end;

function VCLua_ListItem_EditCaption(L: Plua_State): Integer; cdecl;
var 
	lListItem:TLuaListItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	ret := lListItem.EditCaption();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ListItems_Add(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	ret:TListItem;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	ret := lListItems.Add();
	ListItemsToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListItems_AddItem(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AItem:TListItem;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AItem := TListItem(GetLuaObject(L,2));
	lListItems.AddItem(AItem);
	
	Result := 0;
end;

function VCLua_ListItems_BeginUpdate(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	lListItems.BeginUpdate();
	
	Result := 0;
end;

function VCLua_ListItems_Clear(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	lListItems.Clear();
	
	Result := 0;
end;

function VCLua_ListItems_Delete(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AIndex :Integer;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AIndex  := lua_tointeger(L,2);
	lListItems.Delete(AIndex );
	
	Result := 0;
end;

function VCLua_ListItems_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	lListItems.EndUpdate();
	
	Result := 0;
end;

function VCLua_ListItems_Exchange(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AIndex1:Integer;
	AIndex2:Integer;
begin
	CheckArg(L, 3);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AIndex1 := lua_tointeger(L,2);
	AIndex2 := lua_tointeger(L,3);
	lListItems.Exchange(AIndex1,AIndex2);
	
	Result := 0;
end;

function VCLua_ListItems_Move(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AFromIndex:Integer;
	AToIndex:Integer;
begin
	CheckArg(L, 3);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AFromIndex := lua_tointeger(L,2);
	AToIndex := lua_tointeger(L,3);
	lListItems.Move(AFromIndex,AToIndex);
	
	Result := 0;
end;

function VCLua_ListItems_FindCaption(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	StartIndex:Integer;
	Value:string;
	Partial:Boolean;
	Inclusive:Boolean;
	Wrap:Boolean;
	PartStart:Boolean;
	ret:TListItem;
begin
	CheckArg(L, -1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	StartIndex := lua_tointeger(L,2);
	Value := lua_tostring(L,3);
	Partial := lua_toboolean(L,4);
	Inclusive := lua_toboolean(L,5);
	Wrap := lua_toboolean(L,6);
	PartStart := luaL_optbool(L,7, True);
	ret := lListItems.FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart);
	ListItemsToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListItems_FindData(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AData:Pointer;
	ret:TListItem;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AData := Pointer(lua_touserdata(L,2));
	ret := lListItems.FindData(AData);
	ListItemsToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListItems_FindData2(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	StartIndex:Integer;
	Value:Pointer;
	Inclusive:Boolean;
	Wrap:Boolean;
	ret:TListItem;
begin
	CheckArg(L, 5);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	StartIndex := lua_tointeger(L,2);
	Value := Pointer(lua_touserdata(L,3));
	Inclusive := lua_toboolean(L,4);
	Wrap := lua_toboolean(L,5);
	ret := lListItems.FindData(StartIndex,Value,Inclusive,Wrap);
	ListItemsToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListItems_GetEnumerator(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	ret:TListItemsEnumerator;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	ret := lListItems.GetEnumerator();
	ListItemsToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListItems_IndexOf(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AItem:TListItem;
	ret:Integer;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AItem := TListItem(GetLuaObject(L,2));
	ret := lListItems.IndexOf(AItem);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_ListItems_Insert(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AIndex:Integer;
	ret:TListItem;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	ret := lListItems.Insert(AIndex);
	ListItemsToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListItems_InsertItem(L: Plua_State): Integer; cdecl;
var 
	lListItems:TLuaListItems;
	AItem:TListItem;
	AIndex:Integer;
begin
	CheckArg(L, 3);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AItem := TListItem(GetLuaObject(L,2));
	AIndex := lua_tointeger(L,3);
	lListItems.InsertItem(AItem,AIndex);
	
	Result := 0;
end;

function VCLua_ListView_AddItem(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
	Item:string;
	AObject:TObject;
begin
	CheckArg(L, 3);
	lListView := TLuaListView(GetLuaObject(L, 1));
	Item := lua_tostring(L,2);
	AObject := TObject(GetLuaObject(L,3));
	lListView.AddItem(Item,AObject);
	
	Result := 0;
end;

function VCLua_ListView_Sort(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	lListView.Sort();
	
	Result := 0;
end;

function VCLua_ListView_CustomSort(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
	ASortProc:TLVCompare;
	AOptionalParam:PtrInt;
	ret:Boolean;
begin
	CheckArg(L, 3);
	lListView := TLuaListView(GetLuaObject(L, 1));
	ASortProc := TLVCompare(GetLuaObject(L,2));
	AOptionalParam := lua_tointeger(L,3);
	ret := lListView.CustomSort(ASortProc,AOptionalParam);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ListView_BeginUpdate(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	lListView.BeginUpdate();
	
	Result := 0;
end;

function VCLua_ListView_Clear(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	lListView.Clear();
	
	Result := 0;
end;

function VCLua_ListView_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	lListView.EndUpdate();
	
	Result := 0;
end;

function VCLua_ListView_Repaint(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	lListView.Repaint();
	
	Result := 0;
end;

function VCLua_ListView_FindCaption(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
	StartIndex:Integer;
	Value:string;
	Partial:Boolean;
	Inclusive:Boolean;
	Wrap:Boolean;
	PartStart:Boolean;
	ret:TListItem;
begin
	CheckArg(L, -1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	StartIndex := lua_tointeger(L,2);
	Value := lua_tostring(L,3);
	Partial := lua_toboolean(L,4);
	Inclusive := lua_toboolean(L,5);
	Wrap := lua_toboolean(L,6);
	PartStart := luaL_optbool(L,7, True);
	ret := lListView.FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart);
	ListViewToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListView_FindData(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
	StartIndex:Integer;
	Value:Pointer;
	Inclusive:Boolean;
	Wrap:Boolean;
	ret:TListItem;
begin
	CheckArg(L, 5);
	lListView := TLuaListView(GetLuaObject(L, 1));
	StartIndex := lua_tointeger(L,2);
	Value := Pointer(lua_touserdata(L,3));
	Inclusive := lua_toboolean(L,4);
	Wrap := lua_toboolean(L,5);
	ret := lListView.FindData(StartIndex,Value,Inclusive,Wrap);
	ListViewToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListView_GetItemAt(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
	x:integer;
	y:integer;
	ret:TListItem;
begin
	CheckArg(L, 3);
	lListView := TLuaListView(GetLuaObject(L, 1));
	x := lua_tointeger(L,2);
	y := lua_tointeger(L,3);
	ret := lListView.GetItemAt(x,y);
	ListViewToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListView_GetNearestItem(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
	APoint:TPoint;
	Direction:TSearchDirection;
	ret:TListItem;
begin
	CheckArg(L, 3);
	lListView := TLuaListView(GetLuaObject(L, 1));
	APoint := lua_toTPoint(L,2);
	Direction := TSearchDirection(GetLuaObject(L,3));
	ret := lListView.GetNearestItem(APoint,Direction);
	ListViewToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListView_GetNextItem(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
	StartItem:TListItem;
	Direction:TSearchDirection;
	States:TListItemStates;
	ret:TListItem;
begin
	CheckArg(L, 4);
	lListView := TLuaListView(GetLuaObject(L, 1));
	StartItem := TListItem(GetLuaObject(L,2));
	Direction := TSearchDirection(GetLuaObject(L,3));
	States := TListItemStates(GetEnumValue(TypeInfo(TListItemStates),lua_tostring(L,4)));
	ret := lListView.GetNextItem(StartItem,Direction,States);
	ListViewToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ListView_ClearSelection(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	lListView.ClearSelection();
	
	Result := 0;
end;

function VCLua_ListView_SelectAll(L: Plua_State): Integer; cdecl;
var 
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	lListView.SelectAll();
	
	Result := 0;
end;

procedure ListItemToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_ListItem_Assign);
	LuaSetTableFunction(L, Index, 'Delete', @VCLua_ListItem_Delete);
	LuaSetTableFunction(L, Index, 'MakeVisible', @VCLua_ListItem_MakeVisible);
	LuaSetTableFunction(L, Index, 'DisplayRect', @VCLua_ListItem_DisplayRect);
	LuaSetTableFunction(L, Index, 'DisplayRectSubItem', @VCLua_ListItem_DisplayRectSubItem);
	LuaSetTableFunction(L, Index, 'EditCaption', @VCLua_ListItem_EditCaption);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

procedure ListItemsToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_ListItems_Add);
	LuaSetTableFunction(L, Index, 'AddItem', @VCLua_ListItems_AddItem);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_ListItems_BeginUpdate);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_ListItems_Clear);
	LuaSetTableFunction(L, Index, 'Delete', @VCLua_ListItems_Delete);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_ListItems_EndUpdate);
	LuaSetTableFunction(L, Index, 'Exchange', @VCLua_ListItems_Exchange);
	LuaSetTableFunction(L, Index, 'Move', @VCLua_ListItems_Move);
	LuaSetTableFunction(L, Index, 'FindCaption', @VCLua_ListItems_FindCaption);
	LuaSetTableFunction(L, Index, 'FindData', @VCLua_ListItems_FindData);
	LuaSetTableFunction(L, Index, 'FindData2', @VCLua_ListItems_FindData2);
	LuaSetTableFunction(L, Index, 'GetEnumerator', @VCLua_ListItems_GetEnumerator);
	LuaSetTableFunction(L, Index, 'IndexOf', @VCLua_ListItems_IndexOf);
	LuaSetTableFunction(L, Index, 'Insert', @VCLua_ListItems_Insert);
	LuaSetTableFunction(L, Index, 'InsertItem', @VCLua_ListItems_InsertItem);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

procedure ListViewToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AddItem', @VCLua_ListView_AddItem);
	LuaSetTableFunction(L, Index, 'Sort', @VCLua_ListView_Sort);
	LuaSetTableFunction(L, Index, 'CustomSort', @VCLua_ListView_CustomSort);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_ListView_BeginUpdate);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_ListView_Clear);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_ListView_EndUpdate);
	LuaSetTableFunction(L, Index, 'Repaint', @VCLua_ListView_Repaint);
	LuaSetTableFunction(L, Index, 'FindCaption', @VCLua_ListView_FindCaption);
	LuaSetTableFunction(L, Index, 'FindData', @VCLua_ListView_FindData);
	LuaSetTableFunction(L, Index, 'GetItemAt', @VCLua_ListView_GetItemAt);
	LuaSetTableFunction(L, Index, 'GetNearestItem', @VCLua_ListView_GetNearestItem);
	LuaSetTableFunction(L, Index, 'GetNextItem', @VCLua_ListView_GetNextItem);
	LuaSetTableFunction(L, Index, 'ClearSelection', @VCLua_ListView_ClearSelection);
	LuaSetTableFunction(L, Index, 'SelectAll', @VCLua_ListView_SelectAll);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateListView(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lListView := TLuaListView.Create(Parent);
	lListView.Parent := TWinControl(Parent);
	lListView.LuaCtl := TVCLuaControl.Create(TControl(lListView),L,@ListViewToTable);
	InitControl(L,lListView,Name);
	ListViewToTable(L, -1, lListView);
	Result := 1;
end;

end.
