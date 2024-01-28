(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaActionList;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ActnList, Controls, TypInfo;

function CreateAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TAction; pti: PTypeInfo = nil); overload; inline;
procedure ActionToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaAction = class(TAction)
        LuaCtl: TVCLuaControl;
    end;

function CreateActionList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TActionList; pti: PTypeInfo = nil); overload; inline;
procedure ActionListToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaActionList = class(TActionList)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Action_DoHint(L: Plua_State): Integer; cdecl;
var 
	lAction:TLuaAction;
	HintStr:string;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	
	ret := lAction.DoHint(HintStr);
	lua_pushboolean(L,ret);
	lua_pushStringCP(L,HintStr);
	Result := 2;
end;

function VCLua_Action_Execute(L: Plua_State): Integer; cdecl;
var 
	lAction:TLuaAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	ret := lAction.Execute();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ActionList_ActionByName(L: Plua_State): Integer; cdecl;
var 
	lActionList:TLuaActionList;
	ActionName:string;
	ret:TContainedAction;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	ActionName := lua_toStringCP(L,2);
	ret := lActionList.ActionByName(ActionName);
	ActionToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ActionList_ExecuteAction(L: Plua_State): Integer; cdecl;
var 
	lActionList:TLuaActionList;
	Action:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	Action := TBasicAction(GetLuaObject(L,2));
	ret := lActionList.ExecuteAction(Action);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ActionList_IndexOfName(L: Plua_State): Integer; cdecl;
var 
	lActionList:TLuaActionList;
	ActionName:string;
	ret:integer;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	ActionName := lua_toStringCP(L,2);
	ret := lActionList.IndexOfName(ActionName);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_ActionList_UpdateAction(L: Plua_State): Integer; cdecl;
var 
	lActionList:TLuaActionList;
	Action:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	Action := TBasicAction(GetLuaObject(L,2));
	ret := lActionList.UpdateAction(Action);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TAction; pti: PTypeInfo);
begin
	ActionToTable(L,-1,v);
end;
procedure ActionToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'DoHint', @VCLua_Action_DoHint);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_Action_Execute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateAction(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lAction := TLuaAction.Create(Parent);
	// := TWinControl(Parent);
	lAction.LuaCtl := TVCLuaControl.Create(lAction as TComponent,L,@ActionToTable);
	InitControl(L,lAction,Name);
	ActionToTable(L, -1, lAction);
	Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TActionList; pti: PTypeInfo);
begin
	ActionListToTable(L,-1,v);
end;
procedure ActionListToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'ActionByName', @VCLua_ActionList_ActionByName);
	LuaSetTableFunction(L, Index, 'ExecuteAction', @VCLua_ActionList_ExecuteAction);
	LuaSetTableFunction(L, Index, 'IndexOfName', @VCLua_ActionList_IndexOfName);
	LuaSetTableFunction(L, Index, 'UpdateAction', @VCLua_ActionList_UpdateAction);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateActionList(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lActionList := TLuaActionList.Create(Parent);
	// := TWinControl(Parent);
	lActionList.LuaCtl := TVCLuaControl.Create(lActionList as TComponent,L,@ActionListToTable);
	InitControl(L,lActionList,Name);
	ActionListToTable(L, -1, lActionList);
	Result := 1;
end;

end.
