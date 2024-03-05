(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaListView;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

procedure lua_push(L: Plua_State; const v: TListItem; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListItem = class(TListItem)
    public
      L:Plua_State;
    end;
var
    ListItemFuncs: TLuaVmt;
    ListItemSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TListItems; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListItems = class(TListItems)
    public
      L:Plua_State;
    end;
var
    ListItemsFuncs: TLuaVmt;
    ListItemsSets: TLuaVmt;

function CreateListView(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListView; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListView = class(TListView)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomListViewFuncs: TLuaVmt;
    CustomListViewSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaCanvas;

function VCLua_ListItem_Assign(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	ASource:TPersistent;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	luaL_check(L,2,@ASource);
	try
		lListItem.Assign(ASource);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItem_Delete(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
begin
	CheckArg(L, 1);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	try
		lListItem.Delete();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItem_MakeVisible(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	PartialOK:Boolean;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	luaL_check(L,2,@PartialOK);
	try
		lListItem.MakeVisible(PartialOK);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'MakeVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItem_DisplayRect(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	Code:TDisplayCode;
	ret:TRect;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	luaL_check(L,2,@Code,TypeInfo(TDisplayCode));
	try
		ret := lListItem.DisplayRect(Code);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'DisplayRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@subItem);
	luaL_check(L,3,@Code,TypeInfo(TDisplayCode));
	try
		ret := lListItem.DisplayRectSubItem(subItem,Code);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'DisplayRectSubItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItem_EditCaption(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	try
		ret := lListItem.EditCaption();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'EditCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItem_VCLuaSetData(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	val:Pointer;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	val := Pointer(lua_touserdata(L,2));
	try
		lListItem.Data := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'Data', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItem_VCLuaGetData(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	ret:Pointer;
begin
	CheckArg(L, 1);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	try
		ret := lListItem.Data;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'Data', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ret);
end;

function VCLua_ListItem_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	val:TPoint;
begin
	CheckArg(L, 2);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListItem.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'Position', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItem_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	try
		ret := lListItem.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'Position', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItem_SubItemImages(L: Plua_State): Integer; cdecl;
var
	lListItem:TLuaListItem;
	AIndex:Integer;
	ret:Integer;
begin
	CheckArg(L, 2, 3);
	lListItem := TLuaListItem(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		if lua_isnone(L, 3) then begin
			ret := lListItem.SubItemImages[AIndex];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lListItem.SubItemImages[AIndex] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'ListItem', 'SubItemImages', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_Add(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	ret:TListItem;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	try
		ret := lListItems.Add();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItems_AddItem(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AItem:TListItem;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AItem);
	try
		lListItems.AddItem(AItem);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'AddItem', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	try
		lListItems.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_Clear(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	try
		lListItems.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_Delete(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AIndex:Integer;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		lListItems.Delete(AIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	try
		lListItems.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_Exchange(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AIndex1:Integer;
	AIndex2:Integer;
begin
	CheckArg(L, 3);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex1);
	luaL_check(L,3,@AIndex2);
	try
		lListItems.Exchange(AIndex1,AIndex2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Exchange', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_Move(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AFromIndex:Integer;
	AToIndex:Integer;
begin
	CheckArg(L, 3);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AFromIndex);
	luaL_check(L,3,@AToIndex);
	try
		lListItems.Move(AFromIndex,AToIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Move', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 6, 7);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@StartIndex);
	luaL_check(L,3,@Value);
	luaL_check(L,4,@Partial);
	luaL_check(L,5,@Inclusive);
	luaL_check(L,6,@Wrap);
	TTrait<Boolean>.luaL_optcheck(L, 7, @PartStart, True);
	try
		ret := lListItems.FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'FindCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	try
		ret := lListItems.FindData(AData);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'FindData', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@StartIndex);
	Value := Pointer(lua_touserdata(L,3));
	luaL_check(L,4,@Inclusive);
	luaL_check(L,5,@Wrap);
	try
		ret := lListItems.FindData(StartIndex,Value,Inclusive,Wrap);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'FindData', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItems_IndexOf(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AItem:TListItem;
	ret:Integer;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AItem);
	try
		ret := lListItems.IndexOf(AItem);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItems_Insert(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AIndex:Integer;
	ret:TListItem;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lListItems.Insert(AIndex);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Insert', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItems_InsertItem(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AItem:TListItem;
	AIndex:Integer;
begin
	CheckArg(L, 3);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AItem);
	luaL_check(L,3,@AIndex);
	try
		lListItems.InsertItem(AItem,AIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'InsertItem', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_VCLuaGetFlags(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	ret:TListItemsFlags;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	try
		ret := lListItems.Flags;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Flags', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ListItems_VCLuaSetCount(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	val:Integer;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListItems.Count := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Count', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_VCLuaGetCount(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	try
		ret := lListItems.Count;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Count', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListItems_Item(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	AIndex:Integer;
	ret:TListItem;
begin
	CheckArg(L, 2, 3);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		if lua_isnone(L, 3) then begin
			ret := lListItems.Item[AIndex];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lListItems.Item[AIndex] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Item', E.ClassName, E.Message);
	end;
end;

function VCLua_ListItems_VCLuaGetOwner(L: Plua_State): Integer; cdecl;
var
	lListItems:TLuaListItems;
	ret:TCustomListView;
begin
	CheckArg(L, 1);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	try
		ret := lListItems.Owner;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListItems', 'Owner', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ListView_AddItem(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	Item:string;
	AObject:TObject;
begin
	CheckArg(L, 3);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@Item);
	luaL_check(L,3,@AObject);
	try
		lListView.AddItem(Item,AObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'AddItem', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_Sort(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		lListView.Sort();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Sort', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		lListView.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_Clear(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		lListView.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		lListView.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_Repaint(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		lListView.Repaint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Repaint', E.ClassName, E.Message);
	end;
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
	CheckArg(L, 6, 7);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@StartIndex);
	luaL_check(L,3,@Value);
	luaL_check(L,4,@Partial);
	luaL_check(L,5,@Inclusive);
	luaL_check(L,6,@Wrap);
	TTrait<Boolean>.luaL_optcheck(L, 7, @PartStart, True);
	try
		ret := lListView.FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'FindCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@StartIndex);
	Value := Pointer(lua_touserdata(L,3));
	luaL_check(L,4,@Inclusive);
	luaL_check(L,5,@Wrap);
	try
		ret := lListView.FindData(StartIndex,Value,Inclusive,Wrap);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'FindData', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@x);
	luaL_check(L,3,@y);
	try
		ret := lListView.GetItemAt(x,y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'GetItemAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@APoint);
	luaL_check(L,3,@Direction,TypeInfo(TSearchDirection));
	try
		ret := lListView.GetNearestItem(APoint,Direction);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'GetNearestItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@StartItem);
	luaL_check(L,3,@Direction,TypeInfo(TSearchDirection));
	luaL_checkSet(L,4,@States,TypeInfo(TListItemStates));
	try
		ret := lListView.GetNextItem(StartItem,Direction,States);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'GetNextItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_ClearSelection(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		lListView.ClearSelection();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ClearSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_SelectAll(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		lListView.SelectAll();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'SelectAll', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetBoundingRect(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TRect;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.BoundingRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'BoundingRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TCanvas;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Canvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetCheckboxes(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.Checkboxes := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Checkboxes', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetCheckboxes(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.Checkboxes;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Checkboxes', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_Column(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	AIndex:Integer;
	ret:TListColumn;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lListView.Column[AIndex];
		lua_push(L,ret,TypeInfo(ret));
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Column', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetColumnCount(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.ColumnCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ColumnCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetDropTarget(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:TListItem;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.DropTarget := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'DropTarget', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetDropTarget(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TListItem;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.DropTarget;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'DropTarget', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetFlatScrollBars(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.FlatScrollBars := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'FlatScrollBars', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetFlatScrollBars(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.FlatScrollBars;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'FlatScrollBars', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetFullDrag(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.FullDrag := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'FullDrag', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetFullDrag(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.FullDrag;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'FullDrag', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetGridLines(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.GridLines := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'GridLines', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetGridLines(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.GridLines;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'GridLines', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetHotTrack(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.HotTrack := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'HotTrack', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetHotTrack(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.HotTrack;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'HotTrack', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetHotTrackStyles(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:TListHotTrackStyles;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TListHotTrackStyles));
	try
		lListView.HotTrackStyles := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'HotTrackStyles', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetHotTrackStyles(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TListHotTrackStyles;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.HotTrackStyles;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'HotTrackStyles', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ListView_VCLuaSetIconOptions(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:TIconOptions;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.IconOptions := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'IconOptions', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetIconOptions(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TIconOptions;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.IconOptions;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'IconOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ListView_VCLuaSetItemFocused(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:TListItem;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.ItemFocused := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ItemFocused', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetItemFocused(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TListItem;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.ItemFocused;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ItemFocused', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetItemIndex(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Integer;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.ItemIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ItemIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetItemIndex(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.ItemIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ItemIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetItems(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:TListItems;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.Items := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetItems(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TListItems;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.Items;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Items', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.MultiSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'MultiSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.MultiSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'MultiSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetOwnerData(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.OwnerData := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'OwnerData', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetOwnerData(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.OwnerData;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'OwnerData', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetReadOnly(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.ReadOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ReadOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetReadOnly(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.ReadOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetRowSelect(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:Boolean;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.RowSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'RowSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetRowSelect(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.RowSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'RowSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaGetSelCount(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.SelCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'SelCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetSelected(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:TListItem;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.Selected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Selected', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetSelected(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TListItem;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.Selected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'Selected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaGetLastSelected(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TListItem;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.LastSelected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'LastSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaGetTopItem(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TListItem;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.TopItem;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'TopItem', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaSetViewOrigin(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	val:TPoint;
begin
	CheckArg(L, 2);
	lListView := TLuaListView(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListView.ViewOrigin := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ViewOrigin', E.ClassName, E.Message);
	end;
end;

function VCLua_ListView_VCLuaGetViewOrigin(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.ViewOrigin;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'ViewOrigin', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListView_VCLuaGetVisibleRowCount(L: Plua_State): Integer; cdecl;
var
	lListView:TLuaListView;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListView := TLuaListView(GetLuaObject(L, 1));
	try
		ret := lListView.VisibleRowCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListView', 'VisibleRowCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TListItem; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TListItem',v);
end;

procedure lua_push(L: Plua_State; const v: TListItems; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TListItems',v);
end;

procedure lua_push(L: Plua_State; const v: TListView; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomListView',v);
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
	lListView.LuaCtl := TVCLuaControl.Create(lListView as TComponent,L,nil,'TCustomListView');
	InitControl(L,lListView,Name);
	CreateTableForKnownType(L,'TCustomListView',lListView);
	Result := 1;
end;

begin
	ListItemFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ListItemFuncs, 'Assign', @VCLua_ListItem_Assign);
	TLuaMethodInfo.Create(ListItemFuncs, 'Delete', @VCLua_ListItem_Delete);
	TLuaMethodInfo.Create(ListItemFuncs, 'MakeVisible', @VCLua_ListItem_MakeVisible);
	TLuaMethodInfo.Create(ListItemFuncs, 'DisplayRect', @VCLua_ListItem_DisplayRect);
	TLuaMethodInfo.Create(ListItemFuncs, 'DisplayRectSubItem', @VCLua_ListItem_DisplayRectSubItem);
	TLuaMethodInfo.Create(ListItemFuncs, 'EditCaption', @VCLua_ListItem_EditCaption);
	TLuaMethodInfo.Create(ListItemFuncs, 'Data', @VCLua_ListItem_VCLuaGetData, mfCall);
	TLuaMethodInfo.Create(ListItemFuncs, 'Position', @VCLua_ListItem_VCLuaGetPosition, mfCall);
	TLuaMethodInfo.Create(ListItemFuncs, 'SubItemImages', @VCLua_ListItem_SubItemImages);
	ListItemSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ListItemSets, 'Data', @VCLua_ListItem_VCLuaSetData, mfCall);
	TLuaMethodInfo.Create(ListItemSets, 'Position', @VCLua_ListItem_VCLuaSetPosition, mfCall);
	ListItemsFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ListItemsFuncs, 'Add', @VCLua_ListItems_Add);
	TLuaMethodInfo.Create(ListItemsFuncs, 'AddItem', @VCLua_ListItems_AddItem);
	TLuaMethodInfo.Create(ListItemsFuncs, 'BeginUpdate', @VCLua_ListItems_BeginUpdate);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Clear', @VCLua_ListItems_Clear);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Delete', @VCLua_ListItems_Delete);
	TLuaMethodInfo.Create(ListItemsFuncs, 'EndUpdate', @VCLua_ListItems_EndUpdate);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Exchange', @VCLua_ListItems_Exchange);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Move', @VCLua_ListItems_Move);
	TLuaMethodInfo.Create(ListItemsFuncs, 'FindCaption', @VCLua_ListItems_FindCaption);
	TLuaMethodInfo.Create(ListItemsFuncs, 'FindData', @VCLua_ListItems_FindData);
	TLuaMethodInfo.Create(ListItemsFuncs, 'FindData2', @VCLua_ListItems_FindData2);
	TLuaMethodInfo.Create(ListItemsFuncs, 'IndexOf', @VCLua_ListItems_IndexOf);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Insert', @VCLua_ListItems_Insert);
	TLuaMethodInfo.Create(ListItemsFuncs, 'InsertItem', @VCLua_ListItems_InsertItem);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Flags', @VCLua_ListItems_VCLuaGetFlags, mfCall);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Count', @VCLua_ListItems_VCLuaGetCount, mfCall);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Item', @VCLua_ListItems_Item);
	TLuaMethodInfo.Create(ListItemsFuncs, 'Owner', @VCLua_ListItems_VCLuaGetOwner, mfCall);
	ListItemsSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ListItemsSets, 'Count', @VCLua_ListItems_VCLuaSetCount, mfCall);
	CustomListViewFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomListViewFuncs, 'AddItem', @VCLua_ListView_AddItem);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Sort', @VCLua_ListView_Sort);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'BeginUpdate', @VCLua_ListView_BeginUpdate);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Clear', @VCLua_ListView_Clear);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'EndUpdate', @VCLua_ListView_EndUpdate);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Repaint', @VCLua_ListView_Repaint);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'FindCaption', @VCLua_ListView_FindCaption);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'FindData', @VCLua_ListView_FindData);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'GetItemAt', @VCLua_ListView_GetItemAt);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'GetNearestItem', @VCLua_ListView_GetNearestItem);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'GetNextItem', @VCLua_ListView_GetNextItem);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'ClearSelection', @VCLua_ListView_ClearSelection);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'SelectAll', @VCLua_ListView_SelectAll);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'BoundingRect', @VCLua_ListView_VCLuaGetBoundingRect, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Canvas', @VCLua_ListView_VCLuaGetCanvas, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Checkboxes', @VCLua_ListView_VCLuaGetCheckboxes, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Column', @VCLua_ListView_Column);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'ColumnCount', @VCLua_ListView_VCLuaGetColumnCount, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'DropTarget', @VCLua_ListView_VCLuaGetDropTarget, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'FlatScrollBars', @VCLua_ListView_VCLuaGetFlatScrollBars, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'FullDrag', @VCLua_ListView_VCLuaGetFullDrag, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'GridLines', @VCLua_ListView_VCLuaGetGridLines, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'HotTrack', @VCLua_ListView_VCLuaGetHotTrack, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'HotTrackStyles', @VCLua_ListView_VCLuaGetHotTrackStyles, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'IconOptions', @VCLua_ListView_VCLuaGetIconOptions, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'ItemFocused', @VCLua_ListView_VCLuaGetItemFocused, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'ItemIndex', @VCLua_ListView_VCLuaGetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Items', @VCLua_ListView_VCLuaGetItems, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'MultiSelect', @VCLua_ListView_VCLuaGetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'OwnerData', @VCLua_ListView_VCLuaGetOwnerData, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'ReadOnly', @VCLua_ListView_VCLuaGetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'RowSelect', @VCLua_ListView_VCLuaGetRowSelect, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'SelCount', @VCLua_ListView_VCLuaGetSelCount, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'Selected', @VCLua_ListView_VCLuaGetSelected, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'LastSelected', @VCLua_ListView_VCLuaGetLastSelected, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'TopItem', @VCLua_ListView_VCLuaGetTopItem, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'ViewOrigin', @VCLua_ListView_VCLuaGetViewOrigin, mfCall);
	TLuaMethodInfo.Create(CustomListViewFuncs, 'VisibleRowCount', @VCLua_ListView_VCLuaGetVisibleRowCount, mfCall);
	CustomListViewSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomListViewSets, 'Checkboxes', @VCLua_ListView_VCLuaSetCheckboxes, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'DropTarget', @VCLua_ListView_VCLuaSetDropTarget, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'FlatScrollBars', @VCLua_ListView_VCLuaSetFlatScrollBars, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'FullDrag', @VCLua_ListView_VCLuaSetFullDrag, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'GridLines', @VCLua_ListView_VCLuaSetGridLines, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'HotTrack', @VCLua_ListView_VCLuaSetHotTrack, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'HotTrackStyles', @VCLua_ListView_VCLuaSetHotTrackStyles, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'IconOptions', @VCLua_ListView_VCLuaSetIconOptions, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'ItemFocused', @VCLua_ListView_VCLuaSetItemFocused, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'ItemIndex', @VCLua_ListView_VCLuaSetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'Items', @VCLua_ListView_VCLuaSetItems, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'MultiSelect', @VCLua_ListView_VCLuaSetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'OwnerData', @VCLua_ListView_VCLuaSetOwnerData, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'ReadOnly', @VCLua_ListView_VCLuaSetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'RowSelect', @VCLua_ListView_VCLuaSetRowSelect, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'Selected', @VCLua_ListView_VCLuaSetSelected, mfCall);
	TLuaMethodInfo.Create(CustomListViewSets, 'ViewOrigin', @VCLua_ListView_VCLuaSetViewOrigin, mfCall);
end.
