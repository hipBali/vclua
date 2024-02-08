(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTimer;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateTimer(L: Plua_State): Integer; cdecl;
function IsTimer(L: Plua_State): Integer; cdecl;
function AsTimer(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTimer; pti: PTypeInfo = nil); overload; inline;
procedure TimerToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTimer = class(TTimer)
        LuaCtl: TVCLuaControl;
    end;
var
    TimerFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsTimer(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTimer);
end;
function AsTimer(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTimer then
    lua_push(L, TTimer(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTimer; pti: PTypeInfo);
begin
	TimerToTable(L,-1,v);
end;
procedure TimerToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TTimer');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateTimer(L: Plua_State): Integer; cdecl;
var
	lTimer:TLuaTimer;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTimer := TLuaTimer.Create(Parent);
	// := TWinControl(Parent);
	lTimer.LuaCtl := TVCLuaControl.Create(lTimer as TComponent,L,@TimerToTable);
	InitControl(L,lTimer,Name);
	TimerToTable(L, -1, lTimer);
	Result := 1;
end;

begin
	SetLength(TimerFuncs, 0+1);
	
	TimerFuncs[0].name:=nil;
	TimerFuncs[0].func:=nil;

end.
