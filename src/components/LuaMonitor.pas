(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMonitor;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Forms;

procedure lua_push(L: Plua_State; const v: TMonitor; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMonitor = class(TMonitor)
    end;
var
    MonitorFuncs: TLuaVmt;
    MonitorSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LCLType;

function VCLua_Monitor_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:HMONITOR;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetMonitorNum(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:Integer;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.MonitorNum;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetMonitorNum', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetLeft(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:Integer;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.Left;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:Integer;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetTop(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:Integer;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.Top;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetWidth(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:Integer;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.Width;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetBoundsRect(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:TRect;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.BoundsRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetBoundsRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetWorkareaRect(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:TRect;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.WorkareaRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetWorkareaRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetPrimary(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:Boolean;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.Primary;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetPrimary', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Monitor_VCLuaGetPixelsPerInch(L: Plua_State): Integer; cdecl;
var
	lMonitor:TLuaMonitor;
	ret:Integer;
begin
	lMonitor := TLuaMonitor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lMonitor.PixelsPerInch;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Monitor', 'GetPixelsPerInch', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TMonitor; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TMonitor',v);
end;

begin
	MonitorFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(MonitorFuncs, 'Handle', @VCLua_Monitor_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'MonitorNum', @VCLua_Monitor_VCLuaGetMonitorNum, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'Left', @VCLua_Monitor_VCLuaGetLeft, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'Height', @VCLua_Monitor_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'Top', @VCLua_Monitor_VCLuaGetTop, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'Width', @VCLua_Monitor_VCLuaGetWidth, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'BoundsRect', @VCLua_Monitor_VCLuaGetBoundsRect, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'WorkareaRect', @VCLua_Monitor_VCLuaGetWorkareaRect, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'Primary', @VCLua_Monitor_VCLuaGetPrimary, mfCall);
	TLuaMethodInfo.Create(MonitorFuncs, 'PixelsPerInch', @VCLua_Monitor_VCLuaGetPixelsPerInch, mfCall);
	MonitorSets := TLuaVmt.Create;
	
end.
