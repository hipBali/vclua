unit LuaStdCtrlsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, Controls, StdCtrls;

type
  TLuaDrawItemEvent = class(TLuaEvent)
    public
      procedure Handler(Control: TWinControl; Index: Integer; ARect: TRect; State: TOwnerDrawState);
  end;

  TLuaMeasureItemEvent = class(TLuaEvent)
    public
      procedure Handler(Control: TWinControl; Index: Integer; var AHeight: Integer);
  end;

  TLuaScrollEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
  end;

  TLuaSelectionChangeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; User: boolean);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaDrawItemEvent.Handler(Control: TWinControl; Index: Integer; ARect: TRect; State: TOwnerDrawState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Control,TypeInfo(Control));
  lua_push(L,Index);
  lua_push(L,ARect);
  lua_push(L,State,TypeInfo(State));
  DoCall(L,4);
end;

procedure TLuaMeasureItemEvent.Handler(Control: TWinControl; Index: Integer; var AHeight: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Control,TypeInfo(Control));
  lua_push(L,Index);
  lua_push(L,AHeight);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AHeight);
end;

procedure TLuaScrollEvent.Handler(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ScrollCode,TypeInfo(ScrollCode));
  lua_push(L,ScrollPos);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ScrollPos);
end;

procedure TLuaSelectionChangeEvent.Handler(Sender: TObject; User: boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,User);
  DoCall(L,2);
end;

end.
