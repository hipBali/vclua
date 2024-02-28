unit LuaProxy;

{$mode Delphi}{$H+}{$T+}

interface

uses
  Classes, Types, SysUtils, Graphics, TypInfo, LCLType, LuaObject,
  LuaHelper, Lua;

type
  PTUTF8Char = ^TUTF8Char;
  PTextStyle = ^TTextStyle;

// UTF8 Codepage conversion
function set_vclua_utf8_conv(L : Plua_State): Integer; cdecl;
function is_vclua_utf8_conv:boolean; // internal

// String UTF-8 support
function lua_toStringCP(L: Plua_State; Index: Integer):string;
procedure lua_pushStringCP(L: Plua_State; const str:string);
// --------------------

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
procedure luaL_check(L: Plua_State; i: Integer; v: PPoint; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PSize; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PRect; pti : PTypeInfo = nil); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PTextStyle; pti : PTypeInfo = nil); overload; inline;

// it's out of trait to allow calling luaL_check for different type than T, e.g. for TObject instead of TMenuItem
procedure luaL_checkProxy<PT>(L: Plua_State; i: Integer; addr: PT); inline;
procedure luaL_checkProxyPti<PT>(L: Plua_State; i: Integer; addr: PT; pti : PTypeInfo); inline;
type
  // this type must nor be instantiated for enums or it won't compile
  TTrait<T> = class
    type
        PT = ^T;
        aoT = array of T;
        PaoT = ^aoT;
    // expects not relative index
    class procedure luaL_checkArray(L: Plua_State; i: Integer; v: PaoT); inline;
    class procedure luaL_optcheck(L: Plua_State; i: Integer; v:PT; const dflt: T); inline;
  end;
  TTraitPti<T> = class
    type
        PT = ^T;
        aoT = array of T;
        PaoT = ^aoT;
    class procedure luaL_optcheck(L: Plua_State; i: Integer; v:PT; const dflt: T; pti : PTypeInfo); inline;
  end;

procedure lua_push(L: Plua_State; v:Boolean; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:Int64  ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:QWord  ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:Double ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; v:Char   ; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v:String; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v:TUTF8Char; pti : PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v:TPoint; pti : PTypeInfo = nil); overload;
procedure lua_push(L: Plua_State; const v:TRect ; pti : PTypeInfo = nil); overload;
procedure lua_push(L: Plua_State; const v:TSize ; pti : PTypeInfo = nil); overload;
procedure lua_push(L: Plua_State; const v:TTextStyle; pti : PTypeInfo = nil); overload;
procedure lua_push(L: Plua_State; const v       ; pti : PTypeInfo);       overload; inline;
procedure lua_pushSet(L: Plua_State; v:LongInt; pti : PTypeInfo);overload; inline;// LongInt as per TypInfo
procedure lua_pushSet(L: Plua_State; v:Pointer; pti : PTypeInfo);overload; inline;
procedure lua_pushEnum(L: Plua_State; v:Integer; pti : PTypeInfo);inline;         // Integer as per TypInfo
// can't be named lua_push even with overloads due to a bug in generic implementation
procedure lua_pushArray<T>(L: Plua_State; const v:array of T; pti : PTypeInfo = nil);inline;

implementation

uses LazUtf8;

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

procedure luaL_checkRecord<PT>(L: Plua_State; i: Integer; LoNames: array of string; addrs: array of PT; pti : PTypeInfo); inline;
var
  f:String;
  j:Integer = 0;
  k:Integer;
begin
  assert(High(LoNames)=High(addrs),'luaL_checkRecord: check names and addresses number and order');
  i := LuaAbsIndex(L, i);
  if lua_istable(L, i) then begin
    // fast path, assume record was pushed by API
    luaL_checkstack(L, Length(LoNames), 'luaL_checkRecord');
    while j <= High(LoNames) do begin
      lua_pushstring(L, LoNames[j]);
      Inc(j);
      lua_rawget(L, i);
      if lua_isnil(L, -1) then Break;
      luaL_check(L, -1, addrs[j-1]);
    end;
    lua_pop(L,j);
    if j = Length(LoNames) then Exit;
    // slow path, field #(j-1) in lowercase isn't found
    Dec(j);
    lua_pushnil(L);
    while (lua_next(L,i)<>0) do begin
      if (lua_type(L,-2)=LUA_TSTRING) then begin
         f := lowercase(lua_tostring(L, -2));
         for k := j to High(LoNames) do
             if (f=LoNames[k]) then begin
                luaL_check(L, -1, addrs[k]);
                Break;
             end;
      end;
      lua_pop(L, 1);
    end;
  end else
    LuaTypeError(L, i, pti);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PPoint; pti : PTypeInfo = nil);
begin
  luaL_checkRecord<PLongint>(L, i, ['x','y'], [@v^.x, @v^.y], TypeInfo(v^));
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PSize; pti : PTypeInfo = nil);
begin
  luaL_checkRecord<PLongint>(L, i, ['width','height'], [@v^.Width, @v^.Height], TypeInfo(v^));
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PRect; pti : PTypeInfo = nil);
begin
  luaL_checkRecord<PLongint>(L, i, ['left','top','right','bottom'], [@v^.Left, @v^.Top, @v^.Right, @v^.Bottom], TypeInfo(v^));
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PTextStyle; pti : PTypeInfo = nil);
var f:string;
begin
  if lua_istable(L, i) then begin
    v^ := Default(TTextStyle); // allow to pass incomplete record from Lua
    lua_pushnil(L);
    while (lua_next(L,i)<>0) do begin
      if (lua_type(L,-2)=LUA_TSTRING) then begin
         f := lowercase(lua_tostring(L, -2));
         if      (f='singleline') then luaL_check(L, -1, @v^.SingleLine)
         else if (f='clipping') then luaL_check(L, -1, @v^.Clipping)
         else if (f='expandtabs') then luaL_check(L, -1, @v^.ExpandTabs)
         else if (f='showprefix') then luaL_check(L, -1, @v^.ShowPrefix)
         else if (f='wordbreak') then luaL_check(L, -1, @v^.Wordbreak)
         else if (f='opaque') then luaL_check(L, -1, @v^.Opaque)
         else if (f='systemfont') then luaL_check(L, -1, @v^.SystemFont)
         else if (f='righttoleft') then luaL_check(L, -1, @v^.RightToLeft)
         else if (f='endellipsis') then luaL_check(L, -1, @v^.EndEllipsis)
         else if (f='layout') then luaL_check(L, -1, @v^.Layout, TypeInfo(v^.Layout))
         else if (f='alignment') then luaL_check(L, -1, @v^.Alignment, TypeInfo(v^.Alignment));
      end;
      lua_pop(L, 1);
    end;
  end else
    LuaTypeError(L, i, TypeInfo(v^));
end;

procedure luaL_checkProxy<PT>(L: Plua_State; i: Integer; addr: PT);
begin
  luaL_check(L, -1, addr);
end;
procedure luaL_checkProxyPti<PT>(L: Plua_State; i: Integer; addr: PT; pti : PTypeInfo);
begin
  luaL_check(L, -1, addr, pti);
end;

class procedure TTrait<T>.luaL_checkArray(L: Plua_State; i: Integer; v: PaoT);
var j,len: size_t;
begin
  if lua_istable(L, i) then begin
    len := lua_rawlen(L, i);
    SetLength(v^, len);
    luaL_checkstack(L, len, 'luaL_checkArray');
    for j := 1 to len do begin
      lua_rawgeti(L, i, j);
      luaL_checkProxy<PT>(L, -1, @v^[j-1]);
    end;
    lua_pop(L, len);
  end else
    LuaTypeError(L, i, TypeInfo(v^));
end;

class procedure TTrait<T>.luaL_optcheck(L: Plua_State; i: Integer; v: PT; const dflt: T);
begin
  if not lua_isnoneornil(L, i) then
     luaL_checkProxy<PT>(L, i, v)
  else
     v^ := dflt;
end;
class procedure TTraitPti<T>.luaL_optcheck(L: Plua_State; i: Integer; v: PT; const dflt: T; pti : PTypeInfo);
begin
  if not lua_isnoneornil(L, i) then
     luaL_checkProxyPti<PT>(L, i, v, pti)
  else
     v^ := dflt;
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
procedure lua_pushRecord<PT>(L: Plua_State; LoNames: array of string; addrs: array of PT); inline;
var k:Integer;
begin
  assert(High(LoNames)=High(addrs),'lua_pushRecord: check names and addresses number and order');
  lua_newtable(L);
  for k := 0 to High(LoNames) do begin
    lua_pushstring(L, LoNames[k]);
    lua_push(L, addrs[k]^, TypeInfo(addrs[k]^));
    lua_rawset(L,-3);
  end;
end;
procedure lua_push(L: Plua_State; const v:TPoint; pti : PTypeInfo = nil);
begin
  lua_pushRecord<PLongint>(L, ['x', 'y'], [@v.x, @v.y]);
end;
procedure lua_push(L: Plua_State; const v:TRect; pti : PTypeInfo = nil);
begin
  lua_pushRecord<PLongint>(L, ['left', 'top', 'right', 'bottom'], [@v.Left, @v.Top, @v.Right, @v.Bottom]);
end;
procedure lua_push(L: Plua_State; const v:TSize; pti : PTypeInfo = nil);
begin
  lua_pushRecord<PLongint>(L, ['cx', 'cy'], [@v.cx, @v.cy]);
end;
procedure lua_push(L: Plua_State; const v:TTextStyle; pti : PTypeInfo = nil);
begin
  lua_pushRecord<PBoolean>(L, ['singleline', 'clipping', 'expandtabs', 'showprefix', 'wordbreak', 'opaque', 'systemfont', 'righttoleft', 'endellipsis'],
                              [@v.SingleLine, @v.Clipping, @v.ExpandTabs, @v.ShowPrefix, @v.Wordbreak, @v.Opaque, @v.SystemFont, @v.RightToLeft, @v.EndEllipsis]);
  lua_pushliteral(L, 'layout');
  lua_pushEnum(L, Integer(v.Layout), TypeInfo(v.Layout));
  lua_rawset(L,-3);
  lua_pushliteral(L, 'alignment');
  lua_pushEnum(L, Integer(v.Alignment), TypeInfo(v.Alignment));
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

end.

