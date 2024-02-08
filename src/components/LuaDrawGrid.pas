(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDrawGrid;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Grids, Controls, TypInfo;

function CreateDrawGrid(L: Plua_State): Integer; cdecl;
function IsDrawGrid(L: Plua_State): Integer; cdecl;
function AsDrawGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDrawGrid; pti: PTypeInfo = nil); overload; inline;
procedure DrawGridToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDrawGrid = class(TDrawGrid)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomDrawGridFuncs: aoluaL_Reg;


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
	lua_push(L,aRect);
	Result := 1;
end;

function VCLua_DrawGrid_DefaultDrawCell2(L: Plua_State): Integer; cdecl;
var
	lDrawGrid:TLuaDrawGrid;
	aCol:Integer;
	aRow:Integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 5);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	aRow := lua_tointeger(L,3);
	aRect := lua_toTRect(L,4);
	aState := TGridDrawState(GetEnumValue(TypeInfo(TGridDrawState),lua_tostring(L,5)));
	lDrawGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
	lua_push(L,aRect);
	Result := 1;
end;

function IsDrawGrid(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TDrawGrid);
end;
function AsDrawGrid(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TDrawGrid then
    lua_push(L, TDrawGrid(o))
  else
    lua_pushnil(L);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomDrawGrid');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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

begin
	SetLength(CustomDrawGridFuncs, 10+1);
	CustomDrawGridFuncs[0].name:='DeleteColRow';
	CustomDrawGridFuncs[0].func:=@VCLua_DrawGrid_DeleteColRow;
	CustomDrawGridFuncs[1].name:='DeleteCol';
	CustomDrawGridFuncs[1].func:=@VCLua_DrawGrid_DeleteCol;
	CustomDrawGridFuncs[2].name:='DeleteRow';
	CustomDrawGridFuncs[2].func:=@VCLua_DrawGrid_DeleteRow;
	CustomDrawGridFuncs[3].name:='ExchangeColRow';
	CustomDrawGridFuncs[3].func:=@VCLua_DrawGrid_ExchangeColRow;
	CustomDrawGridFuncs[4].name:='InsertColRow';
	CustomDrawGridFuncs[4].func:=@VCLua_DrawGrid_InsertColRow;
	CustomDrawGridFuncs[5].name:='MoveColRow';
	CustomDrawGridFuncs[5].func:=@VCLua_DrawGrid_MoveColRow;
	CustomDrawGridFuncs[6].name:='SortColRow';
	CustomDrawGridFuncs[6].func:=@VCLua_DrawGrid_SortColRow;
	CustomDrawGridFuncs[7].name:='SortColRow2';
	CustomDrawGridFuncs[7].func:=@VCLua_DrawGrid_SortColRow2;
	CustomDrawGridFuncs[8].name:='DefaultDrawCell';
	CustomDrawGridFuncs[8].func:=@VCLua_DrawGrid_DefaultDrawCell;
	CustomDrawGridFuncs[9].name:='DefaultDrawCell2';
	CustomDrawGridFuncs[9].func:=@VCLua_DrawGrid_DefaultDrawCell2;
	CustomDrawGridFuncs[10].name:=nil;
	CustomDrawGridFuncs[10].func:=nil;

end.
