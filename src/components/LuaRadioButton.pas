(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaRadioButton;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateRadioButton(L: Plua_State): Integer; cdecl;
procedure RadioButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaRadioButton = class(TRadioButton)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure RadioButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateRadioButton(L: Plua_State): Integer; cdecl;
var
	lRadioButton:TLuaRadioButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lRadioButton := TLuaRadioButton.Create(Parent);
	lRadioButton.Parent := TWinControl(Parent);
	lRadioButton.LuaCtl := TVCLuaControl.Create(TControl(lRadioButton),L,@RadioButtonToTable);
	InitControl(L,lRadioButton,Name);
	RadioButtonToTable(L, -1, lRadioButton);
	Result := 1;
end;

end.
