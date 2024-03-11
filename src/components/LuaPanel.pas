(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPanel;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ExtCtrls;

function CreatePanel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPanel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPanel = class(TPanel)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomPanelFuncs: TLuaVmt;
    CustomPanelSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics;

function VCLua_Panel_VCLuaSetAlignment(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	val:TAlignment;
begin
	CheckArg(L, 2);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAlignment));
	try
		lPanel.Alignment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Panel', 'Alignment', E.ClassName, E.Message);
	end;
end;

function VCLua_Panel_VCLuaGetAlignment(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	ret:TAlignment;
begin
	CheckArg(L, 1);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	try
		ret := lPanel.Alignment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Panel', 'Alignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Panel_VCLuaSetBevelColor(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	val:TColor;
begin
	CheckArg(L, 2);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	val := luaL_checkColor(L,2);
	try
		lPanel.BevelColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelColor', E.ClassName, E.Message);
	end;
end;

function VCLua_Panel_VCLuaGetBevelColor(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	ret:TColor;
begin
	CheckArg(L, 1);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	try
		ret := lPanel.BevelColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Panel_VCLuaSetBevelInner(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	val:TPanelBevel;
begin
	CheckArg(L, 2);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPanelBevel));
	try
		lPanel.BevelInner := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelInner', E.ClassName, E.Message);
	end;
end;

function VCLua_Panel_VCLuaGetBevelInner(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	ret:TPanelBevel;
begin
	CheckArg(L, 1);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	try
		ret := lPanel.BevelInner;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelInner', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Panel_VCLuaSetBevelOuter(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	val:TPanelBevel;
begin
	CheckArg(L, 2);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPanelBevel));
	try
		lPanel.BevelOuter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelOuter', E.ClassName, E.Message);
	end;
end;

function VCLua_Panel_VCLuaGetBevelOuter(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	ret:TPanelBevel;
begin
	CheckArg(L, 1);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	try
		ret := lPanel.BevelOuter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelOuter', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Panel_VCLuaSetBevelWidth(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	val:TBevelWidth;
begin
	CheckArg(L, 2);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lPanel.BevelWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_Panel_VCLuaGetBevelWidth(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	ret:TBevelWidth;
begin
	CheckArg(L, 1);
	lPanel := TLuaPanel(GetLuaObject(L, 1));
	try
		ret := lPanel.BevelWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Panel', 'BevelWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TPanel; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomPanel',v);
end;
function CreatePanel(L: Plua_State): Integer; cdecl;
var
	lPanel:TLuaPanel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPanel := TLuaPanel.Create(Parent);
	lPanel.Parent := TWinControl(Parent);
	lPanel.LuaCtl := TVCLuaControl.Create(lPanel as TComponent,L,nil,'TCustomPanel');
	CreateTableForKnownType(L,'TCustomPanel',lPanel);
	InitControl(L,lPanel,Name);
	Result := 1;
end;

begin
	CustomPanelFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomPanelFuncs, 'Alignment', @VCLua_Panel_VCLuaGetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomPanelFuncs, 'BevelColor', @VCLua_Panel_VCLuaGetBevelColor, mfCall);
	TLuaMethodInfo.Create(CustomPanelFuncs, 'BevelInner', @VCLua_Panel_VCLuaGetBevelInner, mfCall);
	TLuaMethodInfo.Create(CustomPanelFuncs, 'BevelOuter', @VCLua_Panel_VCLuaGetBevelOuter, mfCall);
	TLuaMethodInfo.Create(CustomPanelFuncs, 'BevelWidth', @VCLua_Panel_VCLuaGetBevelWidth, mfCall);
	CustomPanelSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomPanelSets, 'Alignment', @VCLua_Panel_VCLuaSetAlignment, mfCall, TypeInfo(TAlignment));
	TLuaMethodInfo.Create(CustomPanelSets, 'BevelColor', @VCLua_Panel_VCLuaSetBevelColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomPanelSets, 'BevelInner', @VCLua_Panel_VCLuaSetBevelInner, mfCall, TypeInfo(TPanelBevel));
	TLuaMethodInfo.Create(CustomPanelSets, 'BevelOuter', @VCLua_Panel_VCLuaSetBevelOuter, mfCall, TypeInfo(TPanelBevel));
	TLuaMethodInfo.Create(CustomPanelSets, 'BevelWidth', @VCLua_Panel_VCLuaSetBevelWidth, mfCall, TypeInfo(TBevelWidth));
end.
