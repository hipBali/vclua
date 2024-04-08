(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaEdit = class(TEdit)
    end;
var
    CustomEditFuncs: TLuaVmt;
    CustomEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LCLType, LuaClassesEvents, LuaEvent;

function VCLua_Edit_Clear(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_SelectAll(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.SelectAll();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelectAll', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_ClearSelection(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.ClearSelection();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'ClearSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_CopyToClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.CopyToClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CopyToClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_CutToClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.CutToClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CutToClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_PasteFromClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.PasteFromClipboard();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'PasteFromClipboard', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_Undo(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		lEdit.Undo();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Undo', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_RemoveAllHandlersOfObject(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	AnObject:TObject;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@AnObject);
	try
		lEdit.RemoveAllHandlersOfObject(AnObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'RemoveAllHandlersOfObject', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaSetAlignment(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TAlignment;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAlignment));
	try
		lEdit.Alignment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetAlignment', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetAlignment(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TAlignment;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.Alignment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetAlignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaGetCanUndo(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.CanUndo;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetCanUndo', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetCaretPos(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TPoint;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.CaretPos := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetCaretPos', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetCaretPos(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TPoint;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.CaretPos;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetCaretPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetCharCase(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TEditCharCase;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEditCharCase));
	try
		lEdit.CharCase := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetCharCase', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetCharCase(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TEditCharCase;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.CharCase;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetCharCase', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaSetEchoMode(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TEchoMode;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEchoMode));
	try
		lEdit.EchoMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetEchoMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetEchoMode(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TEchoMode;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.EchoMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetEchoMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaGetEmulatedTextHintStatus(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TEmulatedTextHintStatus;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.EmulatedTextHintStatus;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetEmulatedTextHintStatus', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaSetHideSelection(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.HideSelection := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetHideSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetHideSelection(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.HideSelection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetHideSelection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetMaxLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Integer;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.MaxLength := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetMaxLength', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetMaxLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Integer;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.MaxLength;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetMaxLength', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetModified(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.Modified := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetModified', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetModified(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.Modified;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetModified', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetNumbersOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.NumbersOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetNumbersOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetNumbersOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.NumbersOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetNumbersOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lEdit.OnChange));
	lEdit.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Edit_VCLuaSetPasswordChar(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Char;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.PasswordChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetPasswordChar', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetPasswordChar(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Char;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.PasswordChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetPasswordChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetReadOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.ReadOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetReadOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetReadOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.ReadOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetSelLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:integer;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.SelLength := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetSelLength', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetSelLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:integer;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.SelLength;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetSelLength', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetSelStart(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:integer;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.SelStart := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetSelStart', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetSelStart(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:integer;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.SelStart;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetSelStart', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetSelText(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:String;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.SelText := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetSelText', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetSelText(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:String;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.SelText;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetSelText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetTextHint(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TTranslateString;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.TextHint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SetTextHint', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetTextHint(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TTranslateString;
begin
	lEdit := TLuaEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lEdit.TextHint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'GetTextHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEdit',v);
end;
function CreateEdit(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lEdit := TLuaEdit.Create(Parent);
	lEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomEdit',lEdit);
	InitControl(L,lEdit,Name);
	Result := 1;
end;

begin
	CustomEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomEditFuncs, 'Clear', @VCLua_Edit_Clear);
	TLuaMethodInfo.Create(CustomEditFuncs, 'SelectAll', @VCLua_Edit_SelectAll);
	TLuaMethodInfo.Create(CustomEditFuncs, 'ClearSelection', @VCLua_Edit_ClearSelection);
	TLuaMethodInfo.Create(CustomEditFuncs, 'CopyToClipboard', @VCLua_Edit_CopyToClipboard);
	TLuaMethodInfo.Create(CustomEditFuncs, 'CutToClipboard', @VCLua_Edit_CutToClipboard);
	TLuaMethodInfo.Create(CustomEditFuncs, 'PasteFromClipboard', @VCLua_Edit_PasteFromClipboard);
	TLuaMethodInfo.Create(CustomEditFuncs, 'Undo', @VCLua_Edit_Undo);
	TLuaMethodInfo.Create(CustomEditFuncs, 'RemoveAllHandlersOfObject', @VCLua_Edit_RemoveAllHandlersOfObject);
	TLuaMethodInfo.Create(CustomEditFuncs, 'Alignment', @VCLua_Edit_VCLuaGetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'CanUndo', @VCLua_Edit_VCLuaGetCanUndo, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'CaretPos', @VCLua_Edit_VCLuaGetCaretPos, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'CharCase', @VCLua_Edit_VCLuaGetCharCase, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'EchoMode', @VCLua_Edit_VCLuaGetEchoMode, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'EmulatedTextHintStatus', @VCLua_Edit_VCLuaGetEmulatedTextHintStatus, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'HideSelection', @VCLua_Edit_VCLuaGetHideSelection, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'MaxLength', @VCLua_Edit_VCLuaGetMaxLength, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'Modified', @VCLua_Edit_VCLuaGetModified, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'NumbersOnly', @VCLua_Edit_VCLuaGetNumbersOnly, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'PasswordChar', @VCLua_Edit_VCLuaGetPasswordChar, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'ReadOnly', @VCLua_Edit_VCLuaGetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'SelLength', @VCLua_Edit_VCLuaGetSelLength, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'SelStart', @VCLua_Edit_VCLuaGetSelStart, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'SelText', @VCLua_Edit_VCLuaGetSelText, mfCall);
	TLuaMethodInfo.Create(CustomEditFuncs, 'TextHint', @VCLua_Edit_VCLuaGetTextHint, mfCall);
	CustomEditSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomEditSets, 'Alignment', @VCLua_Edit_VCLuaSetAlignment, mfCall, TypeInfo(TAlignment));
	TLuaMethodInfo.Create(CustomEditSets, 'CaretPos', @VCLua_Edit_VCLuaSetCaretPos, mfCall, TypeInfo(TPoint));
	TLuaMethodInfo.Create(CustomEditSets, 'CharCase', @VCLua_Edit_VCLuaSetCharCase, mfCall, TypeInfo(TEditCharCase));
	TLuaMethodInfo.Create(CustomEditSets, 'EchoMode', @VCLua_Edit_VCLuaSetEchoMode, mfCall, TypeInfo(TEchoMode));
	TLuaMethodInfo.Create(CustomEditSets, 'HideSelection', @VCLua_Edit_VCLuaSetHideSelection, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomEditSets, 'MaxLength', @VCLua_Edit_VCLuaSetMaxLength, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomEditSets, 'Modified', @VCLua_Edit_VCLuaSetModified, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomEditSets, 'NumbersOnly', @VCLua_Edit_VCLuaSetNumbersOnly, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomEditSets, 'OnChange', @VCLua_Edit_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomEditSets, 'PasswordChar', @VCLua_Edit_VCLuaSetPasswordChar, mfCall, TypeInfo(Char));
	TLuaMethodInfo.Create(CustomEditSets, 'ReadOnly', @VCLua_Edit_VCLuaSetReadOnly, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomEditSets, 'SelLength', @VCLua_Edit_VCLuaSetSelLength, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(CustomEditSets, 'SelStart', @VCLua_Edit_VCLuaSetSelStart, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(CustomEditSets, 'SelText', @VCLua_Edit_VCLuaSetSelText, mfCall, TypeInfo(String));
	TLuaMethodInfo.Create(CustomEditSets, 'TextHint', @VCLua_Edit_VCLuaSetTextHint, mfCall, TypeInfo(TTranslateString));
end.
