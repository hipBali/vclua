(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDrawGrid;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Grids, Controls, LCLType, TypInfo;

function IsCustomGrid(L: Plua_State): Integer; cdecl;
function AsCustomGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCustomGrid; pti: PTypeInfo = nil); overload; inline;
procedure CustomGridToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCustomGrid = class(TCustomGrid)
    public
      L:Plua_State;
    end;
var
    CustomGridFuncs: aoluaL_Reg;

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

function VCLua_CustomGrid_Invalidate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.Invalidate();
	
	Result := 0;
end;

function VCLua_CustomGrid_EditingDone(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.EditingDone();
	
	Result := 0;
end;

function VCLua_CustomGrid_AdjustInnerCellRect(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ARect:TRect;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	
	lCustomGrid.AdjustInnerCellRect(ARect);
	lua_push(L,ARect);
	Result := 1;
end;

function VCLua_CustomGrid_AdjustInnerCellRect2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	lCustomGrid.AdjustInnerCellRect(ARect);
	lua_push(L,ARect);
	Result := 1;
end;

function VCLua_CustomGrid_AutoAdjustColumns(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.AutoAdjustColumns();
	
	Result := 0;
end;

function VCLua_CustomGrid_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.BeginUpdate();
	
	Result := 0;
end;

function VCLua_CustomGrid_CellRect(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ACol:Integer;
	ARow:Integer;
	ret:TRect;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ACol := lua_tointeger(L,2);
	ARow := lua_tointeger(L,3);
	ret := lCustomGrid.CellRect(ACol,ARow);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_CellToGridZone(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aCol:Integer;
	aRow:Integer;
	ret:TGridZone;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	aRow := lua_tointeger(L,3);
	ret := lCustomGrid.CellToGridZone(aCol,aRow);
	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function VCLua_CustomGrid_CheckPosition(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.CheckPosition();
	
	Result := 0;
end;

function VCLua_CustomGrid_ClearCols(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ret := lCustomGrid.ClearCols();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_ClearRows(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ret := lCustomGrid.ClearRows();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_Clear(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.Clear();
	
	Result := 0;
end;

function VCLua_CustomGrid_ClearSelections(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.ClearSelections();
	
	Result := 0;
end;

function VCLua_CustomGrid_EditorByStyle(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Style:TColumnButtonStyle;
	ret:TWinControl;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Style := TColumnButtonStyle(GetLuaObject(L,2));
	ret := lCustomGrid.EditorByStyle(Style);
	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function VCLua_CustomGrid_EditorKeyDown(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	Key:Word;
	Shift:TShiftState;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	Shift := TShiftState(GetEnumValue(TypeInfo(TShiftState),lua_tostring(L,3)));
	lCustomGrid.EditorKeyDown(Sender,Key,Shift);
	lua_push(L,Key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorKeyDown2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	Key:Word;
	Shift:TShiftState;
begin
	CheckArg(L, 4);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	Key := Word(lua_tointeger(L,3));
	Shift := TShiftState(GetEnumValue(TypeInfo(TShiftState),lua_tostring(L,4)));
	lCustomGrid.EditorKeyDown(Sender,Key,Shift);
	lua_push(L,Key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorKeyPress(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	Key:Char;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	lCustomGrid.EditorKeyPress(Sender,Key);
	lua_push(L,Key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorKeyPress2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	Key:Char;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	Key := Char(lua_tostring(L,3));
	lCustomGrid.EditorKeyPress(Sender,Key);
	lua_push(L,Key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorUTF8KeyPress(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	UTF8Key:TUTF8Char;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	lCustomGrid.EditorUTF8KeyPress(Sender,UTF8Key);
	lua_push(L,UTF8Key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorUTF8KeyPress2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	UTF8Key:TUTF8Char;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	UTF8Key := TUTF8Char(lua_tostring(L,3));
	lCustomGrid.EditorUTF8KeyPress(Sender,UTF8Key);
	lua_push(L,UTF8Key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorKeyUp(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	key:Word;
	shift:TShiftState;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	shift := TShiftState(GetEnumValue(TypeInfo(TShiftState),lua_tostring(L,3)));
	lCustomGrid.EditorKeyUp(Sender,key,shift);
	lua_push(L,key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorKeyUp2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	key:Word;
	shift:TShiftState;
begin
	CheckArg(L, 4);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	key := Word(lua_tointeger(L,3));
	shift := TShiftState(GetEnumValue(TypeInfo(TShiftState),lua_tostring(L,4)));
	lCustomGrid.EditorKeyUp(Sender,key,shift);
	lua_push(L,key);
	Result := 1;
end;

function VCLua_CustomGrid_EditorTextChanged(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aCol:Integer;
	aRow:Integer;
	aText:string;
begin
	CheckArg(L, 4);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	aRow := lua_tointeger(L,3);
	aText := lua_toStringCP(L,4);
	lCustomGrid.EditorTextChanged(aCol,aRow,aText);
	
	Result := 0;
end;

function VCLua_CustomGrid_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aRefresh:boolean;
begin
	CheckArg(L, -1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	aRefresh := luaL_optbool(L,2,true);
	lCustomGrid.EndUpdate(aRefresh);
	
	Result := 0;
end;

function VCLua_CustomGrid_FixDesignFontsPPI(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ADesignTimePPI:Integer;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ADesignTimePPI := lua_tointeger(L,2);
	lCustomGrid.FixDesignFontsPPI(ADesignTimePPI);
	
	Result := 0;
end;

function VCLua_CustomGrid_Focused(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ret := lCustomGrid.Focused();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_HasMultiSelection(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ret := lCustomGrid.HasMultiSelection();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_HideSortArrow(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.HideSortArrow();
	
	Result := 0;
end;

function VCLua_CustomGrid_InvalidateCell(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aCol:Integer;
	aRow:Integer;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	aRow := lua_tointeger(L,3);
	lCustomGrid.InvalidateCell(aCol,aRow);
	
	Result := 0;
end;

function VCLua_CustomGrid_InvalidateCol(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ACol:Integer;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ACol := lua_tointeger(L,2);
	lCustomGrid.InvalidateCol(ACol);
	
	Result := 0;
end;

function VCLua_CustomGrid_InvalidateRange(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aRange:TRect;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	aRange := lua_toTRect(L,2);
	lCustomGrid.InvalidateRange(aRange);
	
	Result := 0;
end;

function VCLua_CustomGrid_InvalidateRow(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ARow:Integer;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	ARow := lua_tointeger(L,2);
	lCustomGrid.InvalidateRow(ARow);
	
	Result := 0;
end;

function VCLua_CustomGrid_IsCellVisible(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aCol:Integer;
	aRow:Integer;
	ret:Boolean;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	aRow := lua_tointeger(L,3);
	ret := lCustomGrid.IsCellVisible(aCol,aRow);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_IsFixedCellVisible(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aCol:Integer;
	aRow:Integer;
	ret:boolean;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	aRow := lua_tointeger(L,3);
	ret := lCustomGrid.IsFixedCellVisible(aCol,aRow);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	FileName:string;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lCustomGrid.LoadFromFile(FileName);
	
	Result := 0;
end;

function VCLua_CustomGrid_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	lCustomGrid.LoadFromStream(AStream);
	
	Result := 0;
end;

function VCLua_CustomGrid_MouseCoord(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	X:Integer;
	Y:Integer;
	ret:TGridCoord;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lCustomGrid.MouseCoord(X,Y);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_MouseToCell(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Mouse:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Mouse := lua_toTPoint(L,2);
	ret := lCustomGrid.MouseToCell(Mouse);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_MouseToCell2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	X:Integer;
	Y:Integer;
	ACol:Longint;
	ARow:Longint;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	lCustomGrid.MouseToCell(X,Y,ACol,ARow);
	lua_push(L,ACol);
	lua_push(L,ARow);
	Result := 2;
end;

function VCLua_CustomGrid_MouseToLogcell(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Mouse:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	Mouse := lua_toTPoint(L,2);
	ret := lCustomGrid.MouseToLogcell(Mouse);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_MouseToGridZone(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	X:Integer;
	Y:Integer;
	ret:TGridZone;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lCustomGrid.MouseToGridZone(X,Y);
	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function VCLua_CustomGrid_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	FileName:string;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	FileName := lua_toStringCP(L,2);
	lCustomGrid.SaveToFile(FileName);
	
	Result := 0;
end;

function VCLua_CustomGrid_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	lCustomGrid.SaveToStream(AStream);
	
	Result := 0;
end;

function VCLua_CustomGrid_ScaleFontsPPI(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	AToPPI:Integer;
	AProportion:Double;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	AToPPI := lua_tointeger(L,2);
	AProportion := lua_tonumber(L,3);
	lCustomGrid.ScaleFontsPPI(AToPPI,AProportion);
	
	Result := 0;
end;

function VCLua_CustomGrid_SetFocus(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	lCustomGrid.SetFocus();
	
	Result := 0;
end;

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

function IsCustomGrid(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCustomGrid);
end;
function AsCustomGrid(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCustomGrid then
    lua_push(L, TCustomGrid(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCustomGrid; pti: PTypeInfo);
begin
	CustomGridToTable(L,-1,v);
end;
procedure CustomGridToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomGrid');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	SetLength(CustomGridFuncs, 45+1);
	CustomGridFuncs[0].name:='Invalidate';
	CustomGridFuncs[0].func:=@VCLua_CustomGrid_Invalidate;
	CustomGridFuncs[1].name:='EditingDone';
	CustomGridFuncs[1].func:=@VCLua_CustomGrid_EditingDone;
	CustomGridFuncs[2].name:='AdjustInnerCellRect';
	CustomGridFuncs[2].func:=@VCLua_CustomGrid_AdjustInnerCellRect;
	CustomGridFuncs[3].name:='AdjustInnerCellRect2';
	CustomGridFuncs[3].func:=@VCLua_CustomGrid_AdjustInnerCellRect2;
	CustomGridFuncs[4].name:='AutoAdjustColumns';
	CustomGridFuncs[4].func:=@VCLua_CustomGrid_AutoAdjustColumns;
	CustomGridFuncs[5].name:='BeginUpdate';
	CustomGridFuncs[5].func:=@VCLua_CustomGrid_BeginUpdate;
	CustomGridFuncs[6].name:='CellRect';
	CustomGridFuncs[6].func:=@VCLua_CustomGrid_CellRect;
	CustomGridFuncs[7].name:='CellToGridZone';
	CustomGridFuncs[7].func:=@VCLua_CustomGrid_CellToGridZone;
	CustomGridFuncs[8].name:='CheckPosition';
	CustomGridFuncs[8].func:=@VCLua_CustomGrid_CheckPosition;
	CustomGridFuncs[9].name:='ClearCols';
	CustomGridFuncs[9].func:=@VCLua_CustomGrid_ClearCols;
	CustomGridFuncs[10].name:='ClearRows';
	CustomGridFuncs[10].func:=@VCLua_CustomGrid_ClearRows;
	CustomGridFuncs[11].name:='Clear';
	CustomGridFuncs[11].func:=@VCLua_CustomGrid_Clear;
	CustomGridFuncs[12].name:='ClearSelections';
	CustomGridFuncs[12].func:=@VCLua_CustomGrid_ClearSelections;
	CustomGridFuncs[13].name:='EditorByStyle';
	CustomGridFuncs[13].func:=@VCLua_CustomGrid_EditorByStyle;
	CustomGridFuncs[14].name:='EditorKeyDown';
	CustomGridFuncs[14].func:=@VCLua_CustomGrid_EditorKeyDown;
	CustomGridFuncs[15].name:='EditorKeyDown2';
	CustomGridFuncs[15].func:=@VCLua_CustomGrid_EditorKeyDown2;
	CustomGridFuncs[16].name:='EditorKeyPress';
	CustomGridFuncs[16].func:=@VCLua_CustomGrid_EditorKeyPress;
	CustomGridFuncs[17].name:='EditorKeyPress2';
	CustomGridFuncs[17].func:=@VCLua_CustomGrid_EditorKeyPress2;
	CustomGridFuncs[18].name:='EditorUTF8KeyPress';
	CustomGridFuncs[18].func:=@VCLua_CustomGrid_EditorUTF8KeyPress;
	CustomGridFuncs[19].name:='EditorUTF8KeyPress2';
	CustomGridFuncs[19].func:=@VCLua_CustomGrid_EditorUTF8KeyPress2;
	CustomGridFuncs[20].name:='EditorKeyUp';
	CustomGridFuncs[20].func:=@VCLua_CustomGrid_EditorKeyUp;
	CustomGridFuncs[21].name:='EditorKeyUp2';
	CustomGridFuncs[21].func:=@VCLua_CustomGrid_EditorKeyUp2;
	CustomGridFuncs[22].name:='EditorTextChanged';
	CustomGridFuncs[22].func:=@VCLua_CustomGrid_EditorTextChanged;
	CustomGridFuncs[23].name:='EndUpdate';
	CustomGridFuncs[23].func:=@VCLua_CustomGrid_EndUpdate;
	CustomGridFuncs[24].name:='FixDesignFontsPPI';
	CustomGridFuncs[24].func:=@VCLua_CustomGrid_FixDesignFontsPPI;
	CustomGridFuncs[25].name:='Focused';
	CustomGridFuncs[25].func:=@VCLua_CustomGrid_Focused;
	CustomGridFuncs[26].name:='HasMultiSelection';
	CustomGridFuncs[26].func:=@VCLua_CustomGrid_HasMultiSelection;
	CustomGridFuncs[27].name:='HideSortArrow';
	CustomGridFuncs[27].func:=@VCLua_CustomGrid_HideSortArrow;
	CustomGridFuncs[28].name:='InvalidateCell';
	CustomGridFuncs[28].func:=@VCLua_CustomGrid_InvalidateCell;
	CustomGridFuncs[29].name:='InvalidateCol';
	CustomGridFuncs[29].func:=@VCLua_CustomGrid_InvalidateCol;
	CustomGridFuncs[30].name:='InvalidateRange';
	CustomGridFuncs[30].func:=@VCLua_CustomGrid_InvalidateRange;
	CustomGridFuncs[31].name:='InvalidateRow';
	CustomGridFuncs[31].func:=@VCLua_CustomGrid_InvalidateRow;
	CustomGridFuncs[32].name:='IsCellVisible';
	CustomGridFuncs[32].func:=@VCLua_CustomGrid_IsCellVisible;
	CustomGridFuncs[33].name:='IsFixedCellVisible';
	CustomGridFuncs[33].func:=@VCLua_CustomGrid_IsFixedCellVisible;
	CustomGridFuncs[34].name:='LoadFromFile';
	CustomGridFuncs[34].func:=@VCLua_CustomGrid_LoadFromFile;
	CustomGridFuncs[35].name:='LoadFromStream';
	CustomGridFuncs[35].func:=@VCLua_CustomGrid_LoadFromStream;
	CustomGridFuncs[36].name:='MouseCoord';
	CustomGridFuncs[36].func:=@VCLua_CustomGrid_MouseCoord;
	CustomGridFuncs[37].name:='MouseToCell';
	CustomGridFuncs[37].func:=@VCLua_CustomGrid_MouseToCell;
	CustomGridFuncs[38].name:='MouseToCell2';
	CustomGridFuncs[38].func:=@VCLua_CustomGrid_MouseToCell2;
	CustomGridFuncs[39].name:='MouseToLogcell';
	CustomGridFuncs[39].func:=@VCLua_CustomGrid_MouseToLogcell;
	CustomGridFuncs[40].name:='MouseToGridZone';
	CustomGridFuncs[40].func:=@VCLua_CustomGrid_MouseToGridZone;
	CustomGridFuncs[41].name:='SaveToFile';
	CustomGridFuncs[41].func:=@VCLua_CustomGrid_SaveToFile;
	CustomGridFuncs[42].name:='SaveToStream';
	CustomGridFuncs[42].func:=@VCLua_CustomGrid_SaveToStream;
	CustomGridFuncs[43].name:='ScaleFontsPPI';
	CustomGridFuncs[43].func:=@VCLua_CustomGrid_ScaleFontsPPI;
	CustomGridFuncs[44].name:='SetFocus';
	CustomGridFuncs[44].func:=@VCLua_CustomGrid_SetFocus;
	CustomGridFuncs[45].name:=nil;
	CustomGridFuncs[45].func:=nil;

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
