unit LuaFormsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Controls, Forms, LCLType;

type
  TLuaCloseEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var CloseAction: TCloseAction);
  end;

  TLuaCloseQueryEvent = class(TLuaEvent)
    public
      procedure Handler(Sender : TObject; var CanClose: Boolean);
  end;

  TLuaDataEvent = class(TLuaEvent)
    public
      procedure Handler(Data: PtrInt);
  end;

  TLuaDropFilesEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; const FileNames: array of string);
  end;

  TLuaGetHandleEvent = class(TLuaEvent)
    public
      procedure Handler(var Handle: HWND);
  end;

  TLuaIdleEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var Done: Boolean);
  end;

  TLuaModalDialogFinished = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; AResult: Integer);
  end;

  TLuaOnUserInputEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Msg: Cardinal);
  end;

  TLuaQueryEndSessionEvent = class(TLuaEvent)
    public
      procedure Handler(var Cancel: Boolean);
  end;

  TLuaScreenControlEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; LastControl: TControl);
  end;

  TLuaScreenFormEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Form: TCustomForm);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaControl, LuaForm;

procedure TLuaCloseEvent.Handler(Sender: TObject; var CloseAction: TCloseAction);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,CloseAction,TypeInfo(CloseAction));
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@CloseAction,TypeInfo(TCloseAction));
end;

procedure TLuaCloseQueryEvent.Handler(Sender : TObject; var CanClose: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,CanClose);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@CanClose);
end;

procedure TLuaDataEvent.Handler(Data: PtrInt);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Data);
  DoCall(L,1);
end;

procedure TLuaDropFilesEvent.Handler(Sender: TObject; const FileNames: array of string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_pushArray<string>(L, FileNames);
  DoCall(L,2);
end;

procedure TLuaGetHandleEvent.Handler(var Handle: HWND);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Handle);
  DoCall(L,1);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Handle);
end;

procedure TLuaIdleEvent.Handler(Sender: TObject; var Done: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Done);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Done);
end;

procedure TLuaModalDialogFinished.Handler(Sender: TObject; AResult: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AResult);
  DoCall(L,2);
end;

procedure TLuaOnUserInputEvent.Handler(Sender: TObject; Msg: Cardinal);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Msg);
  DoCall(L,2);
end;

procedure TLuaQueryEndSessionEvent.Handler(var Cancel: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Cancel);
  DoCall(L,1);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Cancel);
end;

procedure TLuaScreenControlEvent.Handler(Sender: TObject; LastControl: TControl);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,LastControl);
  DoCall(L,2);
end;

procedure TLuaScreenFormEvent.Handler(Sender: TObject; Form: TCustomForm);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Form,TypeInfo(Form));
  DoCall(L,2);
end;

end.
