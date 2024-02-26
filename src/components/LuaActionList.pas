(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaActionList;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ActnList, TypInfo, LuaVmt;

function CreateContainedAction(L: Plua_State): Integer; cdecl;
function IsContainedAction(L: Plua_State): Integer; cdecl;
function AsContainedAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TContainedAction; pti: PTypeInfo = nil); overload; inline;

type
    TLuaContainedAction = class(TContainedAction)
        LuaCtl: TVCLuaControl;
    end;
var
    ContainedActionFuncs: TLuaVmt;

function CreateAction(L: Plua_State): Integer; cdecl;
function IsAction(L: Plua_State): Integer; cdecl;
function AsAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TAction; pti: PTypeInfo = nil); overload; inline;

type
    TLuaAction = class(TAction)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomActionFuncs: TLuaVmt;

function CreateActionList(L: Plua_State): Integer; cdecl;
function IsActionList(L: Plua_State): Integer; cdecl;
function AsActionList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TActionList; pti: PTypeInfo = nil); overload; inline;

type
    TLuaActionList = class(TActionList)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomActionListFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_ContainedAction_Execute(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	try
		ret := lContainedAction.Execute();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'Execute', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ContainedAction_GetParentComponent(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	try
		ret := lContainedAction.GetParentComponent();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'GetParentComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ContainedAction_HasParent(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	try
		ret := lContainedAction.HasParent();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'HasParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ContainedAction_Update(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	try
		ret := lContainedAction.Update();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'Update', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_DoHint(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	HintStr:string;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.DoHint(HintStr);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Action', 'DoHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,HintStr);
end;

function VCLua_Action_DoHint2(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	HintStr:string;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@HintStr);
	try
		ret := lAction.DoHint(HintStr);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'Action', 'DoHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,HintStr);
end;

function VCLua_Action_Execute(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.Execute();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'Execute', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ActionList_ActionByName(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	ActionName:string;
	ret:TContainedAction;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	luaL_check(L,2,@ActionName);
	try
		ret := lActionList.ActionByName(ActionName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'ActionByName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ActionList_ExecuteAction(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	Action:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	luaL_check(L,2,@Action);
	try
		ret := lActionList.ExecuteAction(Action);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'ExecuteAction', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ActionList_IndexOfName(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	ActionName:string;
	ret:integer;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	luaL_check(L,2,@ActionName);
	try
		ret := lActionList.IndexOfName(ActionName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'IndexOfName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ActionList_UpdateAction(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	Action:TBasicAction;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	luaL_check(L,2,@Action);
	try
		ret := lActionList.UpdateAction(Action);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'UpdateAction', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ActionList_Actions(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	Index:Integer;
	ret:TContainedAction;
begin
	CheckArg(L, 2, 3);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lActionList.Actions[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lActionList.Actions[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'Actions', E.ClassName, E.Message);
	end;
end;

function IsContainedAction(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TContainedAction);
end;
function AsContainedAction(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TContainedAction then
    lua_push(L, TContainedAction(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TContainedAction; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TContainedAction',v);
end;
function CreateContainedAction(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lContainedAction := TLuaContainedAction.Create(Parent);
	// := TWinControl(Parent);
	lContainedAction.LuaCtl := TVCLuaControl.Create(lContainedAction as TComponent,L,nil,'TContainedAction');
	InitControl(L,lContainedAction,Name);
	CreateTableForKnownType(L,'TContainedAction',lContainedAction);
	Result := 1;
end;

function IsAction(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TAction);
end;
function AsAction(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TAction then
    lua_push(L, TAction(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TAction; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomAction',v);
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
	lAction.LuaCtl := TVCLuaControl.Create(lAction as TComponent,L,nil,'TCustomAction');
	InitControl(L,lAction,Name);
	CreateTableForKnownType(L,'TCustomAction',lAction);
	Result := 1;
end;

function IsActionList(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TActionList);
end;
function AsActionList(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TActionList then
    lua_push(L, TActionList(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TActionList; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomActionList',v);
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
	lActionList.LuaCtl := TVCLuaControl.Create(lActionList as TComponent,L,nil,'TCustomActionList');
	InitControl(L,lActionList,Name);
	CreateTableForKnownType(L,'TCustomActionList',lActionList);
	Result := 1;
end;

begin
	ContainedActionFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ContainedActionFuncs, 'Execute', @VCLua_ContainedAction_Execute);
	TLuaMethodInfo.Create(ContainedActionFuncs, 'GetParentComponent', @VCLua_ContainedAction_GetParentComponent);
	TLuaMethodInfo.Create(ContainedActionFuncs, 'HasParent', @VCLua_ContainedAction_HasParent);
	TLuaMethodInfo.Create(ContainedActionFuncs, 'Update', @VCLua_ContainedAction_Update);
	CustomActionFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomActionFuncs, 'DoHint', @VCLua_Action_DoHint);
	TLuaMethodInfo.Create(CustomActionFuncs, 'DoHint2', @VCLua_Action_DoHint2);
	TLuaMethodInfo.Create(CustomActionFuncs, 'Execute', @VCLua_Action_Execute);
	CustomActionListFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomActionListFuncs, 'ActionByName', @VCLua_ActionList_ActionByName);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'ExecuteAction', @VCLua_ActionList_ExecuteAction);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'IndexOfName', @VCLua_ActionList_IndexOfName);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'UpdateAction', @VCLua_ActionList_UpdateAction);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'Actions', @VCLua_ActionList_Actions);
end.
