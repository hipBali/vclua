(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTimer;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateTimer(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTimer; pti: PTypeInfo = nil); overload; inline;
procedure TimerToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTimer = class(TTimer)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TTimer; pti: PTypeInfo);
begin
	TimerToTable(L,-1,v);
end;
procedure TimerToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lTimer.LuaCtl := TVCLuaControl.Create(lTimer as TComponent,L,@TimerToTable);
	InitControl(L,lTimer,Name);
	TimerToTable(L, -1, lTimer);
	Result := 1;
end;

end.
