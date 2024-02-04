(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCommonDialogs;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Dialogs, Controls, TypInfo;

function CreateColorButton(L: Plua_State): Integer; cdecl;
function IsColorButton(L: Plua_State): Integer; cdecl;
function AsColorButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorButton; pti: PTypeInfo = nil); overload; inline;
procedure ColorButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorButton = class(TColorButton)
        LuaCtl: TVCLuaControl;
    end;

function CreateOpenDialog(L: Plua_State): Integer; cdecl;
function IsOpenDialog(L: Plua_State): Integer; cdecl;
function AsOpenDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TOpenDialog; pti: PTypeInfo = nil); overload; inline;
procedure OpenDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaOpenDialog = class(TOpenDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateSaveDialog(L: Plua_State): Integer; cdecl;
function IsSaveDialog(L: Plua_State): Integer; cdecl;
function AsSaveDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSaveDialog; pti: PTypeInfo = nil); overload; inline;
procedure SaveDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSaveDialog = class(TSaveDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
function IsSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
function AsSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSelectDirectoryDialog; pti: PTypeInfo = nil); overload; inline;
procedure SelectDirectoryDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSelectDirectoryDialog = class(TSelectDirectoryDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateColorDialog(L: Plua_State): Integer; cdecl;
function IsColorDialog(L: Plua_State): Integer; cdecl;
function AsColorDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorDialog; pti: PTypeInfo = nil); overload; inline;
procedure ColorDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorDialog = class(TColorDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateFontDialog(L: Plua_State): Integer; cdecl;
function IsFontDialog(L: Plua_State): Integer; cdecl;
function AsFontDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFontDialog; pti: PTypeInfo = nil); overload; inline;
procedure FontDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFontDialog = class(TFontDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateFindDialog(L: Plua_State): Integer; cdecl;
function IsFindDialog(L: Plua_State): Integer; cdecl;
function AsFindDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFindDialog; pti: PTypeInfo = nil); overload; inline;
procedure FindDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFindDialog = class(TFindDialog)
        LuaCtl: TVCLuaControl;
    end;

function CreateReplaceDialog(L: Plua_State): Integer; cdecl;
function IsReplaceDialog(L: Plua_State): Integer; cdecl;
function AsReplaceDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TReplaceDialog; pti: PTypeInfo = nil); overload; inline;
procedure ReplaceDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaReplaceDialog = class(TReplaceDialog)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,CanClose);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
	Result := 1;
end;

function IsColorButton(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TColorButton);
end;
function AsColorButton(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TColorButton then
    lua_push(L, TColorButton(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TColorButton; pti: PTypeInfo);
begin
	ColorButtonToTable(L,-1,v);
end;
procedure ColorButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lColorButton.LuaCtl := TVCLuaControl.Create(lColorButton as TComponent,L,@ColorButtonToTable);
	InitControl(L,lColorButton,Name);
	ColorButtonToTable(L, -1, lColorButton);
	Result := 1;
end;

function IsOpenDialog(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TOpenDialog);
end;
function AsOpenDialog(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TOpenDialog then
    lua_push(L, TOpenDialog(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TOpenDialog; pti: PTypeInfo);
begin
	OpenDialogToTable(L,-1,v);
end;
procedure OpenDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lOpenDialog.LuaCtl := TVCLuaControl.Create(lOpenDialog as TComponent,L,@OpenDialogToTable);
	InitControl(L,lOpenDialog,Name);
	OpenDialogToTable(L, -1, lOpenDialog);
	Result := 1;
end;

function IsSaveDialog(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TSaveDialog);
end;
function AsSaveDialog(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TSaveDialog then
    lua_push(L, TSaveDialog(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TSaveDialog; pti: PTypeInfo);
begin
	SaveDialogToTable(L,-1,v);
end;
procedure SaveDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lSaveDialog.LuaCtl := TVCLuaControl.Create(lSaveDialog as TComponent,L,@SaveDialogToTable);
	InitControl(L,lSaveDialog,Name);
	SaveDialogToTable(L, -1, lSaveDialog);
	Result := 1;
end;

function IsSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TSelectDirectoryDialog);
end;
function AsSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TSelectDirectoryDialog then
    lua_push(L, TSelectDirectoryDialog(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TSelectDirectoryDialog; pti: PTypeInfo);
begin
	SelectDirectoryDialogToTable(L,-1,v);
end;
procedure SelectDirectoryDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lSelectDirectoryDialog.LuaCtl := TVCLuaControl.Create(lSelectDirectoryDialog as TComponent,L,@SelectDirectoryDialogToTable);
	InitControl(L,lSelectDirectoryDialog,Name);
	SelectDirectoryDialogToTable(L, -1, lSelectDirectoryDialog);
	Result := 1;
end;

function IsColorDialog(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TColorDialog);
end;
function AsColorDialog(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TColorDialog then
    lua_push(L, TColorDialog(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TColorDialog; pti: PTypeInfo);
begin
	ColorDialogToTable(L,-1,v);
end;
procedure ColorDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lColorDialog.LuaCtl := TVCLuaControl.Create(lColorDialog as TComponent,L,@ColorDialogToTable);
	InitControl(L,lColorDialog,Name);
	ColorDialogToTable(L, -1, lColorDialog);
	Result := 1;
end;

function IsFontDialog(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TFontDialog);
end;
function AsFontDialog(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TFontDialog then
    lua_push(L, TFontDialog(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TFontDialog; pti: PTypeInfo);
begin
	FontDialogToTable(L,-1,v);
end;
procedure FontDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lFontDialog.LuaCtl := TVCLuaControl.Create(lFontDialog as TComponent,L,@FontDialogToTable);
	InitControl(L,lFontDialog,Name);
	FontDialogToTable(L, -1, lFontDialog);
	Result := 1;
end;

function IsFindDialog(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TFindDialog);
end;
function AsFindDialog(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TFindDialog then
    lua_push(L, TFindDialog(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TFindDialog; pti: PTypeInfo);
begin
	FindDialogToTable(L,-1,v);
end;
procedure FindDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lFindDialog.LuaCtl := TVCLuaControl.Create(lFindDialog as TComponent,L,@FindDialogToTable);
	InitControl(L,lFindDialog,Name);
	FindDialogToTable(L, -1, lFindDialog);
	Result := 1;
end;

function IsReplaceDialog(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TReplaceDialog);
end;
function AsReplaceDialog(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TReplaceDialog then
    lua_push(L, TReplaceDialog(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TReplaceDialog; pti: PTypeInfo);
begin
	ReplaceDialogToTable(L,-1,v);
end;
procedure ReplaceDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lReplaceDialog.LuaCtl := TVCLuaControl.Create(lReplaceDialog as TComponent,L,@ReplaceDialogToTable);
	InitControl(L,lReplaceDialog,Name);
	ReplaceDialogToTable(L, -1, lReplaceDialog);
	Result := 1;
end;

end.
