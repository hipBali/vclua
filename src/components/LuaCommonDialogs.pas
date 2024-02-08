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
var
    ColorButtonFuncs: aoluaL_Reg;

function CreateOpenDialog(L: Plua_State): Integer; cdecl;
function IsOpenDialog(L: Plua_State): Integer; cdecl;
function AsOpenDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TOpenDialog; pti: PTypeInfo = nil); overload; inline;
procedure OpenDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaOpenDialog = class(TOpenDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    OpenDialogFuncs: aoluaL_Reg;

function CreateSaveDialog(L: Plua_State): Integer; cdecl;
function IsSaveDialog(L: Plua_State): Integer; cdecl;
function AsSaveDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSaveDialog; pti: PTypeInfo = nil); overload; inline;
procedure SaveDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSaveDialog = class(TSaveDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    SaveDialogFuncs: aoluaL_Reg;

function CreateSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
function IsSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
function AsSelectDirectoryDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSelectDirectoryDialog; pti: PTypeInfo = nil); overload; inline;
procedure SelectDirectoryDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSelectDirectoryDialog = class(TSelectDirectoryDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    SelectDirectoryDialogFuncs: aoluaL_Reg;

function CreateColorDialog(L: Plua_State): Integer; cdecl;
function IsColorDialog(L: Plua_State): Integer; cdecl;
function AsColorDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorDialog; pti: PTypeInfo = nil); overload; inline;
procedure ColorDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaColorDialog = class(TColorDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    ColorDialogFuncs: aoluaL_Reg;

function CreateFontDialog(L: Plua_State): Integer; cdecl;
function IsFontDialog(L: Plua_State): Integer; cdecl;
function AsFontDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFontDialog; pti: PTypeInfo = nil); overload; inline;
procedure FontDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFontDialog = class(TFontDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    FontDialogFuncs: aoluaL_Reg;

function CreateFindDialog(L: Plua_State): Integer; cdecl;
function IsFindDialog(L: Plua_State): Integer; cdecl;
function AsFindDialog(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFindDialog; pti: PTypeInfo = nil); overload; inline;
procedure FindDialogToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFindDialog = class(TFindDialog)
        LuaCtl: TVCLuaControl;
    end;
var
    FindDialogFuncs: aoluaL_Reg;

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

function VCLua_OpenDialog_DoCanClose2(L: Plua_State): Integer; cdecl;
var
	lOpenDialog:TLuaOpenDialog;
	CanClose:Boolean;
begin
	CheckArg(L, 2);
	lOpenDialog := TLuaOpenDialog(GetLuaObject(L, 1));
	CanClose := lua_toboolean(L,2);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TColorButton');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TOpenDialog');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TSaveDialog');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TSelectDirectoryDialog');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TColorDialog');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TFontDialog');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TFindDialog');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TFindDialog');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
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

begin
	SetLength(ColorButtonFuncs, 1+1);
	ColorButtonFuncs[0].name:='Click';
	ColorButtonFuncs[0].func:=@VCLua_ColorButton_Click;
	ColorButtonFuncs[1].name:=nil;
	ColorButtonFuncs[1].func:=nil;

	SetLength(OpenDialogFuncs, 6+1);
	OpenDialogFuncs[0].name:='DoCanClose';
	OpenDialogFuncs[0].func:=@VCLua_OpenDialog_DoCanClose;
	OpenDialogFuncs[1].name:='DoCanClose2';
	OpenDialogFuncs[1].func:=@VCLua_OpenDialog_DoCanClose2;
	OpenDialogFuncs[2].name:='DoFolderChange';
	OpenDialogFuncs[2].func:=@VCLua_OpenDialog_DoFolderChange;
	OpenDialogFuncs[3].name:='DoSelectionChange';
	OpenDialogFuncs[3].func:=@VCLua_OpenDialog_DoSelectionChange;
	OpenDialogFuncs[4].name:='IntfSetOption';
	OpenDialogFuncs[4].func:=@VCLua_OpenDialog_IntfSetOption;
	OpenDialogFuncs[5].name:='Execute';
	OpenDialogFuncs[5].func:=@VCLua_OpenDialog_DoExecute;
	OpenDialogFuncs[6].name:=nil;
	OpenDialogFuncs[6].func:=nil;

	SetLength(SaveDialogFuncs, 1+1);
	SaveDialogFuncs[0].name:='Execute';
	SaveDialogFuncs[0].func:=@VCLua_SaveDialog_DoExecute;
	SaveDialogFuncs[1].name:=nil;
	SaveDialogFuncs[1].func:=nil;

	SetLength(SelectDirectoryDialogFuncs, 1+1);
	SelectDirectoryDialogFuncs[0].name:='Execute';
	SelectDirectoryDialogFuncs[0].func:=@VCLua_SelectDirectoryDialog_DoExecute;
	SelectDirectoryDialogFuncs[1].name:=nil;
	SelectDirectoryDialogFuncs[1].func:=nil;

	SetLength(ColorDialogFuncs, 1+1);
	ColorDialogFuncs[0].name:='Execute';
	ColorDialogFuncs[0].func:=@VCLua_ColorDialog_DoExecute;
	ColorDialogFuncs[1].name:=nil;
	ColorDialogFuncs[1].func:=nil;

	SetLength(FontDialogFuncs, 2+1);
	FontDialogFuncs[0].name:='ApplyClicked';
	FontDialogFuncs[0].func:=@VCLua_FontDialog_ApplyClicked;
	FontDialogFuncs[1].name:='Execute';
	FontDialogFuncs[1].func:=@VCLua_FontDialog_DoExecute;
	FontDialogFuncs[2].name:=nil;
	FontDialogFuncs[2].func:=nil;

	SetLength(FindDialogFuncs, 2+1);
	FindDialogFuncs[0].name:='CloseDialog';
	FindDialogFuncs[0].func:=@VCLua_FindDialog_CloseDialog;
	FindDialogFuncs[1].name:='Execute';
	FindDialogFuncs[1].func:=@VCLua_FindDialog_Execute;
	FindDialogFuncs[2].name:=nil;
	FindDialogFuncs[2].func:=nil;

end.
