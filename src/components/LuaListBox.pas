(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaListBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateListBox(L: Plua_State): Integer; cdecl;
function IsListBox(L: Plua_State): Integer; cdecl;
function AsListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListBox; pti: PTypeInfo = nil); overload; inline;
procedure ListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaListBox = class(TListBox)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_ListBox_AddItem(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	Item:String;
	AnObject:TObject;
begin
	CheckArg(L, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	Item := lua_toStringCP(L,2);
	AnObject := TObject(GetLuaObject(L,3));
	lListBox.AddItem(Item,AnObject);
	
	Result := 0;
end;

function VCLua_ListBox_Clear(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	lListBox.Clear();
	
	Result := 0;
end;

function VCLua_ListBox_ClearSelection(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	lListBox.ClearSelection();
	
	Result := 0;
end;

function VCLua_ListBox_GetIndexAtXY(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	X:integer;
	Y:integer;
	ret:integer;
begin
	CheckArg(L, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lListBox.GetIndexAtXY(X,Y);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_ListBox_GetIndexAtY(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	Y:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	Y := lua_tointeger(L,2);
	ret := lListBox.GetIndexAtY(Y);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_ListBox_GetSelectedText(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	ret:string;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	ret := lListBox.GetSelectedText();
	lua_pushStringCP(L,ret);
	
	Result := 1;
end;

function VCLua_ListBox_ItemAtPos(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	Pos:TPoint;
	Existing:Boolean;
	ret:Integer;
begin
	CheckArg(L, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	Pos := lua_toTPoint(L,2);
	Existing := lua_toboolean(L,3);
	ret := lListBox.ItemAtPos(Pos,Existing);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_ListBox_ItemRect(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	Index:Integer;
	ret:TRect;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	ret := lListBox.ItemRect(Index);
	lua_pushTRect(L,ret);
	
	Result := 1;
end;

function VCLua_ListBox_ItemVisible(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	Index:Integer;
	ret:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	ret := lListBox.ItemVisible(Index);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ListBox_ItemFullyVisible(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	Index:Integer;
	ret:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	ret := lListBox.ItemFullyVisible(Index);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ListBox_LockSelectionChange(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	lListBox.LockSelectionChange();
	
	Result := 0;
end;

function VCLua_ListBox_MakeCurrentVisible(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	lListBox.MakeCurrentVisible();
	
	Result := 0;
end;

function VCLua_ListBox_MeasureItem(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	Index:Integer;
	TheHeight:Integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lListBox.MeasureItem(Index,TheHeight);
	lua_pushinteger(L,TheHeight);
	Result := 1;
end;

function VCLua_ListBox_SelectAll(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	lListBox.SelectAll();
	
	Result := 0;
end;

function VCLua_ListBox_SelectRange(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
	ALow:integer;
	AHigh:integer;
	ASelected:boolean;
begin
	CheckArg(L, 4);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	ALow := lua_tointeger(L,2);
	AHigh := lua_tointeger(L,3);
	ASelected := lua_toboolean(L,4);
	lListBox.SelectRange(ALow,AHigh,ASelected);
	
	Result := 0;
end;

function VCLua_ListBox_DeleteSelected(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	lListBox.DeleteSelected();
	
	Result := 0;
end;

function VCLua_ListBox_UnlockSelectionChange(L: Plua_State): Integer; cdecl;
var 
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	lListBox.UnlockSelectionChange();
	
	Result := 0;
end;

function IsListBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TListBox);
end;
function AsListBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TListBox then
    lua_push(L, TListBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TListBox; pti: PTypeInfo);
begin
	ListBoxToTable(L,-1,v);
end;
procedure ListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AddItem', @VCLua_ListBox_AddItem);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_ListBox_Clear);
	LuaSetTableFunction(L, Index, 'ClearSelection', @VCLua_ListBox_ClearSelection);
	LuaSetTableFunction(L, Index, 'GetIndexAtXY', @VCLua_ListBox_GetIndexAtXY);
	LuaSetTableFunction(L, Index, 'GetIndexAtY', @VCLua_ListBox_GetIndexAtY);
	LuaSetTableFunction(L, Index, 'GetSelectedText', @VCLua_ListBox_GetSelectedText);
	LuaSetTableFunction(L, Index, 'ItemAtPos', @VCLua_ListBox_ItemAtPos);
	LuaSetTableFunction(L, Index, 'ItemRect', @VCLua_ListBox_ItemRect);
	LuaSetTableFunction(L, Index, 'ItemVisible', @VCLua_ListBox_ItemVisible);
	LuaSetTableFunction(L, Index, 'ItemFullyVisible', @VCLua_ListBox_ItemFullyVisible);
	LuaSetTableFunction(L, Index, 'LockSelectionChange', @VCLua_ListBox_LockSelectionChange);
	LuaSetTableFunction(L, Index, 'MakeCurrentVisible', @VCLua_ListBox_MakeCurrentVisible);
	LuaSetTableFunction(L, Index, 'MeasureItem', @VCLua_ListBox_MeasureItem);
	LuaSetTableFunction(L, Index, 'SelectAll', @VCLua_ListBox_SelectAll);
	LuaSetTableFunction(L, Index, 'SelectRange', @VCLua_ListBox_SelectRange);
	LuaSetTableFunction(L, Index, 'DeleteSelected', @VCLua_ListBox_DeleteSelected);
	LuaSetTableFunction(L, Index, 'UnlockSelectionChange', @VCLua_ListBox_UnlockSelectionChange);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateListBox(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lListBox := TLuaListBox.Create(Parent);
	lListBox.Parent := TWinControl(Parent);
	lListBox.LuaCtl := TVCLuaControl.Create(lListBox as TComponent,L,@ListBoxToTable);
	InitControl(L,lListBox,Name);
	ListBoxToTable(L, -1, lListBox);
	Result := 1;
end;

end.
