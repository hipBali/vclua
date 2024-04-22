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

function CreateTIGrid(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTIGrid; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTIGrid = class(TTIGrid)
    end;
var
    TICustomGridFuncs: TLuaVmt;
    TICustomGridSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Grids, LuaClassesEvents, LuaEvent, LuaGridsEvents, LuaPersistent, LuaPropEdits, LuaRTTICtrls, LuaRTTIGridsEvents, LuaStrings, LuaWinControl, PropEdits, RTTICtrls;


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
	lua_push(L,ret);
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
	lua_push(L,ret);
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

function VCLua_TIGrid_Loaded(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	CheckArg(L, 1);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	try
		lTIGrid.Loaded();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'Loaded', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_ReloadTIList(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	CheckArg(L, 1);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	try
		lTIGrid.ReloadTIList();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'ReloadTIList', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_ClearProperties(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	CheckArg(L, 1);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	try
		lTIGrid.ClearProperties();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'ClearProperties', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_DefaultDrawCell(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	aCol:Integer;
	aRow:Integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 4);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_checkSet(L,4,@aState,TypeInfo(TGridDrawState));
	try
		lTIGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;
	lua_push(L,aRect);
end;

function VCLua_TIGrid_DefaultDrawCell2(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	aCol:Integer;
	aRow:Integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 5);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	luaL_check(L,4,@aRect);
	luaL_checkSet(L,5,@aState,TypeInfo(TGridDrawState));
	try
		lTIGrid.DefaultDrawCell(aCol,aRow,aRect,aState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'DefaultDrawCell', E.ClassName, E.Message);
	end;
	lua_push(L,aRect);
end;

function VCLua_TIGrid_DrawObjectName(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	Index:integer;
	aRect:TRect;
	aState:TGridDrawState;
begin
	CheckArg(L, 4);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@aRect);
	luaL_checkSet(L,4,@aState,TypeInfo(TGridDrawState));
	try
		lTIGrid.DrawObjectName(Index,aRect,aState);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'DrawObjectName', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_GetCellEditor(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	aCol:integer;
	aRow:integer;
	aPropEditor:TPropertyEditor;
	aIndependentEditor:boolean;
begin
	CheckArg(L, 3);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		lTIGrid.GetCellEditor(aCol,aRow,aPropEditor,aIndependentEditor);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetCellEditor', E.ClassName, E.Message);
	end;
	lua_push(L,aPropEditor);
	lua_push(L,aIndependentEditor);
end;

function VCLua_TIGrid_FreeCellEditor(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	PropEditor:TPropertyEditor;
begin
	CheckArg(L, 2);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropEditor);
	try
		lTIGrid.FreeCellEditor(PropEditor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'FreeCellEditor', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_GridStateToPropEditState(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	GridState:TGridDrawState;
	ret:TPropEditDrawState;
begin
	CheckArg(L, 2);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@GridState,TypeInfo(TGridDrawState));
	try
		ret := lTIGrid.GridStateToPropEditState(GridState);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GridStateToPropEditState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TIGrid_GetTIObject(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	Index:integer;
	ret:TPersistent;
begin
	CheckArg(L, 2);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTIGrid.GetTIObject(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetTIObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_MapCell(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	aCol:integer;
	aRow:integer;
	ObjectIndex:integer;
	PropertyIndex:integer;
	CellType:TTIGridCellType;
begin
	CheckArg(L, 3);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@aCol);
	luaL_check(L,3,@aRow);
	try
		lTIGrid.MapCell(aCol,aRow,ObjectIndex,PropertyIndex,CellType);
		Result := 3;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'MapCell', E.ClassName, E.Message);
	end;
	lua_push(L,ObjectIndex);
	lua_push(L,PropertyIndex);
	lua_push(L,CellType,TypeInfo(CellType));
end;

function VCLua_TIGrid_GetCurrentGridProperty(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TTIGridProperty;
begin
	CheckArg(L, 1);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	try
		ret := lTIGrid.GetCurrentGridProperty();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetCurrentGridProperty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_IndexOfGridProperty(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	PropName:string;
	ret:integer;
begin
	CheckArg(L, 2);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropName);
	try
		ret := lTIGrid.IndexOfGridProperty(PropName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'IndexOfGridProperty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_FindGridProperty(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	PropName:string;
	ret:TTIGridProperty;
begin
	CheckArg(L, 2);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@PropName);
	try
		ret := lTIGrid.FindGridProperty(PropName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'FindGridProperty', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_MoveProperty(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	FromID:integer;
	ToID:integer;
begin
	CheckArg(L, 3);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@FromID);
	luaL_check(L,3,@ToID);
	try
		lTIGrid.MoveProperty(FromID,ToID);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'MoveProperty', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_VCLuaSetAliasPropertyNames(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TAliasStrings;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTIGrid.AliasPropertyNames := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetAliasPropertyNames', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_VCLuaGetAliasPropertyNames(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TAliasStrings;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.AliasPropertyNames;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetAliasPropertyNames', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_VCLuaSetFilter(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TTypeKinds;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTypeKinds));
	try
		lTIGrid.Filter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetFilter', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_VCLuaGetFilter(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TTypeKinds;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.Filter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetFilter', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TIGrid_VCLuaSetHideProperties(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList,TypeInfo(val));
	try
		lTIGrid.HideProperties := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetHideProperties', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_TIGrid_VCLuaGetHideProperties(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TStrings;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.HideProperties;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetHideProperties', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_VCLuaSetListDirection(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TTIListDirection;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTIListDirection));
	try
		lTIGrid.ListDirection := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetListDirection', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_VCLuaGetListDirection(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TTIListDirection;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.ListDirection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetListDirection', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TIGrid_VCLuaSetListObject(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TObject;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTIGrid.ListObject := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetListObject', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_VCLuaGetListObject(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TObject;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.ListObject;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetListObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_TIGrid_VCLuaSetOnCreateCellEditor(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnCreateCellEditor));
	lTIGrid.OnCreateCellEditor := TLuaEvent.Factory<TTIGridCreateCellEditor,TLuaTIGridCreateCellEditor>(L);
	Result := 0;
end;

function VCLua_TIGrid_VCLuaSetOnGetObject(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnGetObject));
	lTIGrid.OnGetObject := TLuaEvent.Factory<TTIGridGetObject,TLuaTIGridGetObject>(L);
	Result := 0;
end;

function VCLua_TIGrid_VCLuaSetOnGetObjectCount(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnGetObjectCount));
	lTIGrid.OnGetObjectCount := TLuaEvent.Factory<TTIGridGetObjectCount,TLuaTIGridGetObjectCount>(L);
	Result := 0;
end;

function VCLua_TIGrid_VCLuaSetOnGetObjectName(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnGetObjectName));
	lTIGrid.OnGetObjectName := TLuaEvent.Factory<TTIGridGetObjectName,TLuaTIGridGetObjectName>(L);
	Result := 0;
end;

function VCLua_TIGrid_VCLuaSetOnHeaderClick(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnHeaderClick));
	lTIGrid.OnHeaderClick := TLuaEvent.Factory<THdrEvent,TLuaHdrEvent>(L);
	Result := 0;
end;

function VCLua_TIGrid_VCLuaSetOnHeaderSized(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnHeaderSized));
	lTIGrid.OnHeaderSized := TLuaEvent.Factory<THdrEvent,TLuaHdrEvent>(L);
	Result := 0;
end;

function VCLua_TIGrid_VCLuaSetOnInitCellEditor(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnInitCellEditor));
	lTIGrid.OnInitCellEditor := TLuaEvent.Factory<TTIGridInitCellEditor,TLuaTIGridInitCellEditor>(L);
	Result := 0;
end;

function VCLua_TIGrid_VCLuaSetOnPropertiesCreated(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTIGrid.OnPropertiesCreated));
	lTIGrid.OnPropertiesCreated := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_TIGrid_Properties(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	Index:integer;
	ret:TTIGridProperty;
begin
	CheckArg(L, 2);
	lTIGrid := TLuaTIGrid(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lTIGrid.Properties[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'Properties', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_VCLuaGetPropertyCount(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:integer;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.PropertyCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetPropertyCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_VCLuaSetPropertyOrder(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList,TypeInfo(val));
	try
		lTIGrid.PropertyOrder := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetPropertyOrder', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_TIGrid_VCLuaGetPropertyOrder(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TStrings;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.PropertyOrder;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetPropertyOrder', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_VCLuaSetShowOnlyProperties(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList,TypeInfo(val));
	try
		lTIGrid.ShowOnlyProperties := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetShowOnlyProperties', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_TIGrid_VCLuaGetShowOnlyProperties(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TStrings;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.ShowOnlyProperties;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetShowOnlyProperties', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_VCLuaGetTIObjectCount(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:integer;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.TIObjectCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetTIObjectCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TIGrid_VCLuaSetTIOptions(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	val:TTIGridOptions;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TTIGridOptions));
	try
		lTIGrid.TIOptions := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'SetTIOptions', E.ClassName, E.Message);
	end;
end;

function VCLua_TIGrid_VCLuaGetTIOptions(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	ret:TTIGridOptions;
begin
	lTIGrid := TLuaTIGrid(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTIGrid.TIOptions;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TIGrid', 'GetTIOptions', E.ClassName, E.Message);
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lTIPropertyGrid := TLuaTIPropertyGrid.Create(Parent);
	lTIPropertyGrid.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TTIPropertyGrid',lTIPropertyGrid);
	InitControl(L,lTIPropertyGrid,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TIPropertyGrid', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TTIGridProperty; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTIGridProperty',v);
end;

procedure lua_push(L: Plua_State; const v: TTIGrid; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTICustomGrid',v);
end;
function CreateTIGrid(L: Plua_State): Integer; cdecl;
var
	lTIGrid:TLuaTIGrid;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lTIGrid := TLuaTIGrid.Create(Parent);
	lTIGrid.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TTICustomGrid',lTIGrid);
	InitControl(L,lTIGrid,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TIGrid', E.ClassName, E.Message);
	end;
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
	TLuaMethodInfo.Create(TICustomGridFuncs, 'Loaded', @VCLua_TIGrid_Loaded);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ReloadTIList', @VCLua_TIGrid_ReloadTIList);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ClearProperties', @VCLua_TIGrid_ClearProperties);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'DefaultDrawCell', @VCLua_TIGrid_DefaultDrawCell);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'DefaultDrawCell2', @VCLua_TIGrid_DefaultDrawCell2);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'DrawObjectName', @VCLua_TIGrid_DrawObjectName);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GetCellEditor', @VCLua_TIGrid_GetCellEditor);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'FreeCellEditor', @VCLua_TIGrid_FreeCellEditor);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GridStateToPropEditState', @VCLua_TIGrid_GridStateToPropEditState);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GetTIObject', @VCLua_TIGrid_GetTIObject);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'MapCell', @VCLua_TIGrid_MapCell);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'GetCurrentGridProperty', @VCLua_TIGrid_GetCurrentGridProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'IndexOfGridProperty', @VCLua_TIGrid_IndexOfGridProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'FindGridProperty', @VCLua_TIGrid_FindGridProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'MoveProperty', @VCLua_TIGrid_MoveProperty);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'AliasPropertyNames', @VCLua_TIGrid_VCLuaGetAliasPropertyNames, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'Filter', @VCLua_TIGrid_VCLuaGetFilter, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'HideProperties', @VCLua_TIGrid_VCLuaGetHideProperties, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ListDirection', @VCLua_TIGrid_VCLuaGetListDirection, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ListObject', @VCLua_TIGrid_VCLuaGetListObject, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'Properties', @VCLua_TIGrid_Properties);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'PropertyCount', @VCLua_TIGrid_VCLuaGetPropertyCount, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'PropertyOrder', @VCLua_TIGrid_VCLuaGetPropertyOrder, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'ShowOnlyProperties', @VCLua_TIGrid_VCLuaGetShowOnlyProperties, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'TIObjectCount', @VCLua_TIGrid_VCLuaGetTIObjectCount, mfCall);
	TLuaMethodInfo.Create(TICustomGridFuncs, 'TIOptions', @VCLua_TIGrid_VCLuaGetTIOptions, mfCall);
	TICustomGridSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TICustomGridSets, 'AliasPropertyNames', @VCLua_TIGrid_VCLuaSetAliasPropertyNames, mfCall, TypeInfo(TAliasStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'Filter', @VCLua_TIGrid_VCLuaSetFilter, mfCall, TypeInfo(TTypeKinds));
	TLuaMethodInfo.Create(TICustomGridSets, 'HideProperties', @VCLua_TIGrid_VCLuaSetHideProperties, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'ListDirection', @VCLua_TIGrid_VCLuaSetListDirection, mfCall, TypeInfo(TTIListDirection));
	TLuaMethodInfo.Create(TICustomGridSets, 'ListObject', @VCLua_TIGrid_VCLuaSetListObject, mfCall, TypeInfo(TObject));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnCreateCellEditor', @VCLua_TIGrid_VCLuaSetOnCreateCellEditor, mfCall, TypeInfo(TTIGridCreateCellEditor));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnGetObject', @VCLua_TIGrid_VCLuaSetOnGetObject, mfCall, TypeInfo(TTIGridGetObject));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnGetObjectCount', @VCLua_TIGrid_VCLuaSetOnGetObjectCount, mfCall, TypeInfo(TTIGridGetObjectCount));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnGetObjectName', @VCLua_TIGrid_VCLuaSetOnGetObjectName, mfCall, TypeInfo(TTIGridGetObjectName));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnHeaderClick', @VCLua_TIGrid_VCLuaSetOnHeaderClick, mfCall, TypeInfo(THdrEvent));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnHeaderSized', @VCLua_TIGrid_VCLuaSetOnHeaderSized, mfCall, TypeInfo(THdrEvent));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnInitCellEditor', @VCLua_TIGrid_VCLuaSetOnInitCellEditor, mfCall, TypeInfo(TTIGridInitCellEditor));
	TLuaMethodInfo.Create(TICustomGridSets, 'OnPropertiesCreated', @VCLua_TIGrid_VCLuaSetOnPropertiesCreated, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(TICustomGridSets, 'PropertyOrder', @VCLua_TIGrid_VCLuaSetPropertyOrder, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'ShowOnlyProperties', @VCLua_TIGrid_VCLuaSetShowOnlyProperties, mfCall, TypeInfo(TStrings));
	TLuaMethodInfo.Create(TICustomGridSets, 'TIOptions', @VCLua_TIGrid_VCLuaSetTIOptions, mfCall, TypeInfo(TTIGridOptions));
end.
