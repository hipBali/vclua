(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTimer;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateTimer(L: Plua_State): Integer; cdecl;
function IsTimer(L: Plua_State): Integer; cdecl;
function AsTimer(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTimer; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTimer = class(TTimer)
        LuaCtl: TVCLuaControl;
    end;
var
    TimerFuncs: TLuaVmt;
    TimerSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsTimer(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTimer);
end;
function AsTimer(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTimer then
    lua_push(L, TTimer(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTimer; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTimer',v);
end;
function CreateTimer(L: Plua_State): Integer; cdecl;
var
	lTimer:TLuaTimer;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTimer := TLuaTimer.Create(Parent);
	// := TWinControl(Parent);
	lTimer.LuaCtl := TVCLuaControl.Create(lTimer as TComponent,L,nil,'TTimer');
	InitControl(L,lTimer,Name);
	CreateTableForKnownType(L,'TTimer',lTimer);
	Result := 1;
end;

begin
	TimerFuncs := TLuaVmt.Create;
	
	TimerSets := TLuaVmt.Create;
	
end.
