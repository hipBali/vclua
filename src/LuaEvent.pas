unit LuaEvent;

{$mode Delphi}{$T+}

interface

uses
  Contnrs,
  Lua;

type
  TLuaCb = TMethod;
  TLuaEvent = class
    public
      L: Plua_State;
      ref: Integer;
      constructor Create(aL: Plua_State); overload;
      constructor Create(aL: Plua_State; index: Integer); overload;
      constructor Create(aL: Plua_State; f: lua_CFunction); overload;
      destructor Destroy; override;
      function ToStack: Plua_State;
      class function Factory<ET,LT>(L: Plua_State):ET;
      class procedure MaybeFree(cb: TLuaCb);
  end;
  TLuaEvents = TFPHashList;

var
  eventPtrs: TLuaEvents;

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

constructor TLuaEvent.Create(aL: Plua_State; index: Integer);
begin
  inherited Create;
  L := aL;
  if lua_type(L, index) <> LUA_TFUNCTION then
    LuaTypeError(L, index, TypeInfo(lua_CFunction));
  lua_pushvalue(L, index);
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
  else begin
    lua_settop(L, 2);
    Result := LT.Create(L).Handler;
  end;
end;

class procedure TLuaEvent.MaybeFree(cb: TLuaCb);
begin
  if Assigned(cb.Data) and (TObject(cb.Data) is TLuaEvent) then
    TObject(cb.Data).Free;
end;

begin
  eventPtrs := TLuaEvents.Create;

end.
