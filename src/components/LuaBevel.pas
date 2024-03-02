(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBevel;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateBevel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBevel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBevel = class(TBevel)
        LuaCtl: TVCLuaControl;
    end;
var
    BevelFuncs: TLuaVmt;
    BevelSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Bevel', 'Assign', E.ClassName, E.Message);
	end;
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
	BevelFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(BevelFuncs, 'Assign', @VCLua_Bevel_Assign);
	BevelSets := TLuaVmt.Create;
	
end.
