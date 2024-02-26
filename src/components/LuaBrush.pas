(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBrush;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo, LuaVmt;

function IsBrush(L: Plua_State): Integer; cdecl;
function AsBrush(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBrush; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBrush = class(TBrush)
    public
      L:Plua_State;
    end;
var
    BrushFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

function VCLua_Brush_Assign(L: Plua_State): Integer; cdecl;
var
	lBrush:TLuaBrush;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lBrush.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Brush', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Brush_EqualsBrush(L: Plua_State): Integer; cdecl;
var
	lBrush:TLuaBrush;
	ABrush:TBrush;
	ret:boolean;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	luaL_check(L,2,@ABrush);
	try
		ret := lBrush.EqualsBrush(ABrush);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Brush', 'EqualsBrush', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	CreateTableForKnownType(L,'TBrush',v);
end;

begin
	BrushFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(BrushFuncs, 'Assign', @VCLua_Brush_Assign);
	TLuaMethodInfo.Create(BrushFuncs, 'EqualsBrush', @VCLua_Brush_EqualsBrush);
end.
