(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStringGrid;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Grids, Controls, TypInfo;

function IsGridColumn(L: Plua_State): Integer; cdecl;
function AsGridColumn(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGridColumn; pti: PTypeInfo = nil); overload; inline;
procedure GridColumnToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaGridColumn = class(TGridColumn)
    public
      L:Plua_State;
    end;

function IsGridColumns(L: Plua_State): Integer; cdecl;
function AsGridColumns(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGridColumns; pti: PTypeInfo = nil); overload; inline;
procedure GridColumnsToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaGridColumns = class(TGridColumns)
    public
      L:Plua_State;
    end;

function CreateStringGrid(L: Plua_State): Integer; cdecl;
function IsStringGrid(L: Plua_State): Integer; cdecl;
function AsStringGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStringGrid; pti: PTypeInfo = nil); overload; inline;
procedure StringGridToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStringGrid = class(TStringGrid)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_GridColumn_Assign(L: Plua_State): Integer; cdecl;
var 
	lGridColumn:TLuaGridColumn;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lGridColumn.Assign(Source);
	
	Result := 0;
end;

function VCLua_GridColumn_FillDefaultFont(L: Plua_State): Integer; cdecl;
var 
	lGridColumn:TLuaGridColumn;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	lGridColumn.FillDefaultFont();
	
	Result := 0;
end;

function VCLua_GridColumn_FixDesignFontsPPI(L: Plua_State): Integer; cdecl;
var 
	lGridColumn:TLuaGridColumn;
	ADesignTimePPI:Integer;
begin
	CheckArg(L, 2);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	ADesignTimePPI := lua_tointeger(L,2);
	lGridColumn.FixDesignFontsPPI(ADesignTimePPI);
	
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
	AToPPI := lua_tointeger(L,2);
	AProportion := lua_tonumber(L,3);
	lGridColumn.ScaleFontsPPI(AToPPI,AProportion);
	
	Result := 0;
end;

function VCLua_GridColumn_IsDefault(L: Plua_State): Integer; cdecl;
var 
	lGridColumn:TLuaGridColumn;
	ret:boolean;
begin
	CheckArg(L, 1);
	lGridColumn := TLuaGridColumn(GetLuaObject(L, 1));
	ret := lGridColumn.IsDefault();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_GridColumns_Add(L: Plua_State): Integer; cdecl;
var 
	lGridColumns:TLuaGridColumns;
	ret:TGridColumn;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	ret := lGridColumns.Add();
	GridColumnToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_GridColumns_Clear(L: Plua_State): Integer; cdecl;
var 
	lGridColumns:TLuaGridColumns;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	lGridColumns.Clear();
	
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
	aTitle := lua_toStringCP(L,2);
	ret := lGridColumns.ColumnByTitle(aTitle);
	GridColumnToTable(L,-1,ret);
	
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
	Index := lua_tointeger(L,2);
	ret := lGridColumns.RealIndex(Index);
	lua_pushinteger(L,ret);
	
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
	Column := TGridColumn(GetLuaObject(L,2));
	ret := lGridColumns.IndexOf(Column);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_GridColumns_IsDefault(L: Plua_State): Integer; cdecl;
var 
	lGridColumns:TLuaGridColumns;
	ret:boolean;
begin
	CheckArg(L, 1);
	lGridColumns := TLuaGridColumns(GetLuaObject(L, 1));
	ret := lGridColumns.IsDefault();
	lua_pushboolean(L,ret);
	
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
	Index := lua_tointeger(L,2);
	ret := lGridColumns.HasIndex(Index);
	lua_pushboolean(L,ret);
	
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
	Index := lua_tointeger(L,2);
	ret := lGridColumns.VisibleIndex(Index);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_StringGrid_AutoSizeColumn(L: Plua_State): Integer; cdecl;
var 
	lStringGrid:TLuaStringGrid;
	aCol:Integer;
begin
	CheckArg(L, 2);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	aCol := lua_tointeger(L,2);
	lStringGrid.AutoSizeColumn(aCol);
	
	Result := 0;
end;

function VCLua_StringGrid_AutoSizeColumns(L: Plua_State): Integer; cdecl;
var 
	lStringGrid:TLuaStringGrid;
begin
	CheckArg(L, 1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	lStringGrid.AutoSizeColumns();
	
	Result := 0;
end;

function VCLua_StringGrid_Clean(L: Plua_State): Integer; cdecl;
var 
	lStringGrid:TLuaStringGrid;
begin
	CheckArg(L, 1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	lStringGrid.Clean();
	
	Result := 0;
end;

function VCLua_StringGrid_Clean2(L: Plua_State): Integer; cdecl;
var 
	lStringGrid:TLuaStringGrid;
	CleanOptions:TGridZoneSet;
begin
	CheckArg(L, 2);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	CleanOptions := TGridZoneSet(GetEnumValue(TypeInfo(TGridZoneSet),lua_tostring(L,2)));
	lStringGrid.Clean(CleanOptions);
	
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
	aRect := lua_toTRect(L,2);
	CleanOptions := TGridZoneSet(GetEnumValue(TypeInfo(TGridZoneSet),lua_tostring(L,3)));
	lStringGrid.Clean(aRect,CleanOptions);
	
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
	StartCol := lua_tointeger(L,2);
	StartRow := lua_tointeger(L,3);
	EndCol := lua_tointeger(L,4);
	EndRow := lua_tointeger(L,5);
	CleanOptions := TGridZoneSet(GetEnumValue(TypeInfo(TGridZoneSet),lua_tostring(L,6)));
	lStringGrid.Clean(StartCol,StartRow,EndCol,EndRow,CleanOptions);
	
	Result := 0;
end;

function VCLua_StringGrid_CopyToClipboard(L: Plua_State): Integer; cdecl;
var 
	lStringGrid:TLuaStringGrid;
	AUseSelection:boolean;
begin
	CheckArg(L, -1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	AUseSelection := luaL_optbool(L,2,false);
	lStringGrid.CopyToClipboard(AUseSelection);
	
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
	Index := lua_tointeger(L,2);
	Values := lua_toStringArray(L,3);
	lStringGrid.InsertRowWithValues(Index,Values);
	
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
	CheckArg(L, -1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	ADelimiter := char(luaL_optstring(L,3,','));
	UseTitles := luaL_optbool(L,4,true);
	FromLine := luaL_optint(L,5,0);
	SkipEmptyLines := luaL_optbool(L,6,true);
	lStringGrid.LoadFromCSVStream(AStream,ADelimiter,UseTitles,FromLine,SkipEmptyLines);
	
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
	CheckArg(L, -1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	AFilename := lua_toStringCP(L,2);
	ADelimiter := char(luaL_optstring(L,3,','));
	UseTitles := luaL_optbool(L,4,true);
	FromLine := luaL_optint(L,5,0);
	SkipEmptyLines := luaL_optbool(L,6,true);
	lStringGrid.LoadFromCSVFile(AFilename,ADelimiter,UseTitles,FromLine,SkipEmptyLines);
	
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
	CheckArg(L, -1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	ADelimiter := char(luaL_optstring(L,3,','));
	WriteTitles := luaL_optbool(L,4,true);
	VisibleColumnsOnly := luaL_optbool(L,5,false);
	lStringGrid.SaveToCSVStream(AStream,ADelimiter,WriteTitles,VisibleColumnsOnly);
	
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
	CheckArg(L, -1);
	lStringGrid := TLuaStringGrid(GetLuaObject(L, 1));
	AFileName := lua_toStringCP(L,2);
	ADelimiter := char(luaL_optstring(L,3,','));
	WriteTitles := luaL_optbool(L,4,true);
	VisibleColumnsOnly := luaL_optbool(L,5,false);
	lStringGrid.SaveToCSVFile(AFileName,ADelimiter,WriteTitles,VisibleColumnsOnly);
	
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
function VCLua_StringGrid_GridCellRectGet(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r :Integer;
  Rect : TRect;
begin
  CheckArg(L, 3);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  Rect := strGrid.CellRect(c,r);
  lua_pushTRect(L,Rect);
  Result := 1;
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
function VCLua_StringGrid_GridMouseToCell(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  X,Y,c,r :Integer;
begin
  CheckArg(L, 3);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  X := lua_tointeger(L,2);
  Y := lua_tointeger(L,3);
  strGrid.MouseToCell(X, Y, c, r);
  lua_pushnumber(L,c);
  lua_pushnumber(L,r);
  Result := 2;
end;
function VCLua_StringGrid_GridDrawCell(L: Plua_State): Integer; cdecl;
var
  strGrid:TLuaStringGrid;
  c,r:Integer;
  rect:TRect;
  aState:TGridDrawState;
begin
  CheckArg(L, 5);
  strGrid := TLuaStringGrid(GetLuaObject(L, 1));
  c := lua_tointeger(L,2);
  r := lua_tointeger(L,3);
  rect := lua_toTRect(L,4);
  aState := TGridDrawState(GetEnumValue(TypeInfo(TGridDrawState),lua_tostring(L,5)));
  strGrid.defaultdrawcell(c,r,rect,aState);
  Result := 0;
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
	GridColumnToTable(L,-1,v);
end;
procedure GridColumnToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_GridColumn_Assign);
	LuaSetTableFunction(L, Index, 'FillDefaultFont', @VCLua_GridColumn_FillDefaultFont);
	LuaSetTableFunction(L, Index, 'FixDesignFontsPPI', @VCLua_GridColumn_FixDesignFontsPPI);
	LuaSetTableFunction(L, Index, 'ScaleFontsPPI', @VCLua_GridColumn_ScaleFontsPPI);
	LuaSetTableFunction(L, Index, 'IsDefault', @VCLua_GridColumn_IsDefault);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	GridColumnsToTable(L,-1,v);
end;
procedure GridColumnsToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_GridColumns_Add);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_GridColumns_Clear);
	LuaSetTableFunction(L, Index, 'ColumnByTitle', @VCLua_GridColumns_ColumnByTitle);
	LuaSetTableFunction(L, Index, 'RealIndex', @VCLua_GridColumns_RealIndex);
	LuaSetTableFunction(L, Index, 'IndexOf', @VCLua_GridColumns_IndexOf);
	LuaSetTableFunction(L, Index, 'IsDefault', @VCLua_GridColumns_IsDefault);
	LuaSetTableFunction(L, Index, 'HasIndex', @VCLua_GridColumns_HasIndex);
	LuaSetTableFunction(L, Index, 'VisibleIndex', @VCLua_GridColumns_VisibleIndex);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	StringGridToTable(L,-1,v);
end;
procedure StringGridToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AutoSizeColumn', @VCLua_StringGrid_AutoSizeColumn);
	LuaSetTableFunction(L, Index, 'AutoSizeColumns', @VCLua_StringGrid_AutoSizeColumns);
	LuaSetTableFunction(L, Index, 'Clean', @VCLua_StringGrid_Clean);
	LuaSetTableFunction(L, Index, 'Clean2', @VCLua_StringGrid_Clean2);
	LuaSetTableFunction(L, Index, 'Clean3', @VCLua_StringGrid_Clean3);
	LuaSetTableFunction(L, Index, 'Clean4', @VCLua_StringGrid_Clean4);
	LuaSetTableFunction(L, Index, 'CopyToClipboard', @VCLua_StringGrid_CopyToClipboard);
	LuaSetTableFunction(L, Index, 'InsertRowWithValues', @VCLua_StringGrid_InsertRowWithValues);
	LuaSetTableFunction(L, Index, 'LoadFromCSVStream', @VCLua_StringGrid_LoadFromCSVStream);
	LuaSetTableFunction(L, Index, 'LoadFromCSVFile', @VCLua_StringGrid_LoadFromCSVFile);
	LuaSetTableFunction(L, Index, 'SaveToCSVStream', @VCLua_StringGrid_SaveToCSVStream);
	LuaSetTableFunction(L, Index, 'SaveToCSVFile', @VCLua_StringGrid_SaveToCSVFile);
	LuaSetTableFunction(L, Index, 'GetCells', @VCLua_StringGrid_GridCellsGet);
	LuaSetTableFunction(L, Index, 'SetCells', @VCLua_StringGrid_GridCellsSet);
	LuaSetTableFunction(L, Index, 'GetCellRect', @VCLua_StringGrid_GridCellRectGet);
	LuaSetTableFunction(L, Index, 'GetSelectedCell', @VCLua_StringGrid_GridGetSelectedCell);
	LuaSetTableFunction(L, Index, 'MouseToCell', @VCLua_StringGrid_GridMouseToCell);
	LuaSetTableFunction(L, Index, 'DrawCell', @VCLua_StringGrid_GridDrawCell);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lStringGrid.LuaCtl := TVCLuaControl.Create(lStringGrid as TComponent,L,@StringGridToTable);
	InitControl(L,lStringGrid,Name);
	StringGridToTable(L, -1, lStringGrid);
	Result := 1;
end;

end.
