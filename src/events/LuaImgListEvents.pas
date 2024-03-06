unit LuaImgListEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, ImgList;

type
  TLuaCustomImageListGetWidthForPPI = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomImageList; AImageWidth, APPI: Integer; var AResultWidth: Integer);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaImageList;

procedure TLuaCustomImageListGetWidthForPPI.Handler(Sender: TCustomImageList; AImageWidth, APPI: Integer; var AResultWidth: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AImageWidth);
  lua_push(L,APPI);
  lua_push(L,AResultWidth);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AResultWidth);
end;

end.
