(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBasicAction;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Classes;

function CreateBasicAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBasicAction; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBasicAction = class(TBasicAction)
        LuaCtl: TVCLuaControl;
    end;
var
    BasicActionFuncs: TLuaVmt;
    BasicActionSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LuaClassesEvents, LuaEvent;

function VCLua_BasicAction_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lBasicAction.OnChange));
	lBasicAction.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_BasicAction_HandlesTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	luaL_check(L,2,@Target);
	try
		ret := lBasicAction.HandlesTarget(Target);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'HandlesTarget', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BasicAction_UpdateTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	luaL_check(L,2,@Target);
	try
		lBasicAction.UpdateTarget(Target);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'UpdateTarget', E.ClassName, E.Message);
	end;
end;

function VCLua_BasicAction_ExecuteTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	luaL_check(L,2,@Target);
	try
		lBasicAction.ExecuteTarget(Target);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'ExecuteTarget', E.ClassName, E.Message);
	end;
end;

function VCLua_BasicAction_Execute(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	try
		ret := lBasicAction.Execute();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'Execute', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BasicAction_Update(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	try
		ret := lBasicAction.Update();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'Update', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BasicAction_VCLuaSetActionComponent(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	val:TComponent;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lBasicAction.ActionComponent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'ActionComponent', E.ClassName, E.Message);
	end;
end;

function VCLua_BasicAction_VCLuaGetActionComponent(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	try
		ret := lBasicAction.ActionComponent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'ActionComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_BasicAction_VCLuaSetOnExecute(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lBasicAction.OnExecute));
	lBasicAction.OnExecute := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_BasicAction_VCLuaSetOnUpdate(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lBasicAction.OnUpdate));
	lBasicAction.OnUpdate := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TBasicAction; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBasicAction',v);
end;
function CreateBasicAction(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBasicAction := TLuaBasicAction.Create(Parent);
	// := TWinControl(Parent);
	lBasicAction.LuaCtl := TVCLuaControl.Create(lBasicAction as TComponent,L,nil,'TBasicAction');
	InitControl(L,lBasicAction,Name);
	CreateTableForKnownType(L,'TBasicAction',lBasicAction);
	Result := 1;
end;

begin
	BasicActionFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(BasicActionFuncs, 'HandlesTarget', @VCLua_BasicAction_HandlesTarget);
	TLuaMethodInfo.Create(BasicActionFuncs, 'UpdateTarget', @VCLua_BasicAction_UpdateTarget);
	TLuaMethodInfo.Create(BasicActionFuncs, 'ExecuteTarget', @VCLua_BasicAction_ExecuteTarget);
	TLuaMethodInfo.Create(BasicActionFuncs, 'Execute', @VCLua_BasicAction_Execute);
	TLuaMethodInfo.Create(BasicActionFuncs, 'Update', @VCLua_BasicAction_Update);
	TLuaMethodInfo.Create(BasicActionFuncs, 'ActionComponent', @VCLua_BasicAction_VCLuaGetActionComponent, mfCall);
	BasicActionSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(BasicActionSets, 'OnChange', @VCLua_BasicAction_VCLuaSetOnChange, mfCall);
	TLuaMethodInfo.Create(BasicActionSets, 'ActionComponent', @VCLua_BasicAction_VCLuaSetActionComponent, mfCall);
	TLuaMethodInfo.Create(BasicActionSets, 'OnExecute', @VCLua_BasicAction_VCLuaSetOnExecute, mfCall);
	TLuaMethodInfo.Create(BasicActionSets, 'OnUpdate', @VCLua_BasicAction_VCLuaSetOnUpdate, mfCall);
end.
