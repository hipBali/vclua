(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStringGrid;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Grids, Controls, TypInfo;

function IsGridColumn(L: Plua_State): Integer; cdecl;
function AsGridColumn(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGridColumn; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGridColumn = class(TGridColumn)
    public
      L:Plua_State;
    end;
var
    GridColumnFuncs: aoluaL_Reg;

function IsGridColumns(L: Plua_State): Integer; cdecl;
function AsGridColumns(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGridColumns; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGridColumns = class(TGridColumns)
    public
      L:Plua_State;
    end;
var
    GridColumnsFuncs: aoluaL_Reg;

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
    CustomStringGridFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

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
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'Assign', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_GridColumn_FillDefaultFont(L: Plua_State): Integer; cdecl;
var
	lGridColumn:TLuaGridColumn;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	try
		lGridColumn.FillDefaultFont();
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'FillDefaultFont', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'FixDesignFontsPPI', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'ScaleFontsPPI', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'GridColumn', 'IsDefault', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'Add', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_GridColumns_Clear(L: Plua_State): Integer; cdecl;
var
	lGridColumns:TLuaGridColumns;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	try
		lGridColumns.Clear();
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'Clear', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'ColumnByTitle', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'RealIndex', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'IndexOf', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'IsDefault', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'HasIndex', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'GridColumns', 'VisibleIndex', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'AutoSizeColumn', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_StringGrid_AutoSizeColumns(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
begin
	CheckArg(L, 1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	try
		lStringGrid.AutoSizeColumns();
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'AutoSizeColumns', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_StringGrid_Clean(L: Plua_State): Integer; cdecl;
var
	lStringGrid:TLuaStringGrid;
begin
	CheckArg(L, 1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	try
		lStringGrid.Clean();
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'Clean', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'CopyToClipboard', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'InsertRowWithValues', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'LoadFromCSVStream', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'LoadFromCSVFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'SaveToCSVStream', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'StringGrid', 'SaveToCSVFile', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
  lua_pushstring(L,pchar(strGrid.Cells[c,r]));
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
  strGrid.Cells[c,r] := lua_tostring(L,4);
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
	SetLength(GridColumnFuncs, 5+1);
	GridColumnFuncs[0].name:='Assign';
	GridColumnFuncs[0].func:=@VCLua_GridColumn_Assign;
	GridColumnFuncs[1].name:='FillDefaultFont';
	GridColumnFuncs[1].func:=@VCLua_GridColumn_FillDefaultFont;
	GridColumnFuncs[2].name:='FixDesignFontsPPI';
	GridColumnFuncs[2].func:=@VCLua_GridColumn_FixDesignFontsPPI;
	GridColumnFuncs[3].name:='ScaleFontsPPI';
	GridColumnFuncs[3].func:=@VCLua_GridColumn_ScaleFontsPPI;
	GridColumnFuncs[4].name:='IsDefault';
	GridColumnFuncs[4].func:=@VCLua_GridColumn_IsDefault;
	GridColumnFuncs[5].name:=nil;
	GridColumnFuncs[5].func:=nil;

	SetLength(GridColumnsFuncs, 8+1);
	GridColumnsFuncs[0].name:='Add';
	GridColumnsFuncs[0].func:=@VCLua_GridColumns_Add;
	GridColumnsFuncs[1].name:='Clear';
	GridColumnsFuncs[1].func:=@VCLua_GridColumns_Clear;
	GridColumnsFuncs[2].name:='ColumnByTitle';
	GridColumnsFuncs[2].func:=@VCLua_GridColumns_ColumnByTitle;
	GridColumnsFuncs[3].name:='RealIndex';
	GridColumnsFuncs[3].func:=@VCLua_GridColumns_RealIndex;
	GridColumnsFuncs[4].name:='IndexOf';
	GridColumnsFuncs[4].func:=@VCLua_GridColumns_IndexOf;
	GridColumnsFuncs[5].name:='IsDefault';
	GridColumnsFuncs[5].func:=@VCLua_GridColumns_IsDefault;
	GridColumnsFuncs[6].name:='HasIndex';
	GridColumnsFuncs[6].func:=@VCLua_GridColumns_HasIndex;
	GridColumnsFuncs[7].name:='VisibleIndex';
	GridColumnsFuncs[7].func:=@VCLua_GridColumns_VisibleIndex;
	GridColumnsFuncs[8].name:=nil;
	GridColumnsFuncs[8].func:=nil;

	SetLength(CustomStringGridFuncs, 15+1);
	CustomStringGridFuncs[0].name:='AutoSizeColumn';
	CustomStringGridFuncs[0].func:=@VCLua_StringGrid_AutoSizeColumn;
	CustomStringGridFuncs[1].name:='AutoSizeColumns';
	CustomStringGridFuncs[1].func:=@VCLua_StringGrid_AutoSizeColumns;
	CustomStringGridFuncs[2].name:='Clean';
	CustomStringGridFuncs[2].func:=@VCLua_StringGrid_Clean;
	CustomStringGridFuncs[3].name:='Clean2';
	CustomStringGridFuncs[3].func:=@VCLua_StringGrid_Clean2;
	CustomStringGridFuncs[4].name:='Clean3';
	CustomStringGridFuncs[4].func:=@VCLua_StringGrid_Clean3;
	CustomStringGridFuncs[5].name:='Clean4';
	CustomStringGridFuncs[5].func:=@VCLua_StringGrid_Clean4;
	CustomStringGridFuncs[6].name:='CopyToClipboard';
	CustomStringGridFuncs[6].func:=@VCLua_StringGrid_CopyToClipboard;
	CustomStringGridFuncs[7].name:='InsertRowWithValues';
	CustomStringGridFuncs[7].func:=@VCLua_StringGrid_InsertRowWithValues;
	CustomStringGridFuncs[8].name:='LoadFromCSVStream';
	CustomStringGridFuncs[8].func:=@VCLua_StringGrid_LoadFromCSVStream;
	CustomStringGridFuncs[9].name:='LoadFromCSVFile';
	CustomStringGridFuncs[9].func:=@VCLua_StringGrid_LoadFromCSVFile;
	CustomStringGridFuncs[10].name:='SaveToCSVStream';
	CustomStringGridFuncs[10].func:=@VCLua_StringGrid_SaveToCSVStream;
	CustomStringGridFuncs[11].name:='SaveToCSVFile';
	CustomStringGridFuncs[11].func:=@VCLua_StringGrid_SaveToCSVFile;
	CustomStringGridFuncs[12].name:='GetCells';
	CustomStringGridFuncs[12].func:=@VCLua_StringGrid_GridCellsGet;
	CustomStringGridFuncs[13].name:='SetCells';
	CustomStringGridFuncs[13].func:=@VCLua_StringGrid_GridCellsSet;
	CustomStringGridFuncs[14].name:='GetSelectedCell';
	CustomStringGridFuncs[14].func:=@VCLua_StringGrid_GridGetSelectedCell;
	CustomStringGridFuncs[15].name:=nil;
	CustomStringGridFuncs[15].func:=nil;

end.
