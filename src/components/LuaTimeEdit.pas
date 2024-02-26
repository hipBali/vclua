(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTimeEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, EditBtn, TypInfo, LuaVmt;

function CreateTimeEdit(L: Plua_State): Integer; cdecl;
function IsTimeEdit(L: Plua_State): Integer; cdecl;
function AsTimeEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTimeEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTimeEdit = class(TTimeEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsTimeEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTimeEdit);
end;
function AsTimeEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTimeEdit then
    lua_push(L, TTimeEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTimeEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateTimeEdit(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTimeEdit := TLuaTimeEdit.Create(Parent);
	lTimeEdit.Parent := TWinControl(Parent);
	lTimeEdit.LuaCtl := TVCLuaControl.Create(lTimeEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lTimeEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lTimeEdit);
	Result := 1;
end;

begin
end.
