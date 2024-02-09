(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMaskEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, MaskEdit, Controls, TypInfo;

function CreateMaskEdit(L: Plua_State): Integer; cdecl;
function IsMaskEdit(L: Plua_State): Integer; cdecl;
function AsMaskEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMaskEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMaskEdit = class(TMaskEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    MaskEditFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsMaskEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TMaskEdit);
end;
function AsMaskEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TMaskEdit then
    lua_push(L, TMaskEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TMaskEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TMaskEdit',v);
end;
function CreateMaskEdit(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMaskEdit := TLuaMaskEdit.Create(Parent);
	lMaskEdit.Parent := TWinControl(Parent);
	lMaskEdit.LuaCtl := TVCLuaControl.Create(lMaskEdit as TComponent,L,nil,'TMaskEdit');
	InitControl(L,lMaskEdit,Name);
	CreateTableForKnownType(L,'TMaskEdit',lMaskEdit);
	Result := 1;
end;

begin
	SetLength(MaskEditFuncs, 0+1);
	
	MaskEditFuncs[0].name:=nil;
	MaskEditFuncs[0].func:=nil;

end.
