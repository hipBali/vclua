(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaLabeledEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateLabeledEdit(L: Plua_State): Integer; cdecl;
function IsLabeledEdit(L: Plua_State): Integer; cdecl;
function AsLabeledEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TLabeledEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaLabeledEdit = class(TLabeledEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomLabeledEditFuncs: TLuaVmt;
    CustomLabeledEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LuaBoundLabel;

function VCLua_LabeledEdit_VCLuaGetEditLabel(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	ret:TBoundLabel;
begin
	CheckArg(L, 1);
	lLabeledEdit := TLuaLabeledEdit(GetLuaObject(L, 1));
	try
		ret := lLabeledEdit.EditLabel;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'LabeledEdit', 'EditLabel', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_LabeledEdit_VCLuaSetLabelPosition(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	val:TLabelPosition;
begin
	CheckArg(L, 2);
	lLabeledEdit := TLuaLabeledEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TLabelPosition));
	try
		lLabeledEdit.LabelPosition := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'LabeledEdit', 'LabelPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_LabeledEdit_VCLuaGetLabelPosition(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	ret:TLabelPosition;
begin
	CheckArg(L, 1);
	lLabeledEdit := TLuaLabeledEdit(GetLuaObject(L, 1));
	try
		ret := lLabeledEdit.LabelPosition;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'LabeledEdit', 'LabelPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_LabeledEdit_VCLuaSetLabelSpacing(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	val:Integer;
begin
	CheckArg(L, 2);
	lLabeledEdit := TLuaLabeledEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lLabeledEdit.LabelSpacing := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'LabeledEdit', 'LabelSpacing', E.ClassName, E.Message);
	end;
end;

function VCLua_LabeledEdit_VCLuaGetLabelSpacing(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	ret:Integer;
begin
	CheckArg(L, 1);
	lLabeledEdit := TLuaLabeledEdit(GetLuaObject(L, 1));
	try
		ret := lLabeledEdit.LabelSpacing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'LabeledEdit', 'LabelSpacing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function IsLabeledEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TLabeledEdit);
end;
function AsLabeledEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TLabeledEdit then
    lua_push(L, TLabeledEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TLabeledEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomLabeledEdit',v);
end;
function CreateLabeledEdit(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lLabeledEdit := TLuaLabeledEdit.Create(Parent);
	lLabeledEdit.Parent := TWinControl(Parent);
	lLabeledEdit.LuaCtl := TVCLuaControl.Create(lLabeledEdit as TComponent,L,nil,'TCustomLabeledEdit');
	InitControl(L,lLabeledEdit,Name);
	CreateTableForKnownType(L,'TCustomLabeledEdit',lLabeledEdit);
	Result := 1;
end;

begin
	CustomLabeledEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomLabeledEditFuncs, 'EditLabel', @VCLua_LabeledEdit_VCLuaGetEditLabel, mfCall);
	TLuaMethodInfo.Create(CustomLabeledEditFuncs, 'LabelPosition', @VCLua_LabeledEdit_VCLuaGetLabelPosition, mfCall);
	TLuaMethodInfo.Create(CustomLabeledEditFuncs, 'LabelSpacing', @VCLua_LabeledEdit_VCLuaGetLabelSpacing, mfCall);
	CustomLabeledEditSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomLabeledEditSets, 'LabelPosition', @VCLua_LabeledEdit_VCLuaSetLabelPosition, mfCall);
	TLuaMethodInfo.Create(CustomLabeledEditSets, 'LabelSpacing', @VCLua_LabeledEdit_VCLuaSetLabelSpacing, mfCall);
end.
