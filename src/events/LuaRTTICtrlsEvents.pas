unit LuaRTTICtrlsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent;

type
  TLuaBeforeWriteProperty = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var AllowWrite: boolean);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaBeforeWriteProperty.Handler(Sender: TObject; var AllowWrite: boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AllowWrite);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowWrite);
end;

end.
