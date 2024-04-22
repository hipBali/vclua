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
    end;
var
    DirectoryEditFuncs: TLuaVmt;
    DirectoryEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_DirectoryEdit_RunDialog(L: Plua_State): Integer; cdecl;
var
	lDirectoryEdit:TLuaDirectoryEdit;
begin
	CheckArg(L, 1);
	lDirectoryEdit := TLuaDirectoryEdit(GetLuaObject(L, 1));
	try
		lDirectoryEdit.RunDialog();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DirectoryEdit', 'RunDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TDirectoryEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDirectoryEdit',v);
end;
function CreateDirectoryEdit(L: Plua_State): Integer; cdecl;
var
	lDirectoryEdit:TLuaDirectoryEdit;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lDirectoryEdit := TLuaDirectoryEdit.Create(Parent);
	lDirectoryEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TDirectoryEdit',lDirectoryEdit);
	InitControl(L,lDirectoryEdit,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'DirectoryEdit', E.ClassName, E.Message);
	end;
end;

begin
	DirectoryEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(DirectoryEditFuncs, 'RunDialog', @VCLua_DirectoryEdit_RunDialog);
	DirectoryEditSets := TLuaVmt.Create;
	
end.
