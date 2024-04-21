(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaObjectInspector;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ObjectInspector;

procedure lua_push(L: Plua_State; const v: TOIPropertyGridRow; pti: PTypeInfo = nil); overload; inline;

type
    TLuaOIPropertyGridRow = class(TOIPropertyGridRow)
    end;
var
    OIPropertyGridRowFuncs: TLuaVmt;
    OIPropertyGridRowSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TOICustomPropertyGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaOICustomPropertyGrid = class(TOICustomPropertyGrid)
    end;
var
    OICustomPropertyGridFuncs: TLuaVmt;
    OICustomPropertyGridSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TCustomPropertiesGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomPropertiesGrid = class(TCustomPropertiesGrid)
    end;
var
    CustomPropertiesGridFuncs: TLuaVmt;
    CustomPropertiesGridSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaClassesEvents, LuaControlsEvents, LuaEvent, LuaFont, LuaOIFavoriteProperties, LuaObjectInspectorEvents, LuaPersistent, LuaPropEdits, LuaStringList, OIFavoriteProperties, PropEdits;

function VCLua_OIPropertyGridRow_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	CheckArg(L, 1);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	try
		ret := lOIPropertyGridRow.ConsistencyCheck();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'ConsistencyCheck', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_HasChild(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	Row:TOIPropertyGridRow;
	ret:boolean;
begin
	CheckArg(L, 2);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	luaL_check(L,2,@Row);
	try
		ret := lOIPropertyGridRow.HasChild(Row);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'HasChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_WriteDebugReport(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	Prefix:string;
begin
	CheckArg(L, 2);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	luaL_check(L,2,@Prefix);
	try
		lOIPropertyGridRow.WriteDebugReport(Prefix);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'WriteDebugReport', E.ClassName, E.Message);
	end;
end;

function VCLua_OIPropertyGridRow_GetBottom(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	CheckArg(L, 1);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	try
		ret := lOIPropertyGridRow.GetBottom();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetBottom', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_IsReadOnly(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:boolean;
begin
	CheckArg(L, 1);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	try
		ret := lOIPropertyGridRow.IsReadOnly();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'IsReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_IsDisabled(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:boolean;
begin
	CheckArg(L, 1);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	try
		ret := lOIPropertyGridRow.IsDisabled();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'IsDisabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_MeasureHeight(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ACanvas:TCanvas;
begin
	CheckArg(L, 2);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	try
		lOIPropertyGridRow.MeasureHeight(ACanvas);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'MeasureHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_OIPropertyGridRow_Next(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOIPropertyGridRow;
begin
	CheckArg(L, 1);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	try
		ret := lOIPropertyGridRow.Next();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'Next', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_NextSkipChilds(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOIPropertyGridRow;
begin
	CheckArg(L, 1);
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObject(L, 1));
	try
		ret := lOIPropertyGridRow.NextSkipChilds();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'NextSkipChilds', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetEditor(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TPropertyEditor;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Editor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetEditor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaSetTop(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	val:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOIPropertyGridRow.Top := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'SetTop', E.ClassName, E.Message);
	end;
end;

function VCLua_OIPropertyGridRow_VCLuaGetTop(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Top;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaSetHeight(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	val:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOIPropertyGridRow.Height := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'SetHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_OIPropertyGridRow_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetBottom(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Bottom;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetBottom', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetLvl(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Lvl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetLvl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetName(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:string;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Name;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetExpanded(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:boolean;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Expanded;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetExpanded', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetTree(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOICustomPropertyGrid;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Tree;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetTree', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetParent(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOIPropertyGridRow;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Parent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetChildCount(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.ChildCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetChildCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetFirstChild(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOIPropertyGridRow;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.FirstChild;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetFirstChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetLastChild(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOIPropertyGridRow;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.LastChild;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetLastChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetNextBrother(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOIPropertyGridRow;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.NextBrother;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetNextBrother', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetPriorBrother(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:TOIPropertyGridRow;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.PriorBrother;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetPriorBrother', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIPropertyGridRow_VCLuaGetIndex(L: Plua_State): Integer; cdecl;
var
	lOIPropertyGridRow:TLuaOIPropertyGridRow;
	ret:integer;
begin
	lOIPropertyGridRow := TLuaOIPropertyGridRow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIPropertyGridRow.Index;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIPropertyGridRow', 'GetIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_CanEditRowValue(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	CheckFocus:boolean;
	ret:boolean;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@CheckFocus);
	try
		ret := lOICustomPropertyGrid.CanEditRowValue(CheckFocus);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'CanEditRowValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_FocusCurrentEditor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		lOICustomPropertyGrid.FocusCurrentEditor();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'FocusCurrentEditor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_SaveChanges(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		lOICustomPropertyGrid.SaveChanges();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SaveChanges', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_ConsistencyCheck(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		ret := lOICustomPropertyGrid.ConsistencyCheck();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'ConsistencyCheck', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_GetActiveRow(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TOIPropertyGridRow;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		ret := lOICustomPropertyGrid.GetActiveRow();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetActiveRow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_GetHintTypeAt(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	RowIndex:integer;
	X:integer;
	ret:TPropEditHint;
begin
	CheckArg(L, 3);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@RowIndex);
	luaL_check(L,3,@X);
	try
		ret := lOICustomPropertyGrid.GetHintTypeAt(RowIndex,X);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetHintTypeAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_OICustomPropertyGrid_GetRowByPath(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	PropPath:string;
	ret:TOIPropertyGridRow;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropPath);
	try
		ret := lOICustomPropertyGrid.GetRowByPath(PropPath);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetRowByPath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_GridHeight(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		ret := lOICustomPropertyGrid.GridHeight();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GridHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_RealDefaultItemHeight(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		ret := lOICustomPropertyGrid.RealDefaultItemHeight();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'RealDefaultItemHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_MouseToIndex(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	y:integer;
	MustExist:boolean;
	ret:integer;
begin
	CheckArg(L, 3);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@y);
	luaL_check(L,3,@MustExist);
	try
		ret := lOICustomPropertyGrid.MouseToIndex(y,MustExist);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'MouseToIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_PropertyPath(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	Index:integer;
	ret:string;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lOICustomPropertyGrid.PropertyPath(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'PropertyPath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_PropertyPath2(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	Row:TOIPropertyGridRow;
	ret:string;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Row);
	try
		ret := lOICustomPropertyGrid.PropertyPath(Row);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'PropertyPath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_PropertyEditorByName(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	PropName:string;
	ret:TPropertyEditor;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropName);
	try
		ret := lOICustomPropertyGrid.PropertyEditorByName(PropName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'PropertyEditorByName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_TopMax(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		ret := lOICustomPropertyGrid.TopMax();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'TopMax', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_BuildPropertyList(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	OnlyIfNeeded:Boolean;
	FocusEditor:Boolean;
begin
	CheckArg(L, 1, 3);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(CheckLuaObjectPop(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @OnlyIfNeeded, False);
	TTrait<Boolean>.luaL_optcheck(L, 3, @FocusEditor, True);
	try
		lOICustomPropertyGrid.BuildPropertyList(OnlyIfNeeded,FocusEditor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'BuildPropertyList', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_Clear(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		lOICustomPropertyGrid.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_Paint(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		lOICustomPropertyGrid.Paint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'Paint', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_PropEditLookupRootChange(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		lOICustomPropertyGrid.PropEditLookupRootChange();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'PropEditLookupRootChange', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_RefreshPropertyValues(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		lOICustomPropertyGrid.RefreshPropertyValues();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'RefreshPropertyValues', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_ScrollToActiveItem(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	CheckArg(L, 1);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	try
		lOICustomPropertyGrid.ScrollToActiveItem();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'ScrollToActiveItem', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_ScrollToItem(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	NewIndex:Integer;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@NewIndex);
	try
		lOICustomPropertyGrid.ScrollToItem(NewIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'ScrollToItem', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_SetCurrentRowValue(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	NewValue:string;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	try
		lOICustomPropertyGrid.SetCurrentRowValue(NewValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetCurrentRowValue', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_SetItemIndexAndFocus(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	NewItemIndex:integer;
	WasValueClick:Boolean;
begin
	CheckArg(L, 2, 3);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@NewItemIndex);
	TTrait<Boolean>.luaL_optcheck(L, 3, @WasValueClick, False);
	try
		lOICustomPropertyGrid.SetItemIndexAndFocus(NewItemIndex,WasValueClick);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetItemIndexAndFocus', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaSetBackgroundColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.BackgroundColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetBackgroundColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetBackgroundColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.BackgroundColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetBackgroundColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetGutterColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.GutterColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetGutterColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetGutterColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.GutterColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetGutterColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetGutterEdgeColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.GutterEdgeColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetGutterEdgeColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetGutterEdgeColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.GutterEdgeColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetGutterEdgeColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetHighlightColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.HighlightColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetHighlightColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetHighlightColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.HighlightColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetHighlightColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetReferencesColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.ReferencesColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetReferencesColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetReferencesColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.ReferencesColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetReferencesColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetSubPropertiesColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.SubPropertiesColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetSubPropertiesColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetSubPropertiesColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.SubPropertiesColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetSubPropertiesColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetReadOnlyColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.ReadOnlyColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetReadOnlyColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetReadOnlyColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.ReadOnlyColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetReadOnlyColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetValueDifferBackgrndColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lOICustomPropertyGrid.ValueDifferBackgrndColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetValueDifferBackgrndColor', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetValueDifferBackgrndColor(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TColor;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.ValueDifferBackgrndColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetValueDifferBackgrndColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetNameFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.NameFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetNameFont', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetNameFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.NameFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetNameFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetDefaultValueFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.DefaultValueFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetDefaultValueFont', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetDefaultValueFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.DefaultValueFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetDefaultValueFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetValueFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.ValueFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetValueFont', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetValueFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.ValueFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetValueFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetHighlightFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.HighlightFont := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetHighlightFont', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetHighlightFont(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TFont;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.HighlightFont;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetHighlightFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetColumn(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TOICustomPropertyGridColumn;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TOICustomPropertyGridColumn));
	try
		lOICustomPropertyGrid.Column := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetColumn', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetColumn(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TOICustomPropertyGridColumn;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.Column;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetColumn', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_OICustomPropertyGrid_VCLuaSetCurrentEditValue(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:string;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.CurrentEditValue := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetCurrentEditValue', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetCurrentEditValue(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:string;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.CurrentEditValue;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetCurrentEditValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetDefaultItemHeight(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.DefaultItemHeight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetDefaultItemHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetDefaultItemHeight(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.DefaultItemHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetDefaultItemHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetDrawHorzGridLines(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.DrawHorzGridLines := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetDrawHorzGridLines', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetDrawHorzGridLines(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.DrawHorzGridLines;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetDrawHorzGridLines', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaGetExpandedProperties(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TStringList;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.ExpandedProperties;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetExpandedProperties', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetIndent(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.Indent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetIndent', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetIndent(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.Indent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetIndent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetItemIndex(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.ItemIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetItemIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetItemIndex(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.ItemIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetItemIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetLayout(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TOILayout;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TOILayout));
	try
		lOICustomPropertyGrid.Layout := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetLayout', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetLayout(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TOILayout;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.Layout;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetLayout', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_OICustomPropertyGrid_VCLuaSetOnEditorFilter(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lOICustomPropertyGrid.OnEditorFilter));
	lOICustomPropertyGrid.OnEditorFilter := TLuaEvent.Factory<TOIEditorFilterEvent,TLuaOIEditorFilterEvent>(L);
	Result := 0;
end;

function VCLua_OICustomPropertyGrid_VCLuaSetOnModified(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lOICustomPropertyGrid.OnModified));
	lOICustomPropertyGrid.OnModified := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_OICustomPropertyGrid_VCLuaSetOnOIKeyDown(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lOICustomPropertyGrid.OnOIKeyDown));
	lOICustomPropertyGrid.OnOIKeyDown := TLuaEvent.Factory<TKeyEvent,TLuaKeyEvent>(L);
	Result := 0;
end;

function VCLua_OICustomPropertyGrid_VCLuaSetOnSelectionChange(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lOICustomPropertyGrid.OnSelectionChange));
	lOICustomPropertyGrid.OnSelectionChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_OICustomPropertyGrid_VCLuaSetPropertyEditorHook(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TPropertyEditorHook;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.PropertyEditorHook := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetPropertyEditorHook', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetPropertyEditorHook(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TPropertyEditorHook;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.PropertyEditorHook;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetPropertyEditorHook', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaGetRowCount(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.RowCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetRowCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_Rows(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	Index:integer;
	ret:TOIPropertyGridRow;
begin
	CheckArg(L, 2);
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lOICustomPropertyGrid.Rows[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'Rows', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaSetRowSpacing(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.RowSpacing := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetRowSpacing', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetRowSpacing(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.RowSpacing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetRowSpacing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetShowGutter(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.ShowGutter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetShowGutter', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetShowGutter(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.ShowGutter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetShowGutter', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetCheckboxForBoolean(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.CheckboxForBoolean := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetCheckboxForBoolean', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetCheckboxForBoolean(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.CheckboxForBoolean;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetCheckboxForBoolean', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetPreferredSplitterX(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.PreferredSplitterX := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetPreferredSplitterX', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetPreferredSplitterX(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.PreferredSplitterX;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetPreferredSplitterX', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetSplitterX(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.SplitterX := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetSplitterX', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetSplitterX(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.SplitterX;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetSplitterX', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetTopY(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.TopY := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetTopY', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetTopY(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:integer;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.TopY;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetTopY', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetFavorites(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TOIFavoriteProperties;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.Favorites := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetFavorites', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetFavorites(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TOIFavoriteProperties;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.Favorites;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetFavorites', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetFilter(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:TTypeKinds;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTypeKinds));
	try
		lOICustomPropertyGrid.Filter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetFilter', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetFilter(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:TTypeKinds;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.Filter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetFilter', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_OICustomPropertyGrid_VCLuaSetHideClassNames(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.HideClassNames := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetHideClassNames', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetHideClassNames(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:Boolean;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.HideClassNames;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetHideClassNames', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OICustomPropertyGrid_VCLuaSetPropNameFilter(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	val:String;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOICustomPropertyGrid.PropNameFilter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'SetPropNameFilter', E.ClassName, E.Message);
	end;
end;

function VCLua_OICustomPropertyGrid_VCLuaGetPropNameFilter(L: Plua_State): Integer; cdecl;
var
	lOICustomPropertyGrid:TLuaOICustomPropertyGrid;
	ret:String;
begin
	lOICustomPropertyGrid := TLuaOICustomPropertyGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOICustomPropertyGrid.PropNameFilter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OICustomPropertyGrid', 'GetPropNameFilter', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPropertiesGrid_VCLuaSetTIObject(L: Plua_State): Integer; cdecl;
var
	lCustomPropertiesGrid:TLuaCustomPropertiesGrid;
	val:TPersistent;
begin
	lCustomPropertiesGrid := TLuaCustomPropertiesGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomPropertiesGrid.TIObject := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomPropertiesGrid', 'SetTIObject', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomPropertiesGrid_VCLuaGetTIObject(L: Plua_State): Integer; cdecl;
var
	lCustomPropertiesGrid:TLuaCustomPropertiesGrid;
	ret:TPersistent;
begin
	lCustomPropertiesGrid := TLuaCustomPropertiesGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomPropertiesGrid.TIObject;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPropertiesGrid', 'GetTIObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPropertiesGrid_VCLuaSetAutoFreeHook(L: Plua_State): Integer; cdecl;
var
	lCustomPropertiesGrid:TLuaCustomPropertiesGrid;
	val:boolean;
begin
	lCustomPropertiesGrid := TLuaCustomPropertiesGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomPropertiesGrid.AutoFreeHook := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomPropertiesGrid', 'SetAutoFreeHook', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomPropertiesGrid_VCLuaGetAutoFreeHook(L: Plua_State): Integer; cdecl;
var
	lCustomPropertiesGrid:TLuaCustomPropertiesGrid;
	ret:boolean;
begin
	lCustomPropertiesGrid := TLuaCustomPropertiesGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomPropertiesGrid.AutoFreeHook;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPropertiesGrid', 'GetAutoFreeHook', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomPropertiesGrid_VCLuaSetSaveOnChangeTIObject(L: Plua_State): Integer; cdecl;
var
	lCustomPropertiesGrid:TLuaCustomPropertiesGrid;
	val:boolean;
begin
	lCustomPropertiesGrid := TLuaCustomPropertiesGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomPropertiesGrid.SaveOnChangeTIObject := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomPropertiesGrid', 'SetSaveOnChangeTIObject', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomPropertiesGrid_VCLuaGetSaveOnChangeTIObject(L: Plua_State): Integer; cdecl;
var
	lCustomPropertiesGrid:TLuaCustomPropertiesGrid;
	ret:boolean;
begin
	lCustomPropertiesGrid := TLuaCustomPropertiesGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomPropertiesGrid.SaveOnChangeTIObject;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomPropertiesGrid', 'GetSaveOnChangeTIObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TOIPropertyGridRow; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TOIPropertyGridRow',v);
end;

procedure lua_push(L: Plua_State; const v: TOICustomPropertyGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TOICustomPropertyGrid',v);
end;

procedure lua_push(L: Plua_State; const v: TCustomPropertiesGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomPropertiesGrid',v);
end;

begin
	OIPropertyGridRowFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'ConsistencyCheck', @VCLua_OIPropertyGridRow_ConsistencyCheck);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'HasChild', @VCLua_OIPropertyGridRow_HasChild);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'WriteDebugReport', @VCLua_OIPropertyGridRow_WriteDebugReport);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'GetBottom', @VCLua_OIPropertyGridRow_GetBottom);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'IsReadOnly', @VCLua_OIPropertyGridRow_IsReadOnly);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'IsDisabled', @VCLua_OIPropertyGridRow_IsDisabled);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'MeasureHeight', @VCLua_OIPropertyGridRow_MeasureHeight);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Next', @VCLua_OIPropertyGridRow_Next);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'NextSkipChilds', @VCLua_OIPropertyGridRow_NextSkipChilds);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Editor', @VCLua_OIPropertyGridRow_VCLuaGetEditor, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Top', @VCLua_OIPropertyGridRow_VCLuaGetTop, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Height', @VCLua_OIPropertyGridRow_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Bottom', @VCLua_OIPropertyGridRow_VCLuaGetBottom, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Lvl', @VCLua_OIPropertyGridRow_VCLuaGetLvl, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Name', @VCLua_OIPropertyGridRow_VCLuaGetName, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Expanded', @VCLua_OIPropertyGridRow_VCLuaGetExpanded, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Tree', @VCLua_OIPropertyGridRow_VCLuaGetTree, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Parent', @VCLua_OIPropertyGridRow_VCLuaGetParent, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'ChildCount', @VCLua_OIPropertyGridRow_VCLuaGetChildCount, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'FirstChild', @VCLua_OIPropertyGridRow_VCLuaGetFirstChild, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'LastChild', @VCLua_OIPropertyGridRow_VCLuaGetLastChild, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'NextBrother', @VCLua_OIPropertyGridRow_VCLuaGetNextBrother, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'PriorBrother', @VCLua_OIPropertyGridRow_VCLuaGetPriorBrother, mfCall);
	TLuaMethodInfo.Create(OIPropertyGridRowFuncs, 'Index', @VCLua_OIPropertyGridRow_VCLuaGetIndex, mfCall);
	OIPropertyGridRowSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(OIPropertyGridRowSets, 'Top', @VCLua_OIPropertyGridRow_VCLuaSetTop, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OIPropertyGridRowSets, 'Height', @VCLua_OIPropertyGridRow_VCLuaSetHeight, mfCall, TypeInfo(integer));
	OICustomPropertyGridFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'CanEditRowValue', @VCLua_OICustomPropertyGrid_CanEditRowValue);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'FocusCurrentEditor', @VCLua_OICustomPropertyGrid_FocusCurrentEditor);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'SaveChanges', @VCLua_OICustomPropertyGrid_SaveChanges);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ConsistencyCheck', @VCLua_OICustomPropertyGrid_ConsistencyCheck);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'GetActiveRow', @VCLua_OICustomPropertyGrid_GetActiveRow);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'GetHintTypeAt', @VCLua_OICustomPropertyGrid_GetHintTypeAt);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'GetRowByPath', @VCLua_OICustomPropertyGrid_GetRowByPath);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'GridHeight', @VCLua_OICustomPropertyGrid_GridHeight);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'RealDefaultItemHeight', @VCLua_OICustomPropertyGrid_RealDefaultItemHeight);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'MouseToIndex', @VCLua_OICustomPropertyGrid_MouseToIndex);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'PropertyPath', @VCLua_OICustomPropertyGrid_PropertyPath);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'PropertyPath2', @VCLua_OICustomPropertyGrid_PropertyPath2);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'PropertyEditorByName', @VCLua_OICustomPropertyGrid_PropertyEditorByName);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'TopMax', @VCLua_OICustomPropertyGrid_TopMax);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'BuildPropertyList', @VCLua_OICustomPropertyGrid_BuildPropertyList);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Clear', @VCLua_OICustomPropertyGrid_Clear);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Paint', @VCLua_OICustomPropertyGrid_Paint);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'PropEditLookupRootChange', @VCLua_OICustomPropertyGrid_PropEditLookupRootChange);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'RefreshPropertyValues', @VCLua_OICustomPropertyGrid_RefreshPropertyValues);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ScrollToActiveItem', @VCLua_OICustomPropertyGrid_ScrollToActiveItem);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ScrollToItem', @VCLua_OICustomPropertyGrid_ScrollToItem);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'SetCurrentRowValue', @VCLua_OICustomPropertyGrid_SetCurrentRowValue);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'SetItemIndexAndFocus', @VCLua_OICustomPropertyGrid_SetItemIndexAndFocus);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'BackgroundColor', @VCLua_OICustomPropertyGrid_VCLuaGetBackgroundColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'GutterColor', @VCLua_OICustomPropertyGrid_VCLuaGetGutterColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'GutterEdgeColor', @VCLua_OICustomPropertyGrid_VCLuaGetGutterEdgeColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'HighlightColor', @VCLua_OICustomPropertyGrid_VCLuaGetHighlightColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ReferencesColor', @VCLua_OICustomPropertyGrid_VCLuaGetReferencesColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'SubPropertiesColor', @VCLua_OICustomPropertyGrid_VCLuaGetSubPropertiesColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ReadOnlyColor', @VCLua_OICustomPropertyGrid_VCLuaGetReadOnlyColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ValueDifferBackgrndColor', @VCLua_OICustomPropertyGrid_VCLuaGetValueDifferBackgrndColor, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'NameFont', @VCLua_OICustomPropertyGrid_VCLuaGetNameFont, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'DefaultValueFont', @VCLua_OICustomPropertyGrid_VCLuaGetDefaultValueFont, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ValueFont', @VCLua_OICustomPropertyGrid_VCLuaGetValueFont, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'HighlightFont', @VCLua_OICustomPropertyGrid_VCLuaGetHighlightFont, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Column', @VCLua_OICustomPropertyGrid_VCLuaGetColumn, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'CurrentEditValue', @VCLua_OICustomPropertyGrid_VCLuaGetCurrentEditValue, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'DefaultItemHeight', @VCLua_OICustomPropertyGrid_VCLuaGetDefaultItemHeight, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'DrawHorzGridLines', @VCLua_OICustomPropertyGrid_VCLuaGetDrawHorzGridLines, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ExpandedProperties', @VCLua_OICustomPropertyGrid_VCLuaGetExpandedProperties, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Indent', @VCLua_OICustomPropertyGrid_VCLuaGetIndent, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ItemIndex', @VCLua_OICustomPropertyGrid_VCLuaGetItemIndex, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Layout', @VCLua_OICustomPropertyGrid_VCLuaGetLayout, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'PropertyEditorHook', @VCLua_OICustomPropertyGrid_VCLuaGetPropertyEditorHook, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'RowCount', @VCLua_OICustomPropertyGrid_VCLuaGetRowCount, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Rows', @VCLua_OICustomPropertyGrid_Rows);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'RowSpacing', @VCLua_OICustomPropertyGrid_VCLuaGetRowSpacing, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'ShowGutter', @VCLua_OICustomPropertyGrid_VCLuaGetShowGutter, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'CheckboxForBoolean', @VCLua_OICustomPropertyGrid_VCLuaGetCheckboxForBoolean, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'PreferredSplitterX', @VCLua_OICustomPropertyGrid_VCLuaGetPreferredSplitterX, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'SplitterX', @VCLua_OICustomPropertyGrid_VCLuaGetSplitterX, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'TopY', @VCLua_OICustomPropertyGrid_VCLuaGetTopY, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Favorites', @VCLua_OICustomPropertyGrid_VCLuaGetFavorites, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'Filter', @VCLua_OICustomPropertyGrid_VCLuaGetFilter, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'HideClassNames', @VCLua_OICustomPropertyGrid_VCLuaGetHideClassNames, mfCall);
	TLuaMethodInfo.Create(OICustomPropertyGridFuncs, 'PropNameFilter', @VCLua_OICustomPropertyGrid_VCLuaGetPropNameFilter, mfCall);
	OICustomPropertyGridSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'BackgroundColor', @VCLua_OICustomPropertyGrid_VCLuaSetBackgroundColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'GutterColor', @VCLua_OICustomPropertyGrid_VCLuaSetGutterColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'GutterEdgeColor', @VCLua_OICustomPropertyGrid_VCLuaSetGutterEdgeColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'HighlightColor', @VCLua_OICustomPropertyGrid_VCLuaSetHighlightColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'ReferencesColor', @VCLua_OICustomPropertyGrid_VCLuaSetReferencesColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'SubPropertiesColor', @VCLua_OICustomPropertyGrid_VCLuaSetSubPropertiesColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'ReadOnlyColor', @VCLua_OICustomPropertyGrid_VCLuaSetReadOnlyColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'ValueDifferBackgrndColor', @VCLua_OICustomPropertyGrid_VCLuaSetValueDifferBackgrndColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'NameFont', @VCLua_OICustomPropertyGrid_VCLuaSetNameFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'DefaultValueFont', @VCLua_OICustomPropertyGrid_VCLuaSetDefaultValueFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'ValueFont', @VCLua_OICustomPropertyGrid_VCLuaSetValueFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'HighlightFont', @VCLua_OICustomPropertyGrid_VCLuaSetHighlightFont, mfCall, TypeInfo(TFont));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'Column', @VCLua_OICustomPropertyGrid_VCLuaSetColumn, mfCall, TypeInfo(TOICustomPropertyGridColumn));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'CurrentEditValue', @VCLua_OICustomPropertyGrid_VCLuaSetCurrentEditValue, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'DefaultItemHeight', @VCLua_OICustomPropertyGrid_VCLuaSetDefaultItemHeight, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'DrawHorzGridLines', @VCLua_OICustomPropertyGrid_VCLuaSetDrawHorzGridLines, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'Indent', @VCLua_OICustomPropertyGrid_VCLuaSetIndent, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'ItemIndex', @VCLua_OICustomPropertyGrid_VCLuaSetItemIndex, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'Layout', @VCLua_OICustomPropertyGrid_VCLuaSetLayout, mfCall, TypeInfo(TOILayout));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'OnEditorFilter', @VCLua_OICustomPropertyGrid_VCLuaSetOnEditorFilter, mfCall, TypeInfo(TOIEditorFilterEvent));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'OnModified', @VCLua_OICustomPropertyGrid_VCLuaSetOnModified, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'OnOIKeyDown', @VCLua_OICustomPropertyGrid_VCLuaSetOnOIKeyDown, mfCall, TypeInfo(TKeyEvent));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'OnSelectionChange', @VCLua_OICustomPropertyGrid_VCLuaSetOnSelectionChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'PropertyEditorHook', @VCLua_OICustomPropertyGrid_VCLuaSetPropertyEditorHook, mfCall, TypeInfo(TPropertyEditorHook));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'RowSpacing', @VCLua_OICustomPropertyGrid_VCLuaSetRowSpacing, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'ShowGutter', @VCLua_OICustomPropertyGrid_VCLuaSetShowGutter, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'CheckboxForBoolean', @VCLua_OICustomPropertyGrid_VCLuaSetCheckboxForBoolean, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'PreferredSplitterX', @VCLua_OICustomPropertyGrid_VCLuaSetPreferredSplitterX, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'SplitterX', @VCLua_OICustomPropertyGrid_VCLuaSetSplitterX, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'TopY', @VCLua_OICustomPropertyGrid_VCLuaSetTopY, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'Favorites', @VCLua_OICustomPropertyGrid_VCLuaSetFavorites, mfCall, TypeInfo(TOIFavoriteProperties));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'Filter', @VCLua_OICustomPropertyGrid_VCLuaSetFilter, mfCall, TypeInfo(TTypeKinds));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'HideClassNames', @VCLua_OICustomPropertyGrid_VCLuaSetHideClassNames, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(OICustomPropertyGridSets, 'PropNameFilter', @VCLua_OICustomPropertyGrid_VCLuaSetPropNameFilter, mfCall, TypeInfo(String));
	CustomPropertiesGridFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomPropertiesGridFuncs, 'TIObject', @VCLua_CustomPropertiesGrid_VCLuaGetTIObject, mfCall);
	TLuaMethodInfo.Create(CustomPropertiesGridFuncs, 'AutoFreeHook', @VCLua_CustomPropertiesGrid_VCLuaGetAutoFreeHook, mfCall);
	TLuaMethodInfo.Create(CustomPropertiesGridFuncs, 'SaveOnChangeTIObject', @VCLua_CustomPropertiesGrid_VCLuaGetSaveOnChangeTIObject, mfCall);
	CustomPropertiesGridSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomPropertiesGridSets, 'TIObject', @VCLua_CustomPropertiesGrid_VCLuaSetTIObject, mfCall, TypeInfo(TPersistent));
	TLuaMethodInfo.Create(CustomPropertiesGridSets, 'AutoFreeHook', @VCLua_CustomPropertiesGrid_VCLuaSetAutoFreeHook, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(CustomPropertiesGridSets, 'SaveOnChangeTIObject', @VCLua_CustomPropertiesGrid_VCLuaSetSaveOnChangeTIObject, mfCall, TypeInfo(boolean));
end.
