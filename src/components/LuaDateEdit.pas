(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaDateEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls;

function CreateDateEdit(L: Plua_State): Integer; cdecl;
procedure DateEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDateEdit = class(TDateEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure DateEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateDateEdit(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lDateEdit := TLuaDateEdit.Create(Parent);
	lDateEdit.Parent := TWinControl(Parent);
	lDateEdit.LuaCtl := TVCLuaControl.Create(TControl(lDateEdit),L,@DateEditToTable);
	InitControl(L,lDateEdit,Name);
	DateEditToTable(L, -1, lDateEdit);
	Result := 1;
end;

end.
