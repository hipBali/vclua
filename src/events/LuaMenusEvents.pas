unit LuaMenusEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, Graphics, LCLType, Menus;

type
  TLuaMenuChangeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
  end;

  TLuaMenuDrawItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
  end;

  TLuaMenuMeasureItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACanvas: TCanvas; var AWidth, AHeight: Integer);
  end;


procedure RegisterLuaMenusEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaCanvas, LuaMenu, SysUtils;

procedure RegisterLuaMenusEvents();
begin
  eventPtrs.Add('TMenuChangeEvent', @TLuaMenuChangeEvent.Handler);
  eventPtrs.Add('TMenuDrawItemEvent', @TLuaMenuDrawItemEvent.Handler);
  eventPtrs.Add('TMenuMeasureItemEvent', @TLuaMenuMeasureItemEvent.Handler);
end;

procedure TLuaMenuChangeEvent.Handler(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Source);
  lua_push(L,Rebuild);
  DoCall(L,3);
end;

procedure TLuaMenuDrawItemEvent.Handler(Sender: TObject; ACanvas: TCanvas; ARect: TRect; AState: TOwnerDrawState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACanvas);
  lua_push(L,ARect);
  lua_push(L,AState,TypeInfo(AState));
  DoCall(L,4);
end;

procedure TLuaMenuMeasureItemEvent.Handler(Sender: TObject; ACanvas: TCanvas; var AWidth, AHeight: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACanvas);
  lua_push(L,AWidth);
  lua_push(L,AHeight);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AWidth,TypeInfo(Integer),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@AHeight,TypeInfo(Integer),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

end.
