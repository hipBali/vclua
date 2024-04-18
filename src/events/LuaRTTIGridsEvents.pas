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


procedure RegisterLuaRTTIGridsEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaControl, LuaPersistent, LuaPropertyGrid, SysUtils;

procedure RegisterLuaRTTIGridsEvents();
begin
  eventPtrs.Add('TTIGridCreateCellEditor', @TLuaTIGridCreateCellEditor.Handler);
  eventPtrs.Add('TTIGridGetObject', @TLuaTIGridGetObject.Handler);
  eventPtrs.Add('TTIGridGetObjectCount', @TLuaTIGridGetObjectCount.Handler);
  eventPtrs.Add('TTIGridGetObjectName', @TLuaTIGridGetObjectName.Handler);
  eventPtrs.Add('TTIGridInitCellEditor', @TLuaTIGridInitCellEditor.Handler);
end;

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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@NewEditorControl,TypeInfo(TControl),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@TIObject,TypeInfo(TPersistent),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ObjCount,TypeInfo(integer),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
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
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ObjName,TypeInfo(string),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
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
