(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRTTICtrls;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, RTTICtrls;

function CreateAliasStrings(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TAliasStrings; pti: PTypeInfo = nil); overload; inline;

type
    TLuaAliasStrings = class(TAliasStrings)
    end;
var
    AliasStringsFuncs: TLuaVmt;
    AliasStringsSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_AliasStrings_IndexOfValue(L: Plua_State): Integer; cdecl;
var
	lAliasStrings:TLuaAliasStrings;
	AValue:string;
	ret:integer;
begin
	CheckArg(L, 2);
	lAliasStrings := TLuaAliasStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lAliasStrings.IndexOfValue(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'AliasStrings', 'IndexOfValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_AliasStrings_ValueAt(L: Plua_State): Integer; cdecl;
var
	lAliasStrings:TLuaAliasStrings;
	Index:integer;
	ret:string;
begin
	CheckArg(L, 2);
	lAliasStrings := TLuaAliasStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lAliasStrings.ValueAt(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'AliasStrings', 'ValueAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_AliasStrings_ValueToAlias(L: Plua_State): Integer; cdecl;
var
	lAliasStrings:TLuaAliasStrings;
	AValue:string;
	ret:string;
begin
	CheckArg(L, 2);
	lAliasStrings := TLuaAliasStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		ret := lAliasStrings.ValueToAlias(AValue);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'AliasStrings', 'ValueToAlias', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_AliasStrings_AliasToValue(L: Plua_State): Integer; cdecl;
var
	lAliasStrings:TLuaAliasStrings;
	Alias:string;
	ret:string;
begin
	CheckArg(L, 2);
	lAliasStrings := TLuaAliasStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Alias);
	try
		ret := lAliasStrings.AliasToValue(Alias);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'AliasStrings', 'AliasToValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TAliasStrings; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TAliasStrings',v);
end;
function CreateAliasStrings(L: Plua_State): Integer; cdecl;
var
	lAliasStrings:TLuaAliasStrings;
begin
	try
	lAliasStrings := TLuaAliasStrings.Create;
	CreateTableForKnownType(L,'TAliasStrings',lAliasStrings);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'AliasStrings', E.ClassName, E.Message);
	end;
end;
begin
	AliasStringsFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(AliasStringsFuncs, 'IndexOfValue', @VCLua_AliasStrings_IndexOfValue);
	TLuaMethodInfo.Create(AliasStringsFuncs, 'ValueAt', @VCLua_AliasStrings_ValueAt);
	TLuaMethodInfo.Create(AliasStringsFuncs, 'ValueToAlias', @VCLua_AliasStrings_ValueToAlias);
	TLuaMethodInfo.Create(AliasStringsFuncs, 'AliasToValue', @VCLua_AliasStrings_AliasToValue);
	AliasStringsSets := TLuaVmt.Create;
	
end.
