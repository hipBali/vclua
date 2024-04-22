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
    end;
var
    CustomMaskEditFuncs: TLuaVmt;
    CustomMaskEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaEvent;

function VCLua_MaskEdit_Clear(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
begin
	CheckArg(L, 1);
	lMaskEdit := TLuaMaskEdit(GetLuaObject(L, 1));
	try
		lMaskEdit.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MaskEdit', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_MaskEdit_ValidateEdit(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
begin
	CheckArg(L, 1);
	lMaskEdit := TLuaMaskEdit(GetLuaObject(L, 1));
	try
		lMaskEdit.ValidateEdit();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MaskEdit', 'ValidateEdit', E.ClassName, E.Message);
	end;
end;

function VCLua_MaskEdit_VCLuaSetEnableSets(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	val:Boolean;
begin
	lMaskEdit := TLuaMaskEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lMaskEdit.EnableSets := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MaskEdit', 'SetEnableSets', E.ClassName, E.Message);
	end;
end;

function VCLua_MaskEdit_VCLuaGetEnableSets(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	ret:Boolean;
begin
	lMaskEdit := TLuaMaskEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMaskEdit.EnableSets;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MaskEdit', 'GetEnableSets', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MaskEdit_VCLuaSetModified(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	val:Boolean;
begin
	lMaskEdit := TLuaMaskEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lMaskEdit.Modified := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'MaskEdit', 'SetModified', E.ClassName, E.Message);
	end;
end;

function VCLua_MaskEdit_VCLuaGetModified(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	ret:Boolean;
begin
	lMaskEdit := TLuaMaskEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMaskEdit.Modified;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'MaskEdit', 'GetModified', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_MaskEdit_VCLuaSetOnValidationError(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
begin
	lMaskEdit := TLuaMaskEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lMaskEdit.OnValidationError));
	lMaskEdit.OnValidationError := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TMaskEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomMaskEdit',v);
end;
function CreateMaskEdit(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lMaskEdit := TLuaMaskEdit.Create(Parent);
	lMaskEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomMaskEdit',lMaskEdit);
	InitControl(L,lMaskEdit,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'MaskEdit', E.ClassName, E.Message);
	end;
end;

begin
	CustomMaskEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomMaskEditFuncs, 'Clear', @VCLua_MaskEdit_Clear);
	TLuaMethodInfo.Create(CustomMaskEditFuncs, 'ValidateEdit', @VCLua_MaskEdit_ValidateEdit);
	TLuaMethodInfo.Create(CustomMaskEditFuncs, 'EnableSets', @VCLua_MaskEdit_VCLuaGetEnableSets, mfCall);
	TLuaMethodInfo.Create(CustomMaskEditFuncs, 'Modified', @VCLua_MaskEdit_VCLuaGetModified, mfCall);
	CustomMaskEditSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomMaskEditSets, 'EnableSets', @VCLua_MaskEdit_VCLuaSetEnableSets, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomMaskEditSets, 'Modified', @VCLua_MaskEdit_VCLuaSetModified, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomMaskEditSets, 'OnValidationError', @VCLua_MaskEdit_VCLuaSetOnValidationError, mfCall, TypeInfo(TNotifyEvent));
end.
