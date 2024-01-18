(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaIdleTimer;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreateIdleTimer(L: Plua_State): Integer; cdecl;
procedure IdleTimerToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaIdleTimer = class(TIdleTimer)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure IdleTimerToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lIdleTimer.LuaCtl := TVCLuaControl.Create(TControl(lIdleTimer),L,@IdleTimerToTable);
	InitControl(L,lIdleTimer,Name);
	IdleTimerToTable(L, -1, lIdleTimer);
	Result := 1;
end;

end.
