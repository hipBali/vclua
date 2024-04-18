unit LuaPropEditsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, PropEdits;

type
  TLuaGetPropEditProc = class(TLuaEvent)
    public
      procedure Handler(Prop: TPropertyEditor);
  end;

  TLuaPropHookComponentRenamed = class(TLuaEvent)
    public
      procedure Handler(AComponent: TComponent);
  end;

  TLuaPropHookDeletePersistent = class(TLuaEvent)
    public
      procedure Handler(var APersistent: TPersistent);
  end;

  TLuaPropHookGetCheckboxForBoolean = class(TLuaEvent)
    public
      procedure Handler(var Value: Boolean);
  end;

  TLuaPropHookModified = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject);
  end;

  TLuaPropHookModifiedWithName = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; PropName: ShortString);
  end;

  TLuaPropHookObjectPropertyChanged = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; NewObject: TPersistent);
  end;

  TLuaPropHookPersistentAdded = class(TLuaEvent)
    public
      procedure Handler(APersistent: TPersistent; Select: boolean );
  end;

  TLuaPropHookPersistentDel = class(TLuaEvent)
    public
      procedure Handler(APersistent: TPersistent);
  end;

  TLuaPropHookRenameMethod = class(TLuaEvent)
    public
      procedure Handler(const CurName, NewName: String);
  end;

  TLuaPropHookShowMethod = class(TLuaEvent)
    public
      procedure Handler(const Name: String);
  end;


procedure RegisterLuaPropEditsEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaPersistent, LuaPropEdits, SysUtils;

procedure RegisterLuaPropEditsEvents();
begin
  eventPtrs.Add('TGetPropEditProc', @TLuaGetPropEditProc.Handler);
  eventPtrs.Add('TPropHookComponentRenamed', @TLuaPropHookComponentRenamed.Handler);
  eventPtrs.Add('TPropHookDeletePersistent', @TLuaPropHookDeletePersistent.Handler);
  eventPtrs.Add('TPropHookGetCheckboxForBoolean', @TLuaPropHookGetCheckboxForBoolean.Handler);
  eventPtrs.Add('TPropHookModified', @TLuaPropHookModified.Handler);
  eventPtrs.Add('TPropHookModifiedWithName', @TLuaPropHookModifiedWithName.Handler);
  eventPtrs.Add('TPropHookObjectPropertyChanged', @TLuaPropHookObjectPropertyChanged.Handler);
  eventPtrs.Add('TPropHookPersistentAdded', @TLuaPropHookPersistentAdded.Handler);
  eventPtrs.Add('TPropHookPersistentDel', @TLuaPropHookPersistentDel.Handler);
  eventPtrs.Add('TPropHookRenameMethod', @TLuaPropHookRenameMethod.Handler);
  eventPtrs.Add('TPropHookShowMethod', @TLuaPropHookShowMethod.Handler);
end;

procedure TLuaGetPropEditProc.Handler(Prop: TPropertyEditor);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Prop);
  DoCall(L,1);
end;

procedure TLuaPropHookComponentRenamed.Handler(AComponent: TComponent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,AComponent,TypeInfo(AComponent));
  DoCall(L,1);
end;

procedure TLuaPropHookDeletePersistent.Handler(var APersistent: TPersistent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,APersistent);
  DoCall(L,1);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@APersistent,TypeInfo(TPersistent),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaPropHookGetCheckboxForBoolean.Handler(var Value: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Value);
  DoCall(L,1);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Value,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaPropHookModified.Handler(Sender: TObject);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  DoCall(L,1);
end;

procedure TLuaPropHookModifiedWithName.Handler(Sender: TObject; PropName: ShortString);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,PropName);
  DoCall(L,2);
end;

procedure TLuaPropHookObjectPropertyChanged.Handler(Sender: TObject; NewObject: TPersistent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,NewObject);
  DoCall(L,2);
end;

procedure TLuaPropHookPersistentAdded.Handler(APersistent: TPersistent; Select: boolean );
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,APersistent);
  lua_push(L,Select);
  DoCall(L,2);
end;

procedure TLuaPropHookPersistentDel.Handler(APersistent: TPersistent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,APersistent);
  DoCall(L,1);
end;

procedure TLuaPropHookRenameMethod.Handler(const CurName, NewName: String);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,CurName);
  lua_push(L,NewName);
  DoCall(L,2);
end;

procedure TLuaPropHookShowMethod.Handler(const Name: String);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Name);
  DoCall(L,1);
end;

end.
