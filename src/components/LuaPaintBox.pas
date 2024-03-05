(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPaintBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreatePaintBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPaintBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPaintBox = class(TPaintBox)
        LuaCtl: TVCLuaControl;
    end;
var
    PaintBoxFuncs: TLuaVmt;
    PaintBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TPaintBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPaintBox',v);
end;
function CreatePaintBox(L: Plua_State): Integer; cdecl;
var
	lPaintBox:TLuaPaintBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPaintBox := TLuaPaintBox.Create(Parent);
	lPaintBox.Parent := TWinControl(Parent);
	lPaintBox.LuaCtl := TVCLuaControl.Create(lPaintBox as TComponent,L,nil,'TPaintBox');
	InitControl(L,lPaintBox,Name);
	CreateTableForKnownType(L,'TPaintBox',lPaintBox);
	Result := 1;
end;

begin
	PaintBoxFuncs := TLuaVmt.Create;
	
	PaintBoxSets := TLuaVmt.Create;
	
end.
