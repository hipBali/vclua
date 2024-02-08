(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaIdleTimer;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateIdleTimer(L: Plua_State): Integer; cdecl;
function IsIdleTimer(L: Plua_State): Integer; cdecl;
function AsIdleTimer(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TIdleTimer; pti: PTypeInfo = nil); overload; inline;
procedure IdleTimerToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaIdleTimer = class(TIdleTimer)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomIdleTimerFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsIdleTimer(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TIdleTimer);
end;
function AsIdleTimer(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TIdleTimer then
    lua_push(L, TIdleTimer(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TIdleTimer; pti: PTypeInfo);
begin
	IdleTimerToTable(L,-1,v);
end;
procedure IdleTimerToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomIdleTimer');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateIdleTimer(L: Plua_State): Integer; cdecl;
var
	lIdleTimer:TLuaIdleTimer;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lIdleTimer := TLuaIdleTimer.Create(Parent);
	// := TWinControl(Parent);
	lIdleTimer.LuaCtl := TVCLuaControl.Create(lIdleTimer as TComponent,L,@IdleTimerToTable);
	InitControl(L,lIdleTimer,Name);
	IdleTimerToTable(L, -1, lIdleTimer);
	Result := 1;
end;

begin
	SetLength(CustomIdleTimerFuncs, 0+1);
	
	CustomIdleTimerFuncs[0].name:=nil;
	CustomIdleTimerFuncs[0].func:=nil;

end.
