(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStatusBar;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function IsStatusPanel(L: Plua_State): Integer; cdecl;
function AsStatusPanel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStatusPanel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStatusPanel = class(TStatusPanel)
    public
      L:Plua_State;
    end;
var
    StatusPanelFuncs: aoluaL_Reg;

function IsStatusPanels(L: Plua_State): Integer; cdecl;
function AsStatusPanels(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStatusPanels; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStatusPanels = class(TStatusPanels)
    public
      L:Plua_State;
    end;
var
    StatusPanelsFuncs: aoluaL_Reg;

function CreateStatusBar(L: Plua_State): Integer; cdecl;
function IsStatusBar(L: Plua_State): Integer; cdecl;
function AsStatusBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStatusBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStatusBar = class(TStatusBar)
        LuaCtl: TVCLuaControl;
    end;
var
    StatusBarFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_StatusPanel_Assign(L: Plua_State): Integer; cdecl;
var
	lStatusPanel:TLuaStatusPanel;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lStatusPanel := TLuaStatusPanel(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	luaL_check(L,2,@PanelIndex);
	luaL_checkSet(L,3,@PanelParts,TypeInfo(TPanelParts));
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
	luaL_check(L,2,@ExeAction);
	ret := lStatusBar.ExecuteAction(ExeAction);
	lua_push(L,ret);
	
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	ret := lStatusBar.GetPanelIndexAt(X,Y);
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	CreateTableForKnownType(L,'TStatusPanel',v);
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
	CreateTableForKnownType(L,'TStatusPanels',v);
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
	InitControl(L,lStatusBar,Name);
	CreateTableForKnownType(L,'TStatusBar',lStatusBar);
	Result := 1;
end;

begin
	SetLength(StatusPanelFuncs, 2+1);
	StatusPanelFuncs[0].name:='Assign';
	StatusPanelFuncs[0].func:=@VCLua_StatusPanel_Assign;
	StatusPanelFuncs[1].name:='StatusBar';
	StatusPanelFuncs[1].func:=@VCLua_StatusPanel_StatusBar;
	StatusPanelFuncs[2].name:=nil;
	StatusPanelFuncs[2].func:=nil;

	SetLength(StatusPanelsFuncs, 1+1);
	StatusPanelsFuncs[0].name:='Add';
	StatusPanelsFuncs[0].func:=@VCLua_StatusPanels_Add;
	StatusPanelsFuncs[1].name:=nil;
	StatusPanelsFuncs[1].func:=nil;

	SetLength(StatusBarFuncs, 7+1);
	StatusBarFuncs[0].name:='InvalidatePanel';
	StatusBarFuncs[0].func:=@VCLua_StatusBar_InvalidatePanel;
	StatusBarFuncs[1].name:='BeginUpdate';
	StatusBarFuncs[1].func:=@VCLua_StatusBar_BeginUpdate;
	StatusBarFuncs[2].name:='EndUpdate';
	StatusBarFuncs[2].func:=@VCLua_StatusBar_EndUpdate;
	StatusBarFuncs[3].name:='ExecuteAction';
	StatusBarFuncs[3].func:=@VCLua_StatusBar_ExecuteAction;
	StatusBarFuncs[4].name:='GetPanelIndexAt';
	StatusBarFuncs[4].func:=@VCLua_StatusBar_GetPanelIndexAt;
	StatusBarFuncs[5].name:='SizeGripEnabled';
	StatusBarFuncs[5].func:=@VCLua_StatusBar_SizeGripEnabled;
	StatusBarFuncs[6].name:='UpdatingStatusBar';
	StatusBarFuncs[6].func:=@VCLua_StatusBar_UpdatingStatusBar;
	StatusBarFuncs[7].name:=nil;
	StatusBarFuncs[7].func:=nil;

end.
