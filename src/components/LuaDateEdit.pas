(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDateEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, EditBtn, TypInfo;

function CreateDateEdit(L: Plua_State): Integer; cdecl;
function IsDateEdit(L: Plua_State): Integer; cdecl;
function AsDateEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDateEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDateEdit = class(TDateEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsDateEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TDateEdit);
end;
function AsDateEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TDateEdit then
    lua_push(L, TDateEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TDateEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
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
	lDateEdit.LuaCtl := TVCLuaControl.Create(lDateEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lDateEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lDateEdit);
	Result := 1;
end;

begin
end.
