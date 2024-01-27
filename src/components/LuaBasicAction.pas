(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBasicAction;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Controls;

function CreateBasicAction(L: Plua_State): Integer; cdecl;
procedure BasicActionToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBasicAction = class(TBasicAction)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
	Result := 1;
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
