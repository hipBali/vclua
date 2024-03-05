(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaEditButton;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, EditBtn, TypInfo, LuaVmt;

function CreateEditButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TEditButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaEditButton = class(TEditButton)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomEditButtonFuncs: TLuaVmt;
    CustomEditButtonSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TEditButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateEditButton(L: Plua_State): Integer; cdecl;
var
	lEditButton:TLuaEditButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lEditButton := TLuaEditButton.Create(Parent);
	lEditButton.Parent := TWinControl(Parent);
	lEditButton.LuaCtl := TVCLuaControl.Create(lEditButton as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lEditButton,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lEditButton);
	Result := 1;
end;

begin
	CustomEditButtonFuncs := TLuaVmt.Create;
	
	CustomEditButtonSets := TLuaVmt.Create;
	
end.
