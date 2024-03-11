unit LuaTypesEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent;

type
  TLuaListCallback = class(TLuaEvent)
    public
      procedure Handler(data,arg:pointer);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaListCallback.Handler(data,arg:pointer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_pushlightuserdata(L,data);
  lua_pushlightuserdata(L,arg);
  DoCall(L,2);
end;

end.
