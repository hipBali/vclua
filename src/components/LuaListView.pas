(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaListView;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function IsListItem(L: Plua_State): Integer; cdecl;
function AsListItem(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListItem; pti: PTypeInfo = nil); overload; inline;
procedure ListItemToTable(L:Plua_State; Index:Integer; Sender:TObject);

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
procedure ListItemsToTable(L:Plua_State; Index:Integer; Sender:TObject);

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
procedure ListViewToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaListView = class(TListView)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomListViewFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	AIndex:Integer;
begin
	CheckArg(L, 2);
	lListItems := TLuaListItems(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	lListItems.Delete(AIndex);
	
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
	Value := lua_toStringCP(L,3);
	Partial := lua_toboolean(L,4);
	Inclusive := lua_toboolean(L,5);
	Wrap := lua_toboolean(L,6);
	PartStart := luaL_optbool(L,7,True);
	ret := lListItems.FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart);
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	Item := lua_toStringCP(L,2);
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
	lua_push(L,ret);
	
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
	Value := lua_toStringCP(L,3);
	Partial := lua_toboolean(L,4);
	Inclusive := lua_toboolean(L,5);
	Wrap := lua_toboolean(L,6);
	PartStart := luaL_optbool(L,7,True);
	ret := lListView.FindCaption(StartIndex,Value,Partial,Inclusive,Wrap,PartStart);
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	ListItemToTable(L,-1,v);
end;
procedure ListItemToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TListItem');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	ListItemsToTable(L,-1,v);
end;
procedure ListItemsToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TListItems');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	ListViewToTable(L,-1,v);
end;
procedure ListViewToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomListView');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lListView.LuaCtl := TVCLuaControl.Create(lListView as TComponent,L,@ListViewToTable);
	InitControl(L,lListView,Name);
	ListViewToTable(L, -1, lListView);
	Result := 1;
end;

begin
	SetLength(ListItemFuncs, 6+1);
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
	ListItemFuncs[6].name:=nil;
	ListItemFuncs[6].func:=nil;

	SetLength(ListItemsFuncs, 14+1);
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
	ListItemsFuncs[14].name:=nil;
	ListItemsFuncs[14].func:=nil;

	SetLength(CustomListViewFuncs, 14+1);
	CustomListViewFuncs[0].name:='AddItem';
	CustomListViewFuncs[0].func:=@VCLua_ListView_AddItem;
	CustomListViewFuncs[1].name:='Sort';
	CustomListViewFuncs[1].func:=@VCLua_ListView_Sort;
	CustomListViewFuncs[2].name:='CustomSort';
	CustomListViewFuncs[2].func:=@VCLua_ListView_CustomSort;
	CustomListViewFuncs[3].name:='BeginUpdate';
	CustomListViewFuncs[3].func:=@VCLua_ListView_BeginUpdate;
	CustomListViewFuncs[4].name:='Clear';
	CustomListViewFuncs[4].func:=@VCLua_ListView_Clear;
	CustomListViewFuncs[5].name:='EndUpdate';
	CustomListViewFuncs[5].func:=@VCLua_ListView_EndUpdate;
	CustomListViewFuncs[6].name:='Repaint';
	CustomListViewFuncs[6].func:=@VCLua_ListView_Repaint;
	CustomListViewFuncs[7].name:='FindCaption';
	CustomListViewFuncs[7].func:=@VCLua_ListView_FindCaption;
	CustomListViewFuncs[8].name:='FindData';
	CustomListViewFuncs[8].func:=@VCLua_ListView_FindData;
	CustomListViewFuncs[9].name:='GetItemAt';
	CustomListViewFuncs[9].func:=@VCLua_ListView_GetItemAt;
	CustomListViewFuncs[10].name:='GetNearestItem';
	CustomListViewFuncs[10].func:=@VCLua_ListView_GetNearestItem;
	CustomListViewFuncs[11].name:='GetNextItem';
	CustomListViewFuncs[11].func:=@VCLua_ListView_GetNextItem;
	CustomListViewFuncs[12].name:='ClearSelection';
	CustomListViewFuncs[12].func:=@VCLua_ListView_ClearSelection;
	CustomListViewFuncs[13].name:='SelectAll';
	CustomListViewFuncs[13].func:=@VCLua_ListView_SelectAll;
	CustomListViewFuncs[14].name:=nil;
	CustomListViewFuncs[14].func:=nil;

end.
