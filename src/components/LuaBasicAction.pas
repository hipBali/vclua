(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBasicAction;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Controls, TypInfo;

function CreateBasicAction(L: Plua_State): Integer; cdecl;
function IsBasicAction(L: Plua_State): Integer; cdecl;
function AsBasicAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBasicAction; pti: PTypeInfo = nil); overload; inline;
procedure BasicActionToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBasicAction = class(TBasicAction)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_BasicAction_HandlesTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	Target := TObject(GetLuaObject(L,2));
	ret := lBasicAction.HandlesTarget(Target);
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
	Target := TObject(GetLuaObject(L,2));
	lBasicAction.UpdateTarget(Target);
	
	Result := 0;
end;

function VCLua_BasicAction_ExecuteTarget(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	Target:TObject;
begin
	CheckArg(L, 2);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	Target := TObject(GetLuaObject(L,2));
	lBasicAction.ExecuteTarget(Target);
	
	Result := 0;
end;

function VCLua_BasicAction_Execute(L: Plua_State): Integer; cdecl;
var
	lBasicAction:TLuaBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lBasicAction := TLuaBasicAction(GetLuaObject(L, 1));
	ret := lBasicAction.Execute();
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
	ret := lBasicAction.Update();
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
	BasicActionToTable(L,-1,v);
end;
procedure BasicActionToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'HandlesTarget', @VCLua_BasicAction_HandlesTarget);
	LuaSetTableFunction(L, Index, 'UpdateTarget', @VCLua_BasicAction_UpdateTarget);
	LuaSetTableFunction(L, Index, 'ExecuteTarget', @VCLua_BasicAction_ExecuteTarget);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_BasicAction_Execute);
	LuaSetTableFunction(L, Index, 'Update', @VCLua_BasicAction_Update);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lBasicAction.LuaCtl := TVCLuaControl.Create(lBasicAction as TComponent,L,@BasicActionToTable);
	InitControl(L,lBasicAction,Name);
	BasicActionToTable(L, -1, lBasicAction);
	Result := 1;
end;

end.
