unit LuaProxy;

{$mode Delphi}{$H+}{$T+}

interface

uses
  Classes, Types, Controls, Menus, ComCtrls, SysUtils, Graphics, TypInfo, LCLType,
  LuaHelper, Lua;

type
  aofs = array of string;
  aoflw = array of LongWord;
  aoftp = array of TPoint;
  aofmi = array of TMenuItem;
  aoftn = array of TTreeNode;
  PTUTF8Char = ^TUTF8Char;

// UTF8 Codepage conversion
function set_vclua_utf8_conv(L : Plua_State): Integer; cdecl;
function is_vclua_utf8_conv:boolean; // internal

// String UTF-8 support
function lua_toStringCP(L: Plua_State; Index: Integer):string;
procedure lua_pushStringCP(L: Plua_State; const str:string);
function lua_toStringArray(L: Plua_State; Index: Integer):aofs;
function lua_toStringList(L: Plua_State; Index: Integer):TStringList;
// --------------------

function lua_toTPoint(L: Plua_State; Index: Integer):TPoint;
function lua_toTRect(L: Plua_State; Index: Integer):TRect;
function lua_toTSize(L: Plua_State; Index: Integer):TSize;

function lua_toLongWordArray(L: Plua_State; Index: Integer):aoflw;
function lua_toTPointArray(L: Plua_State; Index: Integer):aoftp;
function lua_toTMenuItem(L: Plua_State; Index: Integer):aofmi;
function lua_toTTreeNode(L: Plua_State; Index: Integer):aoftn;

function lua_toTextStyle(L: Plua_State; Index: Integer):TTextStyle;

function lua_toTShiftState(L: Plua_State; Index: Integer):TShiftState; overload;
function lua_toTShiftState(L: Plua_State; Index: Integer; default:TShiftState ):TShiftState; overload;

// TString descenant properties
function GetTStringsProperty(L: Plua_State; Comp:TStrings; pn:String):boolean;

// compile all users with T+ (typed address operator)
procedure luaL_check(L: Plua_State; i: Integer; v: PBoolean; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt8; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt16; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt32; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt64; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt8; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt16; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt32; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt64; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PDouble; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PSingle; pti : PTypeInfo = nil); overload; inline;
function luaL_checkCP(L: Plua_State; i: Integer; pti : PTypeInfo):String; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PString; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PPChar; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PTUTF8Char; pti : PTypeInfo = nil); overload; inline;
// single char, no conversion
procedure luaL_check(L: Plua_State; i: Integer; v: PChar; pti : PTypeInfo = nil); overload; inline;
procedure luaL_checkSet(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo); inline;
procedure luaL_check(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo); overload; inline;

procedure lua_push(L: Plua_State; v:Boolean; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:Int64  ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:QWord  ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:Double ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:Char   ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v:String; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v:TUTF8Char; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v:TPoint; pti : PTypeInfo = nil); overload;
procedure lua_push(L: Plua_State; const v:TRect ; pti : PTypeInfo = nil); overload;
procedure lua_push(L: Plua_State; const v       ; pti : PTypeInfo);       overload; inline;
procedure lua_pushSet(L: Plua_State; v:LongInt; pti : PTypeInfo);overload; inline;// LongInt as per TypInfo
procedure lua_pushSet(L: Plua_State; v:Pointer; pti : PTypeInfo);overload; inline;
procedure lua_pushEnum(L: Plua_State; v:Integer; pti : PTypeInfo);inline;         // Integer as per TypInfo
// can't be named lua_push even with overloads due to a bug in generic implementation
procedure lua_pushArray<T>(L: Plua_State; const v:array of T; pti : PTypeInfo = nil);inline;

implementation

uses LuaObject, LazUtf8;

// check overloads
procedure luaL_check(L: Plua_State; i: Integer; v: PBoolean; pti : PTypeInfo = nil);
begin
  // CheckArg checks for argument elsewhere, no other check needed
  v^ := lua_toboolean(L, i);
end;

function luaL_checkInt64(L: Plua_State; i: Integer; pti : PTypeInfo):Int64; inline;
{$ifdef LUA51}
var
  temp:Double;
begin
  luaL_check(L, i, @temp, pti);
  Result := Trunc(temp);
  if Result <> temp then
     LuaTypeError(L, i, pti);
end;
{$else}
var
  temp:LongBool;
begin
  Result := lua_tointegerx(L, i, @temp);
  if not temp then
    LuaTypeError(L, i, pti);
end;
{$endif}
procedure luaL_check(L: Plua_State; i: Integer; v: PInt8; pti : PTypeInfo = nil);   begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt16; pti : PTypeInfo = nil);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt32; pti : PTypeInfo = nil);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt64; pti : PTypeInfo = nil);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt8; pti : PTypeInfo = nil);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt16; pti : PTypeInfo = nil); begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt32; pti : PTypeInfo = nil); begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt64; pti : PTypeInfo = nil); begin v^ := luaL_checkInt64(L, i, TypeInfo(v^)); end;

procedure luaL_check(L: Plua_State; i: Integer; v: PDouble; pti : PTypeInfo = nil);
begin
  v^ := lua_tonumber(L, i);
  if (v^ = 0) and not lua_isnumber(L, i) then begin
    if pti = nil then pti := TypeInfo(v^);
    LuaTypeError(L, i, pti);
  end;
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PSingle; pti : PTypeInfo = nil);
var temp:Double;
begin
  luaL_check(L, i, @temp, TypeInfo(Single));
  v^ := temp;
end;

function luaL_checkPChar(L: Plua_State; i: Integer; pti : PTypeInfo):PChar; inline;
begin
  Result := lua_tostring(L, i);
  if Result = nil then
    LuaTypeError(L, i, pti);
end;
function luaL_checkCP(L: Plua_State; i: Integer; pti : PTypeInfo):String;
begin
  Result := luaL_checkPChar(L, i, pti);
  if (is_vclua_utf8_conv) then
    Result := WinCPToUTF8(Result);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PString; pti : PTypeInfo = nil);    begin v^ :=           luaL_checkCP(L, i, TypeInfo(v^)) ; end;
procedure luaL_check(L: Plua_State; i: Integer; v: PPChar; pti : PTypeInfo = nil);     begin v^ :=     PChar(luaL_checkCP(L, i, TypeInfo(v^))); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PTUTF8Char; pti : PTypeInfo = nil); begin v^ := TUTF8Char(luaL_checkCP(L, i, TypeInfo(v^))); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PChar; pti : PTypeInfo = nil);
var s:String;
begin
  if pti = nil then pti := TypeInfo(v^);
  s := luaL_checkPChar(L, i, pti);
  if Length(s) <> 1 then
     LuaTypeError(L, i, pti);
  v^ := s[1];
end;

procedure luaL_checkSet(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo);
begin
  StringToSet(pti, luaL_checkPChar(L, i, pti), v);
end;
function luaL_checkEnum(L: Plua_State; i: Integer; pti : PTypeInfo):Integer; inline;  // Integer as per TypInfo
begin
  Result := GetEnumValue(pti, luaL_checkPChar(L, i, pti));
end;
procedure luaL_check(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo);
begin
  case pti.Kind of
    tkSet: luaL_checkSet(L, i, v, pti);
    tkEnumeration:
      case GetTypeData(pti).OrdType of
          otSByte,otUByte: PByte(v)^ := luaL_checkEnum(L, i, pti);
          otSWord,otUWord: PWord(v)^ := luaL_checkEnum(L, i, pti);
          otSLong,otULong: PCardinal(v)^ := luaL_checkEnum(L, i, pti);
      end;
  else
    LuaError(L, 'Don''t know how to get type from Lua stack', pti.name);
  end;
end;

// push overloads
procedure lua_push(L: Plua_State; v:Boolean; pti : PTypeInfo = nil);
begin
  lua_pushboolean(L, v);
end;
procedure lua_push(L: Plua_State; v:Int64; pti : PTypeInfo = nil);
begin
  lua_pushinteger(L, v);
end;
procedure lua_push(L: Plua_State; v:QWord; pti : PTypeInfo = nil);
begin
  lua_pushinteger(L, v);
end;
procedure lua_push(L: Plua_State; v:Double; pti : PTypeInfo = nil);
begin
  lua_pushnumber(L, v);
end;
// these pushes are used in On* event handlers where user strings are passed from LCL to Lua, so need to decode
// string also catches PChar
procedure lua_push(L: Plua_State; const v:String; pti : PTypeInfo = nil);
begin
  lua_pushStringCP(L, v);
end;
procedure lua_push(L: Plua_State; const v:TUTF8Char; pti : PTypeInfo = nil);
begin
  lua_pushString(L, v);
end;
procedure lua_push(L: Plua_State; v:Char; pti : PTypeInfo = nil);
begin
  lua_push(L, string(v));
end;
procedure lua_push(L: Plua_State; const v:TPoint; pti : PTypeInfo = nil);
begin
  lua_newtable(L);
  lua_pushliteral(L, 'x');
  lua_pushinteger(L, v.x);
  lua_rawset(L,-3);
  lua_pushliteral(L, 'y');
  lua_pushinteger(L, v.y);
  lua_rawset(L,-3);
end;
procedure lua_push(L: Plua_State; const v:TRect; pti : PTypeInfo = nil);
begin
  lua_newtable(L);
  lua_pushliteral(L, 'left');
  lua_pushinteger(L, v.Left);
  lua_rawset(L,-3);
  lua_pushliteral(L, 'top');
  lua_pushinteger(L, v.Top);
  lua_rawset(L,-3);
  lua_pushliteral(L, 'right');
  lua_pushinteger(L, v.Right);
  lua_rawset(L,-3);
  lua_pushliteral(L, 'bottom');
  lua_pushinteger(L, v.Bottom);
  lua_rawset(L,-3);
end;
procedure lua_push(L: Plua_State; const v; pti : PTypeInfo);
var
  i:Integer;
begin
  case pti.Kind of
    tkSet: lua_pushSet(L, @v, pti);
    tkEnumeration:
      begin
        case GetTypeData(pti).OrdType of
            otSByte,otUByte: i := PByte(@v)^;
            otSWord,otUWord: i := PWord(@v)^;
            otSLong,otULong: i := PCardinal(@v)^;
        end;
        lua_pushEnum(L, i, pti);
      end
  else
    LuaError(L, 'Don''t know how to push type to Lua stack', pti.name);
  end;
end;
procedure lua_pushSet(L: Plua_State; v:LongInt; pti : PTypeInfo);
begin lua_pushset(L, @v, pti); end;
procedure lua_pushSet(L: Plua_State; v:Pointer; pti : PTypeInfo);
var s:string;
begin
  s := SetToString(pti, v, True);
  lua_pushstring(L, s);
end;
procedure lua_pushEnum(L: Plua_State; v:Integer; pti : PTypeInfo);
var s:string;
begin
  s := GetEnumName(pti, v);
  lua_pushstring(L, s);
end;
procedure lua_pushArray<T>(L: Plua_State; const v:array of T; pti : PTypeInfo);
var i,top:Integer;
begin
  pti := TypeInfo(T);
  lua_createtable(L, Length(v), 0);
  top := lua_gettop(L);
  for i:=0 to High(v) do begin
    lua_push(L,v[i],pti);
    lua_rawseti(L,top,i+1);
  end;
end;

// ***********************************************
// VCLUA UTF-8 Converter
// ***********************************************
var _VCLUA_UTF8_CONV:boolean;
// -----------------------------------------------
function set_vclua_utf8_conv(L : Plua_State): Integer; cdecl;
begin
    CheckArg(L, 1);
    if (lua_isboolean(L,1)) then
       _VCLUA_UTF8_CONV := lua_toboolean(L,1);
    result := 0;
end;

function is_vclua_utf8_conv:boolean;
begin
    result := _VCLUA_UTF8_CONV;
end;

function lua_toStringCP(L: Plua_State; Index: Integer):string;
begin
     if (is_vclua_utf8_conv) then
       result := WinCPToUTF8(lua_tostring(L,Index))
     else
       result := lua_tostring(L,Index);
end;

procedure lua_pushStringCP(L: Plua_State; const str:string);
begin
     if (is_vclua_utf8_conv) then
       lua_pushstring(L,pchar(UTF8ToWinCP(str)))
     else
       lua_pushstring(L,pchar(str));
end;

function GetTStringsProperty(L: Plua_State; Comp:TStrings; pn:String):boolean;
begin
     Result := true;
     if (pn = 'count') then lua_push(L,Comp.Count) else
     if (pn = 'text') then lua_push(L,Comp.text) else
        Result := false;
end;

function lua_toTShiftState(L: Plua_State; Index: Integer):TShiftState; overload;
begin
  StringToSet(PTypeInfo(TypeInfo(TShiftState)), lua_tostring(L, Index), @result);
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
  s:AnsiString;
begin
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lua_type(L, -2) = LUA_TSTRING) then begin
        s := lowercase(lua_tostring(L,-2));
        if (s='x') then
           point.x :=  lua_tointeger(L, -1)
        else if (s='y') then
           point.y :=  lua_tointeger(L, -1);
      end;
      lua_pop(L, 1);
    end;
  end;
  result := point;
end;

function lua_toTRect(L: Plua_State; Index: Integer):TRect;
var
  rect:TRect;
  s:AnsiString;
begin
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lua_type(L, -2) = LUA_TSTRING) then begin
        s := lowercase(lua_tostring(L,-2));
        if (s='left') then
           rect.Left :=  lua_tointeger(L, -1)
        else if (s='top') then
           rect.Top :=  lua_tointeger(L, -1)
        else if (s='right') then
           rect.Right :=  lua_tointeger(L, -1)
        else if (s='bottom') then
           rect.Bottom :=  lua_tointeger(L, -1);
      end;
      lua_pop(L, 1);
    end;
  end;
  result := rect;
end;

function lua_toTSize(L: Plua_State; Index: Integer):TSize;
var
  size:TSize;
begin
  if lua_istable(L,Index) then begin
    lua_pushnil(L);
    while (lua_next(L, Index) <> 0) do begin
      if (lowercase(lua_tostring(L,-2))='width') then
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

