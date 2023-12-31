(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaDirectoryEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls;

function CreateDirectoryEdit(L: Plua_State): Integer; cdecl;
procedure DirectoryEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDirectoryEdit = class(TDirectoryEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure DirectoryEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateDirectoryEdit(L: Plua_State): Integer; cdecl;
var
	lDirectoryEdit:TLuaDirectoryEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lDirectoryEdit := TLuaDirectoryEdit.Create(Parent);
	lDirectoryEdit.Parent := TWinControl(Parent);
	lDirectoryEdit.LuaCtl := TVCLuaControl.Create(TControl(lDirectoryEdit),L,@DirectoryEditToTable);
	InitControl(L,lDirectoryEdit,Name);
	DirectoryEditToTable(L, -1, lDirectoryEdit);
	Result := 1;
end;

end.
