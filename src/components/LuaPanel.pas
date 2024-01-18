(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaPanel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreatePanel(L: Plua_State): Integer; cdecl;
procedure PanelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPanel = class(TPanel)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure PanelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreatePanel(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPanel := TLuaPanel.Create(Parent);
	lPanel.Parent := TWinControl(Parent);
	lPanel.LuaCtl := TVCLuaControl.Create(TControl(lPanel),L,@PanelToTable);
	InitControl(L,lPanel,Name);
	PanelToTable(L, -1, lPanel);
	Result := 1;
end;

end.
