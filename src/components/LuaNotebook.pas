(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaNotebook;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateNotebook(L: Plua_State): Integer; cdecl;
function IsNotebook(L: Plua_State): Integer; cdecl;
function AsNotebook(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TNotebook; pti: PTypeInfo = nil); overload; inline;
procedure NotebookToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaNotebook = class(TNotebook)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,ret);
	
	Result := 1;
end;

function IsNotebook(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TNotebook);
end;
function AsNotebook(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TNotebook then
    lua_push(L, TNotebook(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TNotebook; pti: PTypeInfo);
begin
	NotebookToTable(L,-1,v);
end;
procedure NotebookToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lNotebook.LuaCtl := TVCLuaControl.Create(lNotebook as TComponent,L,@NotebookToTable);
	InitControl(L,lNotebook,Name);
	NotebookToTable(L, -1, lNotebook);
	Result := 1;
end;

end.
