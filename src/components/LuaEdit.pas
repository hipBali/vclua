(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateEdit(L: Plua_State): Integer; cdecl;
procedure EditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaEdit = class(TEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Edit_Clear(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.Clear();
	
	Result := 0;
end;

function VCLua_Edit_SelectAll(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.SelectAll();
	
	Result := 0;
end;

function VCLua_Edit_ClearSelection(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.ClearSelection();
	
	Result := 0;
end;

function VCLua_Edit_CopyToClipboard(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.CopyToClipboard();
	
	Result := 0;
end;

function VCLua_Edit_CutToClipboard(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.CutToClipboard();
	
	Result := 0;
end;

function VCLua_Edit_PasteFromClipboard(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.PasteFromClipboard();
	
	Result := 0;
end;

function VCLua_Edit_Undo(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.Undo();
	
	Result := 0;
end;

function VCLua_Edit_RemoveAllHandlersOfObject(L: Plua_State): Integer; cdecl;
var 
	lEdit:TLuaEdit;
	AnObject:TObject;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	AnObject := TObject(GetLuaObject(L,2));
	lEdit.RemoveAllHandlersOfObject(AnObject);
	
	Result := 0;
end;

procedure EditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_Edit_Clear);
	LuaSetTableFunction(L, Index, 'SelectAll', @VCLua_Edit_SelectAll);
	LuaSetTableFunction(L, Index, 'ClearSelection', @VCLua_Edit_ClearSelection);
	LuaSetTableFunction(L, Index, 'CopyToClipboard', @VCLua_Edit_CopyToClipboard);
	LuaSetTableFunction(L, Index, 'CutToClipboard', @VCLua_Edit_CutToClipboard);
	LuaSetTableFunction(L, Index, 'PasteFromClipboard', @VCLua_Edit_PasteFromClipboard);
	LuaSetTableFunction(L, Index, 'Undo', @VCLua_Edit_Undo);
	LuaSetTableFunction(L, Index, 'RemoveAllHandlersOfObject', @VCLua_Edit_RemoveAllHandlersOfObject);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateEdit(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lEdit := TLuaEdit.Create(Parent);
	lEdit.Parent := TWinControl(Parent);
	lEdit.LuaCtl := TVCLuaControl.Create(lEdit as TComponent,L,@EditToTable);
	InitControl(L,lEdit,Name);
	EditToTable(L, -1, lEdit);
	Result := 1;
end;

end.
