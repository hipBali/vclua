(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateEdit(L: Plua_State): Integer; cdecl;
function IsEdit(L: Plua_State): Integer; cdecl;
function AsEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaEdit = class(TEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomEditFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_Edit_Clear(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_SelectAll(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.SelectAll();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelectAll', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_ClearSelection(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.ClearSelection();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'ClearSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_CopyToClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.CopyToClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CopyToClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_CutToClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.CutToClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CutToClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_PasteFromClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.PasteFromClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'PasteFromClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_Undo(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.Undo();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Undo', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_RemoveAllHandlersOfObject(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	AnObject:TObject;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@AnObject);
	try
		lEdit.RemoveAllHandlersOfObject(AnObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'RemoveAllHandlersOfObject', E.ClassName, E.Message);
	end;
end;

function IsEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TEdit);
end;
function AsEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TEdit then
    lua_push(L, TEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEdit',v);
end;
function CreateEdit(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lEdit := TLuaEdit.Create(Parent);
	lEdit.Parent := TWinControl(Parent);
	lEdit.LuaCtl := TVCLuaControl.Create(lEdit as TComponent,L,nil,'TCustomEdit');
	InitControl(L,lEdit,Name);
	CreateTableForKnownType(L,'TCustomEdit',lEdit);
	Result := 1;
end;

begin
	CustomEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomEditFuncs, 'Clear', @VCLua_Edit_Clear);
	TLuaMethodInfo.Create(CustomEditFuncs, 'SelectAll', @VCLua_Edit_SelectAll);
	TLuaMethodInfo.Create(CustomEditFuncs, 'ClearSelection', @VCLua_Edit_ClearSelection);
	TLuaMethodInfo.Create(CustomEditFuncs, 'CopyToClipboard', @VCLua_Edit_CopyToClipboard);
	TLuaMethodInfo.Create(CustomEditFuncs, 'CutToClipboard', @VCLua_Edit_CutToClipboard);
	TLuaMethodInfo.Create(CustomEditFuncs, 'PasteFromClipboard', @VCLua_Edit_PasteFromClipboard);
	TLuaMethodInfo.Create(CustomEditFuncs, 'Undo', @VCLua_Edit_Undo);
	TLuaMethodInfo.Create(CustomEditFuncs, 'RemoveAllHandlersOfObject', @VCLua_Edit_RemoveAllHandlersOfObject);
end.
