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
        LuaCtl: TVCLuaControl;
    end;
var
    ColorButtonFuncs: TLuaVmt;
    ColorButtonSets: TLuaVmt;

function CreateOpenDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TOpenDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaOpenDialog = class(TOpenDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    OpenDialogFuncs: TLuaVmt;
    OpenDialogSets: TLuaVmt;

function CreateSaveDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSaveDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSaveDialog = class(TSaveDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    SaveDialogFuncs: TLuaVmt;
    SaveDialogSets: TLuaVmt;

function CreateSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSelectDirectoryDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSelectDirectoryDialog = class(TSelectDirectoryDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    SelectDirectoryDialogFuncs: TLuaVmt;
    SelectDirectoryDialogSets: TLuaVmt;

function CreateColorDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorDialog = class(TColorDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    ColorDialogFuncs: TLuaVmt;
    ColorDialogSets: TLuaVmt;

function CreateFontDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFontDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFontDialog = class(TFontDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    FontDialogFuncs: TLuaVmt;
    FontDialogSets: TLuaVmt;

function CreateFindDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFindDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFindDialog = class(TFindDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    FindDialogFuncs: TLuaVmt;
    FindDialogSets: TLuaVmt;

function CreateReplaceDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TReplaceDialog; pti: PTypeInfo = nil); overload; inline;

type
    TLuaReplaceDialog = class(TReplaceDialog)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_ColorButton_Click(L: Plua_State): Integer; cdecl;
var
	lColorButton:TLuaColorButton;
begin
	CheckArg(L, 1);
	lColorButton := TLuaColorButton(GetLuaObject(L, 1));
	try
		lColorButton.Click();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorButton', 'Click', E.ClassName, E.Message);
	end;
end;

function VCLua_OpenDialog_DoCanClose(L: Plua_State): Integer; cdecl;
var
	lOpenDialog:TLuaOpenDialog;
	CanClose:Boolean;
begin
	CheckArg(L, 1);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	try
		lOpenDialog.DoCanClose(CanClose);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OpenDialog', 'DoCanClose', E.ClassName, E.Message);
	end;
	lua_push(L,CanClose);
end;

function VCLua_OpenDialog_DoCanClose2(L: Plua_State): Integer; cdecl;
var
	lOpenDialog:TLuaOpenDialog;
	CanClose:Boolean;
begin
	CheckArg(L, 2);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@CanClose);
	try
		lOpenDialog.DoCanClose(CanClose);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OpenDialog', 'DoCanClose', E.ClassName, E.Message);
	end;
	lua_push(L,CanClose);
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

function VCLua_OpenDialog_DoExecute(L: Plua_State): Integer; cdecl;
var
  d: TCommonDialog;
begin
  d := TCommonDialog(GetLuaObject(L, 1));
  lua_pushboolean(L, d.Execute);
  Result := 1;
end;

function VCLua_SaveDialog_DoExecute(L: Plua_State): Integer; cdecl;
var
  d: TCommonDialog;
begin
  d := TCommonDialog(GetLuaObject(L, 1));
  lua_pushboolean(L, d.Execute);
  Result := 1;
end;

function VCLua_SelectDirectoryDialog_DoExecute(L: Plua_State): Integer; cdecl;
var
  d: TCommonDialog;
begin
  d := TCommonDialog(GetLuaObject(L, 1));
  lua_pushboolean(L, d.Execute);
  Result := 1;
end;

function VCLua_ColorDialog_DoExecute(L: Plua_State): Integer; cdecl;
var
  d: TCommonDialog;
begin
  d := TCommonDialog(GetLuaObject(L, 1));
  lua_pushboolean(L, d.Execute);
  Result := 1;
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

function VCLua_FontDialog_DoExecute(L: Plua_State): Integer; cdecl;
var
  d: TCommonDialog;
begin
  d := TCommonDialog(GetLuaObject(L, 1));
  lua_pushboolean(L, d.Execute);
  Result := 1;
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

function VCLua_FindDialog_Execute(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	try
		ret := lFindDialog.Execute();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'Execute', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FindDialog_VCLuaSetLeft(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	val:Integer;
begin
	CheckArg(L, 2);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFindDialog.Left := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'Left', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaGetLeft(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	ret:Integer;
begin
	CheckArg(L, 1);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	try
		ret := lFindDialog.Left;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'Left', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FindDialog_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	val:TPoint;
begin
	CheckArg(L, 2);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFindDialog.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'Position', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	try
		ret := lFindDialog.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'Position', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FindDialog_VCLuaSetTop(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	val:Integer;
begin
	CheckArg(L, 2);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lFindDialog.Top := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'Top', E.ClassName, E.Message);
	end;
end;

function VCLua_FindDialog_VCLuaGetTop(L: Plua_State): Integer; cdecl;
var
	lFindDialog:TLuaFindDialog;
	ret:Integer;
begin
	CheckArg(L, 1);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	try
		ret := lFindDialog.Top;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FindDialog', 'Top', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ReplaceDialog_CloseDialog(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
begin
	CheckArg(L, 1);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	try
		lReplaceDialog.CloseDialog();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'CloseDialog', E.ClassName, E.Message);
	end;
end;

function VCLua_ReplaceDialog_Execute(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	try
		ret := lReplaceDialog.Execute();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'Execute', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ReplaceDialog_VCLuaSetLeft(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	val:Integer;
begin
	CheckArg(L, 2);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lReplaceDialog.Left := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'Left', E.ClassName, E.Message);
	end;
end;

function VCLua_ReplaceDialog_VCLuaGetLeft(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	ret:Integer;
begin
	CheckArg(L, 1);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	try
		ret := lReplaceDialog.Left;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'Left', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ReplaceDialog_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	val:TPoint;
begin
	CheckArg(L, 2);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lReplaceDialog.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'Position', E.ClassName, E.Message);
	end;
end;

function VCLua_ReplaceDialog_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	try
		ret := lReplaceDialog.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'Position', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ReplaceDialog_VCLuaSetTop(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	val:Integer;
begin
	CheckArg(L, 2);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lReplaceDialog.Top := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'Top', E.ClassName, E.Message);
	end;
end;

function VCLua_ReplaceDialog_VCLuaGetTop(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	ret:Integer;
begin
	CheckArg(L, 1);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	try
		ret := lReplaceDialog.Top;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ReplaceDialog', 'Top', E.ClassName, E.Message);
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
	GetControlParents(L,TWinControl(Parent),Name);
	lColorButton := TLuaColorButton.Create(Parent);
	lColorButton.Parent := TWinControl(Parent);
	lColorButton.LuaCtl := TVCLuaControl.Create(lColorButton as TComponent,L,nil,'TColorButton');
	InitControl(L,lColorButton,Name);
	CreateTableForKnownType(L,'TColorButton',lColorButton);
	Result := 1;
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
	GetControlParents(L,TWinControl(Parent),Name);
	lOpenDialog := TLuaOpenDialog.Create(Parent);
	// := TWinControl(Parent);
	lOpenDialog.LuaCtl := TVCLuaControl.Create(lOpenDialog as TComponent,L,nil,'TOpenDialog');
	InitControl(L,lOpenDialog,Name);
	CreateTableForKnownType(L,'TOpenDialog',lOpenDialog);
	Result := 1;
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
	GetControlParents(L,TWinControl(Parent),Name);
	lSaveDialog := TLuaSaveDialog.Create(Parent);
	// := TWinControl(Parent);
	lSaveDialog.LuaCtl := TVCLuaControl.Create(lSaveDialog as TComponent,L,nil,'TSaveDialog');
	InitControl(L,lSaveDialog,Name);
	CreateTableForKnownType(L,'TSaveDialog',lSaveDialog);
	Result := 1;
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
	GetControlParents(L,TWinControl(Parent),Name);
	lSelectDirectoryDialog := TLuaSelectDirectoryDialog.Create(Parent);
	// := TWinControl(Parent);
	lSelectDirectoryDialog.LuaCtl := TVCLuaControl.Create(lSelectDirectoryDialog as TComponent,L,nil,'TSelectDirectoryDialog');
	InitControl(L,lSelectDirectoryDialog,Name);
	CreateTableForKnownType(L,'TSelectDirectoryDialog',lSelectDirectoryDialog);
	Result := 1;
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
	GetControlParents(L,TWinControl(Parent),Name);
	lColorDialog := TLuaColorDialog.Create(Parent);
	// := TWinControl(Parent);
	lColorDialog.LuaCtl := TVCLuaControl.Create(lColorDialog as TComponent,L,nil,'TColorDialog');
	InitControl(L,lColorDialog,Name);
	CreateTableForKnownType(L,'TColorDialog',lColorDialog);
	Result := 1;
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
	GetControlParents(L,TWinControl(Parent),Name);
	lFontDialog := TLuaFontDialog.Create(Parent);
	// := TWinControl(Parent);
	lFontDialog.LuaCtl := TVCLuaControl.Create(lFontDialog as TComponent,L,nil,'TFontDialog');
	InitControl(L,lFontDialog,Name);
	CreateTableForKnownType(L,'TFontDialog',lFontDialog);
	Result := 1;
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
	GetControlParents(L,TWinControl(Parent),Name);
	lFindDialog := TLuaFindDialog.Create(Parent);
	// := TWinControl(Parent);
	lFindDialog.LuaCtl := TVCLuaControl.Create(lFindDialog as TComponent,L,nil,'TFindDialog');
	InitControl(L,lFindDialog,Name);
	CreateTableForKnownType(L,'TFindDialog',lFindDialog);
	Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TReplaceDialog; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TFindDialog',v);
end;
function CreateReplaceDialog(L: Plua_State): Integer; cdecl;
var
	lReplaceDialog:TLuaReplaceDialog;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lReplaceDialog := TLuaReplaceDialog.Create(Parent);
	// := TWinControl(Parent);
	lReplaceDialog.LuaCtl := TVCLuaControl.Create(lReplaceDialog as TComponent,L,nil,'TFindDialog');
	InitControl(L,lReplaceDialog,Name);
	CreateTableForKnownType(L,'TFindDialog',lReplaceDialog);
	Result := 1;
end;

begin
	ColorButtonFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ColorButtonFuncs, 'Click', @VCLua_ColorButton_Click);
	ColorButtonSets := TLuaVmt.Create;
	
	OpenDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(OpenDialogFuncs, 'DoCanClose', @VCLua_OpenDialog_DoCanClose);
	TLuaMethodInfo.Create(OpenDialogFuncs, 'DoCanClose2', @VCLua_OpenDialog_DoCanClose2);
	TLuaMethodInfo.Create(OpenDialogFuncs, 'DoFolderChange', @VCLua_OpenDialog_DoFolderChange);
	TLuaMethodInfo.Create(OpenDialogFuncs, 'DoSelectionChange', @VCLua_OpenDialog_DoSelectionChange);
	TLuaMethodInfo.Create(OpenDialogFuncs, 'IntfSetOption', @VCLua_OpenDialog_IntfSetOption);
	TLuaMethodInfo.Create(OpenDialogFuncs, 'Execute', @VCLua_OpenDialog_DoExecute);
	OpenDialogSets := TLuaVmt.Create;
	
	SaveDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(SaveDialogFuncs, 'Execute', @VCLua_SaveDialog_DoExecute);
	SaveDialogSets := TLuaVmt.Create;
	
	SelectDirectoryDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(SelectDirectoryDialogFuncs, 'Execute', @VCLua_SelectDirectoryDialog_DoExecute);
	SelectDirectoryDialogSets := TLuaVmt.Create;
	
	ColorDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ColorDialogFuncs, 'Execute', @VCLua_ColorDialog_DoExecute);
	ColorDialogSets := TLuaVmt.Create;
	
	FontDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FontDialogFuncs, 'ApplyClicked', @VCLua_FontDialog_ApplyClicked);
	TLuaMethodInfo.Create(FontDialogFuncs, 'Execute', @VCLua_FontDialog_DoExecute);
	FontDialogSets := TLuaVmt.Create;
	
	FindDialogFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FindDialogFuncs, 'CloseDialog', @VCLua_FindDialog_CloseDialog);
	TLuaMethodInfo.Create(FindDialogFuncs, 'Execute', @VCLua_FindDialog_Execute);
	TLuaMethodInfo.Create(FindDialogFuncs, 'Left', @VCLua_FindDialog_VCLuaGetLeft, mfCall);
	TLuaMethodInfo.Create(FindDialogFuncs, 'Position', @VCLua_FindDialog_VCLuaGetPosition, mfCall);
	TLuaMethodInfo.Create(FindDialogFuncs, 'Top', @VCLua_FindDialog_VCLuaGetTop, mfCall);
	FindDialogSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(FindDialogSets, 'Left', @VCLua_FindDialog_VCLuaSetLeft, mfCall);
	TLuaMethodInfo.Create(FindDialogSets, 'Position', @VCLua_FindDialog_VCLuaSetPosition, mfCall);
	TLuaMethodInfo.Create(FindDialogSets, 'Top', @VCLua_FindDialog_VCLuaSetTop, mfCall);
end.
