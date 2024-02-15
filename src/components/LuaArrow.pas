(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaArrow;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Arrow, Controls, TypInfo;

function CreateArrow(L: Plua_State): Integer; cdecl;
function IsArrow(L: Plua_State): Integer; cdecl;
function AsArrow(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TArrow; pti: PTypeInfo = nil); overload; inline;

type
    TLuaArrow = class(TArrow)
        LuaCtl: TVCLuaControl;
    end;
var
    ArrowFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;


function IsArrow(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TArrow);
end;
function AsArrow(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TArrow then
    lua_push(L, TArrow(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TArrow; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TArrow',v);
end;
function CreateArrow(L: Plua_State): Integer; cdecl;
var
	lArrow:TLuaArrow;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lArrow := TLuaArrow.Create(Parent);
	lArrow.Parent := TWinControl(Parent);
	lArrow.LuaCtl := TVCLuaControl.Create(lArrow as TComponent,L,nil,'TArrow');
	InitControl(L,lArrow,Name);
	CreateTableForKnownType(L,'TArrow',lArrow);
	Result := 1;
end;

begin
	SetLength(ArrowFuncs, 0+1);
	
	ArrowFuncs[0].name:=nil;
	ArrowFuncs[0].func:=nil;

end.
