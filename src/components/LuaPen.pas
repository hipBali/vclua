(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPen;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo;

function IsPen(L: Plua_State): Integer; cdecl;
function AsPen(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPen; pti: PTypeInfo = nil); overload; inline;
procedure PenToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPen = class(TPen)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Pen_Assign(L: Plua_State): Integer; cdecl;
var 
	lPen:TLuaPen;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lPen := TLuaPen(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lPen.Assign(Source);
	
	Result := 0;
end;

function VCLua_Pen_SetPattern(L: Plua_State): Integer; cdecl;
var 
	lPen:TLuaPen;
	APattern:TPenPattern;
begin
	CheckArg(L, 2);
	lPen := TLuaPen(GetLuaObject(L, 1));
	APattern := lua_toLongWordArray(L,2);
	lPen.SetPattern(APattern);
	
	Result := 0;
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
	PenToTable(L,-1,v);
end;
procedure PenToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Pen_Assign);
	LuaSetTableFunction(L, Index, 'SetPattern', @VCLua_Pen_SetPattern);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
