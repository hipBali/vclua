(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBrush;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo;

function IsBrush(L: Plua_State): Integer; cdecl;
function AsBrush(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBrush; pti: PTypeInfo = nil); overload; inline;
procedure BrushToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBrush = class(TBrush)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,ret);
	
	Result := 1;
end;

function IsBrush(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TBrush);
end;
function AsBrush(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TBrush then
    lua_push(L, TBrush(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TBrush; pti: PTypeInfo);
begin
	BrushToTable(L,-1,v);
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
