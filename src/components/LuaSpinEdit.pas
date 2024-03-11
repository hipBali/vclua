(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpinEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Spin;

function CreateSpinEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpinEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSpinEdit = class(TSpinEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    SpinEditFuncs: TLuaVmt;
    SpinEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TSpinEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TSpinEdit',v);
end;
function CreateSpinEdit(L: Plua_State): Integer; cdecl;
var
	lSpinEdit:TLuaSpinEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lSpinEdit := TLuaSpinEdit.Create(Parent);
	lSpinEdit.Parent := TWinControl(Parent);
	lSpinEdit.LuaCtl := TVCLuaControl.Create(lSpinEdit as TComponent,L,nil,'TSpinEdit');
	CreateTableForKnownType(L,'TSpinEdit',lSpinEdit);
	InitControl(L,lSpinEdit,Name);
	Result := 1;
end;

begin
	SpinEditFuncs := TLuaVmt.Create;
	
	SpinEditSets := TLuaVmt.Create;
	
end.
