(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCollectionPropertyEditorForm;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, CollectionPropEditForm;

procedure lua_push(L: Plua_State; const v: TCollectionPropertyEditorForm; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCollectionPropertyEditorForm = class(TCollectionPropertyEditorForm)
    end;
var
    CollectionPropertyEditorFormFuncs: TLuaVmt;
    CollectionPropertyEditorFormSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, ActnList, Classes, ComCtrls, Forms, LuaActionList, LuaCollection, LuaListBox, LuaPersistent, LuaToolBar, StdCtrls;

function VCLua_CollectionPropertyEditorForm_VCLuaSetactAdd(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.actAdd := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetactAdd', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetactAdd(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.actAdd;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetactAdd', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetactDel(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.actDel := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetactDel', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetactDel(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.actDel;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetactDel', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetactMoveUp(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.actMoveUp := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetactMoveUp', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetactMoveUp(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.actMoveUp;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetactMoveUp', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetactMoveDown(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.actMoveDown := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetactMoveDown', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetactMoveDown(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TAction;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.actMoveDown;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetactMoveDown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetActionList1(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TActionList;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.ActionList1 := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetActionList1', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetActionList1(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TActionList;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.ActionList1;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetActionList1', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetCollectionListBox(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TListBox;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.CollectionListBox := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetCollectionListBox', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetCollectionListBox(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TListBox;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.CollectionListBox;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetCollectionListBox', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetToolBar1(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TToolBar;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.ToolBar1 := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetToolBar1', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetToolBar1(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TToolBar;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.ToolBar1;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetToolBar1', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetAddButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.AddButton := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetAddButton', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetAddButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.AddButton;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetAddButton', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetDeleteButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.DeleteButton := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetDeleteButton', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetDeleteButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.DeleteButton;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetDeleteButton', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetDividerToolButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.DividerToolButton := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetDividerToolButton', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetDividerToolButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.DividerToolButton;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetDividerToolButton', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetMoveUpButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.MoveUpButton := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetMoveUpButton', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetMoveUpButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.MoveUpButton;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetMoveUpButton', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaSetMoveDownButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	val:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionPropertyEditorForm.MoveDownButton := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetMoveDownButton', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetMoveDownButton(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TToolButton;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.MoveDownButton;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetMoveDownButton', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_actAddExecute(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCollectionPropertyEditorForm.actAddExecute(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'actAddExecute', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_actDelExecute(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCollectionPropertyEditorForm.actDelExecute(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'actDelExecute', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_actMoveUpDownExecute(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCollectionPropertyEditorForm.actMoveUpDownExecute(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'actMoveUpDownExecute', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_CollectionListBoxClick(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCollectionPropertyEditorForm.CollectionListBoxClick(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'CollectionListBoxClick', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_FormClose(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
	CloseAction:TCloseAction;
begin
	CheckArg(L, 2);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCollectionPropertyEditorForm.FormClose(Sender,CloseAction);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'FormClose', E.ClassName, E.Message);
	end;
	lua_push(L,CloseAction,TypeInfo(CloseAction));
end;

function VCLua_CollectionPropertyEditorForm_FormClose2(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
	CloseAction:TCloseAction;
begin
	CheckArg(L, 3);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@CloseAction,TypeInfo(TCloseAction));
	try
		lCollectionPropertyEditorForm.FormClose(Sender,CloseAction);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'FormClose', E.ClassName, E.Message);
	end;
	lua_push(L,CloseAction,TypeInfo(CloseAction));
end;

function VCLua_CollectionPropertyEditorForm_FormCreate(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCollectionPropertyEditorForm.FormCreate(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'FormCreate', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_FormDestroy(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCollectionPropertyEditorForm.FormDestroy(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'FormDestroy', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_SetCollection(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	NewCollection:TCollection;
	NewOwnerPersistent:TPersistent;
	NewPropName:String;
begin
	CheckArg(L, 4);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	luaL_check(L,2,@NewCollection);
	luaL_check(L,3,@NewOwnerPersistent);
	luaL_check(L,4,@NewPropName);
	try
		lCollectionPropertyEditorForm.SetCollection(NewCollection,NewOwnerPersistent,NewPropName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'SetCollection', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_UpdateButtons(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
begin
	CheckArg(L, 1);
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObject(L, 1));
	try
		lCollectionPropertyEditorForm.UpdateButtons();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'UpdateButtons', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetCollection(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TCollection;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.Collection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetCollection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetOwnerPersistent(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:TPersistent;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.OwnerPersistent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetOwnerPersistent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionPropertyEditorForm_VCLuaGetPropertyName(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditorForm:TLuaCollectionPropertyEditorForm;
	ret:String;
begin
	lCollectionPropertyEditorForm := TLuaCollectionPropertyEditorForm(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionPropertyEditorForm.PropertyName;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditorForm', 'GetPropertyName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TCollectionPropertyEditorForm; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCollectionPropertyEditorForm',v);
end;

begin
	CollectionPropertyEditorFormFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'actAdd', @VCLua_CollectionPropertyEditorForm_VCLuaGetactAdd, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'actDel', @VCLua_CollectionPropertyEditorForm_VCLuaGetactDel, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'actMoveUp', @VCLua_CollectionPropertyEditorForm_VCLuaGetactMoveUp, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'actMoveDown', @VCLua_CollectionPropertyEditorForm_VCLuaGetactMoveDown, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'ActionList1', @VCLua_CollectionPropertyEditorForm_VCLuaGetActionList1, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'CollectionListBox', @VCLua_CollectionPropertyEditorForm_VCLuaGetCollectionListBox, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'ToolBar1', @VCLua_CollectionPropertyEditorForm_VCLuaGetToolBar1, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'AddButton', @VCLua_CollectionPropertyEditorForm_VCLuaGetAddButton, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'DeleteButton', @VCLua_CollectionPropertyEditorForm_VCLuaGetDeleteButton, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'DividerToolButton', @VCLua_CollectionPropertyEditorForm_VCLuaGetDividerToolButton, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'MoveUpButton', @VCLua_CollectionPropertyEditorForm_VCLuaGetMoveUpButton, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'MoveDownButton', @VCLua_CollectionPropertyEditorForm_VCLuaGetMoveDownButton, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'actAddExecute', @VCLua_CollectionPropertyEditorForm_actAddExecute);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'actDelExecute', @VCLua_CollectionPropertyEditorForm_actDelExecute);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'actMoveUpDownExecute', @VCLua_CollectionPropertyEditorForm_actMoveUpDownExecute);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'CollectionListBoxClick', @VCLua_CollectionPropertyEditorForm_CollectionListBoxClick);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'FormClose', @VCLua_CollectionPropertyEditorForm_FormClose);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'FormClose2', @VCLua_CollectionPropertyEditorForm_FormClose2);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'FormCreate', @VCLua_CollectionPropertyEditorForm_FormCreate);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'FormDestroy', @VCLua_CollectionPropertyEditorForm_FormDestroy);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'SetCollection', @VCLua_CollectionPropertyEditorForm_SetCollection);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'UpdateButtons', @VCLua_CollectionPropertyEditorForm_UpdateButtons);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'Collection', @VCLua_CollectionPropertyEditorForm_VCLuaGetCollection, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'OwnerPersistent', @VCLua_CollectionPropertyEditorForm_VCLuaGetOwnerPersistent, mfCall);
	TLuaMethodInfo.Create(CollectionPropertyEditorFormFuncs, 'PropertyName', @VCLua_CollectionPropertyEditorForm_VCLuaGetPropertyName, mfCall);
	CollectionPropertyEditorFormSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'actAdd', @VCLua_CollectionPropertyEditorForm_VCLuaSetactAdd, mfCall, TypeInfo(TAction));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'actDel', @VCLua_CollectionPropertyEditorForm_VCLuaSetactDel, mfCall, TypeInfo(TAction));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'actMoveUp', @VCLua_CollectionPropertyEditorForm_VCLuaSetactMoveUp, mfCall, TypeInfo(TAction));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'actMoveDown', @VCLua_CollectionPropertyEditorForm_VCLuaSetactMoveDown, mfCall, TypeInfo(TAction));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'ActionList1', @VCLua_CollectionPropertyEditorForm_VCLuaSetActionList1, mfCall, TypeInfo(TActionList));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'CollectionListBox', @VCLua_CollectionPropertyEditorForm_VCLuaSetCollectionListBox, mfCall, TypeInfo(TListBox));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'ToolBar1', @VCLua_CollectionPropertyEditorForm_VCLuaSetToolBar1, mfCall, TypeInfo(TToolBar));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'AddButton', @VCLua_CollectionPropertyEditorForm_VCLuaSetAddButton, mfCall, TypeInfo(TToolButton));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'DeleteButton', @VCLua_CollectionPropertyEditorForm_VCLuaSetDeleteButton, mfCall, TypeInfo(TToolButton));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'DividerToolButton', @VCLua_CollectionPropertyEditorForm_VCLuaSetDividerToolButton, mfCall, TypeInfo(TToolButton));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'MoveUpButton', @VCLua_CollectionPropertyEditorForm_VCLuaSetMoveUpButton, mfCall, TypeInfo(TToolButton));
	TLuaMethodInfo.Create(CollectionPropertyEditorFormSets, 'MoveDownButton', @VCLua_CollectionPropertyEditorForm_VCLuaSetMoveDownButton, mfCall, TypeInfo(TToolButton));
end.
