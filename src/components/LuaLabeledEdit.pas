(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaLabeledEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateLabeledEdit(L: Plua_State): Integer; cdecl;
function IsLabeledEdit(L: Plua_State): Integer; cdecl;
function AsLabeledEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TLabeledEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaLabeledEdit = class(TLabeledEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomLabeledEditFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsLabeledEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TLabeledEdit);
end;
function AsLabeledEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TLabeledEdit then
    lua_push(L, TLabeledEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TLabeledEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomLabeledEdit',v);
end;
function CreateLabeledEdit(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lLabeledEdit := TLuaLabeledEdit.Create(Parent);
	lLabeledEdit.Parent := TWinControl(Parent);
	lLabeledEdit.LuaCtl := TVCLuaControl.Create(lLabeledEdit as TComponent,L,nil,'TCustomLabeledEdit');
	InitControl(L,lLabeledEdit,Name);
	CreateTableForKnownType(L,'TCustomLabeledEdit',lLabeledEdit);
	Result := 1;
end;

begin
	CustomLabeledEditFuncs := TLuaVmt.Create;
	
end.
