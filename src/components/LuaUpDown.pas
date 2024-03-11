(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaUpDown;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

function CreateUpDown(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TUpDown; pti: PTypeInfo = nil); overload; inline;

type
    TLuaUpDown = class(TUpDown)
        LuaCtl: TVCLuaControl;
    end;
var
    UpDownFuncs: TLuaVmt;
    UpDownSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


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
	CreateTableForKnownType(L,'TUpDown',lUpDown);
	InitControl(L,lUpDown,Name);
	Result := 1;
end;

begin
	UpDownFuncs := TLuaVmt.Create;
	
	UpDownSets := TLuaVmt.Create;
	
end.
