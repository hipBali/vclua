(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaSpeedButton;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Buttons, Controls;

function CreateSpeedButton(L: Plua_State): Integer; cdecl;
procedure SpeedButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSpeedButton = class(TSpeedButton)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure SpeedButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lSpeedButton.LuaCtl := TVCLuaControl.Create(TControl(lSpeedButton),L,@SpeedButtonToTable);
	InitControl(L,lSpeedButton,Name);
	SpeedButtonToTable(L, -1, lSpeedButton);
	Result := 1;
end;

end.
