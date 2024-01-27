(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGroupBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateGroupBox(L: Plua_State): Integer; cdecl;
procedure GroupBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaGroupBox = class(TGroupBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure GroupBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateGroupBox(L: Plua_State): Integer; cdecl;
var
	lGroupBox:TLuaGroupBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lGroupBox := TLuaGroupBox.Create(Parent);
	lGroupBox.Parent := TWinControl(Parent);
	lGroupBox.LuaCtl := TVCLuaControl.Create(lGroupBox as TComponent,L,@GroupBoxToTable);
	InitControl(L,lGroupBox,Name);
	GroupBoxToTable(L, -1, lGroupBox);
	Result := 1;
end;

end.
