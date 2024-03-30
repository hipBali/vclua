unit LuaRTTIGridsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, Controls, RTTIGrids;

type
  TLuaTIGridCreateCellEditor = class(TLuaEvent)
    public
      procedure Handler(GridProp: TTIGridProperty; var NewEditorControl: TControl);
  end;

  TLuaTIGridGetObject = class(TLuaEvent)
    public
      procedure Handler(Sender: TTICustomGrid; Index: integer; var TIObject: TPersistent);
  end;

  TLuaTIGridGetObjectCount = class(TLuaEvent)
    public
      procedure Handler(Sender: TTICustomGrid; ListObject: TObject; var ObjCount: integer);
  end;

  TLuaTIGridGetObjectName = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Index: integer; TIObject: TPersistent; var ObjName: string);
  end;

  TLuaTIGridInitCellEditor = class(TLuaEvent)
    public
      procedure Handler(GridProp: TTIGridProperty; TheEditorControl: TControl);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaControl, LuaPersistent, LuaPropertyGrid;

procedure TLuaTIGridCreateCellEditor.Handler(GridProp: TTIGridProperty; var NewEditorControl: TControl);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,GridProp);
  lua_push(L,NewEditorControl);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@NewEditorControl);
end;

procedure TLuaTIGridGetObject.Handler(Sender: TTICustomGrid; Index: integer; var TIObject: TPersistent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender);
  lua_push(L,Index);
  lua_push(L,TIObject);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@TIObject);
end;

procedure TLuaTIGridGetObjectCount.Handler(Sender: TTICustomGrid; ListObject: TObject; var ObjCount: integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender);
  lua_push(L,ListObject,TypeInfo(ListObject));
  lua_push(L,ObjCount);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ObjCount);
end;

procedure TLuaTIGridGetObjectName.Handler(Sender: TObject; Index: integer; TIObject: TPersistent; var ObjName: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Index);
  lua_push(L,TIObject);
  lua_push(L,ObjName);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ObjName);
end;

procedure TLuaTIGridInitCellEditor.Handler(GridProp: TTIGridProperty; TheEditorControl: TControl);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,GridProp);
  lua_push(L,TheEditorControl);
  DoCall(L,2);
end;

end.
