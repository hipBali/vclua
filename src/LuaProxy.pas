unit LuaProxy;

{$mode Delphi}{$T+}

interface

uses
  Classes, Types, Graphics, TypInfo, LCLType, LuaObject, // for generics to work LuaObject must be used here, not in implementation part
  Lua, LuaHelper;

type
  PTUTF8Char = ^TUTF8Char;
  PTextStyle = ^TTextStyle;

// --------------------

(*
How to implement passing callbacks from Lua to FP:
1) Create Lua registry table with functions as keys and TLuaEvent instances as values
2) add VCL.Unregister(f) function to force destruction of TLuaEvent instance to avoid leaks
3) in generator in function inferTypeKindFromLine maintain a table of all procedural typenames
4) based on that table, for each type:
-- set VCLUA_FROMLUA[type] = "#TYP(luaL_checkMethod(L,#,TypeInfo(#TYP));"
-- set VCLUA_TOLUA[type] = "lua_push(L,TMethod(#VAR),TypeInfo(#VAR));"
5) in this file add luaL_checkMethod(L,i,pti):
-- f:=lua_tocfunction(L,i)
-- check if registry has this key. If it does, store value in TMethod.Data, if it doesn't, store TLuaEvent.Create(L,f) in registry table and in TMethod.Data
-- store eventPtrs[pti^.Name] in TMethod.Code, return TMethod
6) in this file add lua_push(L,method,pti)
-- if method.data isn't TLuaEvent, push table {data=ptr,code=ptr,pti=ptr}, unusable ATM in Lua
-- else get ref from method.data and push its contents
*)

// compile all users with T+ (typed address operator)
procedure luaL_check(L: Plua_State; i: Integer; v: PBoolean; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
function luaL_checkInt64(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):Int64; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt8; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt16; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt32; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt64; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt8; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt16; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt32; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt64; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
function luaL_checkDouble(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):Double; inline;
{$ifdef FPC_HAS_TYPE_EXTENDED}
procedure luaL_check(L: Plua_State; i: Integer; v: PExtended; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
{$endif}
procedure luaL_check(L: Plua_State; i: Integer; v: PDouble; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PSingle; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
function luaL_checkPChar(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):PChar; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PString; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PShortString; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PPChar; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PTUTF8Char; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
// single char, no conversion
procedure luaL_check(L: Plua_State; i: Integer; v: PChar; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_checkSet(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError);
function luaL_checkEnum(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):Integer; inline;  // Integer as per TypInfo
procedure luaL_check(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PPoint; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PSize; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PRect; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PTextStyle; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
function luaL_checkShortCut(L: Plua_State; i: Integer; ler: TLuaErrorReport = lerLuaError):TShortCut; inline;
function luaL_checkColor(L: Plua_State; i: Integer; ler: TLuaErrorReport = lerLuaError):TColor;

// it's out of trait to allow calling luaL_check for different type than T, e.g. for TObject instead of TMenuItem
procedure luaL_checkProxy(L: Plua_State; i: Integer; addr: Pointer; pti : PTypeInfo); inline;
procedure luaL_checkProxyPti(L: Plua_State; i: Integer; addr: Pointer; pti : PTypeInfo); inline;
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
procedure lua_push(L: Plua_State; v:Extended; pti : PTypeInfo = nil); overload; inline;
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
procedure lua_pushShortCut(L: Plua_State; v:TShortCut); inline;
function LuaColorToIdent(L: Plua_State): Integer; cdecl;
// can't be named lua_push even with overloads due to a bug in generic implementation
procedure lua_pushArray<T>(L: Plua_State; const v:array of T; pti : PTypeInfo = nil);inline;

implementation

uses LazUtf8, SysUtils, LCLProc;

// check overloads
procedure luaL_check(L: Plua_State; i: Integer; v: PBoolean; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
begin
  // CheckArg checks for argument elsewhere, no other check needed
  v^ := lua_toboolean(L, i);
end;

function luaL_checkInt64(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):Int64;
{$ifdef LUA51}
var
  temp:Double;
begin
  luaL_check(L, i, @temp, pti, ler);
  Result := Trunc(temp);
  if Result <> temp then
     LuaTypeError(L, i, pti, ler);
end;
{$else}
var
  temp:LongBool;
begin
  Result := lua_tointegerx(L, i, @temp);
  if not temp then
    LuaTypeError(L, i, pti, ler);
end;
{$endif}
procedure luaL_check(L: Plua_State; i: Integer; v: PInt8; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);   begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt16; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt32; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PInt64; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt8; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);  begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt16; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt32; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PUInt64; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); begin v^ := luaL_checkInt64(L, i, TypeInfo(v^), ler); end;
function luaL_checkShortCut(L: Plua_State; i: Integer; ler: TLuaErrorReport = lerLuaError):TShortCut;
var s: string;
begin
  if lua_type(L, i) = LUA_TSTRING then begin
    s := lua_tostring(L, i);
    result := TextToShortCut(s);
    if (result = 0) and (s <> '') then
      LuaTypeError(L, i, TypeInfo(result), ler);
  end else
    result := luaL_checkInt64(L, i, TypeInfo(result), ler);
end;
function luaL_checkColor(L: Plua_State; i: Integer; ler: TLuaErrorReport = lerLuaError):TColor;
begin
  if lua_type(L, i) = LUA_TSTRING then
    try
      result := StringToColor(lua_tostring(L, i))
    except
      // inlining causes compiler exception
      on e: EConvertError do
         LuaTypeError(L, i, TypeInfo(result), ler);
    end
  else
    result := luaL_checkInt64(L, i, TypeInfo(result), ler);
end;

function luaL_checkDouble(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):Double; inline;
{$ifdef LUA51}
begin
  result := lua_tonumber(L, i);
  if (result = 0) and not lua_isnumber(L, i) then begin
{$else}
var
  temp:LongBool;
begin
  result := lua_tonumberx(L, i, @temp);
  if not temp then begin
{$endif}
    if pti = nil then pti := TypeInfo(result);
    LuaTypeError(L, i, pti, ler);
  end;
end;
{$ifdef FPC_HAS_TYPE_EXTENDED}
procedure luaL_check(L: Plua_State; i: Integer; v: PExtended; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); begin v^ := luaL_checkDouble(L, i, TypeInfo(v^), ler); end;
{$endif}
procedure luaL_check(L: Plua_State; i: Integer; v: PDouble; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); begin v^ := luaL_checkDouble(L, i, TypeInfo(v^), ler); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PSingle; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); begin v^ := luaL_checkDouble(L, i, TypeInfo(v^), ler); end;

function luaL_checkPChar(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):PChar;
begin
  Result := lua_tostring(L, i);
  if Result = nil then
    LuaTypeError(L, i, pti, ler);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PString; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);      begin v^ :=      string(luaL_checkPChar(L, i, TypeInfo(v^), ler)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PShortString; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); begin v^ := shortstring(luaL_checkPChar(L, i, TypeInfo(v^), ler)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PPChar; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);       begin v^ :=       PChar(luaL_checkPChar(L, i, TypeInfo(v^), ler)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PTUTF8Char; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);   begin v^ :=   TUTF8Char(luaL_checkPChar(L, i, TypeInfo(v^), ler)); end;
procedure luaL_check(L: Plua_State; i: Integer; v: PChar; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
var s:String;
begin
  if pti = nil then pti := TypeInfo(v^);
  s := luaL_checkPChar(L, i, pti, ler);
  if Length(s) <> 1 then
     LuaTypeError(L, i, pti, ler);
  v^ := s[1];
end;

procedure luaL_checkSet(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError);
begin
  try
    StringToSet(pti, luaL_checkPChar(L, i, pti, ler), v);
  except
    on E: Exception do
      // inlining causes internalerror(200602035) if E properties are used
      LuaError(L, E.ClassName, E.Message, ler);
  end;
end;
function luaL_checkEnum(L: Plua_State; i: Integer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError):Integer;
begin
  Result := GetEnumValue(pti, luaL_checkPChar(L, i, pti, ler));
  if Result = -1 then
     LuaTypeError(L, i, pti, ler);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: Pointer; pti : PTypeInfo; ler: TLuaErrorReport = lerLuaError);
var
  tn: string;
begin
  case pti.Kind of
    tkSet:
      luaL_checkSet(L, i, v, pti, ler);

    tkEnumeration:
      case GetTypeData(pti).OrdType of
          otSByte,otUByte: PByte(v)^ := luaL_checkEnum(L, i, pti, ler);
          otSWord,otUWord: PWord(v)^ := luaL_checkEnum(L, i, pti, ler);
          otSLong,otULong: PCardinal(v)^ := luaL_checkEnum(L, i, pti, ler);
      end;

    tkBool:
      case GetTypeData(pti).OrdType of
          otSByte,otUByte: PByte(v)^ := Ord(lua_toboolean(L, i));
          otSWord,otUWord: PWord(v)^ := Ord(lua_toboolean(L, i));
          otSLong,otULong: PCardinal(v)^ := Ord(lua_toboolean(L, i));
      end;

    tkInteger:
      case GetTypeData(pti).OrdType of
          otSByte: PShortInt(v)^ := luaL_checkInt64(L, i, pti, ler);
          otUByte: PByte(v)^ := luaL_checkInt64(L, i, pti, ler);
          otSWord: PSmallInt(v)^ := luaL_checkInt64(L, i, pti, ler);
          otUWord: PWord(v)^ := luaL_checkInt64(L, i, pti, ler);
          otSLong: PLongInt(v)^ := luaL_checkInt64(L, i, pti, ler);
          otULong: PLongWord(v)^ := luaL_checkInt64(L, i, pti, ler);
      end;

    tkInt64:
      PInt64(v)^ := luaL_checkInt64(L, i, pti, ler);

    tkQWord:
      PUInt64(v)^ := luaL_checkInt64(L, i, pti, ler);

    tkFloat:
      case GetTypeData(pti).FloatType of
          ftSingle: PSingle(v)^ := luaL_checkDouble(L, i, pti, ler);
          ftDouble: PDouble(v)^ := luaL_checkDouble(L, i, pti, ler);
          {$ifdef FPC_HAS_TYPE_EXTENDED}
          ftExtended: PExtended(v)^ := luaL_checkDouble(L, i, pti, ler);
          {$endif}
      else
          LuaError(L, 'Unsupported float type from Lua stack', pti.name, ler);
      end;

    tkChar:
      PChar(v)^ := string(luaL_checkPChar(L, i, pti, ler))[1];

    tkSString:
      PShortString(v)^ := ShortString(luaL_checkPChar(L, i, pti, ler));

    tkLString, tkAString:
      PString(v)^ := String(luaL_checkPChar(L, i, pti, ler));

    tkClass:
      PObject(v)^ := GetLuaObjectUnsafe(L, i);

    tkRecord:
      begin
        tn := LowerCase(String(pti^.Name));
        if tn = 'tpoint' then
          luaL_check(L, i, PPoint(v), pti, ler)
        else if tn = 'trect' then
          luaL_check(L, i, PRect(v), pti, ler)
        else if tn = 'tsize' then
          luaL_check(L, i, PSize(v), pti, ler)
        else if tn = 'ttextstyle' then
          luaL_check(L, i, PTextStyle(v), pti, ler)
        else
          LuaError(L, 'Don''t know how to get record type from Lua stack', pti^.Name, ler);
      end;

  else
    LuaError(L, 'Don''t know how to get type from Lua stack', pti^.Name, ler);
  end;
end;

procedure luaL_checkRecord<PT>(L: Plua_State; i: Integer; LoNames: array of string; addrs: array of PT; pti : PTypeInfo; ler: TLuaErrorReport); inline;
var
  f:String;
  j:Integer = 0;
  k,n:Integer;
begin
  assert(High(LoNames)=High(addrs),'luaL_checkRecord: check names and addresses number and order');
  i := LuaAbsIndex(L, i);
  if lua_istable(L, i) then begin
    // fast path, assume record was pushed by API
    luaL_checkstack(L, Length(LoNames), 'luaL_checkRecord');
    while j <= High(LoNames) do begin
      lua_pushstring(L, LoNames[j]);
      lua_rawget(L, i);
      if lua_isnil(L, -1) then Break;
      luaL_check(L, -1, addrs[j], nil, ler);
      Inc(j);
    end;
    lua_pop(L,j);
    if j = Length(LoNames) then Exit;
    // slow path, field #j in lowercase isn't found
    n := j;
    lua_pop(L,1);
    lua_pushnil(L);
    while (lua_next(L,i)<>0) do begin
      if (lua_type(L,-2)=LUA_TSTRING) then begin
         f := lowercase(lua_tostring(L, -2));
         for k := j to High(LoNames) do
             if (f=LoNames[k]) then begin
                luaL_check(L, -1, addrs[k], nil, ler);
                Inc(n);
                Break;
             end;
      end;
      lua_pop(L, 1);
    end;
    if n = Length(LoNames) then Exit;
  end;
  LuaTypeError(L, i, pti, ler);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PPoint; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
begin
  luaL_checkRecord<PLongint>(L, i, ['x','y'], [@v^.x, @v^.y], TypeInfo(v^), ler);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PSize; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
begin
  luaL_checkRecord<PLongint>(L, i, ['width','height'], [@v^.Width, @v^.Height], TypeInfo(v^), ler);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PRect; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
begin
  luaL_checkRecord<PLongint>(L, i, ['left','top','right','bottom'], [@v^.Left, @v^.Top, @v^.Right, @v^.Bottom], TypeInfo(v^), ler);
end;
procedure luaL_check(L: Plua_State; i: Integer; v: PTextStyle; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
var f:string;
begin
  if lua_istable(L, i) then begin
    v^ := Default(TTextStyle); // allow to pass incomplete record from Lua
    lua_pushnil(L);
    while (lua_next(L,i)<>0) do begin
      if (lua_type(L,-2)=LUA_TSTRING) then begin
         f := lowercase(lua_tostring(L, -2));
         if      (f='singleline') then luaL_check(L, -1, @v^.SingleLine, nil, ler)
         else if (f='clipping') then luaL_check(L, -1, @v^.Clipping, nil, ler)
         else if (f='expandtabs') then luaL_check(L, -1, @v^.ExpandTabs, nil, ler)
         else if (f='showprefix') then luaL_check(L, -1, @v^.ShowPrefix, nil, ler)
         else if (f='wordbreak') then luaL_check(L, -1, @v^.Wordbreak, nil, ler)
         else if (f='opaque') then luaL_check(L, -1, @v^.Opaque, nil, ler)
         else if (f='systemfont') then luaL_check(L, -1, @v^.SystemFont, nil, ler)
         else if (f='righttoleft') then luaL_check(L, -1, @v^.RightToLeft, nil, ler)
         else if (f='endellipsis') then luaL_check(L, -1, @v^.EndEllipsis, nil, ler)
         else if (f='layout') then luaL_check(L, -1, @v^.Layout, TypeInfo(v^.Layout), ler)
         else if (f='alignment') then luaL_check(L, -1, @v^.Alignment, TypeInfo(v^.Alignment), ler);
      end;
      lua_pop(L, 1);
    end;
  end else
    LuaTypeError(L, i, TypeInfo(v^), ler);
end;

procedure luaL_checkProxy(L: Plua_State; i: Integer; addr: Pointer; pti : PTypeInfo);
begin
  luaL_check(L, i, addr, pti, lerLuaError);
end;
procedure luaL_checkProxyPti(L: Plua_State; i: Integer; addr: Pointer; pti : PTypeInfo);
begin
  luaL_check(L, i, addr, pti, lerLuaError);
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
      luaL_checkProxy(L, -1, @v^[j-1], TypeInfo(T));
    end;
    lua_pop(L, len);
  end else
    LuaTypeError(L, i, TypeInfo(v^));
end;

class procedure TTrait<T>.luaL_optcheck(L: Plua_State; i: Integer; v: PT; const dflt: T);
begin
  if not lua_isnoneornil(L, i) then
     luaL_checkProxy(L, i, v, TypeInfo(T))
  else
     v^ := dflt;
end;
class procedure TTraitPti<T>.luaL_optcheck(L: Plua_State; i: Integer; v: PT; const dflt: T; pti : PTypeInfo);
begin
  if not lua_isnoneornil(L, i) then
     luaL_checkProxyPti(L, i, v, pti)
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
procedure lua_push(L: Plua_State; v:Extended; pti : PTypeInfo = nil);
begin
  lua_pushnumber(L, v);
end;
// string also catches PChar
procedure lua_push(L: Plua_State; const v:String; pti : PTypeInfo = nil);
begin
  lua_pushstring(L, v);
end;
procedure lua_push(L: Plua_State; const v:TUTF8Char; pti : PTypeInfo = nil);
begin
  lua_pushstring(L, v);
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
procedure lua_pushShortCut(L: Plua_State; v:TShortCut);
begin
  lua_push(L, ShortCutToText(v)); // can potentially be localized, so use utf8 conversion inside lua_push
end;
function LuaColorToIdent(L: Plua_State): Integer; cdecl;
var
  v: TColor;
  s: string;
begin
  CheckArg(L, 1);
  luaL_check(L, 1, @v, TypeInfo(v));
  if ColorToIdent(v, s) then
     lua_pushstring(L, s)
  else
     lua_pushnil(L);
  result := 1;
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

end.

