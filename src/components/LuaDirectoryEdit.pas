(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDirectoryEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, EditBtn;

function CreateDirectoryEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDirectoryEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDirectoryEdit = class(TDirectoryEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TDirectoryEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateDirectoryEdit(L: Plua_State): Integer; cdecl;
var
	lDirectoryEdit:TLuaDirectoryEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lDirectoryEdit := TLuaDirectoryEdit.Create(Parent);
	lDirectoryEdit.Parent := TWinControl(Parent);
	lDirectoryEdit.LuaCtl := TVCLuaControl.Create(lDirectoryEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lDirectoryEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lDirectoryEdit);
	Result := 1;
end;

begin
end.
