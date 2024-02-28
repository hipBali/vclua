(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaIdleTimer;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateIdleTimer(L: Plua_State): Integer; cdecl;
function IsIdleTimer(L: Plua_State): Integer; cdecl;
function AsIdleTimer(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TIdleTimer; pti: PTypeInfo = nil); overload; inline;

type
    TLuaIdleTimer = class(TIdleTimer)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomIdleTimerFuncs: TLuaVmt;
    CustomIdleTimerSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_IdleTimer_VCLuaSetAutoEnabled(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:boolean;
begin
	CheckArg(L, 2);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lIdleTimer.AutoEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'AutoEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetAutoEnabled(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:boolean;
begin
	CheckArg(L, 1);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	try
		ret := lIdleTimer.AutoEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'AutoEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_IdleTimer_VCLuaSetAutoStartEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:TIdleTimerAutoEvent;
begin
	CheckArg(L, 2);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TIdleTimerAutoEvent));
	try
		lIdleTimer.AutoStartEvent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'AutoStartEvent', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetAutoStartEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:TIdleTimerAutoEvent;
begin
	CheckArg(L, 1);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	try
		ret := lIdleTimer.AutoStartEvent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'AutoStartEvent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_IdleTimer_VCLuaSetAutoEndEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:TIdleTimerAutoEvent;
begin
	CheckArg(L, 2);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TIdleTimerAutoEvent));
	try
		lIdleTimer.AutoEndEvent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'AutoEndEvent', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetAutoEndEvent(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:TIdleTimerAutoEvent;
begin
	CheckArg(L, 1);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	try
		ret := lIdleTimer.AutoEndEvent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'AutoEndEvent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_IdleTimer_VCLuaSetFireOnIdle(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	val:boolean;
begin
	CheckArg(L, 2);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lIdleTimer.FireOnIdle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'FireOnIdle', E.ClassName, E.Message);
	end;
end;

function VCLua_IdleTimer_VCLuaGetFireOnIdle(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	ret:boolean;
begin
	CheckArg(L, 1);
	lIdleTimer := TLuaIdleTimer(GetLuaObject(L, 1));
	try
		ret := lIdleTimer.FireOnIdle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'IdleTimer', 'FireOnIdle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function IsIdleTimer(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TIdleTimer);
end;
function AsIdleTimer(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TIdleTimer then
    lua_push(L, TIdleTimer(o))
  else
    lua_pushnil(L);
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
	InitControl(L,lIdleTimer,Name);
	CreateTableForKnownType(L,'TCustomIdleTimer',lIdleTimer);
	Result := 1;
end;

begin
	CustomIdleTimerFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'AutoEnabled', @VCLua_IdleTimer_VCLuaGetAutoEnabled, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'AutoStartEvent', @VCLua_IdleTimer_VCLuaGetAutoStartEvent, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'AutoEndEvent', @VCLua_IdleTimer_VCLuaGetAutoEndEvent, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerFuncs, 'FireOnIdle', @VCLua_IdleTimer_VCLuaGetFireOnIdle, mfCall);
	CustomIdleTimerSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'AutoEnabled', @VCLua_IdleTimer_VCLuaSetAutoEnabled, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'AutoStartEvent', @VCLua_IdleTimer_VCLuaSetAutoStartEvent, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'AutoEndEvent', @VCLua_IdleTimer_VCLuaSetAutoEndEvent, mfCall);
	TLuaMethodInfo.Create(CustomIdleTimerSets, 'FireOnIdle', @VCLua_IdleTimer_VCLuaSetFireOnIdle, mfCall);
end.
