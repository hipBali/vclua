(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaCheckListBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, CheckLst, Controls;

function CreateCheckListBox(L: Plua_State): Integer; cdecl;
procedure CheckListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCheckListBox = class(TCheckListBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure CheckListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCheckListBox(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckListBox := TLuaCheckListBox.Create(Parent);
	lCheckListBox.Parent := TWinControl(Parent);
	lCheckListBox.LuaCtl := TVCLuaControl.Create(TControl(lCheckListBox),L,@CheckListBoxToTable);
	InitControl(L,lCheckListBox,Name);
	CheckListBoxToTable(L, -1, lCheckListBox);
	Result := 1;
end;

end.
