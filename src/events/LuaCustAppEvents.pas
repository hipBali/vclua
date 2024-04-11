unit LuaCustAppEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, SysUtils;

type
  TLuaExceptionEvent = class(TLuaEvent)
    public
      procedure Handler(Sender : TObject; E : Exception);
  end;


procedure RegisterLuaCustAppEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaException;

procedure RegisterLuaCustAppEvents();
begin
  eventPtrs.Add('TExceptionEvent', @TLuaExceptionEvent.Handler);
end;

procedure TLuaExceptionEvent.Handler(Sender : TObject; E : Exception);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,E);
  DoCall(L,2);
end;

end.
