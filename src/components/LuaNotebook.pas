(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaNotebook;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreateNotebook(L: Plua_State): Integer; cdecl;
procedure NotebookToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaNotebook = class(TNotebook)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_Notebook_ShowControl(L: Plua_State): Integer; cdecl;
var 
	lNotebook:TLuaNotebook;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lNotebook := TLuaNotebook(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	lNotebook.ShowControl(AControl);
	
	Result := 0;
end;

function VCLua_Notebook_IndexOf(L: Plua_State): Integer; cdecl;
var 
	lNotebook:TLuaNotebook;
	APage:TPage;
	ret:integer;
begin
	CheckArg(L, 2);
	lNotebook := TLuaNotebook(GetLuaObject(L, 1));
	APage := TPage(GetLuaObject(L,2));
	ret := lNotebook.IndexOf(APage);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

procedure NotebookToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'ShowControl', @VCLua_Notebook_ShowControl);
	LuaSetTableFunction(L, Index, 'IndexOf', @VCLua_Notebook_IndexOf);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateNotebook(L: Plua_State): Integer; cdecl;
var
	lNotebook:TLuaNotebook;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lNotebook := TLuaNotebook.Create(Parent);
	lNotebook.Parent := TWinControl(Parent);
	lNotebook.LuaCtl := TVCLuaControl.Create(TControl(lNotebook),L,@NotebookToTable);
	InitControl(L,lNotebook,Name);
	NotebookToTable(L, -1, lNotebook);
	Result := 1;
end;

end.
