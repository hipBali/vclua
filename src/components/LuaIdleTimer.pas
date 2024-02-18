(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaIdleTimer;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo;

function CreateIdleTimer(L: Plua_State): Integer; cdecl;
function IsIdleTimer(L: Plua_State): Integer; cdecl;
function AsIdleTimer(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TIdleTimer; pti: PTypeInfo = nil); overload; inline;

type
    TLuaIdleTimer = class(TIdleTimer)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomIdleTimerFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils, Controls;


function IsIdleTimer(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TIdleTimer);
end;
function AsIdleTimer(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TIdleTimer then
    lua_push(L, TIdleTimer(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TIdleTimer; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomIdleTimer',v);
end;
function CreateIdleTimer(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lIdleTimer := TLuaIdleTimer.Create(Parent);
	// := TWinControl(Parent);
	lIdleTimer.LuaCtl := TVCLuaControl.Create(lIdleTimer as TComponent,L,nil,'TCustomIdleTimer');
	InitControl(L,lIdleTimer,Name);
	CreateTableForKnownType(L,'TCustomIdleTimer',lIdleTimer);
	Result := 1;
end;

begin
	SetLength(CustomIdleTimerFuncs, 0+1);
	
	CustomIdleTimerFuncs[0].name:=nil;
	CustomIdleTimerFuncs[0].func:=nil;

end.
