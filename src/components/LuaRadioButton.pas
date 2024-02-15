(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRadioButton;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateRadioButton(L: Plua_State): Integer; cdecl;
function IsRadioButton(L: Plua_State): Integer; cdecl;
function AsRadioButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TRadioButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaRadioButton = class(TRadioButton)
        LuaCtl: TVCLuaControl;
    end;
var
    RadioButtonFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;


function IsRadioButton(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TRadioButton);
end;
function AsRadioButton(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TRadioButton then
    lua_push(L, TRadioButton(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TRadioButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TRadioButton',v);
end;
function CreateRadioButton(L: Plua_State): Integer; cdecl;
var
	lRadioButton:TLuaRadioButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lRadioButton := TLuaRadioButton.Create(Parent);
	lRadioButton.Parent := TWinControl(Parent);
	lRadioButton.LuaCtl := TVCLuaControl.Create(lRadioButton as TComponent,L,nil,'TRadioButton');
	InitControl(L,lRadioButton,Name);
	CreateTableForKnownType(L,'TRadioButton',lRadioButton);
	Result := 1;
end;

begin
	SetLength(RadioButtonFuncs, 0+1);
	
	RadioButtonFuncs[0].name:=nil;
	RadioButtonFuncs[0].func:=nil;

end.
