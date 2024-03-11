unit LuaFPImageEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, FPImage, Types;

type
  TLuaFPImgProgressEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Stage: TFPImgProgressStage; PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: AnsiString; var Continue : Boolean);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

procedure TLuaFPImgProgressEvent.Handler(Sender: TObject; Stage: TFPImgProgressStage; PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: AnsiString; var Continue : Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Stage,TypeInfo(Stage));
  lua_push(L,PercentDone);
  lua_push(L,RedrawNow);
  lua_push(L,R);
  lua_push(L,Msg);
  lua_push(L,Continue);
  DoCall(L,7);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Continue);
end;

end.
