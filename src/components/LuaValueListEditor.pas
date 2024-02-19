(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaValueListEditor;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ValEdit, TypInfo;

function CreateValueListEditor(L: Plua_State): Integer; cdecl;
function IsValueListEditor(L: Plua_State): Integer; cdecl;
function AsValueListEditor(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TValueListEditor; pti: PTypeInfo = nil); overload; inline;

type
    TLuaValueListEditor = class(TValueListEditor)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    ValueListEditorFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_ValueListEditor_Clear(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
begin
	CheckArg(L, 1);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	try
		lValueListEditor.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_DeleteColRow(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	IsColumn:Boolean;
	index:Integer;
begin
	CheckArg(L, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lValueListEditor.DeleteColRow(IsColumn,index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'DeleteColRow', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_DeleteRow(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lValueListEditor.DeleteRow(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'DeleteRow', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_DeleteCol(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lValueListEditor.DeleteCol(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'DeleteCol', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@KeyName);
	try
		ret := lValueListEditor.FindRow(KeyName,aRow);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'FindRow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,aRow);
end;

function VCLua_ValueListEditor_InsertColRow(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	IsColumn:boolean;
	index:integer;
begin
	CheckArg(L, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	try
		lValueListEditor.InsertColRow(IsColumn,index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'InsertColRow', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@KeyName);
	luaL_check(L,3,@Value);
	luaL_check(L,4,@Append);
	try
		ret := lValueListEditor.InsertRow(KeyName,Value,Append);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'InsertRow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ValueListEditor_InsertRowWithValues(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
	Values:array of String;
begin
	CheckArg(L, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	TTrait<String>.luaL_checkArray(L, 3, @Values);
	try
		lValueListEditor.InsertRowWithValues(Index,Values);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'InsertRowWithValues', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@index);
	luaL_check(L,4,@WithIndex);
	try
		lValueListEditor.ExchangeColRow(IsColumn,index,WithIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'ExchangeColRow', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_IsEmptyRow(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	try
		ret := lValueListEditor.IsEmptyRow();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'IsEmptyRow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ValueListEditor_IsEmptyRow2(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	aRow:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@aRow);
	try
		ret := lValueListEditor.IsEmptyRow(aRow);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'IsEmptyRow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	CheckArg(L, 2, 6);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	TTrait<Char>.luaL_optcheck(L, 3, @ADelimiter, ',');
	TTrait<boolean>.luaL_optcheck(L, 4, @UseTitles, true);
	TTrait<Integer>.luaL_optcheck(L, 5, @FromLine, 0);
	TTrait<Boolean>.luaL_optcheck(L, 6, @SkipEmptyLines, true);
	try
		lValueListEditor.LoadFromCSVStream(AStream,ADelimiter,UseTitles,FromLine,SkipEmptyLines);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'LoadFromCSVStream', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@IsColumn);
	luaL_check(L,3,@FromIndex);
	luaL_check(L,4,@ToIndex);
	try
		lValueListEditor.MoveColRow(IsColumn,FromIndex,ToIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'MoveColRow', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_RestoreCurrentRow(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	try
		ret := lValueListEditor.RestoreCurrentRow();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'RestoreCurrentRow', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	luaL_check(L,2,@Index);
	luaL_check(L,3,@IndxFrom);
	luaL_check(L,4,@IndxTo);
	try
		lValueListEditor.Sort(Index,IndxFrom,IndxTo);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'Sort', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_Sort2(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	ACol:TVleSortCol;
begin
	CheckArg(L, 1, 2);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	TTraitPti<TVleSortCol>.luaL_optcheck(L, 2, @ACol, colKey, TypeInfo(TVleSortCol));
	try
		lValueListEditor.Sort(ACol);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'Sort', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_Keys(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lValueListEditor.Keys[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lValueListEditor.Keys[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'Keys', E.ClassName, E.Message);
	end;
end;

function VCLua_ValueListEditor_Values(L: Plua_State): Integer; cdecl;
var
	lValueListEditor:TLuaValueListEditor;
	Key:string;
	ret:string;
begin
	CheckArg(L, 2, 3);
	lValueListEditor := TLuaValueListEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Key);
	try
		if lua_isnone(L, 3) then begin
			ret := lValueListEditor.Values[Key];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lValueListEditor.Values[Key] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'ValueListEditor', 'Values', E.ClassName, E.Message);
	end;
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
	CreateTableForKnownType(L,'TValueListEditor',v);
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
	lValueListEditor.LuaCtl := TVCLuaControl.Create(lValueListEditor as TComponent,L,nil,'TValueListEditor');
	InitControl(L,lValueListEditor,Name);
	CreateTableForKnownType(L,'TValueListEditor',lValueListEditor);
	Result := 1;
end;

begin
	SetLength(ValueListEditorFuncs, 18+1);
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
	ValueListEditorFuncs[16].name:='Keys';
	ValueListEditorFuncs[16].func:=@VCLua_ValueListEditor_Keys;
	ValueListEditorFuncs[17].name:='Values';
	ValueListEditorFuncs[17].func:=@VCLua_ValueListEditor_Values;
	ValueListEditorFuncs[18].name:=nil;
	ValueListEditorFuncs[18].func:=nil;

end.
