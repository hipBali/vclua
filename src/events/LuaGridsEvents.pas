unit LuaGridsEvents;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaEvent, Classes, Controls, Graphics, Grids, ImgList, StdCtrls;

type
  TLuaCellProcessEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer; processType: TCellProcessType; var aValue: string);
  end;

  TLuaGetCellHintEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACol, ARow: Integer; var HintText: String);
  end;

  TLuaGetCheckboxStateEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACol, ARow: Integer; var Value: TCheckboxState);
  end;

  TLuaGetEditEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACol, ARow: Integer; var Value: string);
  end;

  TLuaGridOperationEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; IsColumn:Boolean; sIndex, tIndex: Integer);
  end;

  TLuaHdrEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; IsColumn: Boolean; Index: Integer);
  end;

  TLuaHeaderSizingEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; const IsColumn: boolean; const aIndex, aSize: Integer);
  end;

  TLuaOnCompareCells = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACol, ARow, BCol,BRow: Integer; var Result: integer);
  end;

  TLuaOnDrawCell = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer; aRect: TRect; aState:TGridDrawState);
  end;

  TLuaOnPrepareCanvasEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer; aState: TGridDrawState);
  end;

  TLuaOnSelectCellEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer; var CanSelect: Boolean);
  end;

  TLuaOnSelectEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer);
  end;

  TLuaSelectEditorEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer; var Editor: TWinControl);
  end;

  TLuaSetCheckboxStateEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACol, ARow: Integer; const Value: TCheckboxState);
  end;

  TLuaSetEditEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; ACol, ARow: Integer; const Value: string);
  end;

  TLuaToggledCheckboxEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer; aState: TCheckboxState);
  end;

  TLuaUserCheckBoxBitmapEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; const aCol, aRow: Integer; const CheckedState: TCheckboxState; var ABitmap: TBitmap);
  end;

  TLuaUserCheckBoxImageEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; const aCol, aRow: Integer; const CheckedState: TCheckBoxState; var ImageList: TCustomImageList; var ImageIndex: TImageIndex);
  end;

  TLuaValidateEntryEvent = class(TLuaEvent)
    public
      procedure Handler(Sender: TObject; aCol, aRow: Integer; const OldValue: string; var NewValue: String);
  end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, LuaBitmap, LuaImageList;

procedure TLuaCellProcessEvent.Handler(Sender: TObject; aCol, aRow: Integer; processType: TCellProcessType; var aValue: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,processType,TypeInfo(processType));
  lua_push(L,aValue);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@aValue);
end;

procedure TLuaGetCellHintEvent.Handler(Sender: TObject; ACol, ARow: Integer; var HintText: String);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACol);
  lua_push(L,ARow);
  lua_push(L,HintText);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@HintText);
end;

procedure TLuaGetCheckboxStateEvent.Handler(Sender: TObject; ACol, ARow: Integer; var Value: TCheckboxState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACol);
  lua_push(L,ARow);
  lua_push(L,Value,TypeInfo(Value));
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Value,TypeInfo(TCheckboxState));
end;

procedure TLuaGetEditEvent.Handler(Sender: TObject; ACol, ARow: Integer; var Value: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACol);
  lua_push(L,ARow);
  lua_push(L,Value);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Value);
end;

procedure TLuaGridOperationEvent.Handler(Sender: TObject; IsColumn:Boolean; sIndex, tIndex: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,IsColumn);
  lua_push(L,sIndex);
  lua_push(L,tIndex);
  DoCall(L,4);
end;

procedure TLuaHdrEvent.Handler(Sender: TObject; IsColumn: Boolean; Index: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,IsColumn);
  lua_push(L,Index);
  DoCall(L,3);
end;

procedure TLuaHeaderSizingEvent.Handler(Sender: TObject; const IsColumn: boolean; const aIndex, aSize: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,IsColumn);
  lua_push(L,aIndex);
  lua_push(L,aSize);
  DoCall(L,4);
end;

procedure TLuaOnCompareCells.Handler(Sender: TObject; ACol, ARow, BCol,BRow: Integer; var Result: integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACol);
  lua_push(L,ARow);
  lua_push(L,BCol);
  lua_push(L,BRow);
  lua_push(L,Result);
  DoCall(L,6);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Result);
end;

procedure TLuaOnDrawCell.Handler(Sender: TObject; aCol, aRow: Integer; aRect: TRect; aState:TGridDrawState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,aRect);
  lua_push(L,aState,TypeInfo(aState));
  DoCall(L,5);
end;

procedure TLuaOnPrepareCanvasEvent.Handler(Sender: TObject; aCol, aRow: Integer; aState: TGridDrawState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,aState,TypeInfo(aState));
  DoCall(L,4);
end;

procedure TLuaOnSelectCellEvent.Handler(Sender: TObject; aCol, aRow: Integer; var CanSelect: Boolean);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,CanSelect);
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@CanSelect);
end;

procedure TLuaOnSelectEvent.Handler(Sender: TObject; aCol, aRow: Integer);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  DoCall(L,3);
end;

procedure TLuaSelectEditorEvent.Handler(Sender: TObject; aCol, aRow: Integer; var Editor: TWinControl);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,Editor,TypeInfo(Editor));
  DoCall(L,4);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@Editor);
end;

procedure TLuaSetCheckboxStateEvent.Handler(Sender: TObject; ACol, ARow: Integer; const Value: TCheckboxState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACol);
  lua_push(L,ARow);
  lua_push(L,Value,TypeInfo(Value));
  DoCall(L,4);
end;

procedure TLuaSetEditEvent.Handler(Sender: TObject; ACol, ARow: Integer; const Value: string);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,ACol);
  lua_push(L,ARow);
  lua_push(L,Value);
  DoCall(L,4);
end;

procedure TLuaToggledCheckboxEvent.Handler(Sender: TObject; aCol, aRow: Integer; aState: TCheckboxState);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,aState,TypeInfo(aState));
  DoCall(L,4);
end;

procedure TLuaUserCheckBoxBitmapEvent.Handler(Sender: TObject; const aCol, aRow: Integer; const CheckedState: TCheckboxState; var ABitmap: TBitmap);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,CheckedState,TypeInfo(CheckedState));
  lua_push(L,ABitmap);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ABitmap);
end;

procedure TLuaUserCheckBoxImageEvent.Handler(Sender: TObject; const aCol, aRow: Integer; const CheckedState: TCheckBoxState; var ImageList: TCustomImageList; var ImageIndex: TImageIndex);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,CheckedState,TypeInfo(CheckedState));
  lua_push(L,ImageList,TypeInfo(ImageList));
  lua_push(L,ImageIndex);
  DoCall(L,6);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@ImageList);
  if luaTop + 2 <= luaNewTop then luaL_check(L,luaTop + 2,@ImageIndex);
end;

procedure TLuaValidateEntryEvent.Handler(Sender: TObject; aCol, aRow: Integer; const OldValue: string; var NewValue: String);
var
  L: Plua_State;
  luaTop, luaNewTop: Integer;
begin
  L := ToStack;
  luaTop := lua_gettop(L) - 1;
  lua_push(L,Sender,TypeInfo(Sender));
  lua_push(L,aCol);
  lua_push(L,aRow);
  lua_push(L,OldValue);
  lua_push(L,NewValue);
  DoCall(L,5);
  luaNewTop := lua_gettop(L);
  if luaTop + 1 <= luaNewTop then luaL_check(L,luaTop + 1,@NewValue);
end;

end.
