unit LuaEvent;

{$mode Delphi}{$T+}

interface

uses
  Lua;

type
  TLuaCb = procedure of object;
  TLuaEvent = class
    public
      L: Plua_State;
      ref: Integer;
      constructor Create(aL: Plua_State); overload;
      constructor Create(aL: Plua_State; f: lua_CFunction); overload;
      destructor Destroy; override;
      function ToStack: Plua_State;
      class function Factory<ET,LT>(L: Plua_State):ET;
      class procedure MaybeFree(cb: TLuaCb);
  end;

implementation

uses
  LuaHelper;

constructor TLuaEvent.Create(aL: Plua_State);
begin
  inherited Create;
  L := aL;
  if lua_type(L, -1) <> LUA_TFUNCTION then
    LuaTypeError(L, -1, TypeInfo(lua_CFunction));
  ref := luaL_ref(L, LUA_REGISTRYINDEX);
end;

constructor TLuaEvent.Create(aL: Plua_State; f: lua_CFunction);
begin
  inherited Create;
  L := aL;
  lua_pushcfunction(L, f);
  ref := luaL_ref(L, LUA_REGISTRYINDEX);
end;

destructor TLuaEvent.Destroy;
begin
  luaL_unref(L, LUA_REGISTRYINDEX, ref);
  inherited Destroy;
end;

function TLuaEvent.ToStack: Plua_State;
begin
  Result := L;
  lua_rawgeti(L, LUA_REGISTRYINDEX, ref);
end;

class function TLuaEvent.Factory<ET,LT>(L: Plua_State):ET;
begin
  if lua_isnil(L, 2) then
    Result := nil
  else
    Result := LT.Create(L).Handler;
end;

class procedure TLuaEvent.MaybeFree(cb: TLuaCb);
begin
  if Assigned(cb) and (TObject(TMethod(cb).Data) is TLuaEvent) then
    TObject(TMethod(cb).Data).Free;
end;

end.
