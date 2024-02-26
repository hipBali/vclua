(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ColorBox, TypInfo, LuaVmt;

function CreateColorBox(L: Plua_State): Integer; cdecl;
function IsColorBox(L: Plua_State): Integer; cdecl;
function AsColorBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorBox = class(TColorBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomColorBoxFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, Graphics;

function VCLua_ColorBox_Colors(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	Index:Integer;
	ret:TColor;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lColorBox.Colors[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'Colors', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_ColorNames(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lColorBox.ColorNames[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorNames', E.ClassName, E.Message);
	end;
end;

function IsColorBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TColorBox);
end;
function AsColorBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TColorBox then
    lua_push(L, TColorBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TColorBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomColorBox',v);
end;
function CreateColorBox(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lColorBox := TLuaColorBox.Create(Parent);
	lColorBox.Parent := TWinControl(Parent);
	lColorBox.LuaCtl := TVCLuaControl.Create(lColorBox as TComponent,L,nil,'TCustomColorBox');
	InitControl(L,lColorBox,Name);
	CreateTableForKnownType(L,'TCustomColorBox',lColorBox);
	Result := 1;
end;

begin
	CustomColorBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'Colors', @VCLua_ColorBox_Colors);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'ColorNames', @VCLua_ColorBox_ColorNames);
end.
