(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaActionList;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ActnList;

function CreateContainedAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TContainedAction; pti: PTypeInfo = nil); overload; inline;

type
    TLuaContainedAction = class(TContainedAction)
        LuaCtl: TVCLuaControl;
    end;
var
    ContainedActionFuncs: TLuaVmt;
    ContainedActionSets: TLuaVmt;

function CreateAction(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TAction; pti: PTypeInfo = nil); overload; inline;

type
    TLuaAction = class(TAction)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomActionFuncs: TLuaVmt;
    CustomActionSets: TLuaVmt;

function CreateActionList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TActionList; pti: PTypeInfo = nil); overload; inline;

type
    TLuaActionList = class(TActionList)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomActionListFuncs: TLuaVmt;
    CustomActionListSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, ImgList, LCLType, LuaActnListEvents, LuaClassesEvents, LuaEvent, LuaImageList;

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

function VCLua_ContainedAction_VCLuaSetActionList(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	val:TCustomActionList;
begin
	CheckArg(L, 2);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lContainedAction.ActionList := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'ActionList', E.ClassName, E.Message);
	end;
end;

function VCLua_ContainedAction_VCLuaGetActionList(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:TCustomActionList;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	try
		ret := lContainedAction.ActionList;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'ActionList', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ContainedAction_VCLuaSetIndex(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	val:Integer;
begin
	CheckArg(L, 2);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lContainedAction.Index := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'Index', E.ClassName, E.Message);
	end;
end;

function VCLua_ContainedAction_VCLuaGetIndex(L: Plua_State): Integer; cdecl;
var
	lContainedAction:TLuaContainedAction;
	ret:Integer;
begin
	CheckArg(L, 1);
	lContainedAction := TLuaContainedAction(GetLuaObject(L, 1));
	try
		ret := lContainedAction.Index;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ContainedAction', 'Index', E.ClassName, E.Message);
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

function VCLua_Action_VCLuaSetAutoCheck(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:Boolean;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.AutoCheck := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'AutoCheck', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetAutoCheck(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.AutoCheck;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'AutoCheck', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetCaption(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:TTranslateString;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.Caption := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'Caption', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetCaption(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:TTranslateString;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.Caption;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'Caption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetChecked(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:Boolean;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.Checked := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'Checked', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetChecked(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.Checked;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'Checked', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetDisableIfNoHandler(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:Boolean;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.DisableIfNoHandler := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'DisableIfNoHandler', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetDisableIfNoHandler(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.DisableIfNoHandler;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'DisableIfNoHandler', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetEnabled(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:Boolean;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.Enabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'Enabled', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetEnabled(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.Enabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'Enabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetGroupIndex(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:Integer;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.GroupIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'GroupIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetGroupIndex(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:Integer;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.GroupIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'GroupIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetHelpContext(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:THelpContext;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.HelpContext := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'HelpContext', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetHelpContext(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:THelpContext;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.HelpContext;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'HelpContext', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetHelpKeyword(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:string;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.HelpKeyword := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'HelpKeyword', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetHelpKeyword(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:string;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.HelpKeyword;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'HelpKeyword', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetHelpType(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:THelpType;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(THelpType));
	try
		lAction.HelpType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'HelpType', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetHelpType(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:THelpType;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.HelpType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'HelpType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Action_VCLuaSetHint(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:TTranslateString;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.Hint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'Hint', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetHint(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:TTranslateString;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.Hint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'Hint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetImageIndex(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:TImageIndex;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.ImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'ImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:TImageIndex;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.ImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'ImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetOnHint(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lAction.OnHint));
	lAction.OnHint := TLuaEvent.Factory<THintEvent,TLuaHintEvent>(L);
	Result := 0;
end;

function VCLua_Action_VCLuaSetSecondaryShortCuts(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:TShortCutList;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.SecondaryShortCuts := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'SecondaryShortCuts', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetSecondaryShortCuts(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:TShortCutList;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.SecondaryShortCuts;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'SecondaryShortCuts', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Action_VCLuaSetShortCut(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:TShortCut;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.ShortCut := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'ShortCut', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetShortCut(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:TShortCut;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.ShortCut;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'ShortCut', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Action_VCLuaSetVisible(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	val:Boolean;
begin
	CheckArg(L, 2);
	lAction := TLuaAction(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lAction.Visible := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Action', 'Visible', E.ClassName, E.Message);
	end;
end;

function VCLua_Action_VCLuaGetVisible(L: Plua_State): Integer; cdecl;
var
	lAction:TLuaAction;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lAction := TLuaAction(GetLuaObject(L, 1));
	try
		ret := lAction.Visible;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Action', 'Visible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ActionList_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lActionList.OnChange));
	lActionList.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_ActionList_VCLuaSetOnExecute(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lActionList.OnExecute));
	lActionList.OnExecute := TLuaEvent.Factory<TActionEvent,TLuaActionEvent>(L);
	Result := 0;
end;

function VCLua_ActionList_VCLuaSetOnUpdate(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lActionList.OnUpdate));
	lActionList.OnUpdate := TLuaEvent.Factory<TActionEvent,TLuaActionEvent>(L);
	Result := 0;
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

function VCLua_ActionList_VCLuaGetActionCount(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	ret:Integer;
begin
	CheckArg(L, 1);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	try
		ret := lActionList.ActionCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'ActionCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ActionList_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	val:TCustomImageList;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lActionList.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'Images', E.ClassName, E.Message);
	end;
end;

function VCLua_ActionList_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	try
		ret := lActionList.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'Images', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ActionList_VCLuaSetState(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	val:TActionListState;
begin
	CheckArg(L, 2);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TActionListState));
	try
		lActionList.State := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'State', E.ClassName, E.Message);
	end;
end;

function VCLua_ActionList_VCLuaGetState(L: Plua_State): Integer; cdecl;
var
	lActionList:TLuaActionList;
	ret:TActionListState;
begin
	CheckArg(L, 1);
	lActionList := TLuaActionList(GetLuaObject(L, 1));
	try
		ret := lActionList.State;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ActionList', 'State', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
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
	TLuaMethodInfo.Create(ContainedActionFuncs, 'ActionList', @VCLua_ContainedAction_VCLuaGetActionList, mfCall);
	TLuaMethodInfo.Create(ContainedActionFuncs, 'Index', @VCLua_ContainedAction_VCLuaGetIndex, mfCall);
	ContainedActionSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ContainedActionSets, 'ActionList', @VCLua_ContainedAction_VCLuaSetActionList, mfCall);
	TLuaMethodInfo.Create(ContainedActionSets, 'Index', @VCLua_ContainedAction_VCLuaSetIndex, mfCall);
	CustomActionFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomActionFuncs, 'DoHint', @VCLua_Action_DoHint);
	TLuaMethodInfo.Create(CustomActionFuncs, 'DoHint2', @VCLua_Action_DoHint2);
	TLuaMethodInfo.Create(CustomActionFuncs, 'Execute', @VCLua_Action_Execute);
	TLuaMethodInfo.Create(CustomActionFuncs, 'AutoCheck', @VCLua_Action_VCLuaGetAutoCheck, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'Caption', @VCLua_Action_VCLuaGetCaption, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'Checked', @VCLua_Action_VCLuaGetChecked, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'DisableIfNoHandler', @VCLua_Action_VCLuaGetDisableIfNoHandler, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'Enabled', @VCLua_Action_VCLuaGetEnabled, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'GroupIndex', @VCLua_Action_VCLuaGetGroupIndex, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'HelpContext', @VCLua_Action_VCLuaGetHelpContext, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'HelpKeyword', @VCLua_Action_VCLuaGetHelpKeyword, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'HelpType', @VCLua_Action_VCLuaGetHelpType, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'Hint', @VCLua_Action_VCLuaGetHint, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'ImageIndex', @VCLua_Action_VCLuaGetImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'SecondaryShortCuts', @VCLua_Action_VCLuaGetSecondaryShortCuts, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'ShortCut', @VCLua_Action_VCLuaGetShortCut, mfCall);
	TLuaMethodInfo.Create(CustomActionFuncs, 'Visible', @VCLua_Action_VCLuaGetVisible, mfCall);
	CustomActionSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomActionSets, 'AutoCheck', @VCLua_Action_VCLuaSetAutoCheck, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'Caption', @VCLua_Action_VCLuaSetCaption, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'Checked', @VCLua_Action_VCLuaSetChecked, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'DisableIfNoHandler', @VCLua_Action_VCLuaSetDisableIfNoHandler, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'Enabled', @VCLua_Action_VCLuaSetEnabled, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'GroupIndex', @VCLua_Action_VCLuaSetGroupIndex, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'HelpContext', @VCLua_Action_VCLuaSetHelpContext, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'HelpKeyword', @VCLua_Action_VCLuaSetHelpKeyword, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'HelpType', @VCLua_Action_VCLuaSetHelpType, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'Hint', @VCLua_Action_VCLuaSetHint, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'ImageIndex', @VCLua_Action_VCLuaSetImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'OnHint', @VCLua_Action_VCLuaSetOnHint, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'SecondaryShortCuts', @VCLua_Action_VCLuaSetSecondaryShortCuts, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'ShortCut', @VCLua_Action_VCLuaSetShortCut, mfCall);
	TLuaMethodInfo.Create(CustomActionSets, 'Visible', @VCLua_Action_VCLuaSetVisible, mfCall);
	CustomActionListFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomActionListFuncs, 'ActionByName', @VCLua_ActionList_ActionByName);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'ExecuteAction', @VCLua_ActionList_ExecuteAction);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'IndexOfName', @VCLua_ActionList_IndexOfName);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'UpdateAction', @VCLua_ActionList_UpdateAction);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'Actions', @VCLua_ActionList_Actions);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'ActionCount', @VCLua_ActionList_VCLuaGetActionCount, mfCall);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'Images', @VCLua_ActionList_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomActionListFuncs, 'State', @VCLua_ActionList_VCLuaGetState, mfCall);
	CustomActionListSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomActionListSets, 'OnChange', @VCLua_ActionList_VCLuaSetOnChange, mfCall);
	TLuaMethodInfo.Create(CustomActionListSets, 'OnExecute', @VCLua_ActionList_VCLuaSetOnExecute, mfCall);
	TLuaMethodInfo.Create(CustomActionListSets, 'OnUpdate', @VCLua_ActionList_VCLuaSetOnUpdate, mfCall);
	TLuaMethodInfo.Create(CustomActionListSets, 'Images', @VCLua_ActionList_VCLuaSetImages, mfCall);
	TLuaMethodInfo.Create(CustomActionListSets, 'State', @VCLua_ActionList_VCLuaSetState, mfCall);
end.
