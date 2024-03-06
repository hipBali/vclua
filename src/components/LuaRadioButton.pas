(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRadioButton;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateRadioButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TRadioButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaRadioButton = class(TRadioButton)
        LuaCtl: TVCLuaControl;
    end;
var
    RadioButtonFuncs: TLuaVmt;
    RadioButtonSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TRadioButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TRadioButton',v);
end;
function CreateRadioButton(L: Plua_State): Integer; cdecl;
var
	lRadioButton:TLuaRadioButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lRadioButton := TLuaRadioButton.Create(Parent);
	lRadioButton.Parent := TWinControl(Parent);
	lRadioButton.LuaCtl := TVCLuaControl.Create(lRadioButton as TComponent,L,nil,'TRadioButton');
	CreateTableForKnownType(L,'TRadioButton',lRadioButton);
	InitControl(L,lRadioButton,Name);
	Result := 1;
end;

begin
	RadioButtonFuncs := TLuaVmt.Create;
	
	RadioButtonSets := TLuaVmt.Create;
	
end.
