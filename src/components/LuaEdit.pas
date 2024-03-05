(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaEdit = class(TEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomEditFuncs: TLuaVmt;
    CustomEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LCLType;

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
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAlignment));
	try
		lEdit.Alignment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Alignment', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetAlignment(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TAlignment;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.Alignment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Alignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaGetCanUndo(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.CanUndo;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CanUndo', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetCaretPos(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TPoint;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.CaretPos := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CaretPos', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetCaretPos(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.CaretPos;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CaretPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetCharCase(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TEditCharCase;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEditCharCase));
	try
		lEdit.CharCase := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CharCase', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetCharCase(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TEditCharCase;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.CharCase;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'CharCase', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaSetEchoMode(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TEchoMode;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEchoMode));
	try
		lEdit.EchoMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'EchoMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetEchoMode(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TEchoMode;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.EchoMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'EchoMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaGetEmulatedTextHintStatus(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TEmulatedTextHintStatus;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.EmulatedTextHintStatus;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'EmulatedTextHintStatus', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Edit_VCLuaSetHideSelection(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.HideSelection := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'HideSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetHideSelection(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.HideSelection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'HideSelection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetMaxLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Integer;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.MaxLength := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'MaxLength', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetMaxLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Integer;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.MaxLength;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'MaxLength', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetModified(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.Modified := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Modified', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetModified(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.Modified;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'Modified', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetNumbersOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.NumbersOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'NumbersOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetNumbersOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.NumbersOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'NumbersOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetPasswordChar(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Char;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.PasswordChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'PasswordChar', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetPasswordChar(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Char;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.PasswordChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'PasswordChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetReadOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:Boolean;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.ReadOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'ReadOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetReadOnly(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.ReadOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'ReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetSelLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:integer;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.SelLength := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelLength', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetSelLength(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:integer;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.SelLength;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelLength', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetSelStart(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:integer;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.SelStart := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelStart', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetSelStart(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:integer;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.SelStart;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelStart', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetSelText(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:String;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.SelText := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelText', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetSelText(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:String;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.SelText;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'SelText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Edit_VCLuaSetTextHint(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	val:TTranslateString;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lEdit.TextHint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Edit', 'TextHint', E.ClassName, E.Message);
	end;
end;

function VCLua_Edit_VCLuaGetTextHint(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	ret:TTranslateString;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	try
		ret := lEdit.TextHint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Edit', 'TextHint', E.ClassName, E.Message);
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
	lEdit.LuaCtl := TVCLuaControl.Create(lEdit as TComponent,L,nil,'TCustomEdit');
	InitControl(L,lEdit,Name);
	CreateTableForKnownType(L,'TCustomEdit',lEdit);
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
	TLuaMethodInfo.Create(CustomEditSets, 'Alignment', @VCLua_Edit_VCLuaSetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'CaretPos', @VCLua_Edit_VCLuaSetCaretPos, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'CharCase', @VCLua_Edit_VCLuaSetCharCase, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'EchoMode', @VCLua_Edit_VCLuaSetEchoMode, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'HideSelection', @VCLua_Edit_VCLuaSetHideSelection, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'MaxLength', @VCLua_Edit_VCLuaSetMaxLength, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'Modified', @VCLua_Edit_VCLuaSetModified, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'NumbersOnly', @VCLua_Edit_VCLuaSetNumbersOnly, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'PasswordChar', @VCLua_Edit_VCLuaSetPasswordChar, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'ReadOnly', @VCLua_Edit_VCLuaSetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'SelLength', @VCLua_Edit_VCLuaSetSelLength, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'SelStart', @VCLua_Edit_VCLuaSetSelStart, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'SelText', @VCLua_Edit_VCLuaSetSelText, mfCall);
	TLuaMethodInfo.Create(CustomEditSets, 'TextHint', @VCLua_Edit_VCLuaSetTextHint, mfCall);
end.
