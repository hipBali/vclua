unit LuaObjectInspectorEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, PropEdits;

type
  TLuaAddAvailablePersistentEvent = class(TLuaEvent)
    public
      procedure Handler(APersistent: TPersistent; var Allowed: boolean);
  end;

  TLuaOIEditorFilterEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aEditor: TPropertyEditor; var aShow: boolean);
  end;

  TLuaOnOINodeGetImageEvent = class(TLuaEvent)
    public
      procedure Handler(APersistent: TPersistent; var AImageIndex: integer);
  end;


procedure RegisterLuaObjectInspectorEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaPersistent, LuaPropEdits;

procedure RegisterLuaObjectInspectorEvents();
begin
  eventPtrs.Add('TAddAvailablePersistentEvent', @TLuaAddAvailablePersistentEvent.Handler);
  eventPtrs.Add('TOIEditorFilterEvent', @TLuaOIEditorFilterEvent.Handler);
  eventPtrs.Add('TOnOINodeGetImageEvent', @TLuaOnOINodeGetImageEvent.Handler);
end;

procedure TLuaAddAvailablePersistentEvent.Handler(APersistent: TPersistent; var Allowed: boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,APersistent);
  lua_push(L,Allowed);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Allowed);
end;

procedure TLuaOIEditorFilterEvent.Handler(Sender: TObject; aEditor: TPropertyEditor; var aShow: boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aEditor);
  lua_push(L,aShow);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@aShow);
end;

procedure TLuaOnOINodeGetImageEvent.Handler(APersistent: TPersistent; var AImageIndex: integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,APersistent);
  lua_push(L,AImageIndex);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AImageIndex);
end;

end.
