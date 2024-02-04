(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStringList;	

interface

Uses Classes, Lua, LuaController, TypInfo;

function CreateStringList(L: Plua_State): Integer; cdecl;
function IsStringList(L: Plua_State): Integer; cdecl;
function AsStringList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStringList; pti: PTypeInfo = nil); overload; inline;
procedure StringListToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStringList = class(TStringList)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_StringList_Add(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lStringList.Add(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_StringList_Clear(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	lStringList.Clear();
	
	Result := 0;
end;

function VCLua_StringList_Delete(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	Index:Integer;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lStringList.Delete(Index);
	
	Result := 0;
end;

function VCLua_StringList_Exchange(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	Index1:Integer;
	Index2:Integer;
begin
	CheckArg(L, 3);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	Index1 := lua_tointeger(L,2);
	Index2 := lua_tointeger(L,3);
	lStringList.Exchange(Index1,Index2);
	
	Result := 0;
end;

function VCLua_StringList_Find(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	S:string;
	Index:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lStringList.Find(S,Index);
	lua_push(L,ret);
	lua_push(L,Index);
	Result := 2;
end;

function VCLua_StringList_IndexOf(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	S := lua_toStringCP(L,2);
	ret := lStringList.IndexOf(S);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_StringList_Insert(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	Index:Integer;
	S:string;
begin
	CheckArg(L, 3);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	S := lua_toStringCP(L,3);
	lStringList.Insert(Index,S);
	
	Result := 0;
end;

function VCLua_StringList_Sort(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	lStringList.Sort();
	
	Result := 0;
end;

function VCLua_StringList_CustomSort(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	CompareFn:TStringListSortCompare;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	CompareFn := TStringListSortCompare(GetLuaObject(L,2));
	lStringList.CustomSort(CompareFn);
	
	Result := 0;
end;

function IsStringList(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TStringList);
end;
function AsStringList(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TStringList then
    lua_push(L, TStringList(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TStringList; pti: PTypeInfo);
begin
	StringListToTable(L,-1,v);
end;
procedure StringListToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_StringList_Add);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_StringList_Clear);
	LuaSetTableFunction(L, Index, 'Delete', @VCLua_StringList_Delete);
	LuaSetTableFunction(L, Index, 'Exchange', @VCLua_StringList_Exchange);
	LuaSetTableFunction(L, Index, 'Find', @VCLua_StringList_Find);
	LuaSetTableFunction(L, Index, 'IndexOf', @VCLua_StringList_IndexOf);
	LuaSetTableFunction(L, Index, 'Insert', @VCLua_StringList_Insert);
	LuaSetTableFunction(L, Index, 'Sort', @VCLua_StringList_Sort);
	LuaSetTableFunction(L, Index, 'CustomSort', @VCLua_StringList_CustomSort);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateStringList(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	lStringList := TLuaStringList.Create;
	StringListToTable(L, -1, lStringList);
	Result := 1;
end;
end.
