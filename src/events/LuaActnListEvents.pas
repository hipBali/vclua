unit LuaActnListEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes;

type
  TLuaActionEvent = class(TLuaEvent)
    public
      procedure Handler(AAction: TBasicAction; var Handled: Boolean);
  end;

  TLuaHintEvent = class(TLuaEvent)
    public
      procedure Handler(var HintStr: string; var CanShow: Boolean);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaBasicAction;

procedure TLuaActionEvent.Handler(AAction: TBasicAction; var Handled: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,AAction);
  lua_push(L,Handled);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Handled);
end;

procedure TLuaHintEvent.Handler(var HintStr: string; var CanShow: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,HintStr);
  lua_push(L,CanShow);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@HintStr);
  if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@CanShow);
end;

end.
