(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
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
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lRadioButton.LuaCtl := TVCLuaControl.Create(lRadioButton as TComponent,L,@RadioButtonToTable);
	InitControl(L,lRadioButton,Name);
	RadioButtonToTable(L, -1, lRadioButton);
	Result := 1;
end;

end.
