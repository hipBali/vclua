(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDirectoryEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls, TypInfo;

function CreateDirectoryEdit(L: Plua_State): Integer; cdecl;
function IsDirectoryEdit(L: Plua_State): Integer; cdecl;
function AsDirectoryEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDirectoryEdit; pti: PTypeInfo = nil); overload; inline;
procedure DirectoryEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDirectoryEdit = class(TDirectoryEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsDirectoryEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TDirectoryEdit);
end;
function AsDirectoryEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TDirectoryEdit then
    lua_push(L, TDirectoryEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TDirectoryEdit; pti: PTypeInfo);
begin
	DirectoryEditToTable(L,-1,v);
end;
procedure DirectoryEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomEditButton');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lDirectoryEdit.LuaCtl := TVCLuaControl.Create(lDirectoryEdit as TComponent,L,@DirectoryEditToTable);
	InitControl(L,lDirectoryEdit,Name);
	DirectoryEditToTable(L, -1, lDirectoryEdit);
	Result := 1;
end;

begin
end.
