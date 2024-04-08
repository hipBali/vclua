(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPropertyGrid;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, RTTIGrids;

function CreateTIPropertyGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTIPropertyGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTIPropertyGrid = class(TTIPropertyGrid)
    end;
var
    TIPropertyGridFuncs: TLuaVmt;
    TIPropertyGridSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TTIGridProperty; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTIGridProperty = class(TTIGridProperty)
    end;
var
    TIGridPropertyFuncs: TLuaVmt;
    TIGridPropertySets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TTICustomGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTICustomGrid = class(TTICustomGrid)
    end;
var
    TICustomGridFuncs: TLuaVmt;
    TICustomGridSets: TLuaVmt;

function CreateTIGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTIGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTIGrid = class(TTIGrid)
    end;
var
    TIGridFuncs: TLuaVmt;
    TIGridSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Grids, LuaClassesEvents, LuaEvent, LuaGridsEvents, LuaPersistent, LuaPropEdits, LuaRTTICtrls, LuaRTTIGridsEvents, LuaStrings, PropEdits, RTTICtrls;


function VCLua_TIGridProperty_GetEditorControl(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	ret:TWinControl;
begin
	CheckArg(L, 1);
	lTIGridProperty := TLuaTIGridProperty(GetLuaObject(L, 1));
	try
		ret := lTIGridProperty.GetEditorControl();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'GetEditorControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TIGridProperty_GetButtonEditorControl(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	ret:TWinControl;
begin
	CheckArg(L, 1);
	lTIGridProperty := TLuaTIGridProperty(GetLuaObject(L, 1));
	try
		ret := lTIGridProperty.GetButtonEditorControl();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'GetButtonEditorControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TIGridProperty_PropName(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	ret:string;
begin
	CheckArg(L, 1);
	lTIGridProperty := TLuaTIGridProperty(GetLuaObject(L, 1));
	try
		ret := lTIGridProperty.PropName();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'PropName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGridProperty_VCLuaGetEditor(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	ret:TPropertyEditor;
begin
	lTIGridProperty := TLuaTIGridProperty(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGridProperty.Editor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'GetEditor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGridProperty_VCLuaGetGrid(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	ret:TTICustomGrid;
begin
	lTIGridProperty := TLuaTIGridProperty(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGridProperty.Grid;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'GetGrid', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGridProperty_VCLuaGetIndex(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	ret:integer;
begin
	lTIGridProperty := TLuaTIGridProperty(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGridProperty.Index;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'GetIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGridProperty_VCLuaSetTitle(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	val:string;
begin
	lTIGridProperty := TLuaTIGridProperty(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTIGridProperty.Title := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'SetTitle', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGridProperty_VCLuaGetTitle(L: Plua_State): Integer; cdecl;
var
	lTIGridProperty:TLuaTIGridProperty;
	ret:string;
begin
	lTIGridProperty := TLuaTIGridProperty(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGridProperty.Title;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGridProperty', 'GetTitle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_Loaded(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	CheckArg(L, 1);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	try
		lTICustomGrid.Loaded();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'Loaded', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_ReloadTIList(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	CheckArg(L, 1);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	try
		lTICustomGrid.ReloadTIList();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'ReloadTIList', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_ClearProperties(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	CheckArg(L, 1);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	try
		lTICustomGrid.ClearProperties();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'ClearProperties', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_DefaultDrawCell(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	aCol:Integer;
	aRow:Integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 4);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_checkSet(L,4,@aState,TypeInfo(TGridDrawState));
	try
		lTICustomGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;
	lua_push(L,aRect);
end;

function VCLua_TICustomGrid_DefaultDrawCell2(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	aCol:Integer;
	aRow:Integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 5);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_check(L,4,@aRect);
	luaL_checkSet(L,5,@aState,TypeInfo(TGridDrawState));
	try
		lTICustomGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;
	lua_push(L,aRect);
end;

function VCLua_TICustomGrid_DrawObjectName(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	Index:integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 4);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@aRect);
	luaL_checkSet(L,4,@aState,TypeInfo(TGridDrawState));
	try
		lTICustomGrid.DrawObjectName(Index,aRect,aState);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'DrawObjectName', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_GetCellEditor(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	aCol:integer;
	aRow:integer;
	aPropEditor:TPropertyEditor;
	aIndependentEditor:boolean;
begin
	CheckArg(L, 3);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		lTICustomGrid.GetCellEditor(aCol,aRow,aPropEditor,aIndependentEditor);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetCellEditor', E.ClassName, E.Message);
	end;
	lua_push(L,aPropEditor);
	lua_push(L,aIndependentEditor);
end;

function VCLua_TICustomGrid_FreeCellEditor(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	PropEditor:TPropertyEditor;
begin
	CheckArg(L, 2);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropEditor);
	try
		lTICustomGrid.FreeCellEditor(PropEditor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'FreeCellEditor', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_GridStateToPropEditState(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	GridState:TGridDrawState;
	ret:TPropEditDrawState;
begin
	CheckArg(L, 2);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@GridState,TypeInfo(TGridDrawState));
	try
		ret := lTICustomGrid.GridStateToPropEditState(GridState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GridStateToPropEditState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TICustomGrid_GetTIObject(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	Index:integer;
	ret:TPersistent;
begin
	CheckArg(L, 2);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTICustomGrid.GetTIObject(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetTIObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_MapCell(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	aCol:integer;
	aRow:integer;
	ObjectIndex:integer;
	PropertyIndex:integer;
	CellType:TTIGridCellType;
begin
	CheckArg(L, 3);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		lTICustomGrid.MapCell(aCol,aRow,ObjectIndex,PropertyIndex,CellType);
		Result := 3;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'MapCell', E.ClassName, E.Message);
	end;
	lua_push(L,ObjectIndex);
	lua_push(L,PropertyIndex);
	lua_push(L,CellType,TypeInfo(CellType));
end;

function VCLua_TICustomGrid_GetCurrentGridProperty(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TTIGridProperty;
begin
	CheckArg(L, 1);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	try
		ret := lTICustomGrid.GetCurrentGridProperty();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetCurrentGridProperty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_IndexOfGridProperty(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	PropName:string;
	ret:integer;
begin
	CheckArg(L, 2);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropName);
	try
		ret := lTICustomGrid.IndexOfGridProperty(PropName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'IndexOfGridProperty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_FindGridProperty(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	PropName:string;
	ret:TTIGridProperty;
begin
	CheckArg(L, 2);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropName);
	try
		ret := lTICustomGrid.FindGridProperty(PropName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'FindGridProperty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_MoveProperty(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	FromID:integer;
	ToID:integer;
begin
	CheckArg(L, 3);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@FromID);
	luaL_check(L,3,@ToID);
	try
		lTICustomGrid.MoveProperty(FromID,ToID);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'MoveProperty', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_VCLuaSetAliasPropertyNames(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TAliasStrings;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTICustomGrid.AliasPropertyNames := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetAliasPropertyNames', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_VCLuaGetAliasPropertyNames(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TAliasStrings;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.AliasPropertyNames;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetAliasPropertyNames', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_VCLuaSetFilter(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TTypeKinds;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTypeKinds));
	try
		lTICustomGrid.Filter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetFilter', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_VCLuaGetFilter(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TTypeKinds;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.Filter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetFilter', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TICustomGrid_VCLuaSetHideProperties(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList);
	try
		lTICustomGrid.HideProperties := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetHideProperties', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_TICustomGrid_VCLuaGetHideProperties(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TStrings;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.HideProperties;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetHideProperties', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_VCLuaSetListDirection(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TTIListDirection;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTIListDirection));
	try
		lTICustomGrid.ListDirection := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetListDirection', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_VCLuaGetListDirection(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TTIListDirection;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.ListDirection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetListDirection', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TICustomGrid_VCLuaSetListObject(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TObject;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTICustomGrid.ListObject := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetListObject', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_VCLuaGetListObject(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TObject;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.ListObject;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetListObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TICustomGrid_VCLuaSetOnCreateCellEditor(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnCreateCellEditor));
	lTICustomGrid.OnCreateCellEditor := TLuaEvent.Factory<TTIGridCreateCellEditor,TLuaTIGridCreateCellEditor>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_VCLuaSetOnGetObject(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnGetObject));
	lTICustomGrid.OnGetObject := TLuaEvent.Factory<TTIGridGetObject,TLuaTIGridGetObject>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_VCLuaSetOnGetObjectCount(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnGetObjectCount));
	lTICustomGrid.OnGetObjectCount := TLuaEvent.Factory<TTIGridGetObjectCount,TLuaTIGridGetObjectCount>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_VCLuaSetOnGetObjectName(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnGetObjectName));
	lTICustomGrid.OnGetObjectName := TLuaEvent.Factory<TTIGridGetObjectName,TLuaTIGridGetObjectName>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_VCLuaSetOnHeaderClick(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnHeaderClick));
	lTICustomGrid.OnHeaderClick := TLuaEvent.Factory<THdrEvent,TLuaHdrEvent>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_VCLuaSetOnHeaderSized(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnHeaderSized));
	lTICustomGrid.OnHeaderSized := TLuaEvent.Factory<THdrEvent,TLuaHdrEvent>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_VCLuaSetOnInitCellEditor(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnInitCellEditor));
	lTICustomGrid.OnInitCellEditor := TLuaEvent.Factory<TTIGridInitCellEditor,TLuaTIGridInitCellEditor>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_VCLuaSetOnPropertiesCreated(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTICustomGrid.OnPropertiesCreated));
	lTICustomGrid.OnPropertiesCreated := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_TICustomGrid_Properties(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	Index:integer;
	ret:TTIGridProperty;
begin
	CheckArg(L, 2);
	lTICustomGrid := TLuaTICustomGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTICustomGrid.Properties[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'Properties', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_VCLuaGetPropertyCount(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:integer;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.PropertyCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetPropertyCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_VCLuaSetPropertyOrder(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList);
	try
		lTICustomGrid.PropertyOrder := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetPropertyOrder', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_TICustomGrid_VCLuaGetPropertyOrder(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TStrings;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.PropertyOrder;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetPropertyOrder', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_VCLuaSetShowOnlyProperties(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList);
	try
		lTICustomGrid.ShowOnlyProperties := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetShowOnlyProperties', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_TICustomGrid_VCLuaGetShowOnlyProperties(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TStrings;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.ShowOnlyProperties;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetShowOnlyProperties', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_VCLuaGetTIObjectCount(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:integer;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.TIObjectCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetTIObjectCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TICustomGrid_VCLuaSetTIOptions(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	val:TTIGridOptions;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TTIGridOptions));
	try
		lTICustomGrid.TIOptions := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'SetTIOptions', E.ClassName, E.Message);
	end;
end;

function VCLua_TICustomGrid_VCLuaGetTIOptions(L: Plua_State): Integer; cdecl;
var
	lTICustomGrid:TLuaTICustomGrid;
	ret:TTIGridOptions;
begin
	lTICustomGrid := TLuaTICustomGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTICustomGrid.TIOptions;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TICustomGrid', 'GetTIOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;


procedure lua_push(L: Plua_State; const v: TTIPropertyGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTIPropertyGrid',v);
end;
function CreateTIPropertyGrid(L: Plua_State): Integer; cdecl;
var
	lTIPropertyGrid:TLuaTIPropertyGrid;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTIPropertyGrid := TLuaTIPropertyGrid.Create(Parent);
	lTIPropertyGrid.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TTIPropertyGrid',lTIPropertyGrid);
	InitControl(L,lTIPropertyGrid,Name);
	Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TTIGridProperty; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTIGridProperty',v);
end;

procedure lua_push(L: Plua_State; const v: TTICustomGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTICustomGrid',v);
end;

procedure lua_push(L: Plua_State; const v: TTIGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTIGrid',v);
end;
function CreateTIGrid(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTIGrid := TLuaTIGrid.Create(Parent);
	lTIGrid.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TTIGrid',lTIGrid);
	InitControl(L,lTIGrid,Name);
	Result := 1;
end;

begin
	TIPropertyGridFuncs := TLuaVmt.Create;
	
	TIPropertyGridSets := TLuaVmt.Create;
	
	TIGridPropertyFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TIGridPropertyFuncs, 'GetEditorControl', @VCLua_TIGridProperty_GetEditorControl);
	TLuaMethodInfo.Create(TIGridPropertyFuncs, 'GetButtonEditorControl', @VCLua_TIGridProperty_GetButtonEditorControl);
	TLuaMethodInfo.Create(TIGridPropertyFuncs, 'PropName', @VCLua_TIGridProperty_PropName);
	TLuaMethodInfo.Create(TIGridPropertyFuncs, 'Editor', @VCLua_TIGridProperty_VCLuaGetEditor, mfCall);
	TLuaMethodInfo.Create(TIGridPropertyFuncs, 'Grid', @VCLua_TIGridProperty_VCLuaGetGrid, mfCall);
	TLuaMethodInfo.Create(TIGridPropertyFuncs, 'Index', @VCLua_TIGridProperty_VCLuaGetIndex, mfCall);
	TLuaMethodInfo.Create(TIGridPropertyFuncs, 'Title', @VCLua_TIGridProperty_VCLuaGetTitle, mfCall);
	TIGridPropertySets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TIGridPropertySets, 'Title', @VCLua_TIGridProperty_VCLuaSetTitle, mfCall, TypeInfo(string));
	TICustomGridFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TICustomGridFuncs, 'Loaded', @VCLua_TICustomGrid_Loaded);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ReloadTIList', @VCLua_TICustomGrid_ReloadTIList);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ClearProperties', @VCLua_TICustomGrid_ClearProperties);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'DefaultDrawCell', @VCLua_TICustomGrid_DefaultDrawCell);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'DefaultDrawCell2', @VCLua_TICustomGrid_DefaultDrawCell2);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'DrawObjectName', @VCLua_TICustomGrid_DrawObjectName);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GetCellEditor', @VCLua_TICustomGrid_GetCellEditor);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'FreeCellEditor', @VCLua_TICustomGrid_FreeCellEditor);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GridStateToPropEditState', @VCLua_TICustomGrid_GridStateToPropEditState);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GetTIObject', @VCLua_TICustomGrid_GetTIObject);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'MapCell', @VCLua_TICustomGrid_MapCell);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GetCurrentGridProperty', @VCLua_TICustomGrid_GetCurrentGridProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'IndexOfGridProperty', @VCLua_TICustomGrid_IndexOfGridProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'FindGridProperty', @VCLua_TICustomGrid_FindGridProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'MoveProperty', @VCLua_TICustomGrid_MoveProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'AliasPropertyNames', @VCLua_TICustomGrid_VCLuaGetAliasPropertyNames, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'Filter', @VCLua_TICustomGrid_VCLuaGetFilter, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'HideProperties', @VCLua_TICustomGrid_VCLuaGetHideProperties, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ListDirection', @VCLua_TICustomGrid_VCLuaGetListDirection, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ListObject', @VCLua_TICustomGrid_VCLuaGetListObject, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'Properties', @VCLua_TICustomGrid_Properties);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'PropertyCount', @VCLua_TICustomGrid_VCLuaGetPropertyCount, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'PropertyOrder', @VCLua_TICustomGrid_VCLuaGetPropertyOrder, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ShowOnlyProperties', @VCLua_TICustomGrid_VCLuaGetShowOnlyProperties, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'TIObjectCount', @VCLua_TICustomGrid_VCLuaGetTIObjectCount, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'TIOptions', @VCLua_TICustomGrid_VCLuaGetTIOptions, mfCall);
	TICustomGridSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TICustomGridSets, 'AliasPropertyNames', @VCLua_TICustomGrid_VCLuaSetAliasPropertyNames, mfCall, TypeInfo(TAliasStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'Filter', @VCLua_TICustomGrid_VCLuaSetFilter, mfCall, TypeInfo(TTypeKinds));
	TLuaMethodInfo.Create(TICustomGridSets, 'HideProperties', @VCLua_TICustomGrid_VCLuaSetHideProperties, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'ListDirection', @VCLua_TICustomGrid_VCLuaSetListDirection, mfCall, TypeInfo(TTIListDirection));
	TLuaMethodInfo.Create(TICustomGridSets, 'ListObject', @VCLua_TICustomGrid_VCLuaSetListObject, mfCall, TypeInfo(TObject));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnCreateCellEditor', @VCLua_TICustomGrid_VCLuaSetOnCreateCellEditor, mfCall, TypeInfo(TTIGridCreateCellEditor));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnGetObject', @VCLua_TICustomGrid_VCLuaSetOnGetObject, mfCall, TypeInfo(TTIGridGetObject));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnGetObjectCount', @VCLua_TICustomGrid_VCLuaSetOnGetObjectCount, mfCall, TypeInfo(TTIGridGetObjectCount));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnGetObjectName', @VCLua_TICustomGrid_VCLuaSetOnGetObjectName, mfCall, TypeInfo(TTIGridGetObjectName));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnHeaderClick', @VCLua_TICustomGrid_VCLuaSetOnHeaderClick, mfCall, TypeInfo(THdrEvent));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnHeaderSized', @VCLua_TICustomGrid_VCLuaSetOnHeaderSized, mfCall, TypeInfo(THdrEvent));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnInitCellEditor', @VCLua_TICustomGrid_VCLuaSetOnInitCellEditor, mfCall, TypeInfo(TTIGridInitCellEditor));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnPropertiesCreated', @VCLua_TICustomGrid_VCLuaSetOnPropertiesCreated, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(TICustomGridSets, 'PropertyOrder', @VCLua_TICustomGrid_VCLuaSetPropertyOrder, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'ShowOnlyProperties', @VCLua_TICustomGrid_VCLuaSetShowOnlyProperties, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'TIOptions', @VCLua_TICustomGrid_VCLuaSetTIOptions, mfCall, TypeInfo(TTIGridOptions));
	TIGridFuncs := TLuaVmt.Create;
	
	TIGridSets := TLuaVmt.Create;
	
end.
