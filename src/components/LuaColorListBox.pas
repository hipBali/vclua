(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorListBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ColorBox, Controls, TypInfo;

function CreateColorListBox(L: Plua_State): Integer; cdecl;
function IsColorListBox(L: Plua_State): Integer; cdecl;
function AsColorListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorListBox; pti: PTypeInfo = nil); overload; inline;
procedure ColorListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

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
	ColorListBoxToTable(L,-1,v);
end;
procedure ColorListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TColorListBox');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lColorListBox.LuaCtl := TVCLuaControl.Create(lColorListBox as TComponent,L,@ColorListBoxToTable);
	InitControl(L,lColorListBox,Name);
	ColorListBoxToTable(L, -1, lColorListBox);
	Result := 1;
end;

begin
	SetLength(ColorListBoxFuncs, 0+1);
	
	ColorListBoxFuncs[0].name:=nil;
	ColorListBoxFuncs[0].func:=nil;

end.
