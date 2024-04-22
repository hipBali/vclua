(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPropEdits;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, PropEdits;

procedure lua_push(L: Plua_State; const v: TPropertyEditorHook; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPropertyEditorHook = class(TPropertyEditorHook)
    end;
var
    PropertyEditorHookFuncs: TLuaVmt;
    PropertyEditorHookSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TPropertyEditor; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPropertyEditor = class(TPropertyEditor)
    end;
var
    PropertyEditorFuncs: TLuaVmt;
    PropertyEditorSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TCollectionPropertyEditor; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCollectionPropertyEditor = class(TCollectionPropertyEditor)
    end;
var
    CollectionPropertyEditorFuncs: TLuaVmt;
    CollectionPropertyEditorSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Forms, Graphics, LuaClassesEvents, LuaComponent, LuaEvent, LuaForm, LuaPersistent, Menus;

function VCLua_PropertyEditorHook_VCLuaSetGetPrivateDirectory(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	val:AnsiString;
begin
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPropertyEditorHook.GetPrivateDirectory := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'SetGetPrivateDirectory', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_VCLuaGetGetPrivateDirectory(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	ret:AnsiString;
begin
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPropertyEditorHook.GetPrivateDirectory;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetGetPrivateDirectory', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_VCLuaSetLookupRoot(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	val:TPersistent;
begin
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPropertyEditorHook.LookupRoot := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'SetLookupRoot', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_VCLuaGetLookupRoot(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	ret:TPersistent;
begin
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPropertyEditorHook.LookupRoot;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetLookupRoot', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_RenameMethod(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	CurName:String;
	NewName:String;
begin
	CheckArg(L, 3);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@CurName);
	luaL_check(L,3,@NewName);
	try
		lPropertyEditorHook.RenameMethod(CurName,NewName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'RenameMethod', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_ShowMethod(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	aName:String;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@aName);
	try
		lPropertyEditorHook.ShowMethod(aName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'ShowMethod', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_GetComponent(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	ComponentPath:string;
	ret:TComponent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@ComponentPath);
	try
		ret := lPropertyEditorHook.GetComponent(ComponentPath);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_GetComponentName(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	AComponent:TComponent;
	ret:String;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		ret := lPropertyEditorHook.GetComponentName(AComponent);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetComponentName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_GetRootClassName(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	ret:ShortString;
begin
	CheckArg(L, 1);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	try
		ret := lPropertyEditorHook.GetRootClassName();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetRootClassName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_ComponentRenamed(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	AComponent:TComponent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@AComponent);
	try
		lPropertyEditorHook.ComponentRenamed(AComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'ComponentRenamed', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_PersistentAdded(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
	Select:boolean;
begin
	CheckArg(L, 3);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@APersistent);
	luaL_check(L,3,@Select);
	try
		lPropertyEditorHook.PersistentAdded(APersistent,Select);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'PersistentAdded', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_PersistentDeleting(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@APersistent);
	try
		lPropertyEditorHook.PersistentDeleting(APersistent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'PersistentDeleting', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_PersistentDeleted(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@APersistent);
	try
		lPropertyEditorHook.PersistentDeleted(APersistent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'PersistentDeleted', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_DeletePersistent(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
begin
	CheckArg(L, 1);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	try
		lPropertyEditorHook.DeletePersistent(APersistent);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'DeletePersistent', E.ClassName, E.Message);
	end;
	lua_push(L,APersistent);
end;

function VCLua_PropertyEditorHook_DeletePersistent2(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@APersistent);
	try
		lPropertyEditorHook.DeletePersistent(APersistent);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'DeletePersistent', E.ClassName, E.Message);
	end;
	lua_push(L,APersistent);
end;

function VCLua_PropertyEditorHook_Unselect(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@APersistent);
	try
		lPropertyEditorHook.Unselect(APersistent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'Unselect', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_IsSelected(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
	ret:boolean;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@APersistent);
	try
		ret := lPropertyEditorHook.IsSelected(APersistent);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'IsSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_SelectOnlyThis(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	APersistent:TPersistent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@APersistent);
	try
		lPropertyEditorHook.SelectOnlyThis(APersistent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'SelectOnlyThis', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_DesignerMouseDown(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	Sender:TObject;
	Button:TMouseButton;
	Shift:TShiftState;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 6);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@Button,TypeInfo(TMouseButton));
	luaL_checkSet(L,4,@Shift,TypeInfo(TShiftState));
	luaL_check(L,5,@X);
	luaL_check(L,6,@Y);
	try
		lPropertyEditorHook.DesignerMouseDown(Sender,Button,Shift,X,Y);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'DesignerMouseDown', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_DesignerMouseUp(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	Sender:TObject;
	Button:TMouseButton;
	Shift:TShiftState;
	X:Integer;
	Y:Integer;
begin
	CheckArg(L, 6);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@Button,TypeInfo(TMouseButton));
	luaL_checkSet(L,4,@Shift,TypeInfo(TShiftState));
	luaL_check(L,5,@X);
	luaL_check(L,6,@Y);
	try
		lPropertyEditorHook.DesignerMouseUp(Sender,Button,Shift,X,Y);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'DesignerMouseUp', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_GetObject(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	aName:ShortString;
	ret:TPersistent;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@aName);
	try
		ret := lPropertyEditorHook.GetObject(aName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_GetObjectName(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	Instance:TPersistent;
	AOwnerComp:TComponent;
	ret:String;
begin
	CheckArg(L, 3);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@AOwnerComp);
	try
		ret := lPropertyEditorHook.GetObjectName(Instance,AOwnerComp);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetObjectName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_ObjectReferenceChanged(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	Sender:TObject;
	NewObject:TPersistent;
begin
	CheckArg(L, 3);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	luaL_check(L,3,@NewObject);
	try
		lPropertyEditorHook.ObjectReferenceChanged(Sender,NewObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'ObjectReferenceChanged', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_Modified(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	Sender:TObject;
	PropName:ShortString;
begin
	CheckArg(L, 2, 3);
	lPropertyEditorHook := TLuaPropertyEditorHook(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Sender);
	TTrait<ShortString>.luaL_optcheck(L, 3, @PropName, '');
	try
		lPropertyEditorHook.Modified(Sender,PropName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'Modified', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_RefreshPropertyValues(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
begin
	CheckArg(L, 1);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	try
		lPropertyEditorHook.RefreshPropertyValues();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'RefreshPropertyValues', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_VCLuaSetComponentPropertyOnlyDesign(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	val:boolean;
begin
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPropertyEditorHook.ComponentPropertyOnlyDesign := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'SetComponentPropertyOnlyDesign', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditorHook_VCLuaGetComponentPropertyOnlyDesign(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	ret:boolean;
begin
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPropertyEditorHook.ComponentPropertyOnlyDesign;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetComponentPropertyOnlyDesign', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_GetCheckboxForBoolean(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	try
		ret := lPropertyEditorHook.GetCheckboxForBoolean();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'GetCheckboxForBoolean', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditorHook_RemoveAllHandlersForObject(L: Plua_State): Integer; cdecl;
var
	lPropertyEditorHook:TLuaPropertyEditorHook;
	HandlerObject:TObject;
begin
	CheckArg(L, 2);
	lPropertyEditorHook := TLuaPropertyEditorHook(GetLuaObject(L, 1));
	luaL_check(L,2,@HandlerObject);
	try
		lPropertyEditorHook.RemoveAllHandlersForObject(HandlerObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditorHook', 'RemoveAllHandlersForObject', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_Activate(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.Activate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'Activate', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_Deactivate(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.Deactivate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'Deactivate', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_AllEqual(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.AllEqual();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'AllEqual', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_AutoFill(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.AutoFill();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'AutoFill', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_Edit(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.Edit();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'Edit', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_Edit2(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	AOwnerComponent:TComponent;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@AOwnerComponent);
	try
		lPropertyEditor.Edit(AOwnerComponent);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'Edit', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_ShowValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.ShowValue();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ShowValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_GetAttributes(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:TPropertyAttributes;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetAttributes();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetAttributes', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_PropertyEditor_IsReadOnly(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.IsReadOnly();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'IsReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetComponent(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:TPersistent;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPropertyEditor.GetComponent(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetComponent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetUnitName(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 1, 2);
	lPropertyEditor := TLuaPropertyEditor(CheckLuaObjectPop(L, 1));
	TTrait<Integer>.luaL_optcheck(L, 2, @Index, 0);
	try
		ret := lPropertyEditor.GetUnitName(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetUnitName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetPropTypeUnitName(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 1, 2);
	lPropertyEditor := TLuaPropertyEditor(CheckLuaObjectPop(L, 1));
	TTrait<Integer>.luaL_optcheck(L, 2, @Index, 0);
	try
		ret := lPropertyEditor.GetPropTypeUnitName(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetPropTypeUnitName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetPropertyPath(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:integer;
	ret:string;
begin
	CheckArg(L, 1, 2);
	lPropertyEditor := TLuaPropertyEditor(CheckLuaObjectPop(L, 1));
	TTrait<integer>.luaL_optcheck(L, 2, @Index, 0);
	try
		ret := lPropertyEditor.GetPropertyPath(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetPropertyPath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetEditLimit(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Integer;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetEditLimit();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetEditLimit', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetName(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:shortstring;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetName();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetProperties(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Proc:TGetPropEditProc;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Proc);
	try
		lPropertyEditor.GetProperties(Proc);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetProperties', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_GetFloatValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Extended;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetFloatValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetFloatValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetFloatValueAt(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:Extended;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPropertyEditor.GetFloatValueAt(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetFloatValueAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetInt64Value(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Int64;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetInt64Value();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetInt64Value', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetInt64ValueAt(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:Int64;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPropertyEditor.GetInt64ValueAt(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetInt64ValueAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetOrdValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Longint;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetOrdValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetOrdValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetOrdValueAt(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:Longint;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPropertyEditor.GetOrdValueAt(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetOrdValueAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetObjectValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:TObject;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetObjectValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetObjectValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_PropertyEditor_GetObjectValueAt(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:TObject;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPropertyEditor.GetObjectValueAt(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetObjectValueAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_PropertyEditor_GetDefaultOrdValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Longint;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetDefaultOrdValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetDefaultOrdValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetSetValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Brackets:boolean;
	ret:AnsiString;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Brackets);
	try
		ret := lPropertyEditor.GetSetValue(Brackets);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetSetValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetSetValueAt(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	Brackets:boolean;
	ret:AnsiString;
begin
	CheckArg(L, 3);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@Brackets);
	try
		ret := lPropertyEditor.GetSetValueAt(Index,Brackets);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetSetValueAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetStrValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:AnsiString;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetStrValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetStrValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetStrValueAt(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:AnsiString;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPropertyEditor.GetStrValueAt(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetStrValueAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:ansistring;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetHint(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	HintType:TPropEditHint;
	x:integer;
	y:integer;
	ret:string;
begin
	CheckArg(L, 4);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@HintType,TypeInfo(TPropEditHint));
	luaL_check(L,3,@x);
	luaL_check(L,4,@y);
	try
		ret := lPropertyEditor.GetHint(HintType,x,y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_HasDefaultValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.HasDefaultValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'HasDefaultValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_HasStoredFunction(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.HasStoredFunction();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'HasStoredFunction', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetDefaultValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:ansistring;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetDefaultValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetDefaultValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_CallStoredFunction(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.CallStoredFunction();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'CallStoredFunction', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetVisualValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:ansistring;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetVisualValue();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetVisualValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetValues(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Proc:TGetStrProc;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Proc);
	try
		lPropertyEditor.GetValues(Proc);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetValues', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_Initialize(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.Initialize();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'Initialize', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_Revert(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.Revert();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'Revert', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_RevertToInherited(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.RevertToInherited();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'RevertToInherited', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_SetValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:ansistring;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	try
		lPropertyEditor.SetValue(NewValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SetValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_SetFloatValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:Extended;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	try
		lPropertyEditor.SetFloatValue(NewValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SetFloatValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_SetInt64Value(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:Int64;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	try
		lPropertyEditor.SetInt64Value(NewValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SetInt64Value', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_SetOrdValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:Longint;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	try
		lPropertyEditor.SetOrdValue(NewValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SetOrdValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_SetPtrValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:Pointer;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	NewValue := lua_touserdata(L,2);
	try
		lPropertyEditor.SetPtrValue(NewValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SetPtrValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_SetStrValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:AnsiString;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	try
		lPropertyEditor.SetStrValue(NewValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SetStrValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_Modified(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	PropName:ShortString;
begin
	CheckArg(L, 1, 2);
	lPropertyEditor := TLuaPropertyEditor(CheckLuaObjectPop(L, 1));
	TTrait<ShortString>.luaL_optcheck(L, 2, @PropName, '');
	try
		lPropertyEditor.Modified(PropName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'Modified', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_ValueAvailable(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.ValueAvailable();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ValueAvailable', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_ListMeasureWidth(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	AValue:ansistring;
	Index:Integer;
	ACanvas:TCanvas;
	AWidth:Integer;
begin
	CheckArg(L, 4);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@ACanvas);
	try
		lPropertyEditor.ListMeasureWidth(AValue,Index,ACanvas,AWidth);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ListMeasureWidth', E.ClassName, E.Message);
	end;
	lua_push(L,AWidth);
end;

function VCLua_PropertyEditor_ListMeasureWidth2(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	AValue:ansistring;
	Index:Integer;
	ACanvas:TCanvas;
	AWidth:Integer;
begin
	CheckArg(L, 5);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@ACanvas);
	luaL_check(L,5,@AWidth);
	try
		lPropertyEditor.ListMeasureWidth(AValue,Index,ACanvas,AWidth);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ListMeasureWidth', E.ClassName, E.Message);
	end;
	lua_push(L,AWidth);
end;

function VCLua_PropertyEditor_ListMeasureHeight(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	AValue:ansistring;
	Index:Integer;
	ACanvas:TCanvas;
	AHeight:Integer;
begin
	CheckArg(L, 4);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@ACanvas);
	try
		lPropertyEditor.ListMeasureHeight(AValue,Index,ACanvas,AHeight);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ListMeasureHeight', E.ClassName, E.Message);
	end;
	lua_push(L,AHeight);
end;

function VCLua_PropertyEditor_ListMeasureHeight2(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	AValue:ansistring;
	Index:Integer;
	ACanvas:TCanvas;
	AHeight:Integer;
begin
	CheckArg(L, 5);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@ACanvas);
	luaL_check(L,5,@AHeight);
	try
		lPropertyEditor.ListMeasureHeight(AValue,Index,ACanvas,AHeight);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ListMeasureHeight', E.ClassName, E.Message);
	end;
	lua_push(L,AHeight);
end;

function VCLua_PropertyEditor_ListDrawValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	AValue:ansistring;
	Index:Integer;
	ACanvas:TCanvas;
	ARect:TRect;
	AState:TPropEditDrawState;
begin
	CheckArg(L, 6);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@ACanvas);
	luaL_check(L,5,@ARect);
	luaL_checkSet(L,6,@AState,TypeInfo(TPropEditDrawState));
	try
		lPropertyEditor.ListDrawValue(AValue,Index,ACanvas,ARect,AState);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ListDrawValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_PropMeasureHeight(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:ansistring;
	ACanvas:TCanvas;
	AHeight:Integer;
begin
	CheckArg(L, 3);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	luaL_check(L,3,@ACanvas);
	try
		lPropertyEditor.PropMeasureHeight(NewValue,ACanvas,AHeight);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'PropMeasureHeight', E.ClassName, E.Message);
	end;
	lua_push(L,AHeight);
end;

function VCLua_PropertyEditor_PropMeasureHeight2(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	NewValue:ansistring;
	ACanvas:TCanvas;
	AHeight:Integer;
begin
	CheckArg(L, 4);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@NewValue);
	luaL_check(L,3,@ACanvas);
	luaL_check(L,4,@AHeight);
	try
		lPropertyEditor.PropMeasureHeight(NewValue,ACanvas,AHeight);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'PropMeasureHeight', E.ClassName, E.Message);
	end;
	lua_push(L,AHeight);
end;

function VCLua_PropertyEditor_PropDrawName(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ACanvas:TCanvas;
	ARect:TRect;
	AState:TPropEditDrawState;
begin
	CheckArg(L, 4);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@ARect);
	luaL_checkSet(L,4,@AState,TypeInfo(TPropEditDrawState));
	try
		lPropertyEditor.PropDrawName(ACanvas,ARect,AState);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'PropDrawName', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_PropDrawValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ACanvas:TCanvas;
	ARect:TRect;
	AState:TPropEditDrawState;
begin
	CheckArg(L, 4);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@ARect);
	luaL_checkSet(L,4,@AState,TypeInfo(TPropEditDrawState));
	try
		lPropertyEditor.PropDrawValue(ACanvas,ARect,AState);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'PropDrawValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_UpdateSubProperties(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		lPropertyEditor.UpdateSubProperties();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'UpdateSubProperties', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_SubPropertiesNeedsUpdate(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.SubPropertiesNeedsUpdate();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SubPropertiesNeedsUpdate', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_ValueIsStreamed(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.ValueIsStreamed();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ValueIsStreamed', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_IsRevertableToInherited(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:boolean;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.IsRevertableToInherited();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'IsRevertableToInherited', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetVerbCount(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Integer;
begin
	CheckArg(L, 1);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	try
		ret := lPropertyEditor.GetVerbCount();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetVerbCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_GetVerb(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lPropertyEditor.GetVerb(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetVerb', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_PrepareItem(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
	AnItem:TMenuItem;
begin
	CheckArg(L, 3);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@AnItem);
	try
		lPropertyEditor.PrepareItem(Index,AnItem);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'PrepareItem', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_ExecuteVerb(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	Index:Integer;
begin
	CheckArg(L, 2);
	lPropertyEditor := TLuaPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lPropertyEditor.ExecuteVerb(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'ExecuteVerb', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_VCLuaGetPropertyHook(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:TPropertyEditorHook;
begin
	lPropertyEditor := TLuaPropertyEditor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPropertyEditor.PropertyHook;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetPropertyHook', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_VCLuaGetPrivateDirectory(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:ansistring;
begin
	lPropertyEditor := TLuaPropertyEditor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPropertyEditor.PrivateDirectory;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetPrivateDirectory', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_VCLuaGetPropCount(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:Integer;
begin
	lPropertyEditor := TLuaPropertyEditor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPropertyEditor.PropCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetPropCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_VCLuaSetFirstValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	val:ansistring;
begin
	lPropertyEditor := TLuaPropertyEditor(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPropertyEditor.FirstValue := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'SetFirstValue', E.ClassName, E.Message);
	end;
end;

function VCLua_PropertyEditor_VCLuaGetFirstValue(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
	ret:ansistring;
begin
	lPropertyEditor := TLuaPropertyEditor(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPropertyEditor.FirstValue;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'PropertyEditor', 'GetFirstValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_PropertyEditor_VCLuaSetOnSubPropertiesChanged(L: Plua_State): Integer; cdecl;
var
	lPropertyEditor:TLuaPropertyEditor;
begin
	lPropertyEditor := TLuaPropertyEditor(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lPropertyEditor.OnSubPropertiesChanged));
	lPropertyEditor.OnSubPropertiesChanged := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CollectionPropertyEditor_ShowCollectionEditor(L: Plua_State): Integer; cdecl;
var
	lCollectionPropertyEditor:TLuaCollectionPropertyEditor;
	ACollection:TCollection;
	OwnerPersistent:TPersistent;
	PropName:String;
	ret:TCustomForm;
begin
	CheckArg(L, 4);
	lCollectionPropertyEditor := TLuaCollectionPropertyEditor(GetLuaObject(L, 1));
	luaL_check(L,2,@ACollection);
	luaL_check(L,3,@OwnerPersistent);
	luaL_check(L,4,@PropName);
	try
		ret := lCollectionPropertyEditor.ShowCollectionEditor(ACollection,OwnerPersistent,PropName);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionPropertyEditor', 'ShowCollectionEditor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TPropertyEditorHook; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPropertyEditorHook',v);
end;

procedure lua_push(L: Plua_State; const v: TPropertyEditor; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPropertyEditor',v);
end;

procedure lua_push(L: Plua_State; const v: TCollectionPropertyEditor; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCollectionPropertyEditor',v);
end;

begin
	PropertyEditorHookFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'GetPrivateDirectory', @VCLua_PropertyEditorHook_VCLuaGetGetPrivateDirectory, mfCall);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'LookupRoot', @VCLua_PropertyEditorHook_VCLuaGetLookupRoot, mfCall);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'RenameMethod', @VCLua_PropertyEditorHook_RenameMethod);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'ShowMethod', @VCLua_PropertyEditorHook_ShowMethod);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'GetComponent', @VCLua_PropertyEditorHook_GetComponent);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'GetComponentName', @VCLua_PropertyEditorHook_GetComponentName);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'GetRootClassName', @VCLua_PropertyEditorHook_GetRootClassName);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'ComponentRenamed', @VCLua_PropertyEditorHook_ComponentRenamed);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'PersistentAdded', @VCLua_PropertyEditorHook_PersistentAdded);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'PersistentDeleting', @VCLua_PropertyEditorHook_PersistentDeleting);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'PersistentDeleted', @VCLua_PropertyEditorHook_PersistentDeleted);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'DeletePersistent', @VCLua_PropertyEditorHook_DeletePersistent);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'DeletePersistent2', @VCLua_PropertyEditorHook_DeletePersistent2);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'Unselect', @VCLua_PropertyEditorHook_Unselect);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'IsSelected', @VCLua_PropertyEditorHook_IsSelected);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'SelectOnlyThis', @VCLua_PropertyEditorHook_SelectOnlyThis);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'DesignerMouseDown', @VCLua_PropertyEditorHook_DesignerMouseDown);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'DesignerMouseUp', @VCLua_PropertyEditorHook_DesignerMouseUp);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'GetObject', @VCLua_PropertyEditorHook_GetObject);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'GetObjectName', @VCLua_PropertyEditorHook_GetObjectName);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'ObjectReferenceChanged', @VCLua_PropertyEditorHook_ObjectReferenceChanged);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'Modified', @VCLua_PropertyEditorHook_Modified);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'RefreshPropertyValues', @VCLua_PropertyEditorHook_RefreshPropertyValues);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'ComponentPropertyOnlyDesign', @VCLua_PropertyEditorHook_VCLuaGetComponentPropertyOnlyDesign, mfCall);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'GetCheckboxForBoolean', @VCLua_PropertyEditorHook_GetCheckboxForBoolean);
	TLuaMethodInfo.Create(PropertyEditorHookFuncs, 'RemoveAllHandlersForObject', @VCLua_PropertyEditorHook_RemoveAllHandlersForObject);
	PropertyEditorHookSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(PropertyEditorHookSets, 'GetPrivateDirectory', @VCLua_PropertyEditorHook_VCLuaSetGetPrivateDirectory, mfCall, TypeInfo(AnsiString));
	TLuaMethodInfo.Create(PropertyEditorHookSets, 'LookupRoot', @VCLua_PropertyEditorHook_VCLuaSetLookupRoot, mfCall, TypeInfo(TPersistent));
	TLuaMethodInfo.Create(PropertyEditorHookSets, 'ComponentPropertyOnlyDesign', @VCLua_PropertyEditorHook_VCLuaSetComponentPropertyOnlyDesign, mfCall, TypeInfo(boolean));
	PropertyEditorFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'Activate', @VCLua_PropertyEditor_Activate);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'Deactivate', @VCLua_PropertyEditor_Deactivate);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'AllEqual', @VCLua_PropertyEditor_AllEqual);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'AutoFill', @VCLua_PropertyEditor_AutoFill);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'Edit', @VCLua_PropertyEditor_Edit);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'Edit2', @VCLua_PropertyEditor_Edit2);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ShowValue', @VCLua_PropertyEditor_ShowValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetAttributes', @VCLua_PropertyEditor_GetAttributes);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'IsReadOnly', @VCLua_PropertyEditor_IsReadOnly);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetComponent', @VCLua_PropertyEditor_GetComponent);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetUnitName', @VCLua_PropertyEditor_GetUnitName);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetPropTypeUnitName', @VCLua_PropertyEditor_GetPropTypeUnitName);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetPropertyPath', @VCLua_PropertyEditor_GetPropertyPath);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetEditLimit', @VCLua_PropertyEditor_GetEditLimit);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetName', @VCLua_PropertyEditor_GetName);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetProperties', @VCLua_PropertyEditor_GetProperties);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetFloatValue', @VCLua_PropertyEditor_GetFloatValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetFloatValueAt', @VCLua_PropertyEditor_GetFloatValueAt);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetInt64Value', @VCLua_PropertyEditor_GetInt64Value);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetInt64ValueAt', @VCLua_PropertyEditor_GetInt64ValueAt);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetOrdValue', @VCLua_PropertyEditor_GetOrdValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetOrdValueAt', @VCLua_PropertyEditor_GetOrdValueAt);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetObjectValue', @VCLua_PropertyEditor_GetObjectValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetObjectValueAt', @VCLua_PropertyEditor_GetObjectValueAt);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetDefaultOrdValue', @VCLua_PropertyEditor_GetDefaultOrdValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetSetValue', @VCLua_PropertyEditor_GetSetValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetSetValueAt', @VCLua_PropertyEditor_GetSetValueAt);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetStrValue', @VCLua_PropertyEditor_GetStrValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetStrValueAt', @VCLua_PropertyEditor_GetStrValueAt);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetValue', @VCLua_PropertyEditor_GetValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetHint', @VCLua_PropertyEditor_GetHint);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'HasDefaultValue', @VCLua_PropertyEditor_HasDefaultValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'HasStoredFunction', @VCLua_PropertyEditor_HasStoredFunction);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetDefaultValue', @VCLua_PropertyEditor_GetDefaultValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'CallStoredFunction', @VCLua_PropertyEditor_CallStoredFunction);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetVisualValue', @VCLua_PropertyEditor_GetVisualValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetValues', @VCLua_PropertyEditor_GetValues);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'Initialize', @VCLua_PropertyEditor_Initialize);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'Revert', @VCLua_PropertyEditor_Revert);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'RevertToInherited', @VCLua_PropertyEditor_RevertToInherited);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'SetValue', @VCLua_PropertyEditor_SetValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'SetFloatValue', @VCLua_PropertyEditor_SetFloatValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'SetInt64Value', @VCLua_PropertyEditor_SetInt64Value);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'SetOrdValue', @VCLua_PropertyEditor_SetOrdValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'SetPtrValue', @VCLua_PropertyEditor_SetPtrValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'SetStrValue', @VCLua_PropertyEditor_SetStrValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'Modified', @VCLua_PropertyEditor_Modified);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ValueAvailable', @VCLua_PropertyEditor_ValueAvailable);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ListMeasureWidth', @VCLua_PropertyEditor_ListMeasureWidth);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ListMeasureWidth2', @VCLua_PropertyEditor_ListMeasureWidth2);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ListMeasureHeight', @VCLua_PropertyEditor_ListMeasureHeight);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ListMeasureHeight2', @VCLua_PropertyEditor_ListMeasureHeight2);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ListDrawValue', @VCLua_PropertyEditor_ListDrawValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PropMeasureHeight', @VCLua_PropertyEditor_PropMeasureHeight);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PropMeasureHeight2', @VCLua_PropertyEditor_PropMeasureHeight2);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PropDrawName', @VCLua_PropertyEditor_PropDrawName);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PropDrawValue', @VCLua_PropertyEditor_PropDrawValue);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'UpdateSubProperties', @VCLua_PropertyEditor_UpdateSubProperties);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'SubPropertiesNeedsUpdate', @VCLua_PropertyEditor_SubPropertiesNeedsUpdate);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ValueIsStreamed', @VCLua_PropertyEditor_ValueIsStreamed);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'IsRevertableToInherited', @VCLua_PropertyEditor_IsRevertableToInherited);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetVerbCount', @VCLua_PropertyEditor_GetVerbCount);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'GetVerb', @VCLua_PropertyEditor_GetVerb);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PrepareItem', @VCLua_PropertyEditor_PrepareItem);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'ExecuteVerb', @VCLua_PropertyEditor_ExecuteVerb);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PropertyHook', @VCLua_PropertyEditor_VCLuaGetPropertyHook, mfCall);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PrivateDirectory', @VCLua_PropertyEditor_VCLuaGetPrivateDirectory, mfCall);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'PropCount', @VCLua_PropertyEditor_VCLuaGetPropCount, mfCall);
	TLuaMethodInfo.Create(PropertyEditorFuncs, 'FirstValue', @VCLua_PropertyEditor_VCLuaGetFirstValue, mfCall);
	PropertyEditorSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(PropertyEditorSets, 'FirstValue', @VCLua_PropertyEditor_VCLuaSetFirstValue, mfCall, TypeInfo(ansistring));
	TLuaMethodInfo.Create(PropertyEditorSets, 'OnSubPropertiesChanged', @VCLua_PropertyEditor_VCLuaSetOnSubPropertiesChanged, mfCall, TypeInfo(TNotifyEvent));
	CollectionPropertyEditorFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CollectionPropertyEditorFuncs, 'ShowCollectionEditor', @VCLua_CollectionPropertyEditor_ShowCollectionEditor);
	CollectionPropertyEditorSets := TLuaVmt.Create;
	
end.
