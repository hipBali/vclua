(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStringList;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Classes;

function CreateStringList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStringList; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStringList = class(TStringList)
    end;
var
    StringListFuncs: TLuaVmt;
    StringListSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LuaClassesEvents, LuaEvent;

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
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TDuplicates));
	try
		lStringList.Duplicates := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'SetDuplicates', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetDuplicates(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:TDuplicates;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	try
		ret := lStringList.Duplicates;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'GetDuplicates', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_StringList_VCLuaSetSorted(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:Boolean;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lStringList.Sorted := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'SetSorted', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetSorted(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:Boolean;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	try
		ret := lStringList.Sorted;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'GetSorted', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_VCLuaSetCaseSensitive(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:Boolean;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lStringList.CaseSensitive := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'SetCaseSensitive', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetCaseSensitive(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:Boolean;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	try
		ret := lStringList.CaseSensitive;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'GetCaseSensitive', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lStringList.OnChange));
	lStringList.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_StringList_VCLuaSetOnChanging(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lStringList.OnChanging));
	lStringList.OnChanging := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_StringList_VCLuaSetOwnsObjects(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:boolean;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lStringList.OwnsObjects := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'SetOwnsObjects', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetOwnsObjects(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:boolean;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	try
		ret := lStringList.OwnsObjects;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'GetOwnsObjects', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StringList_VCLuaSetSortStyle(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	val:TStringsSortStyle;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TStringsSortStyle));
	try
		lStringList.SortStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StringList', 'SetSortStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_StringList_VCLuaGetSortStyle(L: Plua_State): Integer; cdecl;
var
	lStringList:TLuaStringList;
	ret:TStringsSortStyle;
begin
	lStringList := TLuaStringList(GetLuaObjectUnsafe(L, 1));
	try
		ret := lStringList.SortStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StringList', 'GetSortStyle', E.ClassName, E.Message);
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
	try
	lStringList := TLuaStringList.Create;
	CreateTableForKnownType(L,'TStringList',lStringList);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'StringList', E.ClassName, E.Message);
	end;
end;
begin
	StringListFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(StringListFuncs, 'Find', @VCLua_StringList_Find);
	TLuaMethodInfo.Create(StringListFuncs, 'Sort', @VCLua_StringList_Sort);
	TLuaMethodInfo.Create(StringListFuncs, 'Duplicates', @VCLua_StringList_VCLuaGetDuplicates, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'Sorted', @VCLua_StringList_VCLuaGetSorted, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'CaseSensitive', @VCLua_StringList_VCLuaGetCaseSensitive, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'OwnsObjects', @VCLua_StringList_VCLuaGetOwnsObjects, mfCall);
	TLuaMethodInfo.Create(StringListFuncs, 'SortStyle', @VCLua_StringList_VCLuaGetSortStyle, mfCall);
	StringListSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(StringListSets, 'Duplicates', @VCLua_StringList_VCLuaSetDuplicates, mfCall, TypeInfo(TDuplicates));
	TLuaMethodInfo.Create(StringListSets, 'Sorted', @VCLua_StringList_VCLuaSetSorted, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(StringListSets, 'CaseSensitive', @VCLua_StringList_VCLuaSetCaseSensitive, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(StringListSets, 'OnChange', @VCLua_StringList_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(StringListSets, 'OnChanging', @VCLua_StringList_VCLuaSetOnChanging, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(StringListSets, 'OwnsObjects', @VCLua_StringList_VCLuaSetOwnsObjects, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(StringListSets, 'SortStyle', @VCLua_StringList_VCLuaSetSortStyle, mfCall, TypeInfo(TStringsSortStyle));
end.
