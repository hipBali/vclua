(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorListBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ColorBox;

function CreateColorListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorListBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorListBox = class(TColorListBox)
        LuaCtl: TVCLuaControl;
    end;
var
    ColorListBoxFuncs: TLuaVmt;
    ColorListBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TColorListBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TColorListBox',v);
end;
function CreateColorListBox(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lColorListBox := TLuaColorListBox.Create(Parent);
	lColorListBox.Parent := TWinControl(Parent);
	lColorListBox.LuaCtl := TVCLuaControl.Create(lColorListBox as TComponent,L,nil,'TColorListBox');
	CreateTableForKnownType(L,'TColorListBox',lColorListBox);
	InitControl(L,lColorListBox,Name);
	Result := 1;
end;

begin
	ColorListBoxFuncs := TLuaVmt.Create;
	
	ColorListBoxSets := TLuaVmt.Create;
	
end.
