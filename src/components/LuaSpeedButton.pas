(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpeedButton;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Buttons;

function CreateSpeedButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSpeedButton = class(TSpeedButton)
        LuaCtl: TVCLuaControl;
    end;
var
    SpeedButtonFuncs: TLuaVmt;
    SpeedButtonSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TSpeedButton',v);
end;
function CreateSpeedButton(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lSpeedButton := TLuaSpeedButton.Create(Parent);
	lSpeedButton.Parent := TWinControl(Parent);
	lSpeedButton.LuaCtl := TVCLuaControl.Create(lSpeedButton as TComponent,L,nil,'TSpeedButton');
	CreateTableForKnownType(L,'TSpeedButton',lSpeedButton);
	InitControl(L,lSpeedButton,Name);
	Result := 1;
end;

begin
	SpeedButtonFuncs := TLuaVmt.Create;
	
	SpeedButtonSets := TLuaVmt.Create;
	
end.
