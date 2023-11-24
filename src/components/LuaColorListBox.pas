(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaColorListBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ColorBox, Controls;

function CreateColorListBox(L: Plua_State): Integer; cdecl;
procedure ColorListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorListBox = class(TColorListBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure ColorListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateColorListBox(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lColorListBox := TLuaColorListBox.Create(Parent);
	lColorListBox.Parent := TWinControl(Parent);
	lColorListBox.LuaCtl := TVCLuaControl.Create(TControl(lColorListBox),L,@ColorListBoxToTable);
	InitControl(L,lColorListBox,Name);
	ColorListBoxToTable(L, -1, lColorListBox);
	Result := 1;
end;

end.
