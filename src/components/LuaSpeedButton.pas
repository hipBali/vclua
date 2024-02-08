(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpeedButton;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Buttons, Controls, TypInfo;

function CreateSpeedButton(L: Plua_State): Integer; cdecl;
function IsSpeedButton(L: Plua_State): Integer; cdecl;
function AsSpeedButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo = nil); overload; inline;
procedure SpeedButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSpeedButton = class(TSpeedButton)
        LuaCtl: TVCLuaControl;
    end;
var
    SpeedButtonFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


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
	SpeedButtonToTable(L,-1,v);
end;
procedure SpeedButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TSpeedButton');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lSpeedButton.LuaCtl := TVCLuaControl.Create(lSpeedButton as TComponent,L,@SpeedButtonToTable);
	InitControl(L,lSpeedButton,Name);
	SpeedButtonToTable(L, -1, lSpeedButton);
	Result := 1;
end;

begin
	SetLength(SpeedButtonFuncs, 0+1);
	
	SpeedButtonFuncs[0].name:=nil;
	SpeedButtonFuncs[0].func:=nil;

end.
