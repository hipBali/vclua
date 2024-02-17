(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBevel;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateBevel(L: Plua_State): Integer; cdecl;
function IsBevel(L: Plua_State): Integer; cdecl;
function AsBevel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBevel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBevel = class(TBevel)
        LuaCtl: TVCLuaControl;
    end;
var
    BevelFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

function VCLua_Bevel_Assign(L: Plua_State): Integer; cdecl;
var
	lBevel:TLuaBevel;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lBevel := TLuaBevel(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lBevel.Assign(Source);
	except
		on E: Exception do
			CallError(L, 'Bevel', 'Assign', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function IsBevel(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TBevel);
end;
function AsBevel(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TBevel then
    lua_push(L, TBevel(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TBevel; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBevel',v);
end;
function CreateBevel(L: Plua_State): Integer; cdecl;
var
	lBevel:TLuaBevel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBevel := TLuaBevel.Create(Parent);
	lBevel.Parent := TWinControl(Parent);
	lBevel.LuaCtl := TVCLuaControl.Create(lBevel as TComponent,L,nil,'TBevel');
	InitControl(L,lBevel,Name);
	CreateTableForKnownType(L,'TBevel',lBevel);
	Result := 1;
end;

begin
	SetLength(BevelFuncs, 1+1);
	BevelFuncs[0].name:='Assign';
	BevelFuncs[0].func:=@VCLua_Bevel_Assign;
	BevelFuncs[1].name:=nil;
	BevelFuncs[1].func:=nil;

end.
