(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCommonDialogs;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Dialogs;

function CreateColorButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorButton = class(TColorButton)
    end;
var
    ColorButtonFuncs: TLuaVmt;
    ColorButtonSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TCommonDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCommonDialog = class(TCommonDialog)
    end;
var
    CommonDialogFuncs: TLuaVmt;
    CommonDialogSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TFileDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFileDialog = class(TFileDialog)
    end;
var
    FileDialogFuncs: TLuaVmt;
    FileDialogSets: TLuaVmt;

function CreateOpenDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TOpenDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaOpenDialog = class(TOpenDialog)
    end;
var
    OpenDialogFuncs: TLuaVmt;
    OpenDialogSets: TLuaVmt;

function CreateSaveDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSaveDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSaveDialog = class(TSaveDialog)
    end;
var
    SaveDialogFuncs: TLuaVmt;
    SaveDialogSets: TLuaVmt;

function CreateSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSelectDirectoryDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSelectDirectoryDialog = class(TSelectDirectoryDialog)
    end;
var
    SelectDirectoryDialogFuncs: TLuaVmt;
    SelectDirectoryDialogSets: TLuaVmt;

function CreateColorDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorDialog = class(TColorDialog)
    end;
var
    ColorDialogFuncs: TLuaVmt;
    ColorDialogSets: TLuaVmt;

function CreateFontDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFontDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFontDialog = class(TFontDialog)
    end;
var
    FontDialogFuncs: TLuaVmt;
    FontDialogSets: TLuaVmt;

function CreateFindDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFindDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFindDialog = class(TFindDialog)
    end;
var
    FindDialogFuncs: TLuaVmt;
    FindDialogSets: TLuaVmt;

function CreateReplaceDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TReplaceDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaReplaceDialog = class(TReplaceDialog)
    end;
var
    ReplaceDialogFuncs: TLuaVmt;
    ReplaceDialogSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaDialogsEvents, LuaEvent, LuaStrings;


function VCLua_CommonDialog_VCLuaSetOnDialogResult(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCommonDialog.OnDialogResult));
	lCommonDialog.OnDialogResult := TLuaEvent.Factory<TDialogResultEvent,TLuaDialogResultEvent>(L);
	Result := 0;
end;

function VCLua_CommonDialog_VCLuaSetFCompStyle(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	val:LongInt;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCommonDialog.FCompStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'SetFCompStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_VCLuaGetFCompStyle(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	ret:LongInt;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCommonDialog.FCompStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'GetFCompStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CommonDialog_Execute(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCommonDialog := TLuaCommonDialog(GetLuaObject(L, 1));
	try
		ret := lCommonDialog.Execute();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'Execute', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CommonDialog_VCLuaSetHandle(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	val:THandle;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCommonDialog.Handle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'SetHandle', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	ret:THandle;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCommonDialog.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'GetHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CommonDialog_VCLuaSetUserChoice(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	val:Integer;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCommonDialog.UserChoice := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'SetUserChoice', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_VCLuaGetUserChoice(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	ret:Integer;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCommonDialog.UserChoice;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'GetUserChoice', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CommonDialog_Close(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
begin
	CheckArg(L, 1);
	lCommonDialog := TLuaCommonDialog(GetLuaObject(L, 1));
	try
		lCommonDialog.Close();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'Close', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_DoShow(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
begin
	CheckArg(L, 1);
	lCommonDialog := TLuaCommonDialog(GetLuaObject(L, 1));
	try
		lCommonDialog.DoShow();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'DoShow', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_DoCanClose(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	CanClose:Boolean;
begin
	CheckArg(L, 1);
	lCommonDialog := TLuaCommonDialog(GetLuaObject(L, 1));
	try
		lCommonDialog.DoCanClose(CanClose);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'DoCanClose', E.ClassName, E.Message);
	end;
	lua_push(L,CanClose);
end;

function VCLua_CommonDialog_DoCanClose2(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	CanClose:Boolean;
begin
	CheckArg(L, 2);
	lCommonDialog := TLuaCommonDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@CanClose);
	try
		lCommonDialog.DoCanClose(CanClose);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'DoCanClose', E.ClassName, E.Message);
	end;
	lua_push(L,CanClose);
end;

function VCLua_CommonDialog_DoClose(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
begin
	CheckArg(L, 1);
	lCommonDialog := TLuaCommonDialog(GetLuaObject(L, 1));
	try
		lCommonDialog.DoClose();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'DoClose', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCommonDialog := TLuaCommonDialog(GetLuaObject(L, 1));
	try
		ret := lCommonDialog.HandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CommonDialog_VCLuaSetWidth(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	val:Integer;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCommonDialog.Width := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'SetWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_VCLuaGetWidth(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	ret:Integer;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCommonDialog.Width;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'GetWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CommonDialog_VCLuaSetHeight(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	val:Integer;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCommonDialog.Height := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'SetHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_CommonDialog_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lCommonDialog:TLuaCommonDialog;
	ret:Integer;
begin
	lCommonDialog := TLuaCommonDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCommonDialog.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CommonDialog', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FileDialog_DoTypeChange(L: Plua_State): Integer; cdecl;
var
	lFileDialog:TLuaFileDialog;
begin
	CheckArg(L, 1);
	lFileDialog := TLuaFileDialog(GetLuaObject(L, 1));
	try
		lFileDialog.DoTypeChange();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FileDialog', 'DoTypeChange', E.ClassName, E.Message);
	end;
end;

function VCLua_FileDialog_VCLuaGetFiles(L: Plua_State): Integer; cdecl;
var
	lFileDialog:TLuaFileDialog;
	ret:TStrings;
begin
	lFileDialog := TLuaFileDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFileDialog.Files;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FileDialog', 'GetFiles', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FileDialog_VCLuaSetHistoryList(L: Plua_State): Integer; cdecl;
var
	lFileDialog:TLuaFileDialog;
	val:TStrings;
	valNeedsFree:Boolean = False;
begin
	lFileDialog := TLuaFileDialog(GetLuaObjectUnsafe(L, 1));
	valNeedsFree := luaL_checkOrFromTable(L,2,@val,@luaL_checkStringList,TypeInfo(val));
	try
		lFileDialog.HistoryList := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FileDialog', 'SetHistoryList', E.ClassName, E.Message);
	end;
	if valNeedsFree then val.Free;
end;

function VCLua_FileDialog_VCLuaGetHistoryList(L: Plua_State): Integer; cdecl;
var
	lFileDialog:TLuaFileDialog;
	ret:TStrings;
begin
	lFileDialog := TLuaFileDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFileDialog.HistoryList;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FileDialog', 'GetHistoryList', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FileDialog_IntfFileTypeChanged(L: Plua_State): Integer; cdecl;
var
	lFileDialog:TLuaFileDialog;
	NewFilterIndex:Integer;
begin
	CheckArg(L, 2);
	lFileDialog := TLuaFileDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@NewFilterIndex);
	try
		lFileDialog.IntfFileTypeChanged(NewFilterIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FileDialog', 'IntfFileTypeChanged', E.ClassName, E.Message);
	end;
end;

function VCLua_FileDialog_FindMaskInFilter(L: Plua_State): Integer; cdecl;
var
	lFileDialog:TLuaFileDialog;
	aFilter:string;
	aMask:string;
	ret:Integer;
begin
	CheckArg(L, 3);
	lFileDialog := TLuaFileDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@aFilter);
	luaL_check(L,3,@aMask);
	try
		ret := lFileDialog.FindMaskInFilter(aFilter,aMask);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FileDialog', 'FindMaskInFilter', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FileDialog_ExtractAllFilterMasks(L: Plua_State): Integer; cdecl;
var
	lFileDialog:TLuaFileDialog;
	aFilter:string;
	SkipAllFilesMask:Boolean;
	ret:string;
begin
	CheckArg(L, 2, 3);
	lFileDialog := TLuaFileDialog(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@aFilter);
	TTrait<Boolean>.luaL_optcheck(L, 3, @SkipAllFilesMask, true);
	try
		ret := lFileDialog.ExtractAllFilterMasks(aFilter,SkipAllFilesMask);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FileDialog', 'ExtractAllFilterMasks', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OpenDialog_DoFolderChange(L: Plua_State): Integer; cdecl;
var
	lOpenDialog:TLuaOpenDialog;
begin
	CheckArg(L, 1);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	try
		lOpenDialog.DoFolderChange();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OpenDialog', 'DoFolderChange', E.ClassName, E.Message);
	end;
end;

function VCLua_OpenDialog_DoSelectionChange(L: Plua_State): Integer; cdecl;
var
	lOpenDialog:TLuaOpenDialog;
begin
	CheckArg(L, 1);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	try
		lOpenDialog.DoSelectionChange();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OpenDialog', 'DoSelectionChange', E.ClassName, E.Message);
	end;
end;

function VCLua_OpenDialog_IntfSetOption(L: Plua_State): Integer; cdecl;
var
	lOpenDialog:TLuaOpenDialog;
	AOption:TOpenOption;
	AValue:Boolean;
begin
	CheckArg(L, 3);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@AOption,TypeInfo(TOpenOption));
	luaL_check(L,3,@AValue);
	try
		lOpenDialog.IntfSetOption(AOption,AValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OpenDialog', 'IntfSetOption', E.ClassName, E.Message);
	end;
end;




function VCLua_FontDialog_ApplyClicked(L: Plua_State): Integer; cdecl;
var
	lFontDialog:TLuaFontDialog;
begin
	CheckArg(L, 1);
	lFontDialog := TLuaFontDialog(GetLuaObject(L, 1));
	try
		lFontDialog.ApplyClicked();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FontDialog', 'ApplyClicked', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaSetOnReplace(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
begin
	lFindDialog := TLuaFindDialog(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lFindDialog.OnReplace));
	lFindDialog.OnReplace := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_FindDialog_CloseDialog(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
begin
	CheckArg(L, 1);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	try
		lFindDialog.CloseDialog();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'CloseDialog', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaSetLeft(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	val:Integer;
begin
	lFindDialog := TLuaFindDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFindDialog.Left := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'SetLeft', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaGetLeft(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	ret:Integer;
begin
	lFindDialog := TLuaFindDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFindDialog.Left;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'GetLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FindDialog_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	val:TPoint;
begin
	lFindDialog := TLuaFindDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFindDialog.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'SetPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	ret:TPoint;
begin
	lFindDialog := TLuaFindDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFindDialog.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'GetPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FindDialog_VCLuaSetTop(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	val:Integer;
begin
	lFindDialog := TLuaFindDialog(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFindDialog.Top := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'SetTop', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaGetTop(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	ret:Integer;
begin
	lFindDialog := TLuaFindDialog(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFindDialog.Top;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'GetTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;


procedure lua_push(L: Plua_State; const v: TColorButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TColorButton',v);
end;
function CreateColorButton(L: Plua_State): Integer; cdecl;
var
	lColorButton:TLuaColorButton;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lColorButton := TLuaColorButton.Create(Parent);
	lColorButton.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TColorButton',lColorButton);
	InitControl(L,lColorButton,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'ColorButton', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TCommonDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCommonDialog',v);
end;

procedure lua_push(L: Plua_State; const v: TFileDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TFileDialog',v);
end;

procedure lua_push(L: Plua_State; const v: TOpenDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TOpenDialog',v);
end;
function CreateOpenDialog(L: Plua_State): Integer; cdecl;
var
	lOpenDialog:TLuaOpenDialog;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lOpenDialog := TLuaOpenDialog.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TOpenDialog',lOpenDialog);
	InitControl(L,lOpenDialog,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'OpenDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TSaveDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TSaveDialog',v);
end;
function CreateSaveDialog(L: Plua_State): Integer; cdecl;
var
	lSaveDialog:TLuaSaveDialog;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lSaveDialog := TLuaSaveDialog.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TSaveDialog',lSaveDialog);
	InitControl(L,lSaveDialog,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'SaveDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TSelectDirectoryDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TSelectDirectoryDialog',v);
end;
function CreateSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
var
	lSelectDirectoryDialog:TLuaSelectDirectoryDialog;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lSelectDirectoryDialog := TLuaSelectDirectoryDialog.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TSelectDirectoryDialog',lSelectDirectoryDialog);
	InitControl(L,lSelectDirectoryDialog,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'SelectDirectoryDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TColorDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TColorDialog',v);
end;
function CreateColorDialog(L: Plua_State): Integer; cdecl;
var
	lColorDialog:TLuaColorDialog;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lColorDialog := TLuaColorDialog.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TColorDialog',lColorDialog);
	InitControl(L,lColorDialog,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'ColorDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TFontDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TFontDialog',v);
end;
function CreateFontDialog(L: Plua_State): Integer; cdecl;
var
	lFontDialog:TLuaFontDialog;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lFontDialog := TLuaFontDialog.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TFontDialog',lFontDialog);
	InitControl(L,lFontDialog,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'FontDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TFindDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TFindDialog',v);
end;
function CreateFindDialog(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lFindDialog := TLuaFindDialog.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TFindDialog',lFindDialog);
	InitControl(L,lFindDialog,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'FindDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TReplaceDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TReplaceDialog',v);
end;
function CreateReplaceDialog(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lReplaceDialog := TLuaReplaceDialog.Create(Parent);
	// := TWinControl(Parent);
	CreateTableForKnownType(L,'TReplaceDialog',lReplaceDialog);
	InitControl(L,lReplaceDialog,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'ReplaceDialog', E.ClassName, E.Message);
	end;
end;

begin
	ColorButtonFuncs := TLuaVmt.Create;
	
	ColorButtonSets := TLuaVmt.Create;
	
	CommonDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CommonDialogFuncs, 'FCompStyle', @VCLua_CommonDialog_VCLuaGetFCompStyle, mfCall);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'Execute', @VCLua_CommonDialog_Execute);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'Handle', @VCLua_CommonDialog_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'UserChoice', @VCLua_CommonDialog_VCLuaGetUserChoice, mfCall);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'Close', @VCLua_CommonDialog_Close);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'DoShow', @VCLua_CommonDialog_DoShow);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'DoCanClose', @VCLua_CommonDialog_DoCanClose);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'DoCanClose2', @VCLua_CommonDialog_DoCanClose2);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'DoClose', @VCLua_CommonDialog_DoClose);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'HandleAllocated', @VCLua_CommonDialog_HandleAllocated);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'Width', @VCLua_CommonDialog_VCLuaGetWidth, mfCall);
	TLuaMethodInfo.Create(CommonDialogFuncs, 'Height', @VCLua_CommonDialog_VCLuaGetHeight, mfCall);
	CommonDialogSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CommonDialogSets, 'OnDialogResult', @VCLua_CommonDialog_VCLuaSetOnDialogResult, mfCall, TypeInfo(TDialogResultEvent));
	TLuaMethodInfo.Create(CommonDialogSets, 'FCompStyle', @VCLua_CommonDialog_VCLuaSetFCompStyle, mfCall, TypeInfo(LongInt));
	TLuaMethodInfo.Create(CommonDialogSets, 'Handle', @VCLua_CommonDialog_VCLuaSetHandle, mfCall, TypeInfo(THandle));
	TLuaMethodInfo.Create(CommonDialogSets, 'UserChoice', @VCLua_CommonDialog_VCLuaSetUserChoice, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CommonDialogSets, 'Width', @VCLua_CommonDialog_VCLuaSetWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CommonDialogSets, 'Height', @VCLua_CommonDialog_VCLuaSetHeight, mfCall, TypeInfo(Integer));
	FileDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FileDialogFuncs, 'DoTypeChange', @VCLua_FileDialog_DoTypeChange);
	TLuaMethodInfo.Create(FileDialogFuncs, 'Files', @VCLua_FileDialog_VCLuaGetFiles, mfCall);
	TLuaMethodInfo.Create(FileDialogFuncs, 'HistoryList', @VCLua_FileDialog_VCLuaGetHistoryList, mfCall);
	TLuaMethodInfo.Create(FileDialogFuncs, 'IntfFileTypeChanged', @VCLua_FileDialog_IntfFileTypeChanged);
	TLuaMethodInfo.Create(FileDialogFuncs, 'FindMaskInFilter', @VCLua_FileDialog_FindMaskInFilter);
	TLuaMethodInfo.Create(FileDialogFuncs, 'ExtractAllFilterMasks', @VCLua_FileDialog_ExtractAllFilterMasks);
	FileDialogSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(FileDialogSets, 'HistoryList', @VCLua_FileDialog_VCLuaSetHistoryList, mfCall, TypeInfo(TStrings));
	OpenDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(OpenDialogFuncs, 'DoFolderChange', @VCLua_OpenDialog_DoFolderChange);
	TLuaMethodInfo.Create(OpenDialogFuncs, 'DoSelectionChange', @VCLua_OpenDialog_DoSelectionChange);
	TLuaMethodInfo.Create(OpenDialogFuncs, 'IntfSetOption', @VCLua_OpenDialog_IntfSetOption);
	OpenDialogSets := TLuaVmt.Create;
	
	SaveDialogFuncs := TLuaVmt.Create;
	
	SaveDialogSets := TLuaVmt.Create;
	
	SelectDirectoryDialogFuncs := TLuaVmt.Create;
	
	SelectDirectoryDialogSets := TLuaVmt.Create;
	
	ColorDialogFuncs := TLuaVmt.Create;
	
	ColorDialogSets := TLuaVmt.Create;
	
	FontDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FontDialogFuncs, 'ApplyClicked', @VCLua_FontDialog_ApplyClicked);
	FontDialogSets := TLuaVmt.Create;
	
	FindDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FindDialogFuncs, 'CloseDialog', @VCLua_FindDialog_CloseDialog);
	TLuaMethodInfo.Create(FindDialogFuncs, 'Left', @VCLua_FindDialog_VCLuaGetLeft, mfCall);
	TLuaMethodInfo.Create(FindDialogFuncs, 'Position', @VCLua_FindDialog_VCLuaGetPosition, mfCall);
	TLuaMethodInfo.Create(FindDialogFuncs, 'Top', @VCLua_FindDialog_VCLuaGetTop, mfCall);
	FindDialogSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(FindDialogSets, 'OnReplace', @VCLua_FindDialog_VCLuaSetOnReplace, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(FindDialogSets, 'Left', @VCLua_FindDialog_VCLuaSetLeft, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(FindDialogSets, 'Position', @VCLua_FindDialog_VCLuaSetPosition, mfCall, TypeInfo(TPoint));
	TLuaMethodInfo.Create(FindDialogSets, 'Top', @VCLua_FindDialog_VCLuaSetTop, mfCall, TypeInfo(Integer));
	ReplaceDialogFuncs := TLuaVmt.Create;
	
	ReplaceDialogSets := TLuaVmt.Create;
	
end.
