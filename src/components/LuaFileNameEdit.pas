(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFileNameEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls, TypInfo;

function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
function IsFileNameEdit(L: Plua_State): Integer; cdecl;
function AsFileNameEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFileNameEdit; pti: PTypeInfo = nil); overload; inline;
procedure FileNameEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFileNameEdit = class(TFileNameEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsFileNameEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TFileNameEdit);
end;
function AsFileNameEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TFileNameEdit then
    lua_push(L, TFileNameEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TFileNameEdit; pti: PTypeInfo);
begin
	FileNameEditToTable(L,-1,v);
end;
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
