(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaArrow;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Arrow;

function CreateArrow(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TArrow; pti: PTypeInfo = nil); overload; inline;

type
    TLuaArrow = class(TArrow)
        LuaCtl: TVCLuaControl;
    end;
var
    ArrowFuncs: TLuaVmt;
    ArrowSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


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
	CreateTableForKnownType(L,'TArrow',lArrow);
	InitControl(L,lArrow,Name);
	Result := 1;
end;

begin
	ArrowFuncs := TLuaVmt.Create;
	
	ArrowSets := TLuaVmt.Create;
	
end.
