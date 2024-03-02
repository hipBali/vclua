(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStringList;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, TypInfo, LuaVmt;

function CreateStringList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStringList; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStringList = class(TStringList)
    public
      L:Plua_State;
    end;
var
    StringListFuncs: TLuaVmt;
    StringListSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_StringList_Add(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lStringList.Add(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_Clear(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	try
		lStringList.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_Delete(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	Index:Integer;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lStringList.Delete(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_Exchange(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	Index1:Integer;
	Index2:Integer;
begin
	CheckArg(L, 3);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index1);
	luaL_check(L,3,@Index2);
	try
		lStringList.Exchange(Index1,Index2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Exchange', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@S);
	try
		ret := lStringList.Find(S,Index);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Find', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,Index);
end;

function VCLua_StringList_IndexOf(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lStringList.IndexOf(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_Insert(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	Index:Integer;
	S:string;
begin
	CheckArg(L, 3);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@S);
	try
		lStringList.Insert(Index,S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Insert', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_Sort(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	try
		lStringList.Sort();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Sort', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaSetDuplicates(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:TDuplicates;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TDuplicates));
	try
		lStringList.Duplicates := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Duplicates', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetDuplicates(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:TDuplicates;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	try
		ret := lStringList.Duplicates;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Duplicates', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_StringList_VCLuaSetSorted(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:Boolean;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lStringList.Sorted := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Sorted', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetSorted(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	try
		ret := lStringList.Sorted;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'Sorted', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_VCLuaSetCaseSensitive(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:Boolean;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lStringList.CaseSensitive := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'CaseSensitive', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetCaseSensitive(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	try
		ret := lStringList.CaseSensitive;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'CaseSensitive', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_VCLuaSetOwnsObjects(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:boolean;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lStringList.OwnsObjects := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'OwnsObjects', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetOwnsObjects(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:boolean;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	try
		ret := lStringList.OwnsObjects;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'OwnsObjects', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_VCLuaSetSortStyle(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:TStringsSortStyle;
begin
	CheckArg(L, 2);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TStringsSortStyle));
	try
		lStringList.SortStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'SortStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetSortStyle(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:TStringsSortStyle;
begin
	CheckArg(L, 1);
	lStringList := TLuaStringList(GetLuaObject(L, 1));
	try
		ret := lStringList.SortStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'SortStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
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
	StringListFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(StringListFuncs, 'Add', @VCLua_StringList_Add);
	TLuaMethodInfo.Create(StringListFuncs, 'Clear', @VCLua_StringList_Clear);
	TLuaMethodInfo.Create(StringListFuncs, 'Delete', @VCLua_StringList_Delete);
	TLuaMethodInfo.Create(StringListFuncs, 'Exchange', @VCLua_StringList_Exchange);
	TLuaMethodInfo.Create(StringListFuncs, 'Find', @VCLua_StringList_Find);
	TLuaMethodInfo.Create(StringListFuncs, 'IndexOf', @VCLua_StringList_IndexOf);
	TLuaMethodInfo.Create(StringListFuncs, 'Insert', @VCLua_StringList_Insert);
	TLuaMethodInfo.Create(StringListFuncs, 'Sort', @VCLua_StringList_Sort);
	TLuaMethodInfo.Create(StringListFuncs, 'Duplicates', @VCLua_StringList_VCLuaGetDuplicates, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'Sorted', @VCLua_StringList_VCLuaGetSorted, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'CaseSensitive', @VCLua_StringList_VCLuaGetCaseSensitive, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'OwnsObjects', @VCLua_StringList_VCLuaGetOwnsObjects, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'SortStyle', @VCLua_StringList_VCLuaGetSortStyle, mfCall);
	StringListSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(StringListSets, 'Duplicates', @VCLua_StringList_VCLuaSetDuplicates, mfCall);
	TLuaMethodInfo.Create(StringListSets, 'Sorted', @VCLua_StringList_VCLuaSetSorted, mfCall);
	TLuaMethodInfo.Create(StringListSets, 'CaseSensitive', @VCLua_StringList_VCLuaSetCaseSensitive, mfCall);
	TLuaMethodInfo.Create(StringListSets, 'OwnsObjects', @VCLua_StringList_VCLuaSetOwnsObjects, mfCall);
	TLuaMethodInfo.Create(StringListSets, 'SortStyle', @VCLua_StringList_VCLuaSetSortStyle, mfCall);
end.
