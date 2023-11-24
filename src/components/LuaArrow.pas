(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaArrow;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Arrow, Controls;

function CreateArrow(L: Plua_State): Integer; cdecl;
procedure ArrowToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaArrow = class(TArrow)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure ArrowToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateArrow(L: Plua_State): Integer; cdecl;
var
	lArrow:TLuaArrow;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lArrow := TLuaArrow.Create(Parent);
	lArrow.Parent := TWinControl(Parent);
	lArrow.LuaCtl := TVCLuaControl.Create(TControl(lArrow),L,@ArrowToTable);
	InitControl(L,lArrow,Name);
	ArrowToTable(L, -1, lArrow);
	Result := 1;
end;

end.
