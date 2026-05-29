(*
  Linux/FPC compatibility push/check overloads for generated VCLua sources.
  Keep this unit in the implementation uses list of generated units when the
  target defines contain "linux".
*)
unit LuaLinuxPushFixes;

{$MODE Delphi}{$T+}

interface

uses
  Lua, TypInfo, Classes, Controls, LMessages, ValEdit, Graphics;

type
  PItemProp = ^TItemProp;

procedure lua_push(L: Plua_State; const v: TReader; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TWriter; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TThread; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TWinControlEnumerator; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TItemProp; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: PPropInfo; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: PHintInfo; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TAlignInfo; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TLMessage; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TLCLTextMetric; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: CodePointer; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TMethod; pti: PTypeInfo = nil); overload; inline;
procedure lua_push(L: Plua_State; const v: TThreadReportStatus; pti: PTypeInfo = nil); overload; inline;


implementation

procedure lua_push(L: Plua_State; const v: TReader; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: TWriter; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: TThread; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: TWinControlEnumerator; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: TItemProp; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: PPropInfo; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: PHintInfo; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: TAlignInfo; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(@v));
end;

procedure lua_push(L: Plua_State; const v: TLMessage; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(@v));
end;

procedure lua_push(L: Plua_State; const v: TLCLTextMetric; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(@v));
end;

procedure lua_push(L: Plua_State; const v: CodePointer; pti: PTypeInfo); overload; inline;
begin
  lua_pushlightuserdata(L, Pointer(v));
end;

procedure lua_push(L: Plua_State; const v: TMethod; pti: PTypeInfo); overload; inline;
begin
  lua_newtable(L);

  lua_pushlightuserdata(L, Pointer(v.Code));
  lua_setfield(L, -2, 'Code');

  lua_pushlightuserdata(L, Pointer(v.Data));
  lua_setfield(L, -2, 'Data');
end;

procedure lua_push(L: Plua_State; const v: TThreadReportStatus; pti: PTypeInfo); overload; inline;
begin
  lua_push(L, TMethod(v), pti);
end;

end.
