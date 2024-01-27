(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFileNameEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls;

function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
procedure FileNameEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFileNameEdit = class(TFileNameEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure FileNameEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
var
	lFileNameEdit:TLuaFileNameEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lFileNameEdit := TLuaFileNameEdit.Create(Parent);
	lFileNameEdit.Parent := TWinControl(Parent);
	lFileNameEdit.LuaCtl := TVCLuaControl.Create(lFileNameEdit as TComponent,L,@FileNameEditToTable);
	InitControl(L,lFileNameEdit,Name);
	FileNameEditToTable(L, -1, lFileNameEdit);
	Result := 1;
end;

end.
