(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorListBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ColorBox, Controls, TypInfo;

function CreateColorListBox(L: Plua_State): Integer; cdecl;
function IsColorListBox(L: Plua_State): Integer; cdecl;
function AsColorListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorListBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorListBox = class(TColorListBox)
        LuaCtl: TVCLuaControl;
    end;
var
    ColorListBoxFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsColorListBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TColorListBox);
end;
function AsColorListBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TColorListBox then
    lua_push(L, TColorListBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TColorListBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TColorListBox',v);
end;
function CreateColorListBox(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lColorListBox := TLuaColorListBox.Create(Parent);
	lColorListBox.Parent := TWinControl(Parent);
	lColorListBox.LuaCtl := TVCLuaControl.Create(lColorListBox as TComponent,L,nil,'TColorListBox');
	InitControl(L,lColorListBox,Name);
	CreateTableForKnownType(L,'TColorListBox',lColorListBox);
	Result := 1;
end;

begin
	SetLength(ColorListBoxFuncs, 0+1);
	
	ColorListBoxFuncs[0].name:=nil;
	ColorListBoxFuncs[0].func:=nil;

end.
