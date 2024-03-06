(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStatusBar;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

procedure lua_push(L: Plua_State; const v: TStatusPanel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStatusPanel = class(TStatusPanel)
    public
      L:Plua_State;
    end;
var
    StatusPanelFuncs: TLuaVmt;
    StatusPanelSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TStatusPanels; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStatusPanels = class(TStatusPanels)
    public
      L:Plua_State;
    end;
var
    StatusPanelsFuncs: TLuaVmt;
    StatusPanelsSets: TLuaVmt;

function CreateStatusBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStatusBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStatusBar = class(TStatusBar)
        LuaCtl: TVCLuaControl;
    end;
var
    StatusBarFuncs: TLuaVmt;
    StatusBarSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaCanvas, LuaClassesEvents, LuaComCtrlsEvents, LuaEvent;

function VCLua_StatusPanel_Assign(L: Plua_State): Integer; cdecl;
var
	lStatusPanel:TLuaStatusPanel;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lStatusPanel := TLuaStatusPanel(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lStatusPanel.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StatusPanel', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_StatusPanel_StatusBar(L: Plua_State): Integer; cdecl;
var
	lStatusPanel:TLuaStatusPanel;
	ret:TStatusBar;
begin
	CheckArg(L, 1);
	lStatusPanel := TLuaStatusPanel(GetLuaObject(L, 1));
	try
		ret := lStatusPanel.StatusBar();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusPanel', 'StatusBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusPanels_Add(L: Plua_State): Integer; cdecl;
var
	lStatusPanels:TLuaStatusPanels;
	ret:TStatusPanel;
begin
	CheckArg(L, 1);
	lStatusPanels := TLuaStatusPanels(GetLuaObject(L, 1));
	try
		ret := lStatusPanels.Add();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusPanels', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusPanels_Items(L: Plua_State): Integer; cdecl;
var
	lStatusPanels:TLuaStatusPanels;
	Index:Integer;
	ret:TStatusPanel;
begin
	CheckArg(L, 2, 3);
	lStatusPanels := TLuaStatusPanels(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lStatusPanels.Items[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lStatusPanels.Items[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'StatusPanels', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_StatusPanels_VCLuaGetStatusBar(L: Plua_State): Integer; cdecl;
var
	lStatusPanels:TLuaStatusPanels;
	ret:TStatusBar;
begin
	CheckArg(L, 1);
	lStatusPanels := TLuaStatusPanels(GetLuaObject(L, 1));
	try
		ret := lStatusPanels.StatusBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusPanels', 'StatusBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusBar_InvalidatePanel(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
	PanelIndex:integer;
	PanelParts:TPanelParts;
begin
	CheckArg(L, 3);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	luaL_check(L,2,@PanelIndex);
	luaL_checkSet(L,3,@PanelParts,TypeInfo(TPanelParts));
	try
		lStatusBar.InvalidatePanel(PanelIndex,PanelParts);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'InvalidatePanel', E.ClassName, E.Message);
	end;
end;

function VCLua_StatusBar_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	try
		lStatusBar.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_StatusBar_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	try
		lStatusBar.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_StatusBar_ExecuteAction(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
	ExeAction:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	luaL_check(L,2,@ExeAction);
	try
		ret := lStatusBar.ExecuteAction(ExeAction);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'ExecuteAction', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusBar_GetPanelIndexAt(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
	X:Integer;
	Y:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lStatusBar.GetPanelIndexAt(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'GetPanelIndexAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusBar_SizeGripEnabled(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	try
		ret := lStatusBar.SizeGripEnabled();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'SizeGripEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusBar_UpdatingStatusBar(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
	ret:boolean;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	try
		ret := lStatusBar.UpdatingStatusBar();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'UpdatingStatusBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusBar_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
	ret:TCanvas;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	try
		ret := lStatusBar.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StatusBar', 'Canvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StatusBar_VCLuaSetOnDrawPanel(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
begin
	CheckArg(L, 2);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lStatusBar.OnDrawPanel));
	lStatusBar.OnDrawPanel := TLuaEvent.Factory<TDrawPanelEvent,TLuaDrawPanelEvent>(L);
	Result := 0;
end;

function VCLua_StatusBar_VCLuaSetOnHint(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
begin
	CheckArg(L, 2);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lStatusBar.OnHint));
	lStatusBar.OnHint := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TStatusPanel; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TStatusPanel',v);
end;

procedure lua_push(L: Plua_State; const v: TStatusPanels; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TStatusPanels',v);
end;

procedure lua_push(L: Plua_State; const v: TStatusBar; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TStatusBar',v);
end;
function CreateStatusBar(L: Plua_State): Integer; cdecl;
var
	lStatusBar:TLuaStatusBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lStatusBar := TLuaStatusBar.Create(Parent);
	lStatusBar.Parent := TWinControl(Parent);
	lStatusBar.LuaCtl := TVCLuaControl.Create(lStatusBar as TComponent,L,nil,'TStatusBar');
	CreateTableForKnownType(L,'TStatusBar',lStatusBar);
	InitControl(L,lStatusBar,Name);
	Result := 1;
end;

begin
	StatusPanelFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(StatusPanelFuncs, 'Assign', @VCLua_StatusPanel_Assign);
	TLuaMethodInfo.Create(StatusPanelFuncs, 'StatusBar', @VCLua_StatusPanel_StatusBar);
	StatusPanelSets := TLuaVmt.Create;
	
	StatusPanelsFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(StatusPanelsFuncs, 'Add', @VCLua_StatusPanels_Add);
	TLuaMethodInfo.Create(StatusPanelsFuncs, 'Items', @VCLua_StatusPanels_Items);
	TLuaMethodInfo.Create(StatusPanelsFuncs, 'StatusBar', @VCLua_StatusPanels_VCLuaGetStatusBar, mfCall);
	StatusPanelsSets := TLuaVmt.Create;
	
	StatusBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(StatusBarFuncs, 'InvalidatePanel', @VCLua_StatusBar_InvalidatePanel);
	TLuaMethodInfo.Create(StatusBarFuncs, 'BeginUpdate', @VCLua_StatusBar_BeginUpdate);
	TLuaMethodInfo.Create(StatusBarFuncs, 'EndUpdate', @VCLua_StatusBar_EndUpdate);
	TLuaMethodInfo.Create(StatusBarFuncs, 'ExecuteAction', @VCLua_StatusBar_ExecuteAction);
	TLuaMethodInfo.Create(StatusBarFuncs, 'GetPanelIndexAt', @VCLua_StatusBar_GetPanelIndexAt);
	TLuaMethodInfo.Create(StatusBarFuncs, 'SizeGripEnabled', @VCLua_StatusBar_SizeGripEnabled);
	TLuaMethodInfo.Create(StatusBarFuncs, 'UpdatingStatusBar', @VCLua_StatusBar_UpdatingStatusBar);
	TLuaMethodInfo.Create(StatusBarFuncs, 'Canvas', @VCLua_StatusBar_VCLuaGetCanvas, mfCall);
	StatusBarSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(StatusBarSets, 'OnDrawPanel', @VCLua_StatusBar_VCLuaSetOnDrawPanel, mfCall);
	TLuaMethodInfo.Create(StatusBarSets, 'OnHint', @VCLua_StatusBar_VCLuaSetOnHint, mfCall);
end.
