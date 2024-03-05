(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToggleBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateToggleBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TToggleBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaToggleBox = class(TToggleBox)
        LuaCtl: TVCLuaControl;
    end;
var
    ToggleBoxFuncs: TLuaVmt;
    ToggleBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


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
