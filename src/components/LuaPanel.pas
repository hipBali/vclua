(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPanel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreatePanel(L: Plua_State): Integer; cdecl;
function IsPanel(L: Plua_State): Integer; cdecl;
function AsPanel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPanel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPanel = class(TPanel)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomPanelFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsPanel(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TPanel);
end;
function AsPanel(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TPanel then
    lua_push(L, TPanel(o))
  else
    lua_pushnil(L);
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
	InitControl(L,lPanel,Name);
	CreateTableForKnownType(L,'TCustomPanel',lPanel);
	Result := 1;
end;

begin
	SetLength(CustomPanelFuncs, 0+1);
	
	CustomPanelFuncs[0].name:=nil;
	CustomPanelFuncs[0].func:=nil;

end.
