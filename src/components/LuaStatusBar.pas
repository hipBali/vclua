(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStatusBar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function IsStatusPanel(L: Plua_State): Integer; cdecl;
function AsStatusPanel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStatusPanel; pti: PTypeInfo = nil); overload; inline;
procedure StatusPanelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStatusPanel = class(TStatusPanel)
    public
      L:Plua_State;
    end;

function IsStatusPanels(L: Plua_State): Integer; cdecl;
function AsStatusPanels(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStatusPanels; pti: PTypeInfo = nil); overload; inline;
procedure StatusPanelsToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStatusPanels = class(TStatusPanels)
    public
      L:Plua_State;
    end;

function CreateStatusBar(L: Plua_State): Integer; cdecl;
function IsStatusBar(L: Plua_State): Integer; cdecl;
function AsStatusBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStatusBar; pti: PTypeInfo = nil); overload; inline;
procedure StatusBarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStatusBar = class(TStatusBar)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_StatusPanel_Assign(L: Plua_State): Integer; cdecl;
var 
	lStatusPanel:TLuaStatusPanel;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lStatusPanel := TLuaStatusPanel(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lStatusPanel.Assign(Source);
	
	Result := 0;
end;

function VCLua_StatusPanel_StatusBar(L: Plua_State): Integer; cdecl;
var 
	lStatusPanel:TLuaStatusPanel;
	ret:TStatusBar;
begin
	CheckArg(L, 1);
	lStatusPanel := TLuaStatusPanel(GetLuaObject(L, 1));
	ret := lStatusPanel.StatusBar();
	StatusPanelToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_StatusPanels_Add(L: Plua_State): Integer; cdecl;
var 
	lStatusPanels:TLuaStatusPanels;
	ret:TStatusPanel;
begin
	CheckArg(L, 1);
	lStatusPanels := TLuaStatusPanels(GetLuaObject(L, 1));
	ret := lStatusPanels.Add();
	StatusPanelsToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_StatusBar_InvalidatePanel(L: Plua_State): Integer; cdecl;
var 
	lStatusBar:TLuaStatusBar;
	PanelIndex:integer;
	PanelParts:TPanelParts;
begin
	CheckArg(L, 3);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	PanelIndex := lua_tointeger(L,2);
	PanelParts := TPanelParts(GetEnumValue(TypeInfo(TPanelParts),lua_tostring(L,3)));
	lStatusBar.InvalidatePanel(PanelIndex,PanelParts);
	
	Result := 0;
end;

function VCLua_StatusBar_BeginUpdate(L: Plua_State): Integer; cdecl;
var 
	lStatusBar:TLuaStatusBar;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	lStatusBar.BeginUpdate();
	
	Result := 0;
end;

function VCLua_StatusBar_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lStatusBar:TLuaStatusBar;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	lStatusBar.EndUpdate();
	
	Result := 0;
end;

function VCLua_StatusBar_ExecuteAction(L: Plua_State): Integer; cdecl;
var 
	lStatusBar:TLuaStatusBar;
	ExeAction:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	ExeAction := TBasicAction(GetLuaObject(L,2));
	ret := lStatusBar.ExecuteAction(ExeAction);
	lua_pushboolean(L,ret);
	
	Result := 1;
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
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	ret := lStatusBar.GetPanelIndexAt(X,Y);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_StatusBar_SizeGripEnabled(L: Plua_State): Integer; cdecl;
var 
	lStatusBar:TLuaStatusBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	ret := lStatusBar.SizeGripEnabled();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_StatusBar_UpdatingStatusBar(L: Plua_State): Integer; cdecl;
var 
	lStatusBar:TLuaStatusBar;
	ret:boolean;
begin
	CheckArg(L, 1);
	lStatusBar := TLuaStatusBar(GetLuaObject(L, 1));
	ret := lStatusBar.UpdatingStatusBar();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function IsStatusPanel(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TStatusPanel);
end;
function AsStatusPanel(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TStatusPanel then
    lua_push(L, TStatusPanel(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TStatusPanel; pti: PTypeInfo);
begin
	StatusPanelToTable(L,-1,v);
end;
procedure StatusPanelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_StatusPanel_Assign);
	LuaSetTableFunction(L, Index, 'StatusBar', @VCLua_StatusPanel_StatusBar);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

function IsStatusPanels(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TStatusPanels);
end;
function AsStatusPanels(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TStatusPanels then
    lua_push(L, TStatusPanels(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TStatusPanels; pti: PTypeInfo);
begin
	StatusPanelsToTable(L,-1,v);
end;
procedure StatusPanelsToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_StatusPanels_Add);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

function IsStatusBar(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TStatusBar);
end;
function AsStatusBar(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TStatusBar then
    lua_push(L, TStatusBar(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TStatusBar; pti: PTypeInfo);
begin
	StatusBarToTable(L,-1,v);
end;
procedure StatusBarToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'InvalidatePanel', @VCLua_StatusBar_InvalidatePanel);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_StatusBar_BeginUpdate);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_StatusBar_EndUpdate);
	LuaSetTableFunction(L, Index, 'ExecuteAction', @VCLua_StatusBar_ExecuteAction);
	LuaSetTableFunction(L, Index, 'GetPanelIndexAt', @VCLua_StatusBar_GetPanelIndexAt);
	LuaSetTableFunction(L, Index, 'SizeGripEnabled', @VCLua_StatusBar_SizeGripEnabled);
	LuaSetTableFunction(L, Index, 'UpdatingStatusBar', @VCLua_StatusBar_UpdatingStatusBar);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lStatusBar.LuaCtl := TVCLuaControl.Create(lStatusBar as TComponent,L,@StatusBarToTable);
	InitControl(L,lStatusBar,Name);
	StatusBarToTable(L, -1, lStatusBar);
	Result := 1;
end;

end.
