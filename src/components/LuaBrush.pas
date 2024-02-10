(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBrush;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo;

function IsBrush(L: Plua_State): Integer; cdecl;
function AsBrush(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBrush; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBrush = class(TBrush)
    public
      L:Plua_State;
    end;
var
    BrushFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Brush_Assign(L: Plua_State): Integer; cdecl;
var
	lBrush:TLuaBrush;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
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
	luaL_check(L,2,@ABrush);
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
	CreateTableForKnownType(L,'TBrush',v);
end;

begin
	SetLength(BrushFuncs, 2+1);
	BrushFuncs[0].name:='Assign';
	BrushFuncs[0].func:=@VCLua_Brush_Assign;
	BrushFuncs[1].name:='EqualsBrush';
	BrushFuncs[1].func:=@VCLua_Brush_EqualsBrush;
	BrushFuncs[2].name:=nil;
	BrushFuncs[2].func:=nil;

end.
