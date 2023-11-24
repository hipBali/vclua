(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaStaticText;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateStaticText(L: Plua_State): Integer; cdecl;
procedure StaticTextToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStaticText = class(TStaticText)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure StaticTextToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateStaticText(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lStaticText := TLuaStaticText.Create(Parent);
	lStaticText.Parent := TWinControl(Parent);
	lStaticText.LuaCtl := TVCLuaControl.Create(TControl(lStaticText),L,@StaticTextToTable);
	InitControl(L,lStaticText,Name);
	StaticTextToTable(L, -1, lStaticText);
	Result := 1;
end;

end.
