(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaToolWindow;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Toolwin;

procedure lua_push(L: Plua_State; const v: TToolWindow; pti: PTypeInfo = nil); overload; inline;

type
    TLuaToolWindow = class(TToolWindow)
    end;
var
    ToolWindowFuncs: TLuaVmt;
    ToolWindowSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

function VCLua_ToolWindow_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lToolWindow:TLuaToolWindow;
begin
	CheckArg(L, 1);
	lToolWindow := TLuaToolWindow(GetLuaObject(L, 1));
	try
		lToolWindow.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolWindow', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ToolWindow_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lToolWindow:TLuaToolWindow;
begin
	CheckArg(L, 1);
	lToolWindow := TLuaToolWindow(GetLuaObject(L, 1));
	try
		lToolWindow.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolWindow', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ToolWindow_VCLuaSetEdgeInner(L: Plua_State): Integer; cdecl;
var
	lToolWindow:TLuaToolWindow;
	val:TEdgeStyle;
begin
	lToolWindow := TLuaToolWindow(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEdgeStyle));
	try
		lToolWindow.EdgeInner := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolWindow', 'SetEdgeInner', E.ClassName, E.Message);
	end;
end;

function VCLua_ToolWindow_VCLuaGetEdgeInner(L: Plua_State): Integer; cdecl;
var
	lToolWindow:TLuaToolWindow;
	ret:TEdgeStyle;
begin
	lToolWindow := TLuaToolWindow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lToolWindow.EdgeInner;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolWindow', 'GetEdgeInner', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ToolWindow_VCLuaSetEdgeOuter(L: Plua_State): Integer; cdecl;
var
	lToolWindow:TLuaToolWindow;
	val:TEdgeStyle;
begin
	lToolWindow := TLuaToolWindow(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEdgeStyle));
	try
		lToolWindow.EdgeOuter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ToolWindow', 'SetEdgeOuter', E.ClassName, E.Message);
	end;
end;

function VCLua_ToolWindow_VCLuaGetEdgeOuter(L: Plua_State): Integer; cdecl;
var
	lToolWindow:TLuaToolWindow;
	ret:TEdgeStyle;
begin
	lToolWindow := TLuaToolWindow(GetLuaObjectUnsafe(L, 1));
	try
		ret := lToolWindow.EdgeOuter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ToolWindow', 'GetEdgeOuter', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TToolWindow; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TToolWindow',v);
end;

begin
	ToolWindowFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ToolWindowFuncs, 'BeginUpdate', @VCLua_ToolWindow_BeginUpdate);
	TLuaMethodInfo.Create(ToolWindowFuncs, 'EndUpdate', @VCLua_ToolWindow_EndUpdate);
	TLuaMethodInfo.Create(ToolWindowFuncs, 'EdgeInner', @VCLua_ToolWindow_VCLuaGetEdgeInner, mfCall);
	TLuaMethodInfo.Create(ToolWindowFuncs, 'EdgeOuter', @VCLua_ToolWindow_VCLuaGetEdgeOuter, mfCall);
	ToolWindowSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ToolWindowSets, 'EdgeInner', @VCLua_ToolWindow_VCLuaSetEdgeInner, mfCall, TypeInfo(TEdgeStyle));
	TLuaMethodInfo.Create(ToolWindowSets, 'EdgeOuter', @VCLua_ToolWindow_VCLuaSetEdgeOuter, mfCall, TypeInfo(TEdgeStyle));
end.
