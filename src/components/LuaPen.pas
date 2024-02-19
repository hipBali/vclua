(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPen;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo;

function IsPen(L: Plua_State): Integer; cdecl;
function AsPen(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPen; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPen = class(TPen)
    public
      L:Plua_State;
    end;
var
    PenFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

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

function IsPen(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TPen);
end;
function AsPen(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TPen then
    lua_push(L, TPen(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TPen; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPen',v);
end;

begin
	SetLength(PenFuncs, 2+1);
	PenFuncs[0].name:='Assign';
	PenFuncs[0].func:=@VCLua_Pen_Assign;
	PenFuncs[1].name:='SetPattern';
	PenFuncs[1].func:=@VCLua_Pen_SetPattern;
	PenFuncs[2].name:=nil;
	PenFuncs[2].func:=nil;

end.
