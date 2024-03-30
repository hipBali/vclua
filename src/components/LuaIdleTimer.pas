(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaIdleTimer;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ExtCtrls;

function CreateIdleTimer(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TIdleTimer; pti: PTypeInfo = nil); overload; inline;

type
    TLuaIdleTimer = class(TIdleTimer)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomIdleTimerFuncs: TLuaVmt;
    CustomIdleTimerSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_IdleTimer_VCLuaSetAutoEnabled(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:boolean;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lIdleTimer.AutoEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'SetAutoEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetAutoEnabled(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:boolean;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	try
		ret := lIdleTimer.AutoEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'GetAutoEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_IdleTimer_VCLuaSetAutoStartEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:TIdleTimerAutoEvent;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TIdleTimerAutoEvent));
	try
		lIdleTimer.AutoStartEvent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'SetAutoStartEvent', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetAutoStartEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:TIdleTimerAutoEvent;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	try
		ret := lIdleTimer.AutoStartEvent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'GetAutoStartEvent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_IdleTimer_VCLuaSetAutoEndEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:TIdleTimerAutoEvent;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TIdleTimerAutoEvent));
	try
		lIdleTimer.AutoEndEvent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'SetAutoEndEvent', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetAutoEndEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:TIdleTimerAutoEvent;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	try
		ret := lIdleTimer.AutoEndEvent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'GetAutoEndEvent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_IdleTimer_VCLuaSetFireOnIdle(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:boolean;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lIdleTimer.FireOnIdle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'SetFireOnIdle', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetFireOnIdle(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:boolean;
begin
	lIdleTimer := TLuaIdleTimer(GetLuaObjectUnsafe(L, 1));
	try
		ret := lIdleTimer.FireOnIdle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'GetFireOnIdle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TIdleTimer; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomIdleTimer',v);
end;
function CreateIdleTimer(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lIdleTimer := TLuaIdleTimer.Create(Parent);
	// := TWinControl(Parent);
	lIdleTimer.LuaCtl := TVCLuaControl.Create(lIdleTimer as TComponent,L,nil,'TCustomIdleTimer');
	CreateTableForKnownType(L,'TCustomIdleTimer',lIdleTimer);
	InitControl(L,lIdleTimer,Name);
	Result := 1;
end;

begin
	CustomIdleTimerFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'AutoEnabled', @VCLua_IdleTimer_VCLuaGetAutoEnabled, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'AutoStartEvent', @VCLua_IdleTimer_VCLuaGetAutoStartEvent, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'AutoEndEvent', @VCLua_IdleTimer_VCLuaGetAutoEndEvent, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'FireOnIdle', @VCLua_IdleTimer_VCLuaGetFireOnIdle, mfCall);
	CustomIdleTimerSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'AutoEnabled', @VCLua_IdleTimer_VCLuaSetAutoEnabled, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'AutoStartEvent', @VCLua_IdleTimer_VCLuaSetAutoStartEvent, mfCall, TypeInfo(TIdleTimerAutoEvent));
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'AutoEndEvent', @VCLua_IdleTimer_VCLuaSetAutoEndEvent, mfCall, TypeInfo(TIdleTimerAutoEvent));
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'FireOnIdle', @VCLua_IdleTimer_VCLuaSetFireOnIdle, mfCall, TypeInfo(boolean));
end.
