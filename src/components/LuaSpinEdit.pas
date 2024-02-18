(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpinEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Spin, TypInfo;

function CreateSpinEdit(L: Plua_State): Integer; cdecl;
function IsSpinEdit(L: Plua_State): Integer; cdecl;
function AsSpinEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpinEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSpinEdit = class(TSpinEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    SpinEditFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsSpinEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TSpinEdit);
end;
function AsSpinEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TSpinEdit then
    lua_push(L, TSpinEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TSpinEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TSpinEdit',v);
end;
function CreateSpinEdit(L: Plua_State): Integer; cdecl;
var
	lSpinEdit:TLuaSpinEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lSpinEdit := TLuaSpinEdit.Create(Parent);
	lSpinEdit.Parent := TWinControl(Parent);
	lSpinEdit.LuaCtl := TVCLuaControl.Create(lSpinEdit as TComponent,L,nil,'TSpinEdit');
	InitControl(L,lSpinEdit,Name);
	CreateTableForKnownType(L,'TSpinEdit',lSpinEdit);
	Result := 1;
end;

begin
	SetLength(SpinEditFuncs, 0+1);
	
	SpinEditFuncs[0].name:=nil;
	SpinEditFuncs[0].func:=nil;

end.
