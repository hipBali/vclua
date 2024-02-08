(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaValueListEditor;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ValEdit, Controls, TypInfo;

function CreateValueListEditor(L: Plua_State): Integer; cdecl;
function IsValueListEditor(L: Plua_State): Integer; cdecl;
function AsValueListEditor(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TValueListEditor; pti: PTypeInfo = nil); overload; inline;
procedure ValueListEditorToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaValueListEditor = class(TValueListEditor)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    ValueListEditorFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,ret);
	lua_push(L,aRow);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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

function IsValueListEditor(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TValueListEditor);
end;
function AsValueListEditor(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TValueListEditor then
    lua_push(L, TValueListEditor(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TValueListEditor; pti: PTypeInfo);
begin
	ValueListEditorToTable(L,-1,v);
end;
procedure ValueListEditorToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TValueListEditor');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lValueListEditor.LuaCtl := TVCLuaControl.Create(lValueListEditor as TComponent,L,@ValueListEditorToTable);
	InitControl(L,lValueListEditor,Name);
	ValueListEditorToTable(L, -1, lValueListEditor);
	Result := 1;
end;

begin
	SetLength(ValueListEditorFuncs, 16+1);
	ValueListEditorFuncs[0].name:='Clear';
	ValueListEditorFuncs[0].func:=@VCLua_ValueListEditor_Clear;
	ValueListEditorFuncs[1].name:='DeleteColRow';
	ValueListEditorFuncs[1].func:=@VCLua_ValueListEditor_DeleteColRow;
	ValueListEditorFuncs[2].name:='DeleteRow';
	ValueListEditorFuncs[2].func:=@VCLua_ValueListEditor_DeleteRow;
	ValueListEditorFuncs[3].name:='DeleteCol';
	ValueListEditorFuncs[3].func:=@VCLua_ValueListEditor_DeleteCol;
	ValueListEditorFuncs[4].name:='FindRow';
	ValueListEditorFuncs[4].func:=@VCLua_ValueListEditor_FindRow;
	ValueListEditorFuncs[5].name:='InsertColRow';
	ValueListEditorFuncs[5].func:=@VCLua_ValueListEditor_InsertColRow;
	ValueListEditorFuncs[6].name:='InsertRow';
	ValueListEditorFuncs[6].func:=@VCLua_ValueListEditor_InsertRow;
	ValueListEditorFuncs[7].name:='InsertRowWithValues';
	ValueListEditorFuncs[7].func:=@VCLua_ValueListEditor_InsertRowWithValues;
	ValueListEditorFuncs[8].name:='ExchangeColRow';
	ValueListEditorFuncs[8].func:=@VCLua_ValueListEditor_ExchangeColRow;
	ValueListEditorFuncs[9].name:='IsEmptyRow';
	ValueListEditorFuncs[9].func:=@VCLua_ValueListEditor_IsEmptyRow;
	ValueListEditorFuncs[10].name:='IsEmptyRow2';
	ValueListEditorFuncs[10].func:=@VCLua_ValueListEditor_IsEmptyRow2;
	ValueListEditorFuncs[11].name:='LoadFromCSVStream';
	ValueListEditorFuncs[11].func:=@VCLua_ValueListEditor_LoadFromCSVStream;
	ValueListEditorFuncs[12].name:='MoveColRow';
	ValueListEditorFuncs[12].func:=@VCLua_ValueListEditor_MoveColRow;
	ValueListEditorFuncs[13].name:='RestoreCurrentRow';
	ValueListEditorFuncs[13].func:=@VCLua_ValueListEditor_RestoreCurrentRow;
	ValueListEditorFuncs[14].name:='Sort';
	ValueListEditorFuncs[14].func:=@VCLua_ValueListEditor_Sort;
	ValueListEditorFuncs[15].name:='Sort2';
	ValueListEditorFuncs[15].func:=@VCLua_ValueListEditor_Sort2;
	ValueListEditorFuncs[16].name:=nil;
	ValueListEditorFuncs[16].func:=nil;

end.
