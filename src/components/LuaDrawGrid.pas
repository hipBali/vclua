(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDrawGrid;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Grids, Controls, LCLType, TypInfo;

function IsCustomGrid(L: Plua_State): Integer; cdecl;
function AsCustomGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCustomGrid; pti: PTypeInfo = nil); overload; inline;

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

type
    TLuaDrawGrid = class(TDrawGrid)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomDrawGridFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

function VCLua_CustomGrid_Invalidate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.Invalidate();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'Invalidate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_CustomGrid_EditingDone(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.EditingDone();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditingDone', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'AdjustInnerCellRect', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@ARect);
	try
		lCustomGrid.AdjustInnerCellRect(ARect);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'AdjustInnerCellRect', E.ClassName, E.Message);
	end;

	lua_push(L,ARect);
	Result := 1;
end;

function VCLua_CustomGrid_AutoAdjustColumns(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.AutoAdjustColumns();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'AutoAdjustColumns', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_CustomGrid_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.BeginUpdate();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'BeginUpdate', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@ACol);
	luaL_check(L,3,@ARow);
	try
		ret := lCustomGrid.CellRect(ACol,ARow);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'CellRect', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		ret := lCustomGrid.CellToGridZone(aCol,aRow);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'CellToGridZone', E.ClassName, E.Message);
	end;

	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function VCLua_CustomGrid_CheckPosition(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.CheckPosition();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'CheckPosition', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ClearCols', E.ClassName, E.Message);
	end;

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
	try
		ret := lCustomGrid.ClearRows();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ClearRows', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_Clear(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.Clear();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'Clear', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_CustomGrid_ClearSelections(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.ClearSelections();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ClearSelections', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@Style,TypeInfo(TColumnButtonStyle));
	try
		ret := lCustomGrid.EditorByStyle(Style);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorByStyle', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	luaL_checkSet(L,3,@Shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyDown(Sender,Key,Shift);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyDown', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@Key);
	luaL_checkSet(L,4,@Shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyDown(Sender,Key,Shift);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyDown', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	try
		lCustomGrid.EditorKeyPress(Sender,Key);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyPress', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@Key);
	try
		lCustomGrid.EditorKeyPress(Sender,Key);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyPress', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	try
		lCustomGrid.EditorUTF8KeyPress(Sender,UTF8Key);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorUTF8KeyPress', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@UTF8Key);
	try
		lCustomGrid.EditorUTF8KeyPress(Sender,UTF8Key);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorUTF8KeyPress', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	luaL_checkSet(L,3,@shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyUp(Sender,key,shift);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyUp', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@key);
	luaL_checkSet(L,4,@shift,TypeInfo(TShiftState));
	try
		lCustomGrid.EditorKeyUp(Sender,key,shift);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorKeyUp', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_check(L,4,@aText);
	try
		lCustomGrid.EditorTextChanged(aCol,aRow,aText);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EditorTextChanged', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'EndUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'FixDesignFontsPPI', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'Focused', E.ClassName, E.Message);
	end;

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
	try
		ret := lCustomGrid.HasMultiSelection();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'HasMultiSelection', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomGrid_HideSortArrow(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.HideSortArrow();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'HideSortArrow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		lCustomGrid.InvalidateCell(aCol,aRow);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateCell', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateCol', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateRange', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'InvalidateRow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		ret := lCustomGrid.IsCellVisible(aCol,aRow);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'IsCellVisible', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		ret := lCustomGrid.IsFixedCellVisible(aCol,aRow);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'IsFixedCellVisible', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@FileName);
	try
		lCustomGrid.LoadFromFile(FileName);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'LoadFromFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'LoadFromStream', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lCustomGrid.MouseCoord(X,Y);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseCoord', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Mouse);
	try
		ret := lCustomGrid.MouseToCell(Mouse);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToCell', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		lCustomGrid.MouseToCell(X,Y,ACol,ARow);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToCell', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@Mouse);
	try
		ret := lCustomGrid.MouseToLogcell(Mouse);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToLogcell', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lCustomGrid.MouseToGridZone(X,Y);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'MouseToGridZone', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@FileName);
	try
		lCustomGrid.SaveToFile(FileName);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SaveToFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SaveToStream', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@AToPPI);
	luaL_check(L,3,@AProportion);
	try
		lCustomGrid.ScaleFontsPPI(AToPPI,AProportion);
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'ScaleFontsPPI', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_CustomGrid_SetFocus(L: Plua_State): Integer; cdecl;
var
	lCustomGrid:TLuaCustomGrid;
begin
	CheckArg(L, 1);
	lCustomGrid := TLuaCustomGrid(GetLuaObject(L, 1));
	try
		lCustomGrid.SetFocus();
	except
		on E: Exception do
			CallError(L, 'CustomGrid', 'SetFocus', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lDrawGrid.DeleteColRow(IsColumn,index);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DeleteColRow', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DeleteCol', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DeleteRow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	luaL_check(L,4,@WithIndex);
	try
		lDrawGrid.ExchangeColRow(IsColumn,index,WithIndex);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'ExchangeColRow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lDrawGrid.InsertColRow(IsColumn,index);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'InsertColRow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@FromIndex);
	luaL_check(L,4,@ToIndex);
	try
		lDrawGrid.MoveColRow(IsColumn,FromIndex,ToIndex);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'MoveColRow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lDrawGrid.SortColRow(IsColumn,index);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'SortColRow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@FromIndex);
	luaL_check(L,5,@ToIndex);
	try
		lDrawGrid.SortColRow(IsColumn,Index,FromIndex,ToIndex);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'SortColRow', E.ClassName, E.Message);
	end;

	
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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_checkSet(L,4,@aState,TypeInfo(TGridDrawState));
	try
		lDrawGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;

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
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_check(L,4,@aRect);
	luaL_checkSet(L,5,@aState,TypeInfo(TGridDrawState));
	try
		lDrawGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
	except
		on E: Exception do
			CallError(L, 'DrawGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;

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
	CreateTableForKnownType(L,'TCustomGrid',v);
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
