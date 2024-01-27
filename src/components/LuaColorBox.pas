(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ColorBox, Controls;

function CreateColorBox(L: Plua_State): Integer; cdecl;
procedure ColorBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorBox = class(TColorBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure ColorBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateColorBox(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lColorBox := TLuaColorBox.Create(Parent);
	lColorBox.Parent := TWinControl(Parent);
	lColorBox.LuaCtl := TVCLuaControl.Create(lColorBox as TComponent,L,@ColorBoxToTable);
	InitControl(L,lColorBox,Name);
	ColorBoxToTable(L, -1, lColorBox);
	Result := 1;
end;

end.
