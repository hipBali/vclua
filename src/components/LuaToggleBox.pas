(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToggleBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateToggleBox(L: Plua_State): Integer; cdecl;
function IsToggleBox(L: Plua_State): Integer; cdecl;
function AsToggleBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToggleBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaToggleBox = class(TToggleBox)
        LuaCtl: TVCLuaControl;
    end;
var
    ToggleBoxFuncs: TLuaVmt;
    ToggleBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsToggleBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TToggleBox);
end;
function AsToggleBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TToggleBox then
    lua_push(L, TToggleBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TToggleBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TToggleBox',v);
end;
function CreateToggleBox(L: Plua_State): Integer; cdecl;
var
	lToggleBox:TLuaToggleBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lToggleBox := TLuaToggleBox.Create(Parent);
	lToggleBox.Parent := TWinControl(Parent);
	lToggleBox.LuaCtl := TVCLuaControl.Create(lToggleBox as TComponent,L,nil,'TToggleBox');
	InitControl(L,lToggleBox,Name);
	CreateTableForKnownType(L,'TToggleBox',lToggleBox);
	Result := 1;
end;

begin
	ToggleBoxFuncs := TLuaVmt.Create;
	
	ToggleBoxSets := TLuaVmt.Create;
	
end.
