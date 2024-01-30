(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPaintBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreatePaintBox(L: Plua_State): Integer; cdecl;
procedure PaintBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPaintBox = class(TPaintBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure PaintBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreatePaintBox(L: Plua_State): Integer; cdecl;
var
	lPaintBox:TLuaPaintBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPaintBox := TLuaPaintBox.Create(Parent);
	lPaintBox.Parent := TWinControl(Parent);
	lPaintBox.LuaCtl := TVCLuaControl.Create(TControl(lPaintBox),L,@PaintBoxToTable);
	InitControl(L,lPaintBox,Name);
	PaintBoxToTable(L, -1, lPaintBox);
	Result := 1;
end;

end.
