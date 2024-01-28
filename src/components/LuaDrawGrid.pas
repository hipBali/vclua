(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDrawGrid;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Grids, Controls, TypInfo;

function CreateDrawGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDrawGrid; pti: PTypeInfo = nil); overload; inline;
procedure DrawGridToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDrawGrid = class(TDrawGrid)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_DrawGrid_DeleteColRow(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	IsColumn:Boolean;
	index:Integer;
begin
	CheckArg(L, 3);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	index := lua_tointeger(L,3);
	lDrawGrid.DeleteColRow(IsColumn,index);
	
	Result := 0;
end;

function VCLua_DrawGrid_DeleteCol(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	Index:Integer;
begin
	CheckArg(L, 2);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lDrawGrid.DeleteCol(Index);
	
	Result := 0;
end;

function VCLua_DrawGrid_DeleteRow(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	Index:Integer;
begin
	CheckArg(L, 2);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lDrawGrid.DeleteRow(Index);
	
	Result := 0;
end;

function VCLua_DrawGrid_ExchangeColRow(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	IsColumn:Boolean;
	index:Integer;
	WithIndex:Integer;
begin
	CheckArg(L, 4);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	index := lua_tointeger(L,3);
	WithIndex := lua_tointeger(L,4);
	lDrawGrid.ExchangeColRow(IsColumn,index,WithIndex);
	
	Result := 0;
end;

function VCLua_DrawGrid_InsertColRow(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	IsColumn:boolean;
	index:integer;
begin
	CheckArg(L, 3);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	index := lua_tointeger(L,3);
	lDrawGrid.InsertColRow(IsColumn,index);
	
	Result := 0;
end;

function VCLua_DrawGrid_MoveColRow(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	IsColumn:Boolean;
	FromIndex:Integer;
	ToIndex:Integer;
begin
	CheckArg(L, 4);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	FromIndex := lua_tointeger(L,3);
	ToIndex := lua_tointeger(L,4);
	lDrawGrid.MoveColRow(IsColumn,FromIndex,ToIndex);
	
	Result := 0;
end;

function VCLua_DrawGrid_SortColRow(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	IsColumn:Boolean;
	index:Integer;
begin
	CheckArg(L, 3);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	index := lua_tointeger(L,3);
	lDrawGrid.SortColRow(IsColumn,index);
	
	Result := 0;
end;

function VCLua_DrawGrid_SortColRow2(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	IsColumn:Boolean;
	Index:Integer;
	FromIndex:Integer;
	ToIndex:Integer;
begin
	CheckArg(L, 5);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	Index := lua_tointeger(L,3);
	FromIndex := lua_tointeger(L,4);
	ToIndex := lua_tointeger(L,5);
	lDrawGrid.SortColRow(IsColumn,Index,FromIndex,ToIndex);
	
	Result := 0;
end;

function VCLua_DrawGrid_DefaultDrawCell(L: Plua_State): Integer; cdecl;
var 
	lDrawGrid:TLuaDrawGrid;
	aCol:Integer;
	aRow:Integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 4);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	aRow := lua_tointeger(L,3);
	aState := TGridDrawState(GetEnumValue(TypeInfo(TGridDrawState),lua_tostring(L,4)));
	lDrawGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
	lua_pushTRect(L,aRect);
	Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TDrawGrid; pti: PTypeInfo);
begin
	DrawGridToTable(L,-1,v);
end;
procedure DrawGridToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'DeleteColRow', @VCLua_DrawGrid_DeleteColRow);
	LuaSetTableFunction(L, Index, 'DeleteCol', @VCLua_DrawGrid_DeleteCol);
	LuaSetTableFunction(L, Index, 'DeleteRow', @VCLua_DrawGrid_DeleteRow);
	LuaSetTableFunction(L, Index, 'ExchangeColRow', @VCLua_DrawGrid_ExchangeColRow);
	LuaSetTableFunction(L, Index, 'InsertColRow', @VCLua_DrawGrid_InsertColRow);
	LuaSetTableFunction(L, Index, 'MoveColRow', @VCLua_DrawGrid_MoveColRow);
	LuaSetTableFunction(L, Index, 'SortColRow', @VCLua_DrawGrid_SortColRow);
	LuaSetTableFunction(L, Index, 'SortColRow2', @VCLua_DrawGrid_SortColRow2);
	LuaSetTableFunction(L, Index, 'DefaultDrawCell', @VCLua_DrawGrid_DefaultDrawCell);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateDrawGrid(L: Plua_State): Integer; cdecl;
var
	lDrawGrid:TLuaDrawGrid;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lDrawGrid := TLuaDrawGrid.Create(Parent);
	lDrawGrid.Parent := TWinControl(Parent);
	lDrawGrid.LuaCtl := TVCLuaControl.Create(lDrawGrid as TComponent,L,@DrawGridToTable);
	InitControl(L,lDrawGrid,Name);
	DrawGridToTable(L, -1, lDrawGrid);
	Result := 1;
end;

end.
