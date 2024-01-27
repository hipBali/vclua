(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
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
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure ArrowToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lArrow.LuaCtl := TVCLuaControl.Create(lArrow as TComponent,L,@ArrowToTable);
	InitControl(L,lArrow,Name);
	ArrowToTable(L, -1, lArrow);
	Result := 1;
end;

end.
