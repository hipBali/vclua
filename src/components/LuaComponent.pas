(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaComponent;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Classes;

procedure lua_push(L: Plua_State; const v: TComponent; pti: PTypeInfo = nil); overload; inline;

type
    TLuaComponent = class(TComponent)
    end;
var
    ComponentFuncs: TLuaVmt;
    ComponentSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

function VCLua_Component_BeforeDestruction(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
begin
	CheckArg(L, 1);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	try
		lComponent.BeforeDestruction();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'BeforeDestruction', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_DestroyComponents(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
begin
	CheckArg(L, 1);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	try
		lComponent.DestroyComponents();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'DestroyComponents', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_Destroying(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
begin
	CheckArg(L, 1);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	try
		lComponent.Destroying();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'Destroying', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_ExecuteAction(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	Action:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@Action);
	try
		ret := lComponent.ExecuteAction(Action);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'ExecuteAction', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Component_FindComponent(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	AName:string;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@AName);
	try
		ret := lComponent.FindComponent(AName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'FindComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Component_FreeNotification(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lComponent.FreeNotification(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'FreeNotification', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_RemoveFreeNotification(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lComponent.RemoveFreeNotification(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'RemoveFreeNotification', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_FreeOnRelease(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
begin
	CheckArg(L, 1);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	try
		lComponent.FreeOnRelease();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'FreeOnRelease', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_GetNamePath(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:string;
begin
	CheckArg(L, 1);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	try
		ret := lComponent.GetNamePath();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetNamePath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Component_GetParentComponent(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	try
		ret := lComponent.GetParentComponent();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetParentComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Component_HasParent(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	try
		ret := lComponent.HasParent();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'HasParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Component_InsertComponent(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lComponent.InsertComponent(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'InsertComponent', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_RemoveComponent(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lComponent.RemoveComponent(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'RemoveComponent', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_SetSubComponent(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ASubComponent:Boolean;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@ASubComponent);
	try
		lComponent.SetSubComponent(ASubComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'SetSubComponent', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_UpdateAction(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	Action:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@Action);
	try
		ret := lComponent.UpdateAction(Action);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'UpdateAction', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Component_Components(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	Index:Integer;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lComponent := TLuaComponent(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lComponent.Components[Index];
		lua_push(L,ret,TypeInfo(ret));
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'Components', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_VCLuaGetComponentCount(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:Integer;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	try
		ret := lComponent.ComponentCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetComponentCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Component_VCLuaSetComponentIndex(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	val:Integer;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lComponent.ComponentIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'SetComponentIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_VCLuaGetComponentIndex(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:Integer;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	try
		ret := lComponent.ComponentIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetComponentIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Component_VCLuaGetComponentState(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:TComponentState;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	try
		ret := lComponent.ComponentState;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetComponentState', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Component_VCLuaGetComponentStyle(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:TComponentStyle;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	try
		ret := lComponent.ComponentStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetComponentStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Component_VCLuaSetDesignInfo(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	val:Longint;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lComponent.DesignInfo := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'SetDesignInfo', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_VCLuaGetDesignInfo(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:Longint;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	try
		ret := lComponent.DesignInfo;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetDesignInfo', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Component_VCLuaGetOwner(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:TComponent;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	try
		ret := lComponent.Owner;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetOwner', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Component_VCLuaSetVCLComObject(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	val:Pointer;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	val := lua_touserdata(L,2);
	try
		lComponent.VCLComObject := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Component', 'SetVCLComObject', E.ClassName, E.Message);
	end;
end;

function VCLua_Component_VCLuaGetVCLComObject(L: Plua_State): Integer; cdecl;
var
	lComponent:TLuaComponent;
	ret:Pointer;
begin
	lComponent := TLuaComponent(GetLuaObjectUnsafe(L, 1));
	try
		ret := lComponent.VCLComObject;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Component', 'GetVCLComObject', E.ClassName, E.Message);
	end;
	lua_pushlightuserdata(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TComponent; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TComponent',v);
end;

begin
	ComponentFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ComponentFuncs, 'BeforeDestruction', @VCLua_Component_BeforeDestruction);
	TLuaMethodInfo.Create(ComponentFuncs, 'DestroyComponents', @VCLua_Component_DestroyComponents);
	TLuaMethodInfo.Create(ComponentFuncs, 'Destroying', @VCLua_Component_Destroying);
	TLuaMethodInfo.Create(ComponentFuncs, 'ExecuteAction', @VCLua_Component_ExecuteAction);
	TLuaMethodInfo.Create(ComponentFuncs, 'FindComponent', @VCLua_Component_FindComponent);
	TLuaMethodInfo.Create(ComponentFuncs, 'FreeNotification', @VCLua_Component_FreeNotification);
	TLuaMethodInfo.Create(ComponentFuncs, 'RemoveFreeNotification', @VCLua_Component_RemoveFreeNotification);
	TLuaMethodInfo.Create(ComponentFuncs, 'FreeOnRelease', @VCLua_Component_FreeOnRelease);
	TLuaMethodInfo.Create(ComponentFuncs, 'GetNamePath', @VCLua_Component_GetNamePath);
	TLuaMethodInfo.Create(ComponentFuncs, 'GetParentComponent', @VCLua_Component_GetParentComponent);
	TLuaMethodInfo.Create(ComponentFuncs, 'HasParent', @VCLua_Component_HasParent);
	TLuaMethodInfo.Create(ComponentFuncs, 'InsertComponent', @VCLua_Component_InsertComponent);
	TLuaMethodInfo.Create(ComponentFuncs, 'RemoveComponent', @VCLua_Component_RemoveComponent);
	TLuaMethodInfo.Create(ComponentFuncs, 'SetSubComponent', @VCLua_Component_SetSubComponent);
	TLuaMethodInfo.Create(ComponentFuncs, 'UpdateAction', @VCLua_Component_UpdateAction);
	TLuaMethodInfo.Create(ComponentFuncs, 'Components', @VCLua_Component_Components);
	TLuaMethodInfo.Create(ComponentFuncs, 'ComponentCount', @VCLua_Component_VCLuaGetComponentCount, mfCall);
	TLuaMethodInfo.Create(ComponentFuncs, 'ComponentIndex', @VCLua_Component_VCLuaGetComponentIndex, mfCall);
	TLuaMethodInfo.Create(ComponentFuncs, 'ComponentState', @VCLua_Component_VCLuaGetComponentState, mfCall);
	TLuaMethodInfo.Create(ComponentFuncs, 'ComponentStyle', @VCLua_Component_VCLuaGetComponentStyle, mfCall);
	TLuaMethodInfo.Create(ComponentFuncs, 'DesignInfo', @VCLua_Component_VCLuaGetDesignInfo, mfCall);
	TLuaMethodInfo.Create(ComponentFuncs, 'Owner', @VCLua_Component_VCLuaGetOwner, mfCall);
	TLuaMethodInfo.Create(ComponentFuncs, 'VCLComObject', @VCLua_Component_VCLuaGetVCLComObject, mfCall);
	ComponentSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ComponentSets, 'ComponentIndex', @VCLua_Component_VCLuaSetComponentIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(ComponentSets, 'DesignInfo', @VCLua_Component_VCLuaSetDesignInfo, mfCall, TypeInfo(Longint));
	TLuaMethodInfo.Create(ComponentSets, 'VCLComObject', @VCLua_Component_VCLuaSetVCLComObject, mfCall, TypeInfo(Pointer));
end.
