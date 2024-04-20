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


procedure RegisterLuaEditBtnEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

procedure RegisterLuaEditBtnEvents();
begin
  eventPtrs.Add('TAcceptDateEvent', @TLuaAcceptDateEvent.Handler);
  eventPtrs.Add('TAcceptFileNameEvent', @TLuaAcceptFileNameEvent.Handler);
  eventPtrs.Add('TAcceptTimeEvent', @TLuaAcceptTimeEvent.Handler);
  eventPtrs.Add('TAcceptValueEvent', @TLuaAcceptValueEvent.Handler);
  eventPtrs.Add('TCustomDateEvent', @TLuaCustomDateEvent.Handler);
  eventPtrs.Add('TCustomTimeEvent', @TLuaCustomTimeEvent.Handler);
end;

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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ADate,TypeInfo(TDateTime),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@AcceptDate,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Value,TypeInfo(String),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ATime,TypeInfo(TDateTime),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@AcceptTime,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AValue,TypeInfo(Double),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@Accept,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ADate,TypeInfo(string),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ATime,TypeInfo(TDateTime),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

end.
