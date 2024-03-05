(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCalcEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, EditBtn, TypInfo, LuaVmt;

function CreateCalcEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCalcEdit = class(TCalcEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateCalcEdit(L: Plua_State): Integer; cdecl;
var
	lCalcEdit:TLuaCalcEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCalcEdit := TLuaCalcEdit.Create(Parent);
	lCalcEdit.Parent := TWinControl(Parent);
	lCalcEdit.LuaCtl := TVCLuaControl.Create(lCalcEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lCalcEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lCalcEdit);
	Result := 1;
end;

begin
end.
