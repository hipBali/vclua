(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBrush;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics;

procedure BrushToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBrush = class(TBrush)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Brush_Assign(L: Plua_State): Integer; cdecl;
var 
	lBrush:TLuaBrush;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lBrush.Assign(Source);
	
	Result := 0;
end;

function VCLua_Brush_EqualsBrush(L: Plua_State): Integer; cdecl;
var 
	lBrush:TLuaBrush;
	ABrush:TBrush;
	ret:boolean;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	ABrush := TBrush(GetLuaObject(L,2));
	ret := lBrush.EqualsBrush(ABrush);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

procedure BrushToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Brush_Assign);
	LuaSetTableFunction(L, Index, 'EqualsBrush', @VCLua_Brush_EqualsBrush);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
