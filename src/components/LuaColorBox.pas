(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ColorBox, Controls, TypInfo;

function CreateColorBox(L: Plua_State): Integer; cdecl;
function IsColorBox(L: Plua_State): Integer; cdecl;
function AsColorBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorBox; pti: PTypeInfo = nil); overload; inline;
procedure ColorBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorBox = class(TColorBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomColorBoxFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


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
	ColorBoxToTable(L,-1,v);
end;
procedure ColorBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomColorBox');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lColorBox.LuaCtl := TVCLuaControl.Create(lColorBox as TComponent,L,@ColorBoxToTable);
	InitControl(L,lColorBox,Name);
	ColorBoxToTable(L, -1, lColorBox);
	Result := 1;
end;

begin
	SetLength(CustomColorBoxFuncs, 0+1);
	
	CustomColorBoxFuncs[0].name:=nil;
	CustomColorBoxFuncs[0].func:=nil;

end.
