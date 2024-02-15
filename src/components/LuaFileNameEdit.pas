(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFileNameEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls, TypInfo;

function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
function IsFileNameEdit(L: Plua_State): Integer; cdecl;
function AsFileNameEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFileNameEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFileNameEdit = class(TFileNameEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;


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
	CreateTableForKnownType(L,'TCustomEditButton',v);
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
	lFileNameEdit.LuaCtl := TVCLuaControl.Create(lFileNameEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lFileNameEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lFileNameEdit);
	Result := 1;
end;

begin
end.
