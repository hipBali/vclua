(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCustomAbstractGroupedEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, GroupedEdit;

procedure lua_push(L: Plua_State; const v: TCustomAbstractGroupedEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomAbstractGroupedEdit = class(TCustomAbstractGroupedEdit)
    end;
var
    CustomAbstractGroupedEditFuncs: TLuaVmt;
    CustomAbstractGroupedEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LCLType, LuaClassesEvents, LuaControlsEvents, LuaEvent, LuaMenu, Menus, StdCtrls;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnBuddyClick(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnBuddyClick));
	lCustomAbstractGroupedEdit.OnBuddyClick := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_Clear(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_ClearSelection(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.ClearSelection();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'ClearSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_CopyToClipboard(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.CopyToClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'CopyToClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_CutToClipboard(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.CutToClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'CutToClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_PasteFromClipboard(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.PasteFromClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'PasteFromClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_SelectAll(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.SelectAll();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SelectAll', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_Undo(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.Undo();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'Undo', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_ValidateEdit(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	CheckArg(L, 1);
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObject(L, 1));
	try
		lCustomAbstractGroupedEdit.ValidateEdit();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'ValidateEdit', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetAutoSizeHeightIsEditHeight(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.AutoSizeHeightIsEditHeight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetAutoSizeHeightIsEditHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetAutoSizeHeightIsEditHeight(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.AutoSizeHeightIsEditHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetAutoSizeHeightIsEditHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetAlignment(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:TAlignment;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAlignment));
	try
		lCustomAbstractGroupedEdit.Alignment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetAlignment', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetAlignment(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:TAlignment;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.Alignment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetAlignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetCanUndo(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.CanUndo;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetCanUndo', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetCaretPos(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:TPoint;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.CaretPos := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetCaretPos', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetCaretPos(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:TPoint;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.CaretPos;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetCaretPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetCharCase(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:TEditCharCase;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEditCharCase));
	try
		lCustomAbstractGroupedEdit.CharCase := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetCharCase', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetCharCase(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:TEditCharCase;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.CharCase;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetCharCase', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetColor(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:TColor;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lCustomAbstractGroupedEdit.Color := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetColor', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetColor(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:TColor;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.Color;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetParentColor(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.ParentColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetParentColor', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetParentColor(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.ParentColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetParentColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetEchoMode(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:TEchoMode;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEchoMode));
	try
		lCustomAbstractGroupedEdit.EchoMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetEchoMode', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetEchoMode(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:TEchoMode;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.EchoMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetEchoMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetHideSelection(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.HideSelection := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetHideSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetHideSelection(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.HideSelection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetHideSelection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetMaxLength(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Integer;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.MaxLength := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetMaxLength', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetMaxLength(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Integer;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.MaxLength;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetMaxLength', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetModified(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.Modified := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetModified', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetModified(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.Modified;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetModified', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetNumbersOnly(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.NumbersOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetNumbersOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetNumbersOnly(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.NumbersOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetNumbersOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetPasswordChar(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:char;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.PasswordChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetPasswordChar', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetPasswordChar(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:char;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.PasswordChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetPasswordChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetPopupMenu(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:TPopupMenu;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.PopupMenu := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetPopupMenu', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetPopupMenu(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:TPopupMenu;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.PopupMenu;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetPopupMenu', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetReadOnly(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.ReadOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetReadOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetReadOnly(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.ReadOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetSelLength(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Integer;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.SelLength := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetSelLength', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetSelLength(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Integer;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.SelLength;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetSelLength', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetSelStart(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Integer;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.SelStart := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetSelStart', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetSelStart(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Integer;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.SelStart;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetSelStart', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetSelText(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:String;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.SelText := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetSelText', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetSelText(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:String;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.SelText;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetSelText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetTabStop(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.TabStop := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetTabStop', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetTabStop(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:Boolean;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.TabStop;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetTabStop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetTextHint(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	val:TTranslateString;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomAbstractGroupedEdit.TextHint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'SetTextHint', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaGetTextHint(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
	ret:TTranslateString;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomAbstractGroupedEdit.TextHint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomAbstractGroupedEdit', 'GetTextHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnChange));
	lCustomAbstractGroupedEdit.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnClick(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnClick));
	lCustomAbstractGroupedEdit.OnClick := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnContextPopup(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnContextPopup));
	lCustomAbstractGroupedEdit.OnContextPopup := TLuaEvent.Factory<TContextPopupEvent,TLuaContextPopupEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnDblClick(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnDblClick));
	lCustomAbstractGroupedEdit.OnDblClick := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnDragDrop(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnDragDrop));
	lCustomAbstractGroupedEdit.OnDragDrop := TLuaEvent.Factory<TDragDropEvent,TLuaDragDropEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnDragOver(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnDragOver));
	lCustomAbstractGroupedEdit.OnDragOver := TLuaEvent.Factory<TDragOverEvent,TLuaDragOverEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnEditingDone(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnEditingDone));
	lCustomAbstractGroupedEdit.OnEditingDone := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnEndDrag(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnEndDrag));
	lCustomAbstractGroupedEdit.OnEndDrag := TLuaEvent.Factory<TEndDragEvent,TLuaEndDragEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnEnter(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnEnter));
	lCustomAbstractGroupedEdit.OnEnter := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnExit(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnExit));
	lCustomAbstractGroupedEdit.OnExit := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseDown(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseDown));
	lCustomAbstractGroupedEdit.OnMouseDown := TLuaEvent.Factory<TMouseEvent,TLuaMouseEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnKeyPress(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnKeyPress));
	lCustomAbstractGroupedEdit.OnKeyPress := TLuaEvent.Factory<TKeyPressEvent,TLuaKeyPressEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnKeyDown(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnKeyDown));
	lCustomAbstractGroupedEdit.OnKeyDown := TLuaEvent.Factory<TKeyEvent,TLuaKeyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnKeyUp(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnKeyUp));
	lCustomAbstractGroupedEdit.OnKeyUp := TLuaEvent.Factory<TKeyEvent,TLuaKeyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseEnter(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseEnter));
	lCustomAbstractGroupedEdit.OnMouseEnter := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseLeave(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseLeave));
	lCustomAbstractGroupedEdit.OnMouseLeave := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseMove(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseMove));
	lCustomAbstractGroupedEdit.OnMouseMove := TLuaEvent.Factory<TMouseMoveEvent,TLuaMouseMoveEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseWheel(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseWheel));
	lCustomAbstractGroupedEdit.OnMouseWheel := TLuaEvent.Factory<TMouseWheelEvent,TLuaMouseWheelEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseWheelUp(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseWheelUp));
	lCustomAbstractGroupedEdit.OnMouseWheelUp := TLuaEvent.Factory<TMouseWheelUpDownEvent,TLuaMouseWheelUpDownEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseWheelDown(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseWheelDown));
	lCustomAbstractGroupedEdit.OnMouseWheelDown := TLuaEvent.Factory<TMouseWheelUpDownEvent,TLuaMouseWheelUpDownEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseUp(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnMouseUp));
	lCustomAbstractGroupedEdit.OnMouseUp := TLuaEvent.Factory<TMouseEvent,TLuaMouseEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnStartDrag(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnStartDrag));
	lCustomAbstractGroupedEdit.OnStartDrag := TLuaEvent.Factory<TStartDragEvent,TLuaStartDragEvent>(L);
	Result := 0;
end;

function VCLua_CustomAbstractGroupedEdit_VCLuaSetOnUtf8KeyPress(L: Plua_State): Integer; cdecl;
var
	lCustomAbstractGroupedEdit:TLuaCustomAbstractGroupedEdit;
begin
	lCustomAbstractGroupedEdit := TLuaCustomAbstractGroupedEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomAbstractGroupedEdit.OnUtf8KeyPress));
	lCustomAbstractGroupedEdit.OnUtf8KeyPress := TLuaEvent.Factory<TUtf8KeyPressEvent,TLuaUtf8KeyPressEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TCustomAbstractGroupedEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomAbstractGroupedEdit',v);
end;

begin
	CustomAbstractGroupedEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'Clear', @VCLua_CustomAbstractGroupedEdit_Clear);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'ClearSelection', @VCLua_CustomAbstractGroupedEdit_ClearSelection);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'CopyToClipboard', @VCLua_CustomAbstractGroupedEdit_CopyToClipboard);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'CutToClipboard', @VCLua_CustomAbstractGroupedEdit_CutToClipboard);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'PasteFromClipboard', @VCLua_CustomAbstractGroupedEdit_PasteFromClipboard);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'SelectAll', @VCLua_CustomAbstractGroupedEdit_SelectAll);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'Undo', @VCLua_CustomAbstractGroupedEdit_Undo);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'ValidateEdit', @VCLua_CustomAbstractGroupedEdit_ValidateEdit);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'AutoSizeHeightIsEditHeight', @VCLua_CustomAbstractGroupedEdit_VCLuaGetAutoSizeHeightIsEditHeight, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'Alignment', @VCLua_CustomAbstractGroupedEdit_VCLuaGetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'CanUndo', @VCLua_CustomAbstractGroupedEdit_VCLuaGetCanUndo, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'CaretPos', @VCLua_CustomAbstractGroupedEdit_VCLuaGetCaretPos, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'CharCase', @VCLua_CustomAbstractGroupedEdit_VCLuaGetCharCase, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'Color', @VCLua_CustomAbstractGroupedEdit_VCLuaGetColor, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'ParentColor', @VCLua_CustomAbstractGroupedEdit_VCLuaGetParentColor, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'EchoMode', @VCLua_CustomAbstractGroupedEdit_VCLuaGetEchoMode, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'HideSelection', @VCLua_CustomAbstractGroupedEdit_VCLuaGetHideSelection, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'MaxLength', @VCLua_CustomAbstractGroupedEdit_VCLuaGetMaxLength, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'Modified', @VCLua_CustomAbstractGroupedEdit_VCLuaGetModified, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'NumbersOnly', @VCLua_CustomAbstractGroupedEdit_VCLuaGetNumbersOnly, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'PasswordChar', @VCLua_CustomAbstractGroupedEdit_VCLuaGetPasswordChar, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'PopupMenu', @VCLua_CustomAbstractGroupedEdit_VCLuaGetPopupMenu, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'ReadOnly', @VCLua_CustomAbstractGroupedEdit_VCLuaGetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'SelLength', @VCLua_CustomAbstractGroupedEdit_VCLuaGetSelLength, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'SelStart', @VCLua_CustomAbstractGroupedEdit_VCLuaGetSelStart, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'SelText', @VCLua_CustomAbstractGroupedEdit_VCLuaGetSelText, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'TabStop', @VCLua_CustomAbstractGroupedEdit_VCLuaGetTabStop, mfCall);
	TLuaMethodInfo.Create(CustomAbstractGroupedEditFuncs, 'TextHint', @VCLua_CustomAbstractGroupedEdit_VCLuaGetTextHint, mfCall);
	CustomAbstractGroupedEditSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnBuddyClick', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnBuddyClick, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'AutoSizeHeightIsEditHeight', @VCLua_CustomAbstractGroupedEdit_VCLuaSetAutoSizeHeightIsEditHeight, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'Alignment', @VCLua_CustomAbstractGroupedEdit_VCLuaSetAlignment, mfCall, TypeInfo(TAlignment));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'CaretPos', @VCLua_CustomAbstractGroupedEdit_VCLuaSetCaretPos, mfCall, TypeInfo(TPoint));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'CharCase', @VCLua_CustomAbstractGroupedEdit_VCLuaSetCharCase, mfCall, TypeInfo(TEditCharCase));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'Color', @VCLua_CustomAbstractGroupedEdit_VCLuaSetColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'ParentColor', @VCLua_CustomAbstractGroupedEdit_VCLuaSetParentColor, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'EchoMode', @VCLua_CustomAbstractGroupedEdit_VCLuaSetEchoMode, mfCall, TypeInfo(TEchoMode));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'HideSelection', @VCLua_CustomAbstractGroupedEdit_VCLuaSetHideSelection, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'MaxLength', @VCLua_CustomAbstractGroupedEdit_VCLuaSetMaxLength, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'Modified', @VCLua_CustomAbstractGroupedEdit_VCLuaSetModified, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'NumbersOnly', @VCLua_CustomAbstractGroupedEdit_VCLuaSetNumbersOnly, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'PasswordChar', @VCLua_CustomAbstractGroupedEdit_VCLuaSetPasswordChar, mfCall, TypeInfo(char));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'PopupMenu', @VCLua_CustomAbstractGroupedEdit_VCLuaSetPopupMenu, mfCall, TypeInfo(TPopupMenu));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'ReadOnly', @VCLua_CustomAbstractGroupedEdit_VCLuaSetReadOnly, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'SelLength', @VCLua_CustomAbstractGroupedEdit_VCLuaSetSelLength, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'SelStart', @VCLua_CustomAbstractGroupedEdit_VCLuaSetSelStart, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'SelText', @VCLua_CustomAbstractGroupedEdit_VCLuaSetSelText, mfCall, TypeInfo(String));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'TabStop', @VCLua_CustomAbstractGroupedEdit_VCLuaSetTabStop, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'TextHint', @VCLua_CustomAbstractGroupedEdit_VCLuaSetTextHint, mfCall, TypeInfo(TTranslateString));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnChange', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnClick', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnClick, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnContextPopup', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnContextPopup, mfCall, TypeInfo(TContextPopupEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnDblClick', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnDblClick, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnDragDrop', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnDragDrop, mfCall, TypeInfo(TDragDropEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnDragOver', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnDragOver, mfCall, TypeInfo(TDragOverEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnEditingDone', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnEditingDone, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnEndDrag', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnEndDrag, mfCall, TypeInfo(TEndDragEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnEnter', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnEnter, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnExit', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnExit, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseDown', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseDown, mfCall, TypeInfo(TMouseEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnKeyPress', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnKeyPress, mfCall, TypeInfo(TKeyPressEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnKeyDown', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnKeyDown, mfCall, TypeInfo(TKeyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnKeyUp', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnKeyUp, mfCall, TypeInfo(TKeyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseEnter', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseEnter, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseLeave', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseLeave, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseMove', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseMove, mfCall, TypeInfo(TMouseMoveEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseWheel', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseWheel, mfCall, TypeInfo(TMouseWheelEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseWheelUp', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseWheelUp, mfCall, TypeInfo(TMouseWheelUpDownEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseWheelDown', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseWheelDown, mfCall, TypeInfo(TMouseWheelUpDownEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnMouseUp', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnMouseUp, mfCall, TypeInfo(TMouseEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnStartDrag', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnStartDrag, mfCall, TypeInfo(TStartDragEvent));
	TLuaMethodInfo.Create(CustomAbstractGroupedEditSets, 'OnUtf8KeyPress', @VCLua_CustomAbstractGroupedEdit_VCLuaSetOnUtf8KeyPress, mfCall, TypeInfo(TUtf8KeyPressEvent));
end.
