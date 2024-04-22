(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitBtn;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Buttons;

function CreateBitBtn(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBitBtn; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBitBtn = class(TBitBtn)
    end;
var
    CustomBitBtnFuncs: TLuaVmt;
    CustomBitBtnSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, ImgList, LuaBitmap, LuaImageList, Menus;

function VCLua_BitBtn_LoadGlyphFromResourceName(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	Instance:THandle;
	AName:String;
begin
	CheckArg(L, 3);
	lBitBtn := TLuaBitBtn(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@AName);
	try
		lBitBtn.LoadGlyphFromResourceName(Instance,AName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'LoadGlyphFromResourceName', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_LoadGlyphFromLazarusResource(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	AName:String;
begin
	CheckArg(L, 2);
	lBitBtn := TLuaBitBtn(GetLuaObject(L, 1));
	luaL_check(L,2,@AName);
	try
		lBitBtn.LoadGlyphFromLazarusResource(AName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'LoadGlyphFromLazarusResource', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_LoadGlyphFromStock(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	idButton:Integer;
begin
	CheckArg(L, 2);
	lBitBtn := TLuaBitBtn(GetLuaObject(L, 1));
	luaL_check(L,2,@idButton);
	try
		lBitBtn.LoadGlyphFromStock(idButton);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'LoadGlyphFromStock', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_LoadGlyphFromResource(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	idButton:TButtonImage;
begin
	CheckArg(L, 2);
	lBitBtn := TLuaBitBtn(GetLuaObject(L, 1));
	luaL_check(L,2,@idButton);
	try
		lBitBtn.LoadGlyphFromResource(idButton);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'LoadGlyphFromResource', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_CanShowGlyph(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	AWithShowMode:Boolean;
	ret:Boolean;
begin
	CheckArg(L, 1, 2);
	lBitBtn := TLuaBitBtn(CheckLuaObjectPop(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @AWithShowMode, False);
	try
		ret := lBitBtn.CanShowGlyph(AWithShowMode);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'CanShowGlyph', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetDefaultCaption(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:Boolean;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.DefaultCaption := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetDefaultCaption', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetDefaultCaption(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:Boolean;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.DefaultCaption;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetDefaultCaption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetDisabledImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.DisabledImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetDisabledImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetDisabledImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.DisabledImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetDisabledImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetGlyph(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TBitmap;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.Glyph := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetGlyph', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetGlyph(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TBitmap;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.Glyph;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetGlyph', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetNumGlyphs(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:Integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.NumGlyphs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetNumGlyphs', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetNumGlyphs(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:Integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.NumGlyphs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetNumGlyphs', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetHotImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.HotImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetHotImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetHotImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.HotImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetHotImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TCustomImageList;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetImages', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TCustomImageList;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_BitBtn_VCLuaSetImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.ImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.ImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetImageWidth(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:Integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.ImageWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetImageWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetImageWidth(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:Integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.ImageWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetImageWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetKind(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TBitBtnKind;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TBitBtnKind));
	try
		lBitBtn.Kind := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetKind', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetKind(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TBitBtnKind;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.Kind;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetKind', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_BitBtn_VCLuaSetLayout(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TButtonLayout;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TButtonLayout));
	try
		lBitBtn.Layout := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetLayout', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetLayout(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TButtonLayout;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.Layout;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetLayout', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_BitBtn_VCLuaSetMargin(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.Margin := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetMargin', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetMargin(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.Margin;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetMargin', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetPressedImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.PressedImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetPressedImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetPressedImageIndex(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TImageIndex;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.PressedImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetPressedImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetSpacing(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:Integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lBitBtn.Spacing := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetSpacing', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetSpacing(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:Integer;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.Spacing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetSpacing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_BitBtn_VCLuaSetGlyphShowMode(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	val:TGlyphShowMode;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TGlyphShowMode));
	try
		lBitBtn.GlyphShowMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'SetGlyphShowMode', E.ClassName, E.Message);
	end;
end;

function VCLua_BitBtn_VCLuaGetGlyphShowMode(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	ret:TGlyphShowMode;
begin
	lBitBtn := TLuaBitBtn(GetLuaObjectUnsafe(L, 1));
	try
		ret := lBitBtn.GlyphShowMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'BitBtn', 'GetGlyphShowMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TBitBtn; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomBitBtn',v);
end;
function CreateBitBtn(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lBitBtn := TLuaBitBtn.Create(Parent);
	lBitBtn.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomBitBtn',lBitBtn);
	InitControl(L,lBitBtn,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'BitBtn', E.ClassName, E.Message);
	end;
end;

begin
	CustomBitBtnFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'LoadGlyphFromResourceName', @VCLua_BitBtn_LoadGlyphFromResourceName);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'LoadGlyphFromLazarusResource', @VCLua_BitBtn_LoadGlyphFromLazarusResource);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'LoadGlyphFromStock', @VCLua_BitBtn_LoadGlyphFromStock);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'LoadGlyphFromResource', @VCLua_BitBtn_LoadGlyphFromResource);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'CanShowGlyph', @VCLua_BitBtn_CanShowGlyph);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'DefaultCaption', @VCLua_BitBtn_VCLuaGetDefaultCaption, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'DisabledImageIndex', @VCLua_BitBtn_VCLuaGetDisabledImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'Glyph', @VCLua_BitBtn_VCLuaGetGlyph, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'NumGlyphs', @VCLua_BitBtn_VCLuaGetNumGlyphs, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'HotImageIndex', @VCLua_BitBtn_VCLuaGetHotImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'Images', @VCLua_BitBtn_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'ImageIndex', @VCLua_BitBtn_VCLuaGetImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'ImageWidth', @VCLua_BitBtn_VCLuaGetImageWidth, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'Kind', @VCLua_BitBtn_VCLuaGetKind, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'Layout', @VCLua_BitBtn_VCLuaGetLayout, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'Margin', @VCLua_BitBtn_VCLuaGetMargin, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'PressedImageIndex', @VCLua_BitBtn_VCLuaGetPressedImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'Spacing', @VCLua_BitBtn_VCLuaGetSpacing, mfCall);
	TLuaMethodInfo.Create(CustomBitBtnFuncs, 'GlyphShowMode', @VCLua_BitBtn_VCLuaGetGlyphShowMode, mfCall);
	CustomBitBtnSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomBitBtnSets, 'DefaultCaption', @VCLua_BitBtn_VCLuaSetDefaultCaption, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'DisabledImageIndex', @VCLua_BitBtn_VCLuaSetDisabledImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'Glyph', @VCLua_BitBtn_VCLuaSetGlyph, mfCall, TypeInfo(TBitmap));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'NumGlyphs', @VCLua_BitBtn_VCLuaSetNumGlyphs, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'HotImageIndex', @VCLua_BitBtn_VCLuaSetHotImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'Images', @VCLua_BitBtn_VCLuaSetImages, mfCall, TypeInfo(TCustomImageList));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'ImageIndex', @VCLua_BitBtn_VCLuaSetImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'ImageWidth', @VCLua_BitBtn_VCLuaSetImageWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'Kind', @VCLua_BitBtn_VCLuaSetKind, mfCall, TypeInfo(TBitBtnKind));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'Layout', @VCLua_BitBtn_VCLuaSetLayout, mfCall, TypeInfo(TButtonLayout));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'Margin', @VCLua_BitBtn_VCLuaSetMargin, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'PressedImageIndex', @VCLua_BitBtn_VCLuaSetPressedImageIndex, mfCall, TypeInfo(TImageIndex));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'Spacing', @VCLua_BitBtn_VCLuaSetSpacing, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomBitBtnSets, 'GlyphShowMode', @VCLua_BitBtn_VCLuaSetGlyphShowMode, mfCall, TypeInfo(TGlyphShowMode));
end.
