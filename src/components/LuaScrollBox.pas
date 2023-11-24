(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaScrollBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Forms, Controls;

function CreateScrollBox(L: Plua_State): Integer; cdecl;
procedure ScrollBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaScrollBox = class(TScrollBox)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure ScrollBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateScrollBox(L: Plua_State): Integer; cdecl;
var
	lScrollBox:TLuaScrollBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lScrollBox := TLuaScrollBox.Create(Parent);
	lScrollBox.Parent := TWinControl(Parent);
	lScrollBox.LuaCtl := TVCLuaControl.Create(TControl(lScrollBox),L,@ScrollBoxToTable);
	InitControl(L,lScrollBox,Name);
	ScrollBoxToTable(L, -1, lScrollBox);
	Result := 1;
end;

end.
