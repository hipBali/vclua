unit LuaEditBtnEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent;

type
  TLuaAcceptDateEvent = class(TLuaEvent)
    public
      procedure Handler(Sender : TObject; var ADate : TDateTime; var AcceptDate: Boolean);
  end;

  TLuaAcceptFileNameEvent = class(TLuaEvent)
    public
      procedure Handler(Sender : TObject; Var Value : String);
  end;

  TLuaAcceptTimeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender : TObject; var ATime : TDateTime; var AcceptTime: Boolean);
  end;

  TLuaAcceptValueEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var AValue: Double; var Accept: Boolean);
  end;

  TLuaCustomDateEvent = class(TLuaEvent)
    public
      procedure Handler(Sender : TObject; var ADate : string);
  end;

  TLuaCustomTimeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender : TObject; var ATime : TDateTime);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaAcceptDateEvent.Handler(Sender : TObject; var ADate : TDateTime; var AcceptDate: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ADate);
  lua_push(L,AcceptDate);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ADate);
  if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@AcceptDate);
end;

procedure TLuaAcceptFileNameEvent.Handler(Sender : TObject; Var Value : String);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Value);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Value);
end;

procedure TLuaAcceptTimeEvent.Handler(Sender : TObject; var ATime : TDateTime; var AcceptTime: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ATime);
  lua_push(L,AcceptTime);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ATime);
  if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@AcceptTime);
end;

procedure TLuaAcceptValueEvent.Handler(Sender: TObject; var AValue: Double; var Accept: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AValue);
  lua_push(L,Accept);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AValue);
  if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@Accept);
end;

procedure TLuaCustomDateEvent.Handler(Sender : TObject; var ADate : string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ADate);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ADate);
end;

procedure TLuaCustomTimeEvent.Handler(Sender : TObject; var ATime : TDateTime);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ATime);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ATime);
end;

end.
