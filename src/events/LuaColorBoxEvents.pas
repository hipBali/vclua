unit LuaColorBoxEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, ColorBox;

type
  TLuaGetColorsEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomColorBox; Items: TStrings);
  end;

  TLuaLBGetColorsEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomColorListBox; Items: TStrings);
  end;


procedure RegisterLuaColorBoxEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaColorBox, LuaStrings;

procedure RegisterLuaColorBoxEvents();
begin
  eventPtrs.Add('TGetColorsEvent', @TLuaGetColorsEvent.Handler);
  eventPtrs.Add('TLBGetColorsEvent', @TLuaLBGetColorsEvent.Handler);
end;

procedure TLuaGetColorsEvent.Handler(Sender: TCustomColorBox; Items: TStrings);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Items);
  DoCall(L,2);
end;

procedure TLuaLBGetColorsEvent.Handler(Sender: TCustomColorListBox; Items: TStrings);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Items);
  DoCall(L,2);
end;

end.
