(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPen;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, Graphics, TypInfo, LuaVmt;

procedure lua_push(L: Plua_State; const v: TPen; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPen = class(TPen)
    public
      L:Plua_State;
    end;
var
    PenFuncs: TLuaVmt;
    PenSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LCLType;

function VCLua_Pen_Assign(L: Plua_State): Integer; cdecl;
var
	lPen:TLuaPen;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lPen := TLuaPen(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lPen.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Pen', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Pen_VCLuaSetHandle(L: Plua_State): Integer; cdecl;
var
	lPen:TLuaPen;
	val:HPEN;
begin
	CheckArg(L, 2);
	lPen := TLuaPen(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lPen.Handle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Pen', 'Handle', E.ClassName, E.Message);
	end;
end;

function VCLua_Pen_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lPen:TLuaPen;
	ret:HPEN;
begin
	CheckArg(L, 1);
	lPen := TLuaPen(GetLuaObject(L, 1));
	try
		ret := lPen.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Pen', 'Handle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Pen_GetPattern(L: Plua_State): Integer; cdecl;
var
	lPen:TLuaPen;
	ret:TPenPattern;
begin
	CheckArg(L, 1);
	lPen := TLuaPen(GetLuaObject(L, 1));
	try
		ret := lPen.GetPattern();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Pen', 'GetPattern', E.ClassName, E.Message);
	end;
	lua_pushArray<LongWord>(L, ret);
end;

function VCLua_Pen_SetPattern(L: Plua_State): Integer; cdecl;
var
	lPen:TLuaPen;
	APattern:TPenPattern;
begin
	CheckArg(L, 2);
	lPen := TLuaPen(GetLuaObject(L, 1));
	TTrait<LongWord>.luaL_checkArray(L, 2, @APattern);
	try
		lPen.SetPattern(APattern);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Pen', 'SetPattern', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TPen; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPen',v);
end;

begin
	PenFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PenFuncs, 'Assign', @VCLua_Pen_Assign);
	TLuaMethodInfo.Create(PenFuncs, 'Handle', @VCLua_Pen_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(PenFuncs, 'GetPattern', @VCLua_Pen_GetPattern);
	TLuaMethodInfo.Create(PenFuncs, 'SetPattern', @VCLua_Pen_SetPattern);
	PenSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(PenSets, 'Handle', @VCLua_Pen_VCLuaSetHandle, mfCall);
end.
