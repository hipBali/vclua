(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaUpDown;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateUpDown(L: Plua_State): Integer; cdecl;
function IsUpDown(L: Plua_State): Integer; cdecl;
function AsUpDown(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TUpDown; pti: PTypeInfo = nil); overload; inline;

type
    TLuaUpDown = class(TUpDown)
        LuaCtl: TVCLuaControl;
    end;
var
    UpDownFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;


function IsUpDown(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TUpDown);
end;
function AsUpDown(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TUpDown then
    lua_push(L, TUpDown(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TUpDown; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TUpDown',v);
end;
function CreateUpDown(L: Plua_State): Integer; cdecl;
var
	lUpDown:TLuaUpDown;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lUpDown := TLuaUpDown.Create(Parent);
	lUpDown.Parent := TWinControl(Parent);
	lUpDown.LuaCtl := TVCLuaControl.Create(lUpDown as TComponent,L,nil,'TUpDown');
	InitControl(L,lUpDown,Name);
	CreateTableForKnownType(L,'TUpDown',lUpDown);
	Result := 1;
end;

begin
	SetLength(UpDownFuncs, 0+1);
	
	UpDownFuncs[0].name:=nil;
	UpDownFuncs[0].func:=nil;

end.
