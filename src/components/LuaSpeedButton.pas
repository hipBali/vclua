(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpeedButton;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Buttons, TypInfo, LuaVmt;

function CreateSpeedButton(L: Plua_State): Integer; cdecl;
function IsSpeedButton(L: Plua_State): Integer; cdecl;
function AsSpeedButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSpeedButton = class(TSpeedButton)
        LuaCtl: TVCLuaControl;
    end;
var
    SpeedButtonFuncs: TLuaVmt;
    SpeedButtonSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


function IsSpeedButton(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TSpeedButton);
end;
function AsSpeedButton(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TSpeedButton then
    lua_push(L, TSpeedButton(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TSpeedButton',v);
end;
function CreateSpeedButton(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lSpeedButton := TLuaSpeedButton.Create(Parent);
	lSpeedButton.Parent := TWinControl(Parent);
	lSpeedButton.LuaCtl := TVCLuaControl.Create(lSpeedButton as TComponent,L,nil,'TSpeedButton');
	InitControl(L,lSpeedButton,Name);
	CreateTableForKnownType(L,'TSpeedButton',lSpeedButton);
	Result := 1;
end;

begin
	SpeedButtonFuncs := TLuaVmt.Create;
	
	SpeedButtonSets := TLuaVmt.Create;
	
end.
