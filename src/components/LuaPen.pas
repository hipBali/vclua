(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPen;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics;

procedure PenToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPen = class(TPen)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

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
