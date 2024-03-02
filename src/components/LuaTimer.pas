(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTimer;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateTimer(L: Plua_State): Integer; cdecl;
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
