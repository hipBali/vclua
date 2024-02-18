(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCalcEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, EditBtn, TypInfo;

function CreateCalcEdit(L: Plua_State): Integer; cdecl;
function IsCalcEdit(L: Plua_State): Integer; cdecl;
function AsCalcEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCalcEdit = class(TCalcEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsCalcEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCalcEdit);
end;
function AsCalcEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCalcEdit then
    lua_push(L, TCalcEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateCalcEdit(L: Plua_State): Integer; cdecl;
var
	lCalcEdit:TLuaCalcEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCalcEdit := TLuaCalcEdit.Create(Parent);
	lCalcEdit.Parent := TWinControl(Parent);
	lCalcEdit.LuaCtl := TVCLuaControl.Create(lCalcEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lCalcEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lCalcEdit);
	Result := 1;
end;

begin
end.
