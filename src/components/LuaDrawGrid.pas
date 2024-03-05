(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDrawGrid;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, Grids, TypInfo, LuaVmt;

procedure lua_push(L: Plua_State; const v: TCustomGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomGrid = class(TCustomGrid)
    public
      L:Plua_State;
    end;
var
    CustomGridFuncs: TLuaVmt;
    CustomGridSets: TLuaVmt;

function CreateDrawGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDrawGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDrawGrid = class(TDrawGrid)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomDrawGridFuncs: TLuaVmt;
    CustomDrawGridSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LCLType;

function VCLua_CustomGrid_Invalidate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.Invalidate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'Invalidate', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_EditingDone(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.EditingDone();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditingDone', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_AdjustInnerCellRect(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ARect:TRect;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.AdjustInnerCellRect(ARect);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'AdjustInnerCellRect', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
end;

function VCLua_CustomGrid_AdjustInnerCellRect2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@ARect);
	try
		lCustomGrid.AdjustInnerCellRect(ARect);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'AdjustInnerCellRect', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
end;

function VCLua_CustomGrid_AutoAdjustColumns(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.AutoAdjustColumns();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'AutoAdjustColumns', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'BeginUpdate', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@ACol);
	luaL_check(L,3,@ARow);
	try
		ret := lCustomGrid.CellRect(ACol,ARow);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'CellRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		ret := lCustomGrid.CellToGridZone(aCol,aRow);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'CellToGridZone', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomGrid_CheckPosition(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.CheckPosition();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'CheckPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_ClearCols(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.ClearCols();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ClearCols', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomGrid_ClearRows(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.ClearRows();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ClearRows', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomGrid_Clear(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_ClearSelections(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.ClearSelections();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ClearSelections', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_EditorByStyle(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Style:TColumnButtonStyle;
	ret:TWinControl;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Style,TypeInfo(TColumnButtonStyle));
	try
		ret := lCustomGrid.EditorByStyle(Style);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorByStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
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
	luaL_check(L,2,@Sender);
	luaL_checkSet(L,3,@Shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyDown(Sender,Key,Shift);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyDown', E.ClassName, E.Message);
	end;
	lua_push(L,Key);
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
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@Key);
	luaL_checkSet(L,4,@Shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyDown(Sender,Key,Shift);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyDown', E.ClassName, E.Message);
	end;
	lua_push(L,Key);
end;

function VCLua_CustomGrid_EditorKeyPress(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	Key:Char;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCustomGrid.EditorKeyPress(Sender,Key);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyPress', E.ClassName, E.Message);
	end;
	lua_push(L,Key);
end;

function VCLua_CustomGrid_EditorKeyPress2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	Key:Char;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@Key);
	try
		lCustomGrid.EditorKeyPress(Sender,Key);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyPress', E.ClassName, E.Message);
	end;
	lua_push(L,Key);
end;

function VCLua_CustomGrid_EditorUTF8KeyPress(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	UTF8Key:TUTF8Char;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCustomGrid.EditorUTF8KeyPress(Sender,UTF8Key);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorUTF8KeyPress', E.ClassName, E.Message);
	end;
	lua_push(L,UTF8Key);
end;

function VCLua_CustomGrid_EditorUTF8KeyPress2(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Sender:TObject;
	UTF8Key:TUTF8Char;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@UTF8Key);
	try
		lCustomGrid.EditorUTF8KeyPress(Sender,UTF8Key);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorUTF8KeyPress', E.ClassName, E.Message);
	end;
	lua_push(L,UTF8Key);
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
	luaL_check(L,2,@Sender);
	luaL_checkSet(L,3,@shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyUp(Sender,key,shift);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyUp', E.ClassName, E.Message);
	end;
	lua_push(L,key);
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
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@key);
	luaL_checkSet(L,4,@shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyUp(Sender,key,shift);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyUp', E.ClassName, E.Message);
	end;
	lua_push(L,key);
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_check(L,4,@aText);
	try
		lCustomGrid.EditorTextChanged(aCol,aRow,aText);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorTextChanged', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aRefresh:boolean;
begin
	CheckArg(L, 1, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	TTrait<boolean>.luaL_optcheck(L, 2, @aRefresh, true);
	try
		lCustomGrid.EndUpdate(aRefresh);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_FixDesignFontsPPI(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ADesignTimePPI:Integer;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@ADesignTimePPI);
	try
		lCustomGrid.FixDesignFontsPPI(ADesignTimePPI);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'FixDesignFontsPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_Focused(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.Focused();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'Focused', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomGrid_HasMultiSelection(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.HasMultiSelection();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'HasMultiSelection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomGrid_HideSortArrow(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.HideSortArrow();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'HideSortArrow', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_InvalidateCell(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aCol:Integer;
	aRow:Integer;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		lCustomGrid.InvalidateCell(aCol,aRow);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateCell', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_InvalidateCol(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ACol:Integer;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@ACol);
	try
		lCustomGrid.InvalidateCol(ACol);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateCol', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_InvalidateRange(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	aRange:TRect;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aRange);
	try
		lCustomGrid.InvalidateRange(aRange);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateRange', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_InvalidateRow(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ARow:Integer;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@ARow);
	try
		lCustomGrid.InvalidateRow(ARow);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateRow', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		ret := lCustomGrid.IsCellVisible(aCol,aRow);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'IsCellVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		ret := lCustomGrid.IsFixedCellVisible(aCol,aRow);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'IsFixedCellVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomGrid_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	FileName:string;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lCustomGrid.LoadFromFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lCustomGrid.LoadFromStream(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'LoadFromStream', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lCustomGrid.MouseCoord(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseCoord', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomGrid_MouseToCell(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Mouse:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Mouse);
	try
		ret := lCustomGrid.MouseToCell(Mouse);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToCell', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		lCustomGrid.MouseToCell(X,Y,ACol,ARow);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToCell', E.ClassName, E.Message);
	end;
	lua_push(L,ACol);
	lua_push(L,ARow);
end;

function VCLua_CustomGrid_MouseToLogcell(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	Mouse:TPoint;
	ret:TPoint;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Mouse);
	try
		ret := lCustomGrid.MouseToLogcell(Mouse);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToLogcell', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lCustomGrid.MouseToGridZone(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToGridZone', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomGrid_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	FileName:string;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lCustomGrid.SaveToFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lCustomGrid.SaveToStream(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_ScaleFontsPPI(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	AToPPI:Integer;
	AProportion:Double;
begin
	CheckArg(L, 3);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AToPPI);
	luaL_check(L,3,@AProportion);
	try
		lCustomGrid.ScaleFontsPPI(AToPPI,AProportion);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ScaleFontsPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_SetFocus(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.SetFocus();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SetFocus', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_VCLuaGetCursorState(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:TGridCursorState;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.CursorState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'CursorState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomGrid_SelectedRange(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	AIndex:Integer;
	ret:TGridRect;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		ret := lCustomGrid.SelectedRange[AIndex];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SelectedRange', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_VCLuaGetSelectedRangeCount(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.SelectedRangeCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SelectedRangeCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomGrid_VCLuaSetSortOrder(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	val:TSortOrder;
begin
	CheckArg(L, 2);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TSortOrder));
	try
		lCustomGrid.SortOrder := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SortOrder', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomGrid_VCLuaGetSortOrder(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:TSortOrder;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.SortOrder;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SortOrder', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomGrid_VCLuaGetSortColumn(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		ret := lCustomGrid.SortColumn;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SortColumn', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DrawGrid_DeleteColRow(L: Plua_State): Integer; cdecl;
var
	lDrawGrid:TLuaDrawGrid;
	IsColumn:Boolean;
	index:Integer;
begin
	CheckArg(L, 3);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lDrawGrid.DeleteColRow(IsColumn,index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DeleteColRow', E.ClassName, E.Message);
	end;
end;

function VCLua_DrawGrid_DeleteCol(L: Plua_State): Integer; cdecl;
var
	lDrawGrid:TLuaDrawGrid;
	Index:Integer;
begin
	CheckArg(L, 2);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lDrawGrid.DeleteCol(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DeleteCol', E.ClassName, E.Message);
	end;
end;

function VCLua_DrawGrid_DeleteRow(L: Plua_State): Integer; cdecl;
var
	lDrawGrid:TLuaDrawGrid;
	Index:Integer;
begin
	CheckArg(L, 2);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lDrawGrid.DeleteRow(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DeleteRow', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	luaL_check(L,4,@WithIndex);
	try
		lDrawGrid.ExchangeColRow(IsColumn,index,WithIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'ExchangeColRow', E.ClassName, E.Message);
	end;
end;

function VCLua_DrawGrid_InsertColRow(L: Plua_State): Integer; cdecl;
var
	lDrawGrid:TLuaDrawGrid;
	IsColumn:boolean;
	index:integer;
begin
	CheckArg(L, 3);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lDrawGrid.InsertColRow(IsColumn,index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'InsertColRow', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@FromIndex);
	luaL_check(L,4,@ToIndex);
	try
		lDrawGrid.MoveColRow(IsColumn,FromIndex,ToIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'MoveColRow', E.ClassName, E.Message);
	end;
end;

function VCLua_DrawGrid_SortColRow(L: Plua_State): Integer; cdecl;
var
	lDrawGrid:TLuaDrawGrid;
	IsColumn:Boolean;
	index:Integer;
begin
	CheckArg(L, 3);
	lDrawGrid := TLuaDrawGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lDrawGrid.SortColRow(IsColumn,index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'SortColRow', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@FromIndex);
	luaL_check(L,5,@ToIndex);
	try
		lDrawGrid.SortColRow(IsColumn,Index,FromIndex,ToIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'SortColRow', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_checkSet(L,4,@aState,TypeInfo(TGridDrawState));
	try
		lDrawGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;
	lua_push(L,aRect);
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_check(L,4,@aRect);
	luaL_checkSet(L,5,@aState,TypeInfo(TGridDrawState));
	try
		lDrawGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;
	lua_push(L,aRect);
end;

procedure lua_push(L: Plua_State; const v: TCustomGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomGrid',v);
end;

procedure lua_push(L: Plua_State; const v: TDrawGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomDrawGrid',v);
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
	lDrawGrid.LuaCtl := TVCLuaControl.Create(lDrawGrid as TComponent,L,nil,'TCustomDrawGrid');
	InitControl(L,lDrawGrid,Name);
	CreateTableForKnownType(L,'TCustomDrawGrid',lDrawGrid);
	Result := 1;
end;

begin
	CustomGridFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomGridFuncs, 'Invalidate', @VCLua_CustomGrid_Invalidate);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditingDone', @VCLua_CustomGrid_EditingDone);
	TLuaMethodInfo.Create(CustomGridFuncs, 'AdjustInnerCellRect', @VCLua_CustomGrid_AdjustInnerCellRect);
	TLuaMethodInfo.Create(CustomGridFuncs, 'AdjustInnerCellRect2', @VCLua_CustomGrid_AdjustInnerCellRect2);
	TLuaMethodInfo.Create(CustomGridFuncs, 'AutoAdjustColumns', @VCLua_CustomGrid_AutoAdjustColumns);
	TLuaMethodInfo.Create(CustomGridFuncs, 'BeginUpdate', @VCLua_CustomGrid_BeginUpdate);
	TLuaMethodInfo.Create(CustomGridFuncs, 'CellRect', @VCLua_CustomGrid_CellRect);
	TLuaMethodInfo.Create(CustomGridFuncs, 'CellToGridZone', @VCLua_CustomGrid_CellToGridZone);
	TLuaMethodInfo.Create(CustomGridFuncs, 'CheckPosition', @VCLua_CustomGrid_CheckPosition);
	TLuaMethodInfo.Create(CustomGridFuncs, 'ClearCols', @VCLua_CustomGrid_ClearCols);
	TLuaMethodInfo.Create(CustomGridFuncs, 'ClearRows', @VCLua_CustomGrid_ClearRows);
	TLuaMethodInfo.Create(CustomGridFuncs, 'Clear', @VCLua_CustomGrid_Clear);
	TLuaMethodInfo.Create(CustomGridFuncs, 'ClearSelections', @VCLua_CustomGrid_ClearSelections);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorByStyle', @VCLua_CustomGrid_EditorByStyle);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorKeyDown', @VCLua_CustomGrid_EditorKeyDown);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorKeyDown2', @VCLua_CustomGrid_EditorKeyDown2);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorKeyPress', @VCLua_CustomGrid_EditorKeyPress);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorKeyPress2', @VCLua_CustomGrid_EditorKeyPress2);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorUTF8KeyPress', @VCLua_CustomGrid_EditorUTF8KeyPress);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorUTF8KeyPress2', @VCLua_CustomGrid_EditorUTF8KeyPress2);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorKeyUp', @VCLua_CustomGrid_EditorKeyUp);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorKeyUp2', @VCLua_CustomGrid_EditorKeyUp2);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EditorTextChanged', @VCLua_CustomGrid_EditorTextChanged);
	TLuaMethodInfo.Create(CustomGridFuncs, 'EndUpdate', @VCLua_CustomGrid_EndUpdate);
	TLuaMethodInfo.Create(CustomGridFuncs, 'FixDesignFontsPPI', @VCLua_CustomGrid_FixDesignFontsPPI);
	TLuaMethodInfo.Create(CustomGridFuncs, 'Focused', @VCLua_CustomGrid_Focused);
	TLuaMethodInfo.Create(CustomGridFuncs, 'HasMultiSelection', @VCLua_CustomGrid_HasMultiSelection);
	TLuaMethodInfo.Create(CustomGridFuncs, 'HideSortArrow', @VCLua_CustomGrid_HideSortArrow);
	TLuaMethodInfo.Create(CustomGridFuncs, 'InvalidateCell', @VCLua_CustomGrid_InvalidateCell);
	TLuaMethodInfo.Create(CustomGridFuncs, 'InvalidateCol', @VCLua_CustomGrid_InvalidateCol);
	TLuaMethodInfo.Create(CustomGridFuncs, 'InvalidateRange', @VCLua_CustomGrid_InvalidateRange);
	TLuaMethodInfo.Create(CustomGridFuncs, 'InvalidateRow', @VCLua_CustomGrid_InvalidateRow);
	TLuaMethodInfo.Create(CustomGridFuncs, 'IsCellVisible', @VCLua_CustomGrid_IsCellVisible);
	TLuaMethodInfo.Create(CustomGridFuncs, 'IsFixedCellVisible', @VCLua_CustomGrid_IsFixedCellVisible);
	TLuaMethodInfo.Create(CustomGridFuncs, 'LoadFromFile', @VCLua_CustomGrid_LoadFromFile);
	TLuaMethodInfo.Create(CustomGridFuncs, 'LoadFromStream', @VCLua_CustomGrid_LoadFromStream);
	TLuaMethodInfo.Create(CustomGridFuncs, 'MouseCoord', @VCLua_CustomGrid_MouseCoord);
	TLuaMethodInfo.Create(CustomGridFuncs, 'MouseToCell', @VCLua_CustomGrid_MouseToCell);
	TLuaMethodInfo.Create(CustomGridFuncs, 'MouseToCell2', @VCLua_CustomGrid_MouseToCell2);
	TLuaMethodInfo.Create(CustomGridFuncs, 'MouseToLogcell', @VCLua_CustomGrid_MouseToLogcell);
	TLuaMethodInfo.Create(CustomGridFuncs, 'MouseToGridZone', @VCLua_CustomGrid_MouseToGridZone);
	TLuaMethodInfo.Create(CustomGridFuncs, 'SaveToFile', @VCLua_CustomGrid_SaveToFile);
	TLuaMethodInfo.Create(CustomGridFuncs, 'SaveToStream', @VCLua_CustomGrid_SaveToStream);
	TLuaMethodInfo.Create(CustomGridFuncs, 'ScaleFontsPPI', @VCLua_CustomGrid_ScaleFontsPPI);
	TLuaMethodInfo.Create(CustomGridFuncs, 'SetFocus', @VCLua_CustomGrid_SetFocus);
	TLuaMethodInfo.Create(CustomGridFuncs, 'CursorState', @VCLua_CustomGrid_VCLuaGetCursorState, mfCall);
	TLuaMethodInfo.Create(CustomGridFuncs, 'SelectedRange', @VCLua_CustomGrid_SelectedRange);
	TLuaMethodInfo.Create(CustomGridFuncs, 'SelectedRangeCount', @VCLua_CustomGrid_VCLuaGetSelectedRangeCount, mfCall);
	TLuaMethodInfo.Create(CustomGridFuncs, 'SortOrder', @VCLua_CustomGrid_VCLuaGetSortOrder, mfCall);
	TLuaMethodInfo.Create(CustomGridFuncs, 'SortColumn', @VCLua_CustomGrid_VCLuaGetSortColumn, mfCall);
	CustomGridSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomGridSets, 'SortOrder', @VCLua_CustomGrid_VCLuaSetSortOrder, mfCall);
	CustomDrawGridFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'DeleteColRow', @VCLua_DrawGrid_DeleteColRow);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'DeleteCol', @VCLua_DrawGrid_DeleteCol);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'DeleteRow', @VCLua_DrawGrid_DeleteRow);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'ExchangeColRow', @VCLua_DrawGrid_ExchangeColRow);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'InsertColRow', @VCLua_DrawGrid_InsertColRow);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'MoveColRow', @VCLua_DrawGrid_MoveColRow);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'SortColRow', @VCLua_DrawGrid_SortColRow);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'SortColRow2', @VCLua_DrawGrid_SortColRow2);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'DefaultDrawCell', @VCLua_DrawGrid_DefaultDrawCell);
	TLuaMethodInfo.Create(CustomDrawGridFuncs, 'DefaultDrawCell2', @VCLua_DrawGrid_DefaultDrawCell2);
	CustomDrawGridSets := TLuaVmt.Create;
	
end.
