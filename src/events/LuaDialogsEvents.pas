unit LuaDialogsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Forms;

type
  TLuaDialogResultEvent = class(TLuaEvent)
    public
      procedure Handler(sender: TObject; Success: boolean);
  end;

  TLuaInputCloseQueryEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; const AValues: array of string; var ACanClose: boolean);
  end;

  TLuaTaskDlgClickEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; AModalResult: TModalResult; var ACanClose: Boolean);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaDialogResultEvent.Handler(sender: TObject; Success: boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,sender,TypeInfo(sender));
  lua_push(L,Success);
  DoCall(L,2);
end;

procedure TLuaInputCloseQueryEvent.Handler(Sender: TObject; const AValues: array of string; var ACanClose: boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_pushArray<string>(L, AValues);
  lua_push(L,ACanClose);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ACanClose);
end;

procedure TLuaTaskDlgClickEvent.Handler(Sender: TObject; AModalResult: TModalResult; var ACanClose: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AModalResult);
  lua_push(L,ACanClose);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ACanClose);
end;

end.
