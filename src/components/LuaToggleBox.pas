(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToggleBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateToggleBox(L: Plua_State): Integer; cdecl;
procedure ToggleBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaToggleBox = class(TToggleBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure ToggleBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateToggleBox(L: Plua_State): Integer; cdecl;
var
	lToggleBox:TLuaToggleBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lToggleBox := TLuaToggleBox.Create(Parent);
	lToggleBox.Parent := TWinControl(Parent);
	lToggleBox.LuaCtl := TVCLuaControl.Create(lToggleBox as TComponent,L,@ToggleBoxToTable);
	InitControl(L,lToggleBox,Name);
	ToggleBoxToTable(L, -1, lToggleBox);
	Result := 1;
end;

end.
