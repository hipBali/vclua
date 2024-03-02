(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFileNameEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, EditBtn, TypInfo, LuaVmt;

function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFileNameEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFileNameEdit = class(TFileNameEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


procedure lua_push(L: Plua_State; const v: TFileNameEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
var
	lFileNameEdit:TLuaFileNameEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lFileNameEdit := TLuaFileNameEdit.Create(Parent);
	lFileNameEdit.Parent := TWinControl(Parent);
	lFileNameEdit.LuaCtl := TVCLuaControl.Create(lFileNameEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lFileNameEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lFileNameEdit);
	Result := 1;
end;

begin
end.
