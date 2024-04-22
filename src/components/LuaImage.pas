(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaImage;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ExtCtrls;

function CreateImage(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TImage; pti: PTypeInfo = nil); overload; inline;

type
    TLuaImage = class(TImage)
    end;
var
    CustomImageFuncs: TLuaVmt;
    CustomImageSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, ImgList, LuaCanvas, LuaClassesEvents, LuaEvent, LuaExtCtrlsEvents, LuaImageList, LuaPicture;

function VCLua_Image_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TCanvas;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetCanvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_DestRect(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TRect;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.DestRect();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'DestRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaGetHasGraphic(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.HasGraphic;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetHasGraphic', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetAntialiasingMode(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:TAntialiasingMode;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAntialiasingMode));
	try
		lImage.AntialiasingMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetAntialiasingMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetAntialiasingMode(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TAntialiasingMode;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.AntialiasingMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetAntialiasingMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Image_VCLuaSetCenter(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Center := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetCenter', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetCenter(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.Center;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetCenter', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetKeepOriginXWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.KeepOriginXWhenClipped := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetKeepOriginXWhenClipped', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetKeepOriginXWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.KeepOriginXWhenClipped;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetKeepOriginXWhenClipped', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetKeepOriginYWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.KeepOriginYWhenClipped := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetKeepOriginYWhenClipped', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetKeepOriginYWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.KeepOriginYWhenClipped;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetKeepOriginYWhenClipped', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetImageIndex(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Integer;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.ImageIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetImageIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetImageIndex(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Integer;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.ImageIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetImageIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetImageWidth(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Integer;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.ImageWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetImageWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetImageWidth(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Integer;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.ImageWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetImageWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:TCustomImageList;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetImages', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TCustomImageList;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Image_VCLuaSetPicture(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:TPicture;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Picture := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetPicture', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetPicture(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TPicture;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.Picture;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetPicture', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetStretch(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Stretch := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetStretch', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetStretch(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.Stretch;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetStretch', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetStretchOutEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.StretchOutEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetStretchOutEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetStretchOutEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.StretchOutEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetStretchOutEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetStretchInEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.StretchInEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetStretchInEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetStretchInEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.StretchInEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetStretchInEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetTransparent(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Transparent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetTransparent', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetTransparent(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.Transparent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetTransparent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetProportional(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Proportional := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'SetProportional', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetProportional(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	try
		ret := lImage.Proportional;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'GetProportional', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetOnPictureChanged(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lImage.OnPictureChanged));
	lImage.OnPictureChanged := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Image_VCLuaSetOnPaintBackground(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
begin
	lImage := TLuaImage(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lImage.OnPaintBackground));
	lImage.OnPaintBackground := TLuaEvent.Factory<TImagePaintBackgroundEvent,TLuaImagePaintBackgroundEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TImage; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomImage',v);
end;
function CreateImage(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lImage := TLuaImage.Create(Parent);
	lImage.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomImage',lImage);
	InitControl(L,lImage,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'Image', E.ClassName, E.Message);
	end;
end;

begin
	CustomImageFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomImageFuncs, 'Canvas', @VCLua_Image_VCLuaGetCanvas, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'DestRect', @VCLua_Image_DestRect);
	TLuaMethodInfo.Create(CustomImageFuncs, 'HasGraphic', @VCLua_Image_VCLuaGetHasGraphic, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'AntialiasingMode', @VCLua_Image_VCLuaGetAntialiasingMode, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Center', @VCLua_Image_VCLuaGetCenter, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'KeepOriginXWhenClipped', @VCLua_Image_VCLuaGetKeepOriginXWhenClipped, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'KeepOriginYWhenClipped', @VCLua_Image_VCLuaGetKeepOriginYWhenClipped, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'ImageIndex', @VCLua_Image_VCLuaGetImageIndex, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'ImageWidth', @VCLua_Image_VCLuaGetImageWidth, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Images', @VCLua_Image_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Picture', @VCLua_Image_VCLuaGetPicture, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Stretch', @VCLua_Image_VCLuaGetStretch, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'StretchOutEnabled', @VCLua_Image_VCLuaGetStretchOutEnabled, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'StretchInEnabled', @VCLua_Image_VCLuaGetStretchInEnabled, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Transparent', @VCLua_Image_VCLuaGetTransparent, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Proportional', @VCLua_Image_VCLuaGetProportional, mfCall);
	CustomImageSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomImageSets, 'AntialiasingMode', @VCLua_Image_VCLuaSetAntialiasingMode, mfCall, TypeInfo(TAntialiasingMode));
	TLuaMethodInfo.Create(CustomImageSets, 'Center', @VCLua_Image_VCLuaSetCenter, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'KeepOriginXWhenClipped', @VCLua_Image_VCLuaSetKeepOriginXWhenClipped, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'KeepOriginYWhenClipped', @VCLua_Image_VCLuaSetKeepOriginYWhenClipped, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'ImageIndex', @VCLua_Image_VCLuaSetImageIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomImageSets, 'ImageWidth', @VCLua_Image_VCLuaSetImageWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomImageSets, 'Images', @VCLua_Image_VCLuaSetImages, mfCall, TypeInfo(TCustomImageList));
	TLuaMethodInfo.Create(CustomImageSets, 'Picture', @VCLua_Image_VCLuaSetPicture, mfCall, TypeInfo(TPicture));
	TLuaMethodInfo.Create(CustomImageSets, 'Stretch', @VCLua_Image_VCLuaSetStretch, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'StretchOutEnabled', @VCLua_Image_VCLuaSetStretchOutEnabled, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'StretchInEnabled', @VCLua_Image_VCLuaSetStretchInEnabled, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'Transparent', @VCLua_Image_VCLuaSetTransparent, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'Proportional', @VCLua_Image_VCLuaSetProportional, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomImageSets, 'OnPictureChanged', @VCLua_Image_VCLuaSetOnPictureChanged, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomImageSets, 'OnPaintBackground', @VCLua_Image_VCLuaSetOnPaintBackground, mfCall, TypeInfo(TImagePaintBackgroundEvent));
end.
