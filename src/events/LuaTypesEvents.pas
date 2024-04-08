unit LuaTypesEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent;

type
  TLuaListCallback = class(TLuaEvent)
    public
      procedure Handler(data,arg:pointer);
  end;


procedure RegisterLuaTypesEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure RegisterLuaTypesEvents();
begin
  eventPtrs.Add('TListCallback', @TLuaListCallback.Handler);
end;

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
