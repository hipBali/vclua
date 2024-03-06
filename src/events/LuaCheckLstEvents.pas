unit LuaCheckLstEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent;

type
  TLuaCheckListClicked = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Index: integer);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaCheckListClicked.Handler(Sender: TObject; Index: integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Index);
  DoCall(L,2);
end;

end.
