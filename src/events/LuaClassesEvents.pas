unit LuaClassesEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes;

type
  TLuaGetChildProc = class(TLuaEvent)
    public
      procedure Handler(Child: TComponent);
  end;

  TLuaGetStrProc = class(TLuaEvent)
    public
      procedure Handler(const S: string);
  end;

  TLuaNotifyEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject);
  end;

  TLuaReadComponentsProc = class(TLuaEvent)
    public
      procedure Handler(Component: TComponent);
  end;

  TLuaStringsForEachMethod = class(TLuaEvent)
    public
      procedure Handler(const CurrentValue: string);
  end;

  TLuaStringsForEachMethodEx = class(TLuaEvent)
    public
      procedure Handler(const CurrentValue: string; const index: integer);
  end;

  TLuaStringsForEachMethodExObj = class(TLuaEvent)
    public
      procedure Handler(const CurrentValue: string; const index: integer; Obj : TObject);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaGetChildProc.Handler(Child: TComponent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Child,TypeInfo(Child));
  DoCall(L,1);
end;

procedure TLuaGetStrProc.Handler(const S: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,S);
  DoCall(L,1);
end;

procedure TLuaNotifyEvent.Handler(Sender: TObject);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  DoCall(L,1);
end;

procedure TLuaReadComponentsProc.Handler(Component: TComponent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Component,TypeInfo(Component));
  DoCall(L,1);
end;

procedure TLuaStringsForEachMethod.Handler(const CurrentValue: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,CurrentValue);
  DoCall(L,1);
end;

procedure TLuaStringsForEachMethodEx.Handler(const CurrentValue: string; const index: integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,CurrentValue);
  lua_push(L,index);
  DoCall(L,2);
end;

procedure TLuaStringsForEachMethodExObj.Handler(const CurrentValue: string; const index: integer; Obj : TObject);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,CurrentValue);
  lua_push(L,index);
  lua_push(L,Obj,TypeInfo(Obj));
  DoCall(L,3);
end;

end.
