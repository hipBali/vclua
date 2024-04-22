unit LuaControlsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, Controls, LCLType;

type
  TLuaConstrainedResizeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: TConstraintSize);
  end;

  TLuaContextPopupEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
  end;

  TLuaDockDropEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Source: TDragDockObject; X, Y: Integer);
  end;

  TLuaDockOverEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  end;

  TLuaDragDropEvent = class(TLuaEvent)
    public
      procedure Handler(Sender, Source: TObject; X,Y: Integer);
  end;

  TLuaDragOverEvent = class(TLuaEvent)
    public
      procedure Handler(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
  end;

  TLuaEndDragEvent = class(TLuaEvent)
    public
      procedure Handler(Sender, Target: TObject; X,Y: Integer);
  end;

  TLuaForEachZoneProc = class(TLuaEvent)
    public
      procedure Handler(Zone: TDockZone);
  end;

  TLuaGetChildProc = class(TLuaEvent)
    public
      procedure Handler(Child: TComponent);
  end;

  TLuaGetDockCaptionEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; AControl: TControl; var ACaption: string);
  end;

  TLuaGetSiteInfoEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
  end;

  TLuaKeyEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

  TLuaKeyPressEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var Key: char);
  end;

  TLuaMouseEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  end;

  TLuaMouseMoveEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  end;

  TLuaMouseWheelEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  end;

  TLuaMouseWheelUpDownEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
  end;

  TLuaStartDockEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var DragObject: TDragDockObject);
  end;

  TLuaStartDragEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var DragObject: TDragObject);
  end;

  TLuaUnDockEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
  end;

  TLuaUTF8KeyPressEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var UTF8Key: TUTF8Char);
  end;


procedure RegisterLuaControlsEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaComponent, LuaControl, LuaDrag, LuaWinControl, SysUtils;

procedure RegisterLuaControlsEvents();
begin
  eventPtrs.Add('TConstrainedResizeEvent', @TLuaConstrainedResizeEvent.Handler);
  eventPtrs.Add('TContextPopupEvent', @TLuaContextPopupEvent.Handler);
  eventPtrs.Add('TDockDropEvent', @TLuaDockDropEvent.Handler);
  eventPtrs.Add('TDockOverEvent', @TLuaDockOverEvent.Handler);
  eventPtrs.Add('TDragDropEvent', @TLuaDragDropEvent.Handler);
  eventPtrs.Add('TDragOverEvent', @TLuaDragOverEvent.Handler);
  eventPtrs.Add('TEndDragEvent', @TLuaEndDragEvent.Handler);
  eventPtrs.Add('TForEachZoneProc', @TLuaForEachZoneProc.Handler);
  eventPtrs.Add('TGetChildProc', @TLuaGetChildProc.Handler);
  eventPtrs.Add('TGetDockCaptionEvent', @TLuaGetDockCaptionEvent.Handler);
  eventPtrs.Add('TGetSiteInfoEvent', @TLuaGetSiteInfoEvent.Handler);
  eventPtrs.Add('TKeyEvent', @TLuaKeyEvent.Handler);
  eventPtrs.Add('TKeyPressEvent', @TLuaKeyPressEvent.Handler);
  eventPtrs.Add('TMouseEvent', @TLuaMouseEvent.Handler);
  eventPtrs.Add('TMouseMoveEvent', @TLuaMouseMoveEvent.Handler);
  eventPtrs.Add('TMouseWheelEvent', @TLuaMouseWheelEvent.Handler);
  eventPtrs.Add('TMouseWheelUpDownEvent', @TLuaMouseWheelUpDownEvent.Handler);
  eventPtrs.Add('TStartDockEvent', @TLuaStartDockEvent.Handler);
  eventPtrs.Add('TStartDragEvent', @TLuaStartDragEvent.Handler);
  eventPtrs.Add('TUnDockEvent', @TLuaUnDockEvent.Handler);
  eventPtrs.Add('TUTF8KeyPressEvent', @TLuaUTF8KeyPressEvent.Handler);
end;

procedure TLuaConstrainedResizeEvent.Handler(Sender: TObject; var MinWidth, MinHeight, MaxWidth, MaxHeight: TConstraintSize);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,MinWidth);
  lua_push(L,MinHeight);
  lua_push(L,MaxWidth);
  lua_push(L,MaxHeight);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@MinWidth,TypeInfo(TConstraintSize),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@MinHeight,TypeInfo(TConstraintSize),lerException);
    if luaTop + 3 <= luaNewTop then luaL_check(L,luaTop + 3,@MaxWidth,TypeInfo(TConstraintSize),lerException);
    if luaTop + 4 <= luaNewTop then luaL_check(L,luaTop + 4,@MaxHeight,TypeInfo(TConstraintSize),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaContextPopupEvent.Handler(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,MousePos);
  lua_push(L,Handled);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Handled,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaDockDropEvent.Handler(Sender: TObject; Source: TDragDockObject; X, Y: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Source);
  lua_push(L,X);
  lua_push(L,Y);
  DoCall(L,4);
end;

procedure TLuaDockOverEvent.Handler(Sender: TObject; Source: TDragDockObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Source);
  lua_push(L,X);
  lua_push(L,Y);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,Accept);
  DoCall(L,6);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Accept,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaDragDropEvent.Handler(Sender, Source: TObject; X,Y: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Source,TypeInfo(Source));
  lua_push(L,X);
  lua_push(L,Y);
  DoCall(L,4);
end;

procedure TLuaDragOverEvent.Handler(Sender, Source: TObject; X,Y: Integer; State: TDragState; var Accept: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Source,TypeInfo(Source));
  lua_push(L,X);
  lua_push(L,Y);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,Accept);
  DoCall(L,6);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Accept,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaEndDragEvent.Handler(Sender, Target: TObject; X,Y: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Target,TypeInfo(Target));
  lua_push(L,X);
  lua_push(L,Y);
  DoCall(L,4);
end;

procedure TLuaForEachZoneProc.Handler(Zone: TDockZone);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Zone);
  DoCall(L,1);
end;

procedure TLuaGetChildProc.Handler(Child: TComponent);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Child);
  DoCall(L,1);
end;

procedure TLuaGetDockCaptionEvent.Handler(Sender: TObject; AControl: TControl; var ACaption: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AControl);
  lua_push(L,ACaption);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ACaption,TypeInfo(string),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaGetSiteInfoEvent.Handler(Sender: TObject; DockClient: TControl; var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,DockClient);
  lua_push(L,InfluenceRect);
  lua_push(L,MousePos);
  lua_push(L,CanDock);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@InfluenceRect,TypeInfo(TRect),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@CanDock,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaKeyEvent.Handler(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Key);
  lua_push(L,Shift,TypeInfo(Shift));
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Key,TypeInfo(Word),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaKeyPressEvent.Handler(Sender: TObject; var Key: char);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Key);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Key,TypeInfo(char),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaMouseEvent.Handler(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Button,TypeInfo(Button));
  lua_push(L,Shift,TypeInfo(Shift));
  lua_push(L,X);
  lua_push(L,Y);
  DoCall(L,5);
end;

procedure TLuaMouseMoveEvent.Handler(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Shift,TypeInfo(Shift));
  lua_push(L,X);
  lua_push(L,Y);
  DoCall(L,4);
end;

procedure TLuaMouseWheelEvent.Handler(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Shift,TypeInfo(Shift));
  lua_push(L,WheelDelta);
  lua_push(L,MousePos);
  lua_push(L,Handled);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Handled,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaMouseWheelUpDownEvent.Handler(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Shift,TypeInfo(Shift));
  lua_push(L,MousePos);
  lua_push(L,Handled);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Handled,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaStartDockEvent.Handler(Sender: TObject; var DragObject: TDragDockObject);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,DragObject);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DragObject,TypeInfo(TDragDockObject),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaStartDragEvent.Handler(Sender: TObject; var DragObject: TDragObject);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,DragObject);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DragObject,TypeInfo(TDragObject),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaUnDockEvent.Handler(Sender: TObject; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Client);
  lua_push(L,NewTarget);
  lua_push(L,Allow);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Allow,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaUTF8KeyPressEvent.Handler(Sender: TObject; var UTF8Key: TUTF8Char);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,UTF8Key);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@UTF8Key,TypeInfo(TUTF8Char),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

end.
