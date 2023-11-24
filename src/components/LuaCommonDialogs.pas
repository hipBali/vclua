(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaCommonDialogs;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Dialogs, Controls;

function CreateColorButton(L: Plua_State): Integer; cdecl;
procedure ColorButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorButton = class(TColorButton)
        LuaCtl: TVCLuaControl;
    end;

function CreateOpenDialog(L: Plua_State): Integer; cdecl;
procedure OpenDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaOpenDialog = class(TOpenDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateSaveDialog(L: Plua_State): Integer; cdecl;
procedure SaveDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSaveDialog = class(TSaveDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
procedure SelectDirectoryDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSelectDirectoryDialog = class(TSelectDirectoryDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateColorDialog(L: Plua_State): Integer; cdecl;
procedure ColorDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorDialog = class(TColorDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateFontDialog(L: Plua_State): Integer; cdecl;
procedure FontDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFontDialog = class(TFontDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateFindDialog(L: Plua_State): Integer; cdecl;
procedure FindDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFindDialog = class(TFindDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateReplaceDialog(L: Plua_State): Integer; cdecl;
procedure ReplaceDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaReplaceDialog = class(TReplaceDialog)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_ColorButton_Click(L: Plua_State): Integer; cdecl;
var 
	lColorButton:TLuaColorButton;
begin
	CheckArg(L, 1);
	lColorButton := TLuaColorButton(GetLuaObject(L, 1));
	lColorButton.Click();
	
	Result := 0;
end;

function VCLua_OpenDialog_DoCanClose(L: Plua_State): Integer; cdecl;
var 
	lOpenDialog:TLuaOpenDialog;
	CanClose:Boolean;
begin
	CheckArg(L, 1);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	
	lOpenDialog.DoCanClose(CanClose);
	lua_pushboolean(L,CanClose);
	Result := 1;
end;

function VCLua_OpenDialog_DoFolderChange(L: Plua_State): Integer; cdecl;
var 
	lOpenDialog:TLuaOpenDialog;
begin
	CheckArg(L, 1);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	lOpenDialog.DoFolderChange();
	
	Result := 0;
end;

function VCLua_OpenDialog_DoSelectionChange(L: Plua_State): Integer; cdecl;
var 
	lOpenDialog:TLuaOpenDialog;
begin
	CheckArg(L, 1);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	lOpenDialog.DoSelectionChange();
	
	Result := 0;
end;

function VCLua_OpenDialog_IntfSetOption(L: Plua_State): Integer; cdecl;
var 
	lOpenDialog:TLuaOpenDialog;
	AOption:TOpenOption;
	AValue:Boolean;
begin
	CheckArg(L, 3);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	AOption := TOpenOption(GetLuaObject(L,2));
	AValue := lua_toboolean(L,3);
	lOpenDialog.IntfSetOption(AOption,AValue);
	
	Result := 0;
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
	lFontDialog.ApplyClicked();
	
	Result := 0;
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
	lFindDialog.CloseDialog();
	
	Result := 0;
end;

function VCLua_FindDialog_Execute(L: Plua_State): Integer; cdecl;
var 
	lFindDialog:TLuaFindDialog;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lFindDialog := TLuaFindDialog(GetLuaObject(L, 1));
	ret := lFindDialog.Execute();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_ReplaceDialog_CloseDialog(L: Plua_State): Integer; cdecl;
var 
	lReplaceDialog:TLuaReplaceDialog;
begin
	CheckArg(L, 1);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	lReplaceDialog.CloseDialog();
	
	Result := 0;
end;

function VCLua_ReplaceDialog_Execute(L: Plua_State): Integer; cdecl;
var 
	lReplaceDialog:TLuaReplaceDialog;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lReplaceDialog := TLuaReplaceDialog(GetLuaObject(L, 1));
	ret := lReplaceDialog.Execute();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

procedure ColorButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Click', @VCLua_ColorButton_Click);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lColorButton.LuaCtl := TVCLuaControl.Create(TControl(lColorButton),L,@ColorButtonToTable);
	InitControl(L,lColorButton,Name);
	ColorButtonToTable(L, -1, lColorButton);
	Result := 1;
end;

procedure OpenDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'DoCanClose', @VCLua_OpenDialog_DoCanClose);
	LuaSetTableFunction(L, Index, 'DoFolderChange', @VCLua_OpenDialog_DoFolderChange);
	LuaSetTableFunction(L, Index, 'DoSelectionChange', @VCLua_OpenDialog_DoSelectionChange);
	LuaSetTableFunction(L, Index, 'IntfSetOption', @VCLua_OpenDialog_IntfSetOption);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_OpenDialog_DoExecute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lOpenDialog.LuaCtl := TVCLuaControl.Create(TControl(lOpenDialog),L,@OpenDialogToTable);
	InitControl(L,lOpenDialog,Name);
	OpenDialogToTable(L, -1, lOpenDialog);
	Result := 1;
end;

procedure SaveDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_SaveDialog_DoExecute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lSaveDialog.LuaCtl := TVCLuaControl.Create(TControl(lSaveDialog),L,@SaveDialogToTable);
	InitControl(L,lSaveDialog,Name);
	SaveDialogToTable(L, -1, lSaveDialog);
	Result := 1;
end;

procedure SelectDirectoryDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_SelectDirectoryDialog_DoExecute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lSelectDirectoryDialog.LuaCtl := TVCLuaControl.Create(TControl(lSelectDirectoryDialog),L,@SelectDirectoryDialogToTable);
	InitControl(L,lSelectDirectoryDialog,Name);
	SelectDirectoryDialogToTable(L, -1, lSelectDirectoryDialog);
	Result := 1;
end;

procedure ColorDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_ColorDialog_DoExecute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lColorDialog.LuaCtl := TVCLuaControl.Create(TControl(lColorDialog),L,@ColorDialogToTable);
	InitControl(L,lColorDialog,Name);
	ColorDialogToTable(L, -1, lColorDialog);
	Result := 1;
end;

procedure FontDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'ApplyClicked', @VCLua_FontDialog_ApplyClicked);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_FontDialog_DoExecute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lFontDialog.LuaCtl := TVCLuaControl.Create(TControl(lFontDialog),L,@FontDialogToTable);
	InitControl(L,lFontDialog,Name);
	FontDialogToTable(L, -1, lFontDialog);
	Result := 1;
end;

procedure FindDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'CloseDialog', @VCLua_FindDialog_CloseDialog);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_FindDialog_Execute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lFindDialog.LuaCtl := TVCLuaControl.Create(TControl(lFindDialog),L,@FindDialogToTable);
	InitControl(L,lFindDialog,Name);
	FindDialogToTable(L, -1, lFindDialog);
	Result := 1;
end;

procedure ReplaceDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'CloseDialog', @VCLua_ReplaceDialog_CloseDialog);
	LuaSetTableFunction(L, Index, 'Execute', @VCLua_ReplaceDialog_Execute);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lReplaceDialog.LuaCtl := TVCLuaControl.Create(TControl(lReplaceDialog),L,@ReplaceDialogToTable);
	InitControl(L,lReplaceDialog,Name);
	ReplaceDialogToTable(L, -1, lReplaceDialog);
	Result := 1;
end;

end.
