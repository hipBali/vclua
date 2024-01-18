(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaCheckBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateCheckBox(L: Plua_State): Integer; cdecl;
procedure CheckBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCheckBox = class(TCheckBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure CheckBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCheckBox(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckBox := TLuaCheckBox.Create(Parent);
	lCheckBox.Parent := TWinControl(Parent);
	lCheckBox.LuaCtl := TVCLuaControl.Create(TControl(lCheckBox),L,@CheckBoxToTable);
	InitControl(L,lCheckBox,Name);
	CheckBoxToTable(L, -1, lCheckBox);
	Result := 1;
end;

end.
