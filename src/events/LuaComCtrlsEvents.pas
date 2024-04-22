unit LuaComCtrlsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, ComCtrls, StdCtrls;

type
  TLuaCustomSectionNotifyEvent = class(TLuaEvent)
    public
      procedure Handler(HeaderControl: TCustomHeaderControl; Section: THeaderSection);
  end;

  TLuaCustomSectionTrackEvent = class(TLuaEvent)
    public
      procedure Handler(HeaderControl: TCustomHeaderControl; Section: THeaderSection; Width: Integer; State: TSectionTrackState);
  end;

  TLuaDrawPanelEvent = class(TLuaEvent)
    public
      procedure Handler(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
  end;

  TLuaDrawTabEvent = class(TLuaEvent)
    public
      procedure Handler(Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect; AActive: Boolean);
  end;

  TLuaLVAdvancedCustomDrawEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomListView; const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
  end;

  TLuaLVAdvancedCustomDrawItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomListView; Item: TListItem;  State: TCustomDrawState; Stage: TCustomDrawStage;  var DefaultDraw: Boolean);
  end;

  TLuaLVAdvancedCustomDrawSubItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomListView; Item: TListItem;  SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
  end;

  TLuaLVChangeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Item: TListItem; Change: TItemChange);
  end;

  TLuaLVCheckedItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Item: TListItem);
  end;

  TLuaLVColumnClickEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Column: TListColumn);
  end;

  TLuaLVColumnRClickEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Column: TListColumn; Point: TPoint);
  end;

  TLuaLVCompareEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
  end;

  TLuaLVCustomDrawEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomListView; const ARect: TRect; var DefaultDraw: Boolean);
  end;

  TLuaLVCustomDrawItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomListView; Item: TListItem;  State: TCustomDrawState; var DefaultDraw: Boolean);
  end;

  TLuaLVCustomDrawSubItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomListView; Item: TListItem;  SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
  end;

  TLuaLVDataFindEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; AFind: TItemFind; const AFindString: string; const AFindPosition: TPoint; AFindData: Pointer; AStartIndex: Integer; ADirection: TSearchDirection; AWrap: Boolean; var AIndex: Integer);
  end;

  TLuaLVDataHintEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; StartIndex, EndIndex: Integer);
  end;

  TLuaLVDataStateChangeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; StartIndex, EndIndex: Integer; OldState, NewState: TListItemStates);
  end;

  TLuaLVDeletedEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Item: TListItem);
  end;

  TLuaLVDrawItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomListView; AItem: TListItem; ARect: TRect; AState: TOwnerDrawState);
  end;

  TLuaLVEditedEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Item: TListItem; var AValue: string);
  end;

  TLuaLVEditingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
  end;

  TLuaLVSelectItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Item: TListItem; Selected: Boolean);
  end;

  TLuaSectionDragEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; FromSection, ToSection: THeaderSection; var AllowDrag: Boolean);
  end;

  TLuaTabChangingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var AllowChange: Boolean);
  end;

  TLuaTabGetImageEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; TabIndex: Integer; var ImageIndex: Integer);
  end;

  TLuaToolBarOnPaintButton = class(TLuaEvent)
    public
      procedure Handler(Sender: TToolButton; State: integer);
  end;

  TLuaTVAdvancedCustomDrawEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomTreeView; const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
  end;

  TLuaTVAdvancedCustomDrawItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
  end;

  TLuaTVChangedEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode);
  end;

  TLuaTVChangingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
  end;

  TLuaTVCollapsingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
  end;

  TLuaTVCompareEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node1, Node2: TTreeNode; var Compare: Integer);
  end;

  TLuaTVCustomCreateNodeEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomTreeView; var ATreeNode: TTreenode);
  end;

  TLuaTVCustomDrawArrowEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomTreeView; const ARect: TRect; ACollapsed: Boolean);
  end;

  TLuaTVCustomDrawEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomTreeView; const ARect: TRect; var DefaultDraw: Boolean);
  end;

  TLuaTVCustomDrawItemEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
  end;

  TLuaTVEditedEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode; var S: string);
  end;

  TLuaTVEditingEndEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode; Cancel: Boolean);
  end;

  TLuaTVEditingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
  end;

  TLuaTVExpandedEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode);
  end;

  TLuaTVExpandingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
  end;

  TLuaTVNodeChangedEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
  end;

  TLuaUDChangingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var AllowChange: Boolean);
  end;

  TLuaUDChangingEventEx = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; var AllowChange: Boolean; NewValue: SmallInt; Direction: TUpDownDirection);
  end;

  TLuaUDClickEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; Button: TUDBtnType);
  end;


procedure RegisterLuaComCtrlsEvents();

implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaHeaderControl, LuaListView, LuaStatusBar, LuaTabControl, LuaToolBar, LuaTreeView, SysUtils;

procedure RegisterLuaComCtrlsEvents();
begin
  eventPtrs.Add('TCustomSectionNotifyEvent', @TLuaCustomSectionNotifyEvent.Handler);
  eventPtrs.Add('TCustomSectionTrackEvent', @TLuaCustomSectionTrackEvent.Handler);
  eventPtrs.Add('TDrawPanelEvent', @TLuaDrawPanelEvent.Handler);
  eventPtrs.Add('TDrawTabEvent', @TLuaDrawTabEvent.Handler);
  eventPtrs.Add('TLVAdvancedCustomDrawEvent', @TLuaLVAdvancedCustomDrawEvent.Handler);
  eventPtrs.Add('TLVAdvancedCustomDrawItemEvent', @TLuaLVAdvancedCustomDrawItemEvent.Handler);
  eventPtrs.Add('TLVAdvancedCustomDrawSubItemEvent', @TLuaLVAdvancedCustomDrawSubItemEvent.Handler);
  eventPtrs.Add('TLVChangeEvent', @TLuaLVChangeEvent.Handler);
  eventPtrs.Add('TLVCheckedItemEvent', @TLuaLVCheckedItemEvent.Handler);
  eventPtrs.Add('TLVColumnClickEvent', @TLuaLVColumnClickEvent.Handler);
  eventPtrs.Add('TLVColumnRClickEvent', @TLuaLVColumnRClickEvent.Handler);
  eventPtrs.Add('TLVCompareEvent', @TLuaLVCompareEvent.Handler);
  eventPtrs.Add('TLVCustomDrawEvent', @TLuaLVCustomDrawEvent.Handler);
  eventPtrs.Add('TLVCustomDrawItemEvent', @TLuaLVCustomDrawItemEvent.Handler);
  eventPtrs.Add('TLVCustomDrawSubItemEvent', @TLuaLVCustomDrawSubItemEvent.Handler);
  eventPtrs.Add('TLVDataFindEvent', @TLuaLVDataFindEvent.Handler);
  eventPtrs.Add('TLVDataHintEvent', @TLuaLVDataHintEvent.Handler);
  eventPtrs.Add('TLVDataStateChangeEvent', @TLuaLVDataStateChangeEvent.Handler);
  eventPtrs.Add('TLVDeletedEvent', @TLuaLVDeletedEvent.Handler);
  eventPtrs.Add('TLVDrawItemEvent', @TLuaLVDrawItemEvent.Handler);
  eventPtrs.Add('TLVEditedEvent', @TLuaLVEditedEvent.Handler);
  eventPtrs.Add('TLVEditingEvent', @TLuaLVEditingEvent.Handler);
  eventPtrs.Add('TLVSelectItemEvent', @TLuaLVSelectItemEvent.Handler);
  eventPtrs.Add('TSectionDragEvent', @TLuaSectionDragEvent.Handler);
  eventPtrs.Add('TTabChangingEvent', @TLuaTabChangingEvent.Handler);
  eventPtrs.Add('TTabGetImageEvent', @TLuaTabGetImageEvent.Handler);
  eventPtrs.Add('TToolBarOnPaintButton', @TLuaToolBarOnPaintButton.Handler);
  eventPtrs.Add('TTVAdvancedCustomDrawEvent', @TLuaTVAdvancedCustomDrawEvent.Handler);
  eventPtrs.Add('TTVAdvancedCustomDrawItemEvent', @TLuaTVAdvancedCustomDrawItemEvent.Handler);
  eventPtrs.Add('TTVChangedEvent', @TLuaTVChangedEvent.Handler);
  eventPtrs.Add('TTVChangingEvent', @TLuaTVChangingEvent.Handler);
  eventPtrs.Add('TTVCollapsingEvent', @TLuaTVCollapsingEvent.Handler);
  eventPtrs.Add('TTVCompareEvent', @TLuaTVCompareEvent.Handler);
  eventPtrs.Add('TTVCustomCreateNodeEvent', @TLuaTVCustomCreateNodeEvent.Handler);
  eventPtrs.Add('TTVCustomDrawArrowEvent', @TLuaTVCustomDrawArrowEvent.Handler);
  eventPtrs.Add('TTVCustomDrawEvent', @TLuaTVCustomDrawEvent.Handler);
  eventPtrs.Add('TTVCustomDrawItemEvent', @TLuaTVCustomDrawItemEvent.Handler);
  eventPtrs.Add('TTVEditedEvent', @TLuaTVEditedEvent.Handler);
  eventPtrs.Add('TTVEditingEndEvent', @TLuaTVEditingEndEvent.Handler);
  eventPtrs.Add('TTVEditingEvent', @TLuaTVEditingEvent.Handler);
  eventPtrs.Add('TTVExpandedEvent', @TLuaTVExpandedEvent.Handler);
  eventPtrs.Add('TTVExpandingEvent', @TLuaTVExpandingEvent.Handler);
  eventPtrs.Add('TTVNodeChangedEvent', @TLuaTVNodeChangedEvent.Handler);
  eventPtrs.Add('TUDChangingEvent', @TLuaUDChangingEvent.Handler);
  eventPtrs.Add('TUDChangingEventEx', @TLuaUDChangingEventEx.Handler);
  eventPtrs.Add('TUDClickEvent', @TLuaUDClickEvent.Handler);
end;

procedure TLuaCustomSectionNotifyEvent.Handler(HeaderControl: TCustomHeaderControl; Section: THeaderSection);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,HeaderControl,TypeInfo(HeaderControl));
  lua_push(L,Section,TypeInfo(Section));
  DoCall(L,2);
end;

procedure TLuaCustomSectionTrackEvent.Handler(HeaderControl: TCustomHeaderControl; Section: THeaderSection; Width: Integer; State: TSectionTrackState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,HeaderControl,TypeInfo(HeaderControl));
  lua_push(L,Section,TypeInfo(Section));
  lua_push(L,Width);
  lua_push(L,State,TypeInfo(State));
  DoCall(L,4);
end;

procedure TLuaDrawPanelEvent.Handler(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,StatusBar);
  lua_push(L,Panel);
  lua_push(L,Rect);
  DoCall(L,3);
end;

procedure TLuaDrawTabEvent.Handler(Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect; AActive: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Control);
  lua_push(L,TabIndex);
  lua_push(L,Rect);
  lua_push(L,AActive);
  DoCall(L,4);
end;

procedure TLuaLVAdvancedCustomDrawEvent.Handler(Sender: TCustomListView; const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ARect);
  lua_push(L,Stage,TypeInfo(Stage));
  lua_push(L,DefaultDraw);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVAdvancedCustomDrawItemEvent.Handler(Sender: TCustomListView; Item: TListItem;  State: TCustomDrawState; Stage: TCustomDrawStage;  var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,Stage,TypeInfo(Stage));
  lua_push(L,DefaultDraw);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVAdvancedCustomDrawSubItemEvent.Handler(Sender: TCustomListView; Item: TListItem;  SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,SubItem);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,Stage,TypeInfo(Stage));
  lua_push(L,DefaultDraw);
  DoCall(L,6);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVChangeEvent.Handler(Sender: TObject; Item: TListItem; Change: TItemChange);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,Change,TypeInfo(Change));
  DoCall(L,3);
end;

procedure TLuaLVCheckedItemEvent.Handler(Sender: TObject; Item: TListItem);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  DoCall(L,2);
end;

procedure TLuaLVColumnClickEvent.Handler(Sender: TObject; Column: TListColumn);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Column,TypeInfo(Column));
  DoCall(L,2);
end;

procedure TLuaLVColumnRClickEvent.Handler(Sender: TObject; Column: TListColumn; Point: TPoint);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Column,TypeInfo(Column));
  lua_push(L,Point);
  DoCall(L,3);
end;

procedure TLuaLVCompareEvent.Handler(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item1);
  lua_push(L,Item2);
  lua_push(L,Data);
  lua_push(L,Compare);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Compare,TypeInfo(Integer),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVCustomDrawEvent.Handler(Sender: TCustomListView; const ARect: TRect; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ARect);
  lua_push(L,DefaultDraw);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVCustomDrawItemEvent.Handler(Sender: TCustomListView; Item: TListItem;  State: TCustomDrawState; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,DefaultDraw);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVCustomDrawSubItemEvent.Handler(Sender: TCustomListView; Item: TListItem;  SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,SubItem);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,DefaultDraw);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVDataFindEvent.Handler(Sender: TObject; AFind: TItemFind; const AFindString: string; const AFindPosition: TPoint; AFindData: Pointer; AStartIndex: Integer; ADirection: TSearchDirection; AWrap: Boolean; var AIndex: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AFind,TypeInfo(AFind));
  lua_push(L,AFindString);
  lua_push(L,AFindPosition);
  lua_pushlightuserdata(L,AFindData);
  lua_push(L,AStartIndex);
  lua_push(L,ADirection,TypeInfo(ADirection));
  lua_push(L,AWrap);
  lua_push(L,AIndex);
  DoCall(L,9);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AIndex,TypeInfo(Integer),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVDataHintEvent.Handler(Sender: TObject; StartIndex, EndIndex: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,StartIndex);
  lua_push(L,EndIndex);
  DoCall(L,3);
end;

procedure TLuaLVDataStateChangeEvent.Handler(Sender: TObject; StartIndex, EndIndex: Integer; OldState, NewState: TListItemStates);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,StartIndex);
  lua_push(L,EndIndex);
  lua_push(L,OldState,TypeInfo(OldState));
  lua_push(L,NewState,TypeInfo(NewState));
  DoCall(L,5);
end;

procedure TLuaLVDeletedEvent.Handler(Sender: TObject; Item: TListItem);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  DoCall(L,2);
end;

procedure TLuaLVDrawItemEvent.Handler(Sender: TCustomListView; AItem: TListItem; ARect: TRect; AState: TOwnerDrawState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AItem);
  lua_push(L,ARect);
  lua_push(L,AState,TypeInfo(AState));
  DoCall(L,4);
end;

procedure TLuaLVEditedEvent.Handler(Sender: TObject; Item: TListItem; var AValue: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,AValue);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AValue,TypeInfo(string),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVEditingEvent.Handler(Sender: TObject; Item: TListItem; var AllowEdit: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,AllowEdit);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowEdit,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaLVSelectItemEvent.Handler(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Item);
  lua_push(L,Selected);
  DoCall(L,3);
end;

procedure TLuaSectionDragEvent.Handler(Sender: TObject; FromSection, ToSection: THeaderSection; var AllowDrag: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,FromSection,TypeInfo(FromSection));
  lua_push(L,ToSection,TypeInfo(ToSection));
  lua_push(L,AllowDrag);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowDrag,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTabChangingEvent.Handler(Sender: TObject; var AllowChange: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AllowChange);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowChange,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTabGetImageEvent.Handler(Sender: TObject; TabIndex: Integer; var ImageIndex: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,TabIndex);
  lua_push(L,ImageIndex);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ImageIndex,TypeInfo(Integer),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaToolBarOnPaintButton.Handler(Sender: TToolButton; State: integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender);
  lua_push(L,State);
  DoCall(L,2);
end;

procedure TLuaTVAdvancedCustomDrawEvent.Handler(Sender: TCustomTreeView; const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ARect);
  lua_push(L,Stage,TypeInfo(Stage));
  lua_push(L,DefaultDraw);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVAdvancedCustomDrawItemEvent.Handler(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,Stage,TypeInfo(Stage));
  lua_push(L,PaintImages);
  lua_push(L,DefaultDraw);
  DoCall(L,6);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@PaintImages,TypeInfo(Boolean),lerException);
    if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVChangedEvent.Handler(Sender: TObject; Node: TTreeNode);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  DoCall(L,2);
end;

procedure TLuaTVChangingEvent.Handler(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,AllowChange);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowChange,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVCollapsingEvent.Handler(Sender: TObject; Node: TTreeNode; var AllowCollapse: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,AllowCollapse);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowCollapse,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVCompareEvent.Handler(Sender: TObject; Node1, Node2: TTreeNode; var Compare: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node1);
  lua_push(L,Node2);
  lua_push(L,Compare);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Compare,TypeInfo(Integer),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVCustomCreateNodeEvent.Handler(Sender: TCustomTreeView; var ATreeNode: TTreenode);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ATreeNode);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ATreeNode,TypeInfo(TTreenode),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVCustomDrawArrowEvent.Handler(Sender: TCustomTreeView; const ARect: TRect; ACollapsed: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ARect);
  lua_push(L,ACollapsed);
  DoCall(L,3);
end;

procedure TLuaTVCustomDrawEvent.Handler(Sender: TCustomTreeView; const ARect: TRect; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ARect);
  lua_push(L,DefaultDraw);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVCustomDrawItemEvent.Handler(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,State,TypeInfo(State));
  lua_push(L,DefaultDraw);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@DefaultDraw,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVEditedEvent.Handler(Sender: TObject; Node: TTreeNode; var S: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,S);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@S,TypeInfo(string),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVEditingEndEvent.Handler(Sender: TObject; Node: TTreeNode; Cancel: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,Cancel);
  DoCall(L,3);
end;

procedure TLuaTVEditingEvent.Handler(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,AllowEdit);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowEdit,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVExpandedEvent.Handler(Sender: TObject; Node: TTreeNode);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  DoCall(L,2);
end;

procedure TLuaTVExpandingEvent.Handler(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,AllowExpansion);
  DoCall(L,3);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowExpansion,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaTVNodeChangedEvent.Handler(Sender: TObject; Node: TTreeNode; ChangeReason: TTreeNodeChangeReason);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Node);
  lua_push(L,ChangeReason,TypeInfo(ChangeReason));
  DoCall(L,3);
end;

procedure TLuaUDChangingEvent.Handler(Sender: TObject; var AllowChange: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AllowChange);
  DoCall(L,2);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowChange,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaUDChangingEventEx.Handler(Sender: TObject; var AllowChange: Boolean; NewValue: SmallInt; Direction: TUpDownDirection);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,AllowChange);
  lua_push(L,NewValue);
  lua_push(L,Direction,TypeInfo(Direction));
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  try
    if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@AllowChange,TypeInfo(Boolean),lerException);
  except
    on E: Exception do
      ReportError(L, E.Message);
  end;
end;

procedure TLuaUDClickEvent.Handler(Sender: TObject; Button: TUDBtnType);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,Button,TypeInfo(Button));
  DoCall(L,2);
end;

end.
