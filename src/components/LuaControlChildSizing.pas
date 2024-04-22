(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaControlChildSizing;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Controls;

function CreateControlChildSizing(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TControlChildSizing; pti: PTypeInfo = nil); overload; inline;

type
    TLuaControlChildSizing = class(TControlChildSizing)
    end;
var
    ControlChildSizingFuncs: TLuaVmt;
    ControlChildSizingSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LuaClassesEvents, LuaEvent, LuaWinControl;

function VCLua_ControlChildSizing_AssignTo(L: Plua_State): Integer; cdecl;
var
	lControlChildSizing:TLuaControlChildSizing;
	Dest:TPersistent;
begin
	CheckArg(L, 2);
	lControlChildSizing := TLuaControlChildSizing(GetLuaObject(L, 1));
	luaL_check(L,2,@Dest);
	try
		lControlChildSizing.AssignTo(Dest);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ControlChildSizing', 'AssignTo', E.ClassName, E.Message);
	end;
end;

function VCLua_ControlChildSizing_IsEqual(L: Plua_State): Integer; cdecl;
var
	lControlChildSizing:TLuaControlChildSizing;
	Sizing:TControlChildSizing;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lControlChildSizing := TLuaControlChildSizing(GetLuaObject(L, 1));
	luaL_check(L,2,@Sizing);
	try
		ret := lControlChildSizing.IsEqual(Sizing);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ControlChildSizing', 'IsEqual', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ControlChildSizing_SetGridSpacing(L: Plua_State): Integer; cdecl;
var
	lControlChildSizing:TLuaControlChildSizing;
	Spacing:Integer;
begin
	CheckArg(L, 2);
	lControlChildSizing := TLuaControlChildSizing(GetLuaObject(L, 1));
	luaL_check(L,2,@Spacing);
	try
		lControlChildSizing.SetGridSpacing(Spacing);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ControlChildSizing', 'SetGridSpacing', E.ClassName, E.Message);
	end;
end;

function VCLua_ControlChildSizing_VCLuaGetControl(L: Plua_State): Integer; cdecl;
var
	lControlChildSizing:TLuaControlChildSizing;
	ret:TWinControl;
begin
	lControlChildSizing := TLuaControlChildSizing(GetLuaObjectUnsafe(L, 1));
	try
		ret := lControlChildSizing.Control;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ControlChildSizing', 'GetControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ControlChildSizing_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lControlChildSizing:TLuaControlChildSizing;
begin
	lControlChildSizing := TLuaControlChildSizing(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lControlChildSizing.OnChange));
	lControlChildSizing.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TControlChildSizing; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TControlChildSizing',v);
end;
function CreateControlChildSizing(L: Plua_State): Integer; cdecl;
var
	lControlChildSizing:TLuaControlChildSizing;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lControlChildSizing := TLuaControlChildSizing.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TControlChildSizing',lControlChildSizing);
	InitControl(L,lControlChildSizing,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'ControlChildSizing', E.ClassName, E.Message);
	end;
end;

begin
	ControlChildSizingFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ControlChildSizingFuncs, 'AssignTo', @VCLua_ControlChildSizing_AssignTo);
	TLuaMethodInfo.Create(ControlChildSizingFuncs, 'IsEqual', @VCLua_ControlChildSizing_IsEqual);
	TLuaMethodInfo.Create(ControlChildSizingFuncs, 'SetGridSpacing', @VCLua_ControlChildSizing_SetGridSpacing);
	TLuaMethodInfo.Create(ControlChildSizingFuncs, 'Control', @VCLua_ControlChildSizing_VCLuaGetControl, mfCall);
	ControlChildSizingSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ControlChildSizingSets, 'OnChange', @VCLua_ControlChildSizing_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
end.
