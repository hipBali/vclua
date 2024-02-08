(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaUpDown;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateUpDown(L: Plua_State): Integer; cdecl;
function IsUpDown(L: Plua_State): Integer; cdecl;
function AsUpDown(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TUpDown; pti: PTypeInfo = nil); overload; inline;
procedure UpDownToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaUpDown = class(TUpDown)
        LuaCtl: TVCLuaControl;
    end;
var
    UpDownFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsUpDown(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TUpDown);
end;
function AsUpDown(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TUpDown then
    lua_push(L, TUpDown(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TUpDown; pti: PTypeInfo);
begin
	UpDownToTable(L,-1,v);
end;
procedure UpDownToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TUpDown');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateUpDown(L: Plua_State): Integer; cdecl;
var
	lUpDown:TLuaUpDown;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lUpDown := TLuaUpDown.Create(Parent);
	lUpDown.Parent := TWinControl(Parent);
	lUpDown.LuaCtl := TVCLuaControl.Create(lUpDown as TComponent,L,@UpDownToTable);
	InitControl(L,lUpDown,Name);
	UpDownToTable(L, -1, lUpDown);
	Result := 1;
end;

begin
	SetLength(UpDownFuncs, 0+1);
	
	UpDownFuncs[0].name:=nil;
	UpDownFuncs[0].func:=nil;

end.
