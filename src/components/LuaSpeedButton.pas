(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpeedButton;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Buttons;

function CreateSpeedButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSpeedButton = class(TSpeedButton)
    end;
var
    CustomSpeedButtonFuncs: TLuaVmt;
    CustomSpeedButtonSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, ImgList, LuaBitmap, LuaImageList;

function VCLua_SpeedButton_FindDownButton(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TCustomSpeedButton;
begin
	CheckArg(L, 1);
	lSpeedButton := TLuaSpeedButton(GetLuaObject(L, 1));
	try
		ret := lSpeedButton.FindDownButton();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'FindDownButton', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_SpeedButton_Click(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
begin
	CheckArg(L, 1);
	lSpeedButton := TLuaSpeedButton(GetLuaObject(L, 1));
	try
		lSpeedButton.Click();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'Click', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_LoadGlyphFromResourceName(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	Instance:THandle;
	AName:String;
begin
	CheckArg(L, 3);
	lSpeedButton := TLuaSpeedButton(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@AName);
	try
		lSpeedButton.LoadGlyphFromResourceName(Instance,AName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'LoadGlyphFromResourceName', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_LoadGlyphFromLazarusResource(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	AName:String;
begin
	CheckArg(L, 2);
	lSpeedButton := TLuaSpeedButton(GetLuaObject(L, 1));
	luaL_check(L,2,@AName);
	try
		lSpeedButton.LoadGlyphFromLazarusResource(AName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'LoadGlyphFromLazarusResource', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaSetAlignment(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TAlignment;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAlignment));
	try
		lSpeedButton.Alignment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetAlignment', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetAlignment(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TAlignment;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Alignment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetAlignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_SpeedButton_VCLuaSetAllowAllUp(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.AllowAllUp := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetAllowAllUp', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetAllowAllUp(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.AllowAllUp;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetAllowAllUp', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetDisabledImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.DisabledImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetDisabledImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetDisabledImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.DisabledImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetDisabledImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetDown(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.Down := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetDown', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetDown(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Down;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetDown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetFlat(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.Flat := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetFlat', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetFlat(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Flat;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetFlat', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetGlyph(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TBitmap;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.Glyph := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetGlyph', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetGlyph(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TBitmap;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Glyph;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetGlyph', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetGroupIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:Integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.GroupIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetGroupIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetGroupIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:Integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.GroupIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetGroupIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetHotImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.HotImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetHotImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetHotImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.HotImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetHotImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TCustomImageList;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetImages', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TCustomImageList;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_SpeedButton_VCLuaSetImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.ImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.ImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetImageWidth(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:Integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.ImageWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetImageWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetImageWidth(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:Integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.ImageWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetImageWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetLayout(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TButtonLayout;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TButtonLayout));
	try
		lSpeedButton.Layout := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetLayout', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetLayout(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TButtonLayout;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Layout;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetLayout', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_SpeedButton_VCLuaSetMargin(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.Margin := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetMargin', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetMargin(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Margin;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetMargin', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetNumGlyphs(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:Integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.NumGlyphs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetNumGlyphs', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetNumGlyphs(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:Integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.NumGlyphs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetNumGlyphs', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetPressedImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.PressedImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetPressedImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetPressedImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.PressedImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetPressedImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetSelectedImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.SelectedImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetSelectedImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetSelectedImageIndex(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:TImageIndex;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.SelectedImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetSelectedImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetShowAccelChar(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.ShowAccelChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetShowAccelChar', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetShowAccelChar(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.ShowAccelChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetShowAccelChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetShowCaption(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.ShowCaption := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetShowCaption', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetShowCaption(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.ShowCaption;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetShowCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetSpacing(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.Spacing := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetSpacing', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetSpacing(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:integer;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Spacing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetSpacing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_SpeedButton_VCLuaSetTransparent(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	val:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lSpeedButton.Transparent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'SetTransparent', E.ClassName, E.Message);
	end;
end;

function VCLua_SpeedButton_VCLuaGetTransparent(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	ret:Boolean;
begin
	lSpeedButton := TLuaSpeedButton(GetLuaObjectUnsafe(L, 1));
	try
		ret := lSpeedButton.Transparent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'SpeedButton', 'GetTransparent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomSpeedButton',v);
end;
function CreateSpeedButton(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lSpeedButton := TLuaSpeedButton.Create(Parent);
	lSpeedButton.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomSpeedButton',lSpeedButton);
	InitControl(L,lSpeedButton,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'SpeedButton', E.ClassName, E.Message);
	end;
end;

begin
	CustomSpeedButtonFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'FindDownButton', @VCLua_SpeedButton_FindDownButton);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Click', @VCLua_SpeedButton_Click);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'LoadGlyphFromResourceName', @VCLua_SpeedButton_LoadGlyphFromResourceName);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'LoadGlyphFromLazarusResource', @VCLua_SpeedButton_LoadGlyphFromLazarusResource);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Alignment', @VCLua_SpeedButton_VCLuaGetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'AllowAllUp', @VCLua_SpeedButton_VCLuaGetAllowAllUp, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'DisabledImageIndex', @VCLua_SpeedButton_VCLuaGetDisabledImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Down', @VCLua_SpeedButton_VCLuaGetDown, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Flat', @VCLua_SpeedButton_VCLuaGetFlat, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Glyph', @VCLua_SpeedButton_VCLuaGetGlyph, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'GroupIndex', @VCLua_SpeedButton_VCLuaGetGroupIndex, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'HotImageIndex', @VCLua_SpeedButton_VCLuaGetHotImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Images', @VCLua_SpeedButton_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'ImageIndex', @VCLua_SpeedButton_VCLuaGetImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'ImageWidth', @VCLua_SpeedButton_VCLuaGetImageWidth, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Layout', @VCLua_SpeedButton_VCLuaGetLayout, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Margin', @VCLua_SpeedButton_VCLuaGetMargin, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'NumGlyphs', @VCLua_SpeedButton_VCLuaGetNumGlyphs, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'PressedImageIndex', @VCLua_SpeedButton_VCLuaGetPressedImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'SelectedImageIndex', @VCLua_SpeedButton_VCLuaGetSelectedImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'ShowAccelChar', @VCLua_SpeedButton_VCLuaGetShowAccelChar, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'ShowCaption', @VCLua_SpeedButton_VCLuaGetShowCaption, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Spacing', @VCLua_SpeedButton_VCLuaGetSpacing, mfCall);
	TLuaMethodInfo.Create(CustomSpeedButtonFuncs, 'Transparent', @VCLua_SpeedButton_VCLuaGetTransparent, mfCall);
	CustomSpeedButtonSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Alignment', @VCLua_SpeedButton_VCLuaSetAlignment, mfCall, TypeInfo(TAlignment));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'AllowAllUp', @VCLua_SpeedButton_VCLuaSetAllowAllUp, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'DisabledImageIndex', @VCLua_SpeedButton_VCLuaSetDisabledImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Down', @VCLua_SpeedButton_VCLuaSetDown, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Flat', @VCLua_SpeedButton_VCLuaSetFlat, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Glyph', @VCLua_SpeedButton_VCLuaSetGlyph, mfCall, TypeInfo(TBitmap));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'GroupIndex', @VCLua_SpeedButton_VCLuaSetGroupIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'HotImageIndex', @VCLua_SpeedButton_VCLuaSetHotImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Images', @VCLua_SpeedButton_VCLuaSetImages, mfCall, TypeInfo(TCustomImageList));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'ImageIndex', @VCLua_SpeedButton_VCLuaSetImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'ImageWidth', @VCLua_SpeedButton_VCLuaSetImageWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Layout', @VCLua_SpeedButton_VCLuaSetLayout, mfCall, TypeInfo(TButtonLayout));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Margin', @VCLua_SpeedButton_VCLuaSetMargin, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'NumGlyphs', @VCLua_SpeedButton_VCLuaSetNumGlyphs, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'PressedImageIndex', @VCLua_SpeedButton_VCLuaSetPressedImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'SelectedImageIndex', @VCLua_SpeedButton_VCLuaSetSelectedImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'ShowAccelChar', @VCLua_SpeedButton_VCLuaSetShowAccelChar, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'ShowCaption', @VCLua_SpeedButton_VCLuaSetShowCaption, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Spacing', @VCLua_SpeedButton_VCLuaSetSpacing, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(CustomSpeedButtonSets, 'Transparent', @VCLua_SpeedButton_VCLuaSetTransparent, mfCall, TypeInfo(Boolean));
end.
