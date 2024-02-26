(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGroupBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateGroupBox(L: Plua_State): Integer; cdecl;
function IsGroupBox(L: Plua_State): Integer; cdecl;
function AsGroupBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGroupBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGroupBox = class(TGroupBox)
        LuaCtl: TVCLuaControl;
    end;
var
    GroupBoxFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsGroupBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TGroupBox);
end;
function AsGroupBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TGroupBox then
    lua_push(L, TGroupBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TGroupBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TGroupBox',v);
end;
function CreateGroupBox(L: Plua_State): Integer; cdecl;
var
	lGroupBox:TLuaGroupBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lGroupBox := TLuaGroupBox.Create(Parent);
	lGroupBox.Parent := TWinControl(Parent);
	lGroupBox.LuaCtl := TVCLuaControl.Create(lGroupBox as TComponent,L,nil,'TGroupBox');
	InitControl(L,lGroupBox,Name);
	CreateTableForKnownType(L,'TGroupBox',lGroupBox);
	Result := 1;
end;

begin
	GroupBoxFuncs := TLuaVmt.Create;
	
end.
