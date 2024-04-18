unit LuaExtCtrlsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, Controls, ExtCtrls, Graphics;

type
  TLuaBandDragEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Control: TControl; var Drag: Boolean);
  end;

  TLuaBandInfoEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Control: TControl; var Insets: TRect; var PreferredSize, RowCount: Integer);
  end;

  TLuaBandMoveEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Control: TControl; var ARect: TRect);
  end;

  TLuaBandPaintEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Control: TControl; ACanvas: TCanvas; var ARect: TRect; var Options: TBandPaintOptions);
  end;

  TLuaBeforeShowPageEvent = class(TLuaEvent)
    public
      procedure Handler(ASender: TObject; ANewPage: TPage; ANewIndex: Integer);
  end;

  TLuaCanOffsetEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var NewOffset: Integer; var Accept: Boolean);
  end;

  TLuaCanResizeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
  end;

  TLuaCheckGroupClicked = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Index: integer);
  end;

  TLuaImagePaintBackgroundEvent = class(TLuaEvent)
    public
      procedure Handler(ASender: TObject; ACanvas: TCanvas; ARect: TRect);
  end;


procedure RegisterLuaExtCtrlsEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaCanvas, LuaControl, SysUtils;

procedure RegisterLuaExtCtrlsEvents();
begin
  eventPtrs.Add('TBandDragEvent', @TLuaBandDragEvent.Handler);
  eventPtrs.Add('TBandInfoEvent', @TLuaBandInfoEvent.Handler);
  eventPtrs.Add('TBandMoveEvent', @TLuaBandMoveEvent.Handler);
  eventPtrs.Add('TBandPaintEvent', @TLuaBandPaintEvent.Handler);
  eventPtrs.Add('TBeforeShowPageEvent', @TLuaBeforeShowPageEvent.Handler);
  eventPtrs.Add('TCanOffsetEvent', @TLuaCanOffsetEvent.Handler);
  eventPtrs.Add('TCanResizeEvent', @TLuaCanResizeEvent.Handler);
  eventPtrs.Add('TCheckGroupClicked', @TLuaCheckGroupClicked.Handler);
  eventPtrs.Add('TImagePaintBackgroundEvent', @TLuaImagePaintBackgroundEvent.Handler);
end;

procedure TLuaBandDragEvent.Handler(Sender: TObject; Control: TControl; var Drag: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Control);
  lua_push(L,Drag);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Drag,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaBandInfoEvent.Handler(Sender: TObject; Control: TControl; var Insets: TRect; var PreferredSize, RowCount: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Control);
  lua_push(L,Insets);
  lua_push(L,PreferredSize);
  lua_push(L,RowCount);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Insets,TypeInfo(TRect),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@PreferredSize,TypeInfo(Integer),lerException);
    if luaTop + 3 <= luaNewTop then luaL_check(L,luaTop + 3,@RowCount,TypeInfo(Integer),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaBandMoveEvent.Handler(Sender: TObject; Control: TControl; var ARect: TRect);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Control);
  lua_push(L,ARect);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ARect,TypeInfo(TRect),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaBandPaintEvent.Handler(Sender: TObject; Control: TControl; ACanvas: TCanvas; var ARect: TRect; var Options: TBandPaintOptions);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Control);
  lua_push(L,ACanvas);
  lua_push(L,ARect);
  lua_push(L,Options,TypeInfo(Options));
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ARect,TypeInfo(TRect),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@Options,TypeInfo(TBandPaintOptions),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaBeforeShowPageEvent.Handler(ASender: TObject; ANewPage: TPage; ANewIndex: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,ASender,TypeInfo(ASender));
  lua_push(L,ANewPage,TypeInfo(ANewPage));
  lua_push(L,ANewIndex);
  DoCall(L,3);
end;

procedure TLuaCanOffsetEvent.Handler(Sender: TObject; var NewOffset: Integer; var Accept: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,NewOffset);
  lua_push(L,Accept);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@NewOffset,TypeInfo(Integer),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@Accept,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaCanResizeEvent.Handler(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,NewSize);
  lua_push(L,Accept);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@NewSize,TypeInfo(Integer),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@Accept,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportEventError(L, E.Message);
  end;
end;

procedure TLuaCheckGroupClicked.Handler(Sender: TObject; Index: integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Index);
  DoCall(L,2);
end;

procedure TLuaImagePaintBackgroundEvent.Handler(ASender: TObject; ACanvas: TCanvas; ARect: TRect);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,ASender,TypeInfo(ASender));
  lua_push(L,ACanvas);
  lua_push(L,ARect);
  DoCall(L,3);
end;

end.
