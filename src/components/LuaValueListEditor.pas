(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaValueListEditor;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ValEdit, Controls;

function CreateValueListEditor(L: Plua_State): Integer; cdecl;
procedure ValueListEditorToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaValueListEditor = class(TValueListEditor)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_ValueListEditor_Clear(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
begin
	CheckArg(L, 1);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	lValueListEditor.Clear();
	
	Result := 0;
end;

function VCLua_ValueListEditor_DeleteColRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	IsColumn:Boolean;
	index:Integer;
begin
	CheckArg(L, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	index := lua_tointeger(L,3);
	lValueListEditor.DeleteColRow(IsColumn,index);
	
	Result := 0;
end;

function VCLua_ValueListEditor_DeleteRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lValueListEditor.DeleteRow(Index);
	
	Result := 0;
end;

function VCLua_ValueListEditor_DeleteCol(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lValueListEditor.DeleteCol(Index);
	
	Result := 0;
end;

function VCLua_ValueListEditor_FindRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	KeyName:string;
	aRow:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	KeyName := lua_toStringCP(L,2);
	ret := lValueListEditor.FindRow(KeyName,aRow);
	lua_pushboolean(L,ret);
	lua_pushinteger(L,aRow);
	Result := 2;
end;

function VCLua_ValueListEditor_InsertColRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	IsColumn:boolean;
	index:integer;
begin
	CheckArg(L, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	index := lua_tointeger(L,3);
	lValueListEditor.InsertColRow(IsColumn,index);
	
	Result := 0;
end;

function VCLua_ValueListEditor_InsertRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	KeyName:string;
	Value:string;
	Append:Boolean;
	ret:Integer;
begin
	CheckArg(L, 4);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	KeyName := lua_toStringCP(L,2);
	Value := lua_toStringCP(L,3);
	Append := lua_toboolean(L,4);
	ret := lValueListEditor.InsertRow(KeyName,Value,Append);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_ValueListEditor_InsertRowWithValues(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
	Values:array of String;
begin
	CheckArg(L, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	Values := lua_toStringArray(L,3);
	lValueListEditor.InsertRowWithValues(Index,Values);
	
	Result := 0;
end;

function VCLua_ValueListEditor_ExchangeColRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	IsColumn:Boolean;
	index:Integer;
	WithIndex:Integer;
begin
	CheckArg(L, 4);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	index := lua_tointeger(L,3);
	WithIndex := lua_tointeger(L,4);
	lValueListEditor.ExchangeColRow(IsColumn,index,WithIndex);
	
	Result := 0;
end;

function VCLua_ValueListEditor_IsEmptyRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	ret := lValueListEditor.IsEmptyRow();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ValueListEditor_IsEmptyRow2(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	aRow:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	aRow := lua_tointeger(L,2);
	ret := lValueListEditor.IsEmptyRow(aRow);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ValueListEditor_LoadFromCSVStream(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	AStream:TStream;
	ADelimiter:Char;
	UseTitles:boolean;
	FromLine:Integer;
	SkipEmptyLines:Boolean;
begin
	CheckArg(L, -1);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	ADelimiter := char(luaL_optstring(L,3,','));
	UseTitles := luaL_optbool(L,4,true);
	FromLine := luaL_optint(L,5,0);
	SkipEmptyLines := luaL_optbool(L,6,true);
	lValueListEditor.LoadFromCSVStream(AStream,ADelimiter,UseTitles,FromLine,SkipEmptyLines);
	
	Result := 0;
end;

function VCLua_ValueListEditor_MoveColRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	IsColumn:Boolean;
	FromIndex:Integer;
	ToIndex:Integer;
begin
	CheckArg(L, 4);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	IsColumn := lua_toboolean(L,2);
	FromIndex := lua_tointeger(L,3);
	ToIndex := lua_tointeger(L,4);
	lValueListEditor.MoveColRow(IsColumn,FromIndex,ToIndex);
	
	Result := 0;
end;

function VCLua_ValueListEditor_RestoreCurrentRow(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	ret := lValueListEditor.RestoreCurrentRow();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ValueListEditor_Sort(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
	IndxFrom:Integer;
	IndxTo:Integer;
begin
	CheckArg(L, 4);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	IndxFrom := lua_tointeger(L,3);
	IndxTo := lua_tointeger(L,4);
	lValueListEditor.Sort(Index,IndxFrom,IndxTo);
	
	Result := 0;
end;

function VCLua_ValueListEditor_Sort2(L: Plua_State): Integer; cdecl;
var 
	lValueListEditor:TLuaValueListEditor;
	ACol:TVleSortCol;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	ACol := TVleSortCol(GetLuaObject(L,2));
	lValueListEditor.Sort(ACol);
	
	Result := 0;
end;

procedure ValueListEditorToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_ValueListEditor_Clear);
	LuaSetTableFunction(L, Index, 'DeleteColRow', @VCLua_ValueListEditor_DeleteColRow);
	LuaSetTableFunction(L, Index, 'DeleteRow', @VCLua_ValueListEditor_DeleteRow);
	LuaSetTableFunction(L, Index, 'DeleteCol', @VCLua_ValueListEditor_DeleteCol);
	LuaSetTableFunction(L, Index, 'FindRow', @VCLua_ValueListEditor_FindRow);
	LuaSetTableFunction(L, Index, 'InsertColRow', @VCLua_ValueListEditor_InsertColRow);
	LuaSetTableFunction(L, Index, 'InsertRow', @VCLua_ValueListEditor_InsertRow);
	LuaSetTableFunction(L, Index, 'InsertRowWithValues', @VCLua_ValueListEditor_InsertRowWithValues);
	LuaSetTableFunction(L, Index, 'ExchangeColRow', @VCLua_ValueListEditor_ExchangeColRow);
	LuaSetTableFunction(L, Index, 'IsEmptyRow', @VCLua_ValueListEditor_IsEmptyRow);
	LuaSetTableFunction(L, Index, 'IsEmptyRow2', @VCLua_ValueListEditor_IsEmptyRow2);
	LuaSetTableFunction(L, Index, 'LoadFromCSVStream', @VCLua_ValueListEditor_LoadFromCSVStream);
	LuaSetTableFunction(L, Index, 'MoveColRow', @VCLua_ValueListEditor_MoveColRow);
	LuaSetTableFunction(L, Index, 'RestoreCurrentRow', @VCLua_ValueListEditor_RestoreCurrentRow);
	LuaSetTableFunction(L, Index, 'Sort', @VCLua_ValueListEditor_Sort);
	LuaSetTableFunction(L, Index, 'Sort2', @VCLua_ValueListEditor_Sort2);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateValueListEditor(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lValueListEditor := TLuaValueListEditor.Create(Parent);
	lValueListEditor.Parent := TWinControl(Parent);
	lValueListEditor.LuaCtl := TVCLuaControl.Create(TControl(lValueListEditor),L,@ValueListEditorToTable);
	InitControl(L,lValueListEditor,Name);
	ValueListEditorToTable(L, -1, lValueListEditor);
	Result := 1;
end;

end.
