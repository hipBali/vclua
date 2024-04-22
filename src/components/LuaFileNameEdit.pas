(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFileNameEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, EditBtn;

function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFileNameEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFileNameEdit = class(TFileNameEdit)
    end;
var
    FileNameEditFuncs: TLuaVmt;
    FileNameEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaStrings;

function VCLua_FileNameEdit_RunDialog(L: Plua_State): Integer; cdecl;
var
	lFileNameEdit:TLuaFileNameEdit;
begin
	CheckArg(L, 1);
	lFileNameEdit := TLuaFileNameEdit(GetLuaObject(L, 1));
	try
		lFileNameEdit.RunDialog();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FileNameEdit', 'RunDialog', E.ClassName, E.Message);
	end;
end;

function VCLua_FileNameEdit_VCLuaGetDialogFiles(L: Plua_State): Integer; cdecl;
var
	lFileNameEdit:TLuaFileNameEdit;
	ret:TStrings;
begin
	lFileNameEdit := TLuaFileNameEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFileNameEdit.DialogFiles;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FileNameEdit', 'GetDialogFiles', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TFileNameEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TFileNameEdit',v);
end;
function CreateFileNameEdit(L: Plua_State): Integer; cdecl;
var
	lFileNameEdit:TLuaFileNameEdit;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lFileNameEdit := TLuaFileNameEdit.Create(Parent);
	lFileNameEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TFileNameEdit',lFileNameEdit);
	InitControl(L,lFileNameEdit,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'FileNameEdit', E.ClassName, E.Message);
	end;
end;

begin
	FileNameEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FileNameEditFuncs, 'RunDialog', @VCLua_FileNameEdit_RunDialog);
	TLuaMethodInfo.Create(FileNameEditFuncs, 'DialogFiles', @VCLua_FileNameEdit_VCLuaGetDialogFiles, mfCall);
	FileNameEditSets := TLuaVmt.Create;
	
end.
