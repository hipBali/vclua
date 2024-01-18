(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaUpDown;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls;

function CreateUpDown(L: Plua_State): Integer; cdecl;
procedure UpDownToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaUpDown = class(TUpDown)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure UpDownToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateUpDown(L: Plua_State): Integer; cdecl;
var
	lUpDown:TLuaUpDown;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lUpDown := TLuaUpDown.Create(Parent);
	lUpDown.Parent := TWinControl(Parent);
	lUpDown.LuaCtl := TVCLuaControl.Create(TControl(lUpDown),L,@UpDownToTable);
	InitControl(L,lUpDown,Name);
	UpDownToTable(L, -1, lUpDown);
	Result := 1;
end;

end.
