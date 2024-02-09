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

type
    TLuaStringList = class(TStringList)
    public
      L:Plua_State;
    end;
var
    StringListFuncs: aoluaL_Reg;


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
	CreateTableForKnownType(L,'TStringList',v);
end;
function CreateStringList(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	lStringList := TLuaStringList.Create;
	CreateTableForKnownType(L,'TStringList',lStringList);
	Result := 1;
end;
begin
	SetLength(StringListFuncs, 9+1);
	StringListFuncs[0].name:='Add';
	StringListFuncs[0].func:=@VCLua_StringList_Add;
	StringListFuncs[1].name:='Clear';
	StringListFuncs[1].func:=@VCLua_StringList_Clear;
	StringListFuncs[2].name:='Delete';
	StringListFuncs[2].func:=@VCLua_StringList_Delete;
	StringListFuncs[3].name:='Exchange';
	StringListFuncs[3].func:=@VCLua_StringList_Exchange;
	StringListFuncs[4].name:='Find';
	StringListFuncs[4].func:=@VCLua_StringList_Find;
	StringListFuncs[5].name:='IndexOf';
	StringListFuncs[5].func:=@VCLua_StringList_IndexOf;
	StringListFuncs[6].name:='Insert';
	StringListFuncs[6].func:=@VCLua_StringList_Insert;
	StringListFuncs[7].name:='Sort';
	StringListFuncs[7].func:=@VCLua_StringList_Sort;
	StringListFuncs[8].name:='CustomSort';
	StringListFuncs[8].func:=@VCLua_StringList_CustomSort;
	StringListFuncs[9].name:=nil;
	StringListFuncs[9].func:=nil;

end.
