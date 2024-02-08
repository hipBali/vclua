(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaActionList;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ActnList, Controls, TypInfo;

function CreateContainedAction(L: Plua_State): Integer; cdecl;
function IsContainedAction(L: Plua_State): Integer; cdecl;
function AsContainedAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TContainedAction; pti: PTypeInfo = nil); overload; inline;
procedure ContainedActionToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaContainedAction = class(TContainedAction)
        LuaCtl: TVCLuaControl;
    end;
var
    ContainedActionFuncs: aoluaL_Reg;

function CreateAction(L: Plua_State): Integer; cdecl;
function IsAction(L: Plua_State): Integer; cdecl;
function AsAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TAction; pti: PTypeInfo = nil); overload; inline;
procedure ActionToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaAction = class(TAction)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomActionFuncs: aoluaL_Reg;

function CreateActionList(L: Plua_State): Integer; cdecl;
function IsActionList(L: Plua_State): Integer; cdecl;
function AsActionList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TActionList; pti: PTypeInfo = nil); overload; inline;
procedure ActionListToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaActionList = class(TActionList)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomActionListFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_ContainedAction_Execute(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	ret := lContainedAction.Execute();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ContainedAction_GetParentComponent(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:TComponent;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	ret := lContainedAction.GetParentComponent();
	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function VCLua_ContainedAction_HasParent(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	ret := lContainedAction.HasParent();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ContainedAction_Update(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	ret := lContainedAction.Update();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Action_DoHint(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	HintStr:string;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	
	ret := lAction.DoHint(HintStr);
	lua_push(L,ret);
	lua_push(L,HintStr);
	Result := 2;
end;

function VCLua_Action_DoHint2(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	HintStr:string;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	HintStr := lua_toStringCP(L,2);
	ret := lAction.DoHint(HintStr);
	lua_push(L,ret);
	lua_push(L,HintStr);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
	Result := 1;
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
	ContainedActionToTable(L,-1,v);
end;
procedure ContainedActionToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TContainedAction');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lContainedAction.LuaCtl := TVCLuaControl.Create(lContainedAction as TComponent,L,@ContainedActionToTable);
	InitControl(L,lContainedAction,Name);
	ContainedActionToTable(L, -1, lContainedAction);
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
	ActionToTable(L,-1,v);
end;
procedure ActionToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomAction');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	ActionListToTable(L,-1,v);
end;
procedure ActionListToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomActionList');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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

begin
	SetLength(ContainedActionFuncs, 4+1);
	ContainedActionFuncs[0].name:='Execute';
	ContainedActionFuncs[0].func:=@VCLua_ContainedAction_Execute;
	ContainedActionFuncs[1].name:='GetParentComponent';
	ContainedActionFuncs[1].func:=@VCLua_ContainedAction_GetParentComponent;
	ContainedActionFuncs[2].name:='HasParent';
	ContainedActionFuncs[2].func:=@VCLua_ContainedAction_HasParent;
	ContainedActionFuncs[3].name:='Update';
	ContainedActionFuncs[3].func:=@VCLua_ContainedAction_Update;
	ContainedActionFuncs[4].name:=nil;
	ContainedActionFuncs[4].func:=nil;

	SetLength(CustomActionFuncs, 3+1);
	CustomActionFuncs[0].name:='DoHint';
	CustomActionFuncs[0].func:=@VCLua_Action_DoHint;
	CustomActionFuncs[1].name:='DoHint2';
	CustomActionFuncs[1].func:=@VCLua_Action_DoHint2;
	CustomActionFuncs[2].name:='Execute';
	CustomActionFuncs[2].func:=@VCLua_Action_Execute;
	CustomActionFuncs[3].name:=nil;
	CustomActionFuncs[3].func:=nil;

	SetLength(CustomActionListFuncs, 4+1);
	CustomActionListFuncs[0].name:='ActionByName';
	CustomActionListFuncs[0].func:=@VCLua_ActionList_ActionByName;
	CustomActionListFuncs[1].name:='ExecuteAction';
	CustomActionListFuncs[1].func:=@VCLua_ActionList_ExecuteAction;
	CustomActionListFuncs[2].name:='IndexOfName';
	CustomActionListFuncs[2].func:=@VCLua_ActionList_IndexOfName;
	CustomActionListFuncs[3].name:='UpdateAction';
	CustomActionListFuncs[3].func:=@VCLua_ActionList_UpdateAction;
	CustomActionListFuncs[4].name:=nil;
	CustomActionListFuncs[4].func:=nil;

end.
