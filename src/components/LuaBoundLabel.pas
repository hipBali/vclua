(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaBoundLabel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreateBoundLabel(L: Plua_State): Integer; cdecl;
procedure BoundLabelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBoundLabel = class(TBoundLabel)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure BoundLabelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateBoundLabel(L: Plua_State): Integer; cdecl;
var
	lBoundLabel:TLuaBoundLabel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBoundLabel := TLuaBoundLabel.Create(Parent);
	lBoundLabel.Parent := TWinControl(Parent);
	lBoundLabel.LuaCtl := TVCLuaControl.Create(TControl(lBoundLabel),L,@BoundLabelToTable);
	InitControl(L,lBoundLabel,Name);
	BoundLabelToTable(L, -1, lBoundLabel);
	Result := 1;
end;

end.
