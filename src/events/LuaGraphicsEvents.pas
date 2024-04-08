unit LuaGraphicsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent;

type
  TLuaGetColorStringProc = class(TLuaEvent)
    public
      procedure Handler(const s: AnsiString);
  end;


procedure RegisterLuaGraphicsEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure RegisterLuaGraphicsEvents();
begin
  eventPtrs.Add('TGetColorStringProc', @TLuaGetColorStringProc.Handler);
end;

procedure TLuaGetColorStringProc.Handler(const s: AnsiString);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,s);
  DoCall(L,1);
end;

end.
