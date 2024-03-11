unit LuaValEditEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes;

type
  TLuaGetPickListEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; const KeyName: string; Values: TStrings);
  end;

  TLuaOnValidateEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACol, ARow: Longint; const KeyName, KeyValue: string);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaStrings;

procedure TLuaGetPickListEvent.Handler(Sender: TObject; const KeyName: string; Values: TStrings);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,KeyName);
  lua_push(L,Values);
  DoCall(L,3);
end;

procedure TLuaOnValidateEvent.Handler(Sender: TObject; ACol, ARow: Longint; const KeyName, KeyValue: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACol);
  lua_push(L,ARow);
  lua_push(L,KeyName);
  lua_push(L,KeyValue);
  DoCall(L,5);
end;

end.
