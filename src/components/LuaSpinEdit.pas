(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpinEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Spin, Controls, TypInfo;

function CreateSpinEdit(L: Plua_State): Integer; cdecl;
function IsSpinEdit(L: Plua_State): Integer; cdecl;
function AsSpinEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpinEdit; pti: PTypeInfo = nil); overload; inline;
procedure SpinEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSpinEdit = class(TSpinEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


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
	SpinEditToTable(L,-1,v);
end;
procedure SpinEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lSpinEdit.LuaCtl := TVCLuaControl.Create(lSpinEdit as TComponent,L,@SpinEditToTable);
	InitControl(L,lSpinEdit,Name);
	SpinEditToTable(L, -1, lSpinEdit);
	Result := 1;
end;

end.
