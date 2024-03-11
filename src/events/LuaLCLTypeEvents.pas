unit LuaLCLTypeEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent;

type
  TLuaOnShowSelectItemDialogResult = class(TLuaEvent)
    public
      procedure Handler(ASelectedItem: Integer);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaOnShowSelectItemDialogResult.Handler(ASelectedItem: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,ASelectedItem);
  DoCall(L,1);
end;

end.
