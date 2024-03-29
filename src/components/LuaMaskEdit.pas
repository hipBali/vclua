(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMaskEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, MaskEdit;

function CreateMaskEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMaskEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMaskEdit = class(TMaskEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    MaskEditFuncs: TLuaVmt;
    MaskEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TMaskEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TMaskEdit',v);
end;
function CreateMaskEdit(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMaskEdit := TLuaMaskEdit.Create(Parent);
	lMaskEdit.Parent := TWinControl(Parent);
	lMaskEdit.LuaCtl := TVCLuaControl.Create(lMaskEdit as TComponent,L,nil,'TMaskEdit');
	CreateTableForKnownType(L,'TMaskEdit',lMaskEdit);
	InitControl(L,lMaskEdit,Name);
	Result := 1;
end;

begin
	MaskEditFuncs := TLuaVmt.Create;
	
	MaskEditSets := TLuaVmt.Create;
	
end.
