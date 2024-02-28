(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStringGrid;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Grids, TypInfo, LuaVmt;

function IsGridColumn(L: Plua_State): Integer; cdecl;
function AsGridColumn(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGridColumn; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGridColumn = class(TGridColumn)
    public
      L:Plua_State;
    end;
var
    GridColumnFuncs: TLuaVmt;
    GridColumnSets: TLuaVmt;

function IsGridColumns(L: Plua_State): Integer; cdecl;
function AsGridColumns(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGridColumns; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGridColumns = class(TGridColumns)
    public
      L:Plua_State;
    end;
var
    GridColumnsFuncs: TLuaVmt;
    GridColumnsSets: TLuaVmt;

function CreateStringGrid(L: Plua_State): Integer; cdecl;
function IsStringGrid(L: Plua_State): Integer; cdecl;
function AsStringGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStringGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStringGrid = class(TStringGrid)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomStringGridFuncs: TLuaVmt;
    CustomStringGridSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LuaDrawGrid, LuaStrings;

function VCLua_GridColumn_Assign(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lGridColumn.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_GridColumn_FillDefaultFont(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	try
		lGridColumn.FillDefaultFont();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'FillDefaultFont', E.ClassName, E.Message);
	end;
end;

function VCLua_GridColumn_FixDesignFontsPPI(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	ADesignTimePPI:Integer;
begin
	CheckArg(L, 2);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	luaL_check(L,2,@ADesignTimePPI);
	try
		lGridColumn.FixDesignFontsPPI(ADesignTimePPI);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'FixDesignFontsPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_GridColumn_ScaleFontsPPI(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	AToPPI:Integer;
	AProportion:Double;
begin
	CheckArg(L, 3);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	luaL_check(L,2,@AToPPI);
	luaL_check(L,3,@AProportion);
	try
		lGridColumn.ScaleFontsPPI(AToPPI,AProportion);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'ScaleFontsPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_GridColumn_IsDefault(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	ret:boolean;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	try
		ret := lGridColumn.IsDefault();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'IsDefault', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumn_VCLuaGetGrid(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	ret:TCustomGrid;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	try
		ret := lGridColumn.Grid;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'Grid', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumn_VCLuaGetDefaultWidth(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	ret:Integer;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	try
		ret := lGridColumn.DefaultWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'DefaultWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumn_VCLuaGetStoredWidth(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	ret:Integer;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	try
		ret := lGridColumn.StoredWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'StoredWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumn_VCLuaGetWidthChanged(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
	ret:boolean;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	try
		ret := lGridColumn.WidthChanged;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'WidthChanged', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_Add(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	ret:TGridColumn;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	try
		ret := lGridColumns.Add();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_Clear(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	try
		lGridColumns.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_GridColumns_ColumnByTitle(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	aTitle:string;
	ret:TGridColumn;
begin
	CheckArg(L, 2);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	luaL_check(L,2,@aTitle);
	try
		ret := lGridColumns.ColumnByTitle(aTitle);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'ColumnByTitle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_RealIndex(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	Index:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lGridColumns.RealIndex(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'RealIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_IndexOf(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	Column:TGridColumn;
	ret:Integer;
begin
	CheckArg(L, 2);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	luaL_check(L,2,@Column);
	try
		ret := lGridColumns.IndexOf(Column);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_IsDefault(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	ret:boolean;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	try
		ret := lGridColumns.IsDefault();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'IsDefault', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_HasIndex(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	Index:Integer;
	ret:boolean;
begin
	CheckArg(L, 2);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lGridColumns.HasIndex(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'HasIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_VisibleIndex(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	Index:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lGridColumns.VisibleIndex(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'VisibleIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_VCLuaGetGrid(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	ret:TCustomGrid;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	try
		ret := lGridColumns.Grid;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'Grid', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_Items(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	Index:Integer;
	ret:TGridColumn;
begin
	CheckArg(L, 2, 3);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lGridColumns.Items[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lGridColumns.Items[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_GridColumns_VCLuaGetVisibleCount(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	ret:Integer;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	try
		ret := lGridColumns.VisibleCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'VisibleCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_GridColumns_VCLuaGetEnabled(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	try
		ret := lGridColumns.Enabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'Enabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringGrid_AutoSizeColumn(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	aCol:Integer;
begin
	CheckArg(L, 2);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	try
		lStringGrid.AutoSizeColumn(aCol);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'AutoSizeColumn', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_AutoSizeColumns(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
begin
	CheckArg(L, 1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	try
		lStringGrid.AutoSizeColumns();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'AutoSizeColumns', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_Clean(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
begin
	CheckArg(L, 1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	try
		lStringGrid.Clean();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_Clean2(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	CleanOptions:TGridZoneSet;
begin
	CheckArg(L, 2);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@CleanOptions,TypeInfo(TGridZoneSet));
	try
		lStringGrid.Clean(CleanOptions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_Clean3(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	aRect:TRect;
	CleanOptions:TGridZoneSet;
begin
	CheckArg(L, 3);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aRect);
	luaL_checkSet(L,3,@CleanOptions,TypeInfo(TGridZoneSet));
	try
		lStringGrid.Clean(aRect,CleanOptions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_Clean4(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	StartCol:integer;
	StartRow:integer;
	EndCol:integer;
	EndRow:integer;
	CleanOptions:TGridZoneSet;
begin
	CheckArg(L, 6);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@StartCol);
	luaL_check(L,3,@StartRow);
	luaL_check(L,4,@EndCol);
	luaL_check(L,5,@EndRow);
	luaL_checkSet(L,6,@CleanOptions,TypeInfo(TGridZoneSet));
	try
		lStringGrid.Clean(StartCol,StartRow,EndCol,EndRow,CleanOptions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_CopyToClipboard(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	AUseSelection:boolean;
begin
	CheckArg(L, 1, 2);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	TTrait<boolean>.luaL_optcheck(L, 2, @AUseSelection, false);
	try
		lStringGrid.CopyToClipboard(AUseSelection);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'CopyToClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_InsertRowWithValues(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	Index:Integer;
	Values:array of String;
begin
	CheckArg(L, 3);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	TTrait<String>.luaL_checkArray(L, 3, @Values);
	try
		lStringGrid.InsertRowWithValues(Index,Values);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'InsertRowWithValues', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_LoadFromCSVStream(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	AStream:TStream;
	ADelimiter:Char;
	UseTitles:boolean;
	FromLine:Integer;
	SkipEmptyLines:Boolean;
begin
	CheckArg(L, 2, 6);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	TTrait<Char>.luaL_optcheck(L, 3, @ADelimiter, ',');
	TTrait<boolean>.luaL_optcheck(L, 4, @UseTitles, true);
	TTrait<Integer>.luaL_optcheck(L, 5, @FromLine, 0);
	TTrait<Boolean>.luaL_optcheck(L, 6, @SkipEmptyLines, true);
	try
		lStringGrid.LoadFromCSVStream(AStream,ADelimiter,UseTitles,FromLine,SkipEmptyLines);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'LoadFromCSVStream', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_LoadFromCSVFile(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	AFilename:string;
	ADelimiter:Char;
	UseTitles:boolean;
	FromLine:Integer;
	SkipEmptyLines:Boolean;
begin
	CheckArg(L, 2, 6);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AFilename);
	TTrait<Char>.luaL_optcheck(L, 3, @ADelimiter, ',');
	TTrait<boolean>.luaL_optcheck(L, 4, @UseTitles, true);
	TTrait<Integer>.luaL_optcheck(L, 5, @FromLine, 0);
	TTrait<Boolean>.luaL_optcheck(L, 6, @SkipEmptyLines, true);
	try
		lStringGrid.LoadFromCSVFile(AFilename,ADelimiter,UseTitles,FromLine,SkipEmptyLines);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'LoadFromCSVFile', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_SaveToCSVStream(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	AStream:TStream;
	ADelimiter:Char;
	WriteTitles:boolean;
	VisibleColumnsOnly:boolean;
begin
	CheckArg(L, 2, 5);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	TTrait<Char>.luaL_optcheck(L, 3, @ADelimiter, ',');
	TTrait<boolean>.luaL_optcheck(L, 4, @WriteTitles, true);
	TTrait<boolean>.luaL_optcheck(L, 5, @VisibleColumnsOnly, false);
	try
		lStringGrid.SaveToCSVStream(AStream,ADelimiter,WriteTitles,VisibleColumnsOnly);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'SaveToCSVStream', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_SaveToCSVFile(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	AFileName:string;
	ADelimiter:Char;
	WriteTitles:boolean;
	VisibleColumnsOnly:boolean;
begin
	CheckArg(L, 2, 5);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@AFileName);
	TTrait<Char>.luaL_optcheck(L, 3, @ADelimiter, ',');
	TTrait<boolean>.luaL_optcheck(L, 4, @WriteTitles, true);
	TTrait<boolean>.luaL_optcheck(L, 5, @VisibleColumnsOnly, false);
	try
		lStringGrid.SaveToCSVFile(AFileName,ADelimiter,WriteTitles,VisibleColumnsOnly);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'SaveToCSVFile', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_Cells(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	ACol:Integer;
	ARow:Integer;
	ret:string;
begin
	CheckArg(L, 3, 4);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@ACol);
	luaL_check(L,3,@ARow);
	try
		if lua_isnone(L, 4) then begin
			ret := lStringGrid.Cells[ACol,ARow];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,4,@ret);
			lStringGrid.Cells[ACol,ARow] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Cells', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_Cols(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	index:Integer;
	ret:TStrings;
	retNeedsFree:Boolean = False;
begin
	CheckArg(L, 2, 3);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@index);
	try
		if lua_isnone(L, 3) then begin
			ret := lStringGrid.Cols[index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			retNeedsFree := luaL_checkOrFromTable(L,3,@ret,@luaL_checkStringList);
			lStringGrid.Cols[index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Cols', E.ClassName, E.Message);
	end;
	if retNeedsFree then ret.Free;
end;

function VCLua_StringGrid_Objects(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	ACol:Integer;
	ARow:Integer;
	ret:TObject;
begin
	CheckArg(L, 3, 4);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@ACol);
	luaL_check(L,3,@ARow);
	try
		if lua_isnone(L, 4) then begin
			ret := lStringGrid.Objects[ACol,ARow];
			lua_push(L,ret,TypeInfo(ret));
			Result := 1;
		end else begin
			luaL_check(L,4,@ret);
			lStringGrid.Objects[ACol,ARow] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Objects', E.ClassName, E.Message);
	end;
end;

function VCLua_StringGrid_Rows(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	index:Integer;
	ret:TStrings;
	retNeedsFree:Boolean = False;
begin
	CheckArg(L, 2, 3);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@index);
	try
		if lua_isnone(L, 3) then begin
			ret := lStringGrid.Rows[index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			retNeedsFree := luaL_checkOrFromTable(L,3,@ret,@luaL_checkStringList);
			lStringGrid.Rows[index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Rows', E.ClassName, E.Message);
	end;
	if retNeedsFree then ret.Free;
end;

function VCLua_StringGrid_GridCellsGet(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
begin
  CheckArg(L, 3);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  lua_pushstringCP(L,pchar(strGrid.Cells[c,r]));
  Result := 1;
end;
function VCLua_StringGrid_GridCellsSet(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
begin
  CheckArg(L, 4);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  strGrid.Cells[c,r] := lua_tostringCP(L,4);
  Result := 0;
end;
function VCLua_StringGrid_GridGetSelectedCell(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
  Rect : TRect;
begin
  CheckArg(L, 1);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := strGrid.Selection.TopLeft.x;
  r := strGrid.Selection.TopLeft.y;
  Rect := strGrid.CellRect(c,r);
  lua_pushnumber(L,c);
  lua_pushnumber(L,r);
  Result := 2;
end;
function IsGridColumn(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TGridColumn);
end;
function AsGridColumn(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TGridColumn then
    lua_push(L, TGridColumn(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TGridColumn; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TGridColumn',v);
end;

function IsGridColumns(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TGridColumns);
end;
function AsGridColumns(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TGridColumns then
    lua_push(L, TGridColumns(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TGridColumns; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TGridColumns',v);
end;

function IsStringGrid(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TStringGrid);
end;
function AsStringGrid(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TStringGrid then
    lua_push(L, TStringGrid(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TStringGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomStringGrid',v);
end;
function CreateStringGrid(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lStringGrid := TLuaStringGrid.Create(Parent);
	lStringGrid.Parent := TWinControl(Parent);
	lStringGrid.LuaCtl := TVCLuaControl.Create(lStringGrid as TComponent,L,nil,'TCustomStringGrid');
	InitControl(L,lStringGrid,Name);
	CreateTableForKnownType(L,'TCustomStringGrid',lStringGrid);
	Result := 1;
end;

begin
	GridColumnFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(GridColumnFuncs, 'Assign', @VCLua_GridColumn_Assign);
	TLuaMethodInfo.Create(GridColumnFuncs, 'FillDefaultFont', @VCLua_GridColumn_FillDefaultFont);
	TLuaMethodInfo.Create(GridColumnFuncs, 'FixDesignFontsPPI', @VCLua_GridColumn_FixDesignFontsPPI);
	TLuaMethodInfo.Create(GridColumnFuncs, 'ScaleFontsPPI', @VCLua_GridColumn_ScaleFontsPPI);
	TLuaMethodInfo.Create(GridColumnFuncs, 'IsDefault', @VCLua_GridColumn_IsDefault);
	TLuaMethodInfo.Create(GridColumnFuncs, 'Grid', @VCLua_GridColumn_VCLuaGetGrid, mfCall);
	TLuaMethodInfo.Create(GridColumnFuncs, 'DefaultWidth', @VCLua_GridColumn_VCLuaGetDefaultWidth, mfCall);
	TLuaMethodInfo.Create(GridColumnFuncs, 'StoredWidth', @VCLua_GridColumn_VCLuaGetStoredWidth, mfCall);
	TLuaMethodInfo.Create(GridColumnFuncs, 'WidthChanged', @VCLua_GridColumn_VCLuaGetWidthChanged, mfCall);
	GridColumnSets := TLuaVmt.Create;
	
	GridColumnsFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(GridColumnsFuncs, 'Add', @VCLua_GridColumns_Add);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'Clear', @VCLua_GridColumns_Clear);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'ColumnByTitle', @VCLua_GridColumns_ColumnByTitle);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'RealIndex', @VCLua_GridColumns_RealIndex);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'IndexOf', @VCLua_GridColumns_IndexOf);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'IsDefault', @VCLua_GridColumns_IsDefault);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'HasIndex', @VCLua_GridColumns_HasIndex);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'VisibleIndex', @VCLua_GridColumns_VisibleIndex);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'Grid', @VCLua_GridColumns_VCLuaGetGrid, mfCall);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'Items', @VCLua_GridColumns_Items);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'VisibleCount', @VCLua_GridColumns_VCLuaGetVisibleCount, mfCall);
	TLuaMethodInfo.Create(GridColumnsFuncs, 'Enabled', @VCLua_GridColumns_VCLuaGetEnabled, mfCall);
	GridColumnsSets := TLuaVmt.Create;
	
	CustomStringGridFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'AutoSizeColumn', @VCLua_StringGrid_AutoSizeColumn);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'AutoSizeColumns', @VCLua_StringGrid_AutoSizeColumns);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Clean', @VCLua_StringGrid_Clean);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Clean2', @VCLua_StringGrid_Clean2);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Clean3', @VCLua_StringGrid_Clean3);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Clean4', @VCLua_StringGrid_Clean4);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'CopyToClipboard', @VCLua_StringGrid_CopyToClipboard);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'InsertRowWithValues', @VCLua_StringGrid_InsertRowWithValues);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'LoadFromCSVStream', @VCLua_StringGrid_LoadFromCSVStream);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'LoadFromCSVFile', @VCLua_StringGrid_LoadFromCSVFile);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'SaveToCSVStream', @VCLua_StringGrid_SaveToCSVStream);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'SaveToCSVFile', @VCLua_StringGrid_SaveToCSVFile);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Cells', @VCLua_StringGrid_Cells);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Cols', @VCLua_StringGrid_Cols);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Objects', @VCLua_StringGrid_Objects);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'Rows', @VCLua_StringGrid_Rows);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'GetCells', @VCLua_StringGrid_GridCellsGet);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'SetCells', @VCLua_StringGrid_GridCellsSet);
	TLuaMethodInfo.Create(CustomStringGridFuncs, 'GetSelectedCell', @VCLua_StringGrid_GridGetSelectedCell);
	CustomStringGridSets := TLuaVmt.Create;
	
end.
