unit LuaDialogsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Forms;

type
  TLuaDialogResultEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Success: Boolean);
  end;

  TLuaInputCloseQueryEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; const AValues: array of string; var ACanClose: Boolean);
  end;

  TLuaTaskDlgClickEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; AModalResult: TModalResult; var ACanClose: Boolean);
  end;


procedure RegisterLuaDialogsEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

procedure RegisterLuaDialogsEvents();
begin
  eventPtrs.Add('TDialogResultEvent', @TLuaDialogResultEvent.Handler);
  eventPtrs.Add('TInputCloseQueryEvent', @TLuaInputCloseQueryEvent.Handler);
  eventPtrs.Add('TTaskDlgClickEvent', @TLuaTaskDlgClickEvent.Handler);
end;

procedure TLuaDialogResultEvent.Handler(Sender: TObject; Success: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Success);
  DoCall(L,2);
end;

procedure TLuaInputCloseQueryEvent.Handler(Sender: TObject; const AValues: array of string; var ACanClose: Boolean);
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ACanClose,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ACanClose,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

end.
