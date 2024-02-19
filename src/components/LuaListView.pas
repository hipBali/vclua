(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaListView;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo;

function IsListItem(L: Plua_State): Integer; cdecl;
function AsListItem(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListItem; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListItem = class(TListItem)
    public
      L:Plua_State;
    end;
var
    ListItemFuncs: aoluaL_Reg;

function IsListItems(L: Plua_State): Integer; cdecl;
function AsListItems(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListItems; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListItems = class(TListItems)
    public
      L:Plua_State;
    end;
var
    ListItemsFuncs: aoluaL_Reg;

function CreateListView(L: Plua_State): Integer; cdecl;
function IsListView(L: Plua_State): Integer; cdecl;
function AsListView(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListView; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListView = class(TListView)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomListViewFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

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

function IsListItem(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TListItem);
end;
function AsListItem(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TListItem then
    lua_push(L, TListItem(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TListItem; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TListItem',v);
end;

function IsListItems(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TListItems);
end;
function AsListItems(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TListItems then
    lua_push(L, TListItems(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TListItems; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TListItems',v);
end;

function IsListView(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TListView);
end;
function AsListView(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TListView then
    lua_push(L, TListView(o))
  else
    lua_pushnil(L);
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
	SetLength(ListItemFuncs, 7+1);
	ListItemFuncs[0].name:='Assign';
	ListItemFuncs[0].func:=@VCLua_ListItem_Assign;
	ListItemFuncs[1].name:='Delete';
	ListItemFuncs[1].func:=@VCLua_ListItem_Delete;
	ListItemFuncs[2].name:='MakeVisible';
	ListItemFuncs[2].func:=@VCLua_ListItem_MakeVisible;
	ListItemFuncs[3].name:='DisplayRect';
	ListItemFuncs[3].func:=@VCLua_ListItem_DisplayRect;
	ListItemFuncs[4].name:='DisplayRectSubItem';
	ListItemFuncs[4].func:=@VCLua_ListItem_DisplayRectSubItem;
	ListItemFuncs[5].name:='EditCaption';
	ListItemFuncs[5].func:=@VCLua_ListItem_EditCaption;
	ListItemFuncs[6].name:='SubItemImages';
	ListItemFuncs[6].func:=@VCLua_ListItem_SubItemImages;
	ListItemFuncs[7].name:=nil;
	ListItemFuncs[7].func:=nil;

	SetLength(ListItemsFuncs, 15+1);
	ListItemsFuncs[0].name:='Add';
	ListItemsFuncs[0].func:=@VCLua_ListItems_Add;
	ListItemsFuncs[1].name:='AddItem';
	ListItemsFuncs[1].func:=@VCLua_ListItems_AddItem;
	ListItemsFuncs[2].name:='BeginUpdate';
	ListItemsFuncs[2].func:=@VCLua_ListItems_BeginUpdate;
	ListItemsFuncs[3].name:='Clear';
	ListItemsFuncs[3].func:=@VCLua_ListItems_Clear;
	ListItemsFuncs[4].name:='Delete';
	ListItemsFuncs[4].func:=@VCLua_ListItems_Delete;
	ListItemsFuncs[5].name:='EndUpdate';
	ListItemsFuncs[5].func:=@VCLua_ListItems_EndUpdate;
	ListItemsFuncs[6].name:='Exchange';
	ListItemsFuncs[6].func:=@VCLua_ListItems_Exchange;
	ListItemsFuncs[7].name:='Move';
	ListItemsFuncs[7].func:=@VCLua_ListItems_Move;
	ListItemsFuncs[8].name:='FindCaption';
	ListItemsFuncs[8].func:=@VCLua_ListItems_FindCaption;
	ListItemsFuncs[9].name:='FindData';
	ListItemsFuncs[9].func:=@VCLua_ListItems_FindData;
	ListItemsFuncs[10].name:='FindData2';
	ListItemsFuncs[10].func:=@VCLua_ListItems_FindData2;
	ListItemsFuncs[11].name:='IndexOf';
	ListItemsFuncs[11].func:=@VCLua_ListItems_IndexOf;
	ListItemsFuncs[12].name:='Insert';
	ListItemsFuncs[12].func:=@VCLua_ListItems_Insert;
	ListItemsFuncs[13].name:='InsertItem';
	ListItemsFuncs[13].func:=@VCLua_ListItems_InsertItem;
	ListItemsFuncs[14].name:='Item';
	ListItemsFuncs[14].func:=@VCLua_ListItems_Item;
	ListItemsFuncs[15].name:=nil;
	ListItemsFuncs[15].func:=nil;

	SetLength(CustomListViewFuncs, 14+1);
	CustomListViewFuncs[0].name:='AddItem';
	CustomListViewFuncs[0].func:=@VCLua_ListView_AddItem;
	CustomListViewFuncs[1].name:='Sort';
	CustomListViewFuncs[1].func:=@VCLua_ListView_Sort;
	CustomListViewFuncs[2].name:='BeginUpdate';
	CustomListViewFuncs[2].func:=@VCLua_ListView_BeginUpdate;
	CustomListViewFuncs[3].name:='Clear';
	CustomListViewFuncs[3].func:=@VCLua_ListView_Clear;
	CustomListViewFuncs[4].name:='EndUpdate';
	CustomListViewFuncs[4].func:=@VCLua_ListView_EndUpdate;
	CustomListViewFuncs[5].name:='Repaint';
	CustomListViewFuncs[5].func:=@VCLua_ListView_Repaint;
	CustomListViewFuncs[6].name:='FindCaption';
	CustomListViewFuncs[6].func:=@VCLua_ListView_FindCaption;
	CustomListViewFuncs[7].name:='FindData';
	CustomListViewFuncs[7].func:=@VCLua_ListView_FindData;
	CustomListViewFuncs[8].name:='GetItemAt';
	CustomListViewFuncs[8].func:=@VCLua_ListView_GetItemAt;
	CustomListViewFuncs[9].name:='GetNearestItem';
	CustomListViewFuncs[9].func:=@VCLua_ListView_GetNearestItem;
	CustomListViewFuncs[10].name:='GetNextItem';
	CustomListViewFuncs[10].func:=@VCLua_ListView_GetNextItem;
	CustomListViewFuncs[11].name:='ClearSelection';
	CustomListViewFuncs[11].func:=@VCLua_ListView_ClearSelection;
	CustomListViewFuncs[12].name:='SelectAll';
	CustomListViewFuncs[12].func:=@VCLua_ListView_SelectAll;
	CustomListViewFuncs[13].name:='Column';
	CustomListViewFuncs[13].func:=@VCLua_ListView_Column;
	CustomListViewFuncs[14].name:=nil;
	CustomListViewFuncs[14].func:=nil;

end.
