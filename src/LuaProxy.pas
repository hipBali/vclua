unit LuaProxy;

{$mode Delphi}{$H+}

interface

uses
  Classes, Types, Controls, Menus, ComCtrls, SysUtils, Graphics,
  LuaHelper, Lua;

type
  aofs = array of string;
  aoflw = array of LongWord;
  aoftp = array of TPoint;
  aofmi = array of TMenuItem;
  aoftn = array of TTreeNode;

// String UTF-8 support
function lua_toStringCP(L: Plua_State; Index: Integer):string;
procedure lua_pushStringCP(L: Plua_State; str:string);
function lua_toStringArray(L: Plua_State; Index: Integer):aofs;
function lua_toStringList(L: Plua_State; Index: Integer):TStringList;
// --------------------

function lua_toTPoint(L: Plua_State; Index: Integer):TPoint;
procedure lua_pushTPoint(L: Plua_State; point:TPoint);
function lua_toTRect(L: Plua_State; Index: Integer):TRect;
procedure lua_pushTRect(L: Plua_State; rect:TRect);
function lua_toTSize(L: Plua_State; Index: Integer):TSize;

function lua_toLongWordArray(L: Plua_State; Index: Integer):aoflw;
function lua_toTPointArray(L: Plua_State; Index: Integer):aoftp;
function lua_toTMenuItem(L: Plua_State; Index: Integer):aofmi;
function lua_toTTreeNode(L: Plua_State; Index: Integer):aoftn;

function lua_toTextStyle(L: Plua_State; Index: Integer):TTextStyle;

function lua_toTShiftState(L: Plua_State; Index: Integer):TShiftState; overload;
function lua_toTShiftState(L: Plua_State; Index: Integer; default:TShiftState ):TShiftState; overload;

// TString descenant properties
function GetTStringsProperty(L: Plua_State; Comp:TStrings; PropName:String):boolean;

implementation

uses TypInfo, LuaController, LuaObject, LazUtf8;

function lua_toStringCP(L: Plua_State; Index: Integer):string;
begin
     if (is_vclua_utf8_conv) then
       result := WinCPToUTF8(lua_tostring(L,Index))
     else
       result := lua_tostring(L,Index);
end;

procedure lua_pushStringCP(L: Plua_State; str:string);
begin
     if (is_vclua_utf8_conv) then
       lua_pushstring(L,pchar(UTF8ToWinCP(str)))
     else
       lua_pushstring(L,pchar(str));
end;

function GetTStringsProperty(L: Plua_State; Comp:TStrings; PropName:String):boolean;
var pn:String;
begin
     Result := true;
     pn := LowerCase(PropName);
     if (pn = 'count') then lua_pushinteger(L,Comp.Count) else
     if (pn = 'text') then lua_pushStringCP(L,Comp.text) else
        Result := false;
end;

function lua_toTShiftState(L: Plua_State; Index: Integer):TShiftState; overload;
begin
     result := StringToShiftState(lua_tostring(L, Index));
end;

function lua_toTShiftState(L: Plua_State; Index: Integer; default:TShiftState ):TShiftState; overload;
begin
     if not lua_isstring(L, Index) then
        result := default
     else
         result := lua_toTShiftState(L, Index);
end;

function lua_toTextStyle(L: Plua_State; Index: Integer):TTextStyle;
var
  ts:TTextStyle;
begin
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lowercase(lua_tostring(L,-2))='SingleLine') then
         ts.SingleLine :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='Clipping') then
         ts.Clipping :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='ExpandTabs') then
         ts.ExpandTabs :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='ShowPrefix') then
         ts.ShowPrefix :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='Wordbreak') then
         ts.Wordbreak :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='Opaque') then
         ts.Opaque :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='SystemFont') then
         ts.SystemFont :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='RightToLeft') then
         ts.RightToLeft :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='EndEllipsis') then
         ts.EndEllipsis :=  lua_toboolean(L, -1)
      else if (lowercase(lua_tostring(L,-2))='Layout') then
         ts.Layout :=  TTextLayout(GetEnumValue(TypeInfo(TTextLayout),lua_tostring(L,-1)))
      else if (lowercase(lua_tostring(L,-2))='Alignment') then
         ts.Alignment :=  TAlignment(GetEnumValue(TypeInfo(TAlignment),lua_tostring(L,-1)));
      lua_pop(L, 1);
    end;
  end;
  result := ts;
end;

function lua_toTPoint(L: Plua_State; Index: Integer):TPoint;
var
  point:TPoint;
begin
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lowercase(lua_tostring(L,-2))='x') then
         point.x :=  lua_tointeger(L, -1)
      else if (lowercase(lua_tostring(L,-2))='y') then
         point.y :=  lua_tointeger(L, -1);
      lua_pop(L, 1);
    end;
  end;
  result := point;
end;

procedure lua_pushTPoint(L: Plua_State; point:TPoint);
begin
  lua_newtable(L);
  lua_pushliteral(L, 'x');
  lua_pushinteger(L, point.x);
  lua_pushliteral(L, 'y');
  lua_pushinteger(L, point.y);
  lua_settable(L, -5);
  lua_settable(L, -3);
end;

function lua_toTRect(L: Plua_State; Index: Integer):TRect;
var
  rect:TRect;
begin
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lowercase(lua_tostring(L,-2))='left') then
         rect.Left :=  lua_tointeger(L, -1)
      else if (lowercase(lua_tostring(L,-2))='top') then
         rect.Top :=  lua_tointeger(L, -1)
      else if (lowercase(lua_tostring(L,-2))='width') then
         rect.Width :=  lua_tointeger(L, -1)
      else if (lowercase(lua_tostring(L,-2))='height') then
         rect.Height :=  lua_tointeger(L, -1);
      lua_pop(L, 1);
    end;
  end;
  result := rect;
end;

procedure lua_pushTRect(L: Plua_State; rect:TRect);
begin
  lua_newtable(L);
  lua_pushliteral(L, 'left');
  lua_pushinteger(L, rect.Left);
  lua_pushliteral(L, 'top');
  lua_pushinteger(L, rect.Top);
  lua_pushliteral(L, 'width');
  lua_pushinteger(L, rect.Width);
  lua_pushliteral(L, 'height');
  lua_pushinteger(L, rect.Height);
  lua_settable(L, -9);
  lua_settable(L, -7);
  lua_settable(L, -5);
  lua_settable(L, -3);
end;

function lua_toTSize(L: Plua_State; Index: Integer):TSize;
var
  size:TSize;
begin
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lowercase(lua_tointeger(L,-2))='width') then
         size.Width :=  lua_tointeger(L, -1)
      else if (lowercase(lua_tostring(L,-2))='height') then
         size.Height :=  lua_tointeger(L, -1);
      lua_pop(L, 1);
    end;
  end;
  result := size;
end;

function lua_toStringArray(L: Plua_State; Index: Integer):aofs;
var
  arr: array of string;
  s: string;
  n: integer;
begin
  n := 0;
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lua_isstring(L, -1)) then begin
         s := lua_toStringCP(L, -1);
         SetLength(arr,n+1);
         arr[n] := s;
         n := n + 1;
      end;
      lua_pop(L, 1);
    end;
  end;
  result := arr;
end;

function lua_toStringList(L: Plua_State; Index: Integer):TStringList;
var
  s: string;
  n: integer;
begin
  n := 0;
  if lua_istable(L,Index) then begin
    Result := TStringList.Create;
    n := lua_gettop(L);
    lua_pushnil(L);
    while (lua_next(L, n) <> 0) do begin
      if (lua_isstring(L, -1)) then begin
         s := lua_toStringCP(L, -1);
         Result.Add(s);
      end;
      lua_pop(L, 1);
    end;
  end;
end;

function lua_toLongWordArray(L: Plua_State; Index: Integer):aoflw;
var
  arr: array of LongWord;
  lw: LongWord;
  n: integer;
begin
  n := 0;
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lua_isnumber(L, -1)) then begin
         lw := LongWord(lua_tointeger(L, -1));
         SetLength(arr,n+1);
         arr[n] := lw;
         n := n + 1;
      end;
      lua_pop(L, 1);
    end;
  end;
  result := arr;
end;

function lua_toTPointArray(L: Plua_State; Index: Integer):aoftp;
var
  arr: array of TPoint;
  p: TPoint;
  n: integer;
begin
   n := 0;
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lua_istable(L, -1)) then begin
         p := lua_toTPoint(L,-1);
         SetLength(arr,n+1);
         arr[n] := p;
         n := n + 1;
      end;
      lua_pop(L, 1);
    end;
  end;
  result := arr;
end;

function lua_toTMenuItem(L: Plua_State; Index: Integer):aofmi;
var
  arr: aofmi;
  mi: TMenuItem;
  n: integer;
begin
   n := 0;
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lua_istable(L, -1)) then begin
         mi := TMenuItem(GetLuaObject(L, -1));
         SetLength(arr,n+1);
         arr[n] := mi;
         n := n + 1;
      end;
      lua_pop(L, 1);
    end;
  end;
  result := arr;
end;

function lua_toTTreeNode(L: Plua_State; Index: Integer):aoftn;
var
  arr: aoftn;
  tn: TTreeNode;
  n: integer;
begin
   n := 0;
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lua_istable(L, -1)) then begin
         tn := TTreeNode(GetLuaObject(L, -1));
         SetLength(arr,n+1);
         arr[n] := tn;
         n := n + 1;
      end;
      lua_pop(L, 1);
    end;
  end;
  result := arr;
end;

end.

