(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBasicAction;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Controls, TypInfo;

function CreateBasicAction(L: Plua_State): Integer; cdecl;
function IsBasicAction(L: Plua_State): Integer; cdecl;
function AsBasicAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBasicAction; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBasicAction = class(TBasicAction)
        LuaCtl: TVCLuaControl;
    end;
var
    BasicActionFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

function VCLua_BasicAction_HandlesTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	luaL_check(L,2,@Target);
	try
		ret := lBasicAction.HandlesTarget(Target);
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'HandlesTarget', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_BasicAction_UpdateTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	luaL_check(L,2,@Target);
	try
		lBasicAction.UpdateTarget(Target);
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'UpdateTarget', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_BasicAction_ExecuteTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	luaL_check(L,2,@Target);
	try
		lBasicAction.ExecuteTarget(Target);
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'ExecuteTarget', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_BasicAction_Execute(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	try
		ret := lBasicAction.Execute();
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'Execute', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_BasicAction_Update(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	try
		ret := lBasicAction.Update();
	except
		on E: Exception do
			CallError(L, 'BasicAction', 'Update', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function IsBasicAction(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TBasicAction);
end;
function AsBasicAction(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TBasicAction then
    lua_push(L, TBasicAction(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TBasicAction; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBasicAction',v);
end;
function CreateBasicAction(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBasicAction := TLuaBasicAction.Create(Parent);
	// := TWinControl(Parent);
	lBasicAction.LuaCtl := TVCLuaControl.Create(lBasicAction as TComponent,L,nil,'TBasicAction');
	InitControl(L,lBasicAction,Name);
	CreateTableForKnownType(L,'TBasicAction',lBasicAction);
	Result := 1;
end;

begin
	SetLength(BasicActionFuncs, 5+1);
	BasicActionFuncs[0].name:='HandlesTarget';
	BasicActionFuncs[0].func:=@VCLua_BasicAction_HandlesTarget;
	BasicActionFuncs[1].name:='UpdateTarget';
	BasicActionFuncs[1].func:=@VCLua_BasicAction_UpdateTarget;
	BasicActionFuncs[2].name:='ExecuteTarget';
	BasicActionFuncs[2].func:=@VCLua_BasicAction_ExecuteTarget;
	BasicActionFuncs[3].name:='Execute';
	BasicActionFuncs[3].func:=@VCLua_BasicAction_Execute;
	BasicActionFuncs[4].name:='Update';
	BasicActionFuncs[4].func:=@VCLua_BasicAction_Update;
	BasicActionFuncs[5].name:=nil;
	BasicActionFuncs[5].func:=nil;

end.
