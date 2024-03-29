(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRasterImage;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Graphics;

procedure lua_push(L: Plua_State; const v: TRasterImage; pti: PTypeInfo = nil); overload; inline;

type
    TLuaRasterImage = class(TRasterImage)
    public
      L:Plua_State;
    end;
var
    RasterImageFuncs: TLuaVmt;
    RasterImageSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LuaCanvas, LCLType;

function VCLua_RasterImage_Assign(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lRasterImage.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_Clear(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		lRasterImage.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ACanvasOnly:Boolean;
begin
	CheckArg(L, 1, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ACanvasOnly, False);
	try
		lRasterImage.BeginUpdate(ACanvasOnly);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStreamIsValid:Boolean;
begin
	CheckArg(L, 1, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @AStreamIsValid, False);
	try
		lRasterImage.EndUpdate(AStreamIsValid);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_FreeImage(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		lRasterImage.FreeImage();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'FreeImage', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_BitmapHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.BitmapHandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'BitmapHandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_MaskHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.MaskHandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'MaskHandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_PaletteAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.PaletteAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'PaletteAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lRasterImage.LoadFromStream(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_LoadFromStream2(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStream:TStream;
	ASize:Cardinal;
begin
	CheckArg(L, 3);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	luaL_check(L,3,@ASize);
	try
		lRasterImage.LoadFromStream(AStream,ASize);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_LoadFromMimeStream(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStream:TStream;
	AMimeType:string;
begin
	CheckArg(L, 3);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	luaL_check(L,3,@AMimeType);
	try
		lRasterImage.LoadFromMimeStream(AStream,AMimeType);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'LoadFromMimeStream', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lRasterImage.SaveToStream(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_GetSupportedSourceMimeTypes(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	List:TStrings;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@List);
	try
		lRasterImage.GetSupportedSourceMimeTypes(List);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'GetSupportedSourceMimeTypes', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_GetSize(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AWidth:Integer;
	AHeight:Integer;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		lRasterImage.GetSize(AWidth,AHeight);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'GetSize', E.ClassName, E.Message);
	end;
	lua_push(L,AWidth);
	lua_push(L,AHeight);
end;

function VCLua_RasterImage_Mask(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ATransparentColor:TColor;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ATransparentColor := luaL_checkColor(L,2);
	try
		lRasterImage.Mask(ATransparentColor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'Mask', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_ReleaseBitmapHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.ReleaseBitmapHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'ReleaseBitmapHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_ReleaseMaskHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.ReleaseMaskHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'ReleaseMaskHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:TCanvas;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'Canvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.HandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_VCLuaSetBitmapHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	val:HBITMAP;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lRasterImage.BitmapHandle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'BitmapHandle', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_VCLuaGetBitmapHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.BitmapHandle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'BitmapHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_VCLuaSetMasked(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lRasterImage.Masked := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'Masked', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_VCLuaGetMasked(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.Masked;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'Masked', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_VCLuaSetMaskHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	val:HBITMAP;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lRasterImage.MaskHandle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'MaskHandle', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_VCLuaGetMaskHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.MaskHandle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'MaskHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_VCLuaSetPixelFormat(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	val:TPixelFormat;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TPixelFormat));
	try
		lRasterImage.PixelFormat := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'PixelFormat', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_VCLuaGetPixelFormat(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:TPixelFormat;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.PixelFormat;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'PixelFormat', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_RasterImage_VCLuaSetTransparentColor(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	val:TColor;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	val := luaL_checkColor(L,2);
	try
		lRasterImage.TransparentColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'TransparentColor', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_VCLuaGetTransparentColor(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:TColor;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.TransparentColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'TransparentColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RasterImage_VCLuaSetTransparentMode(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	val:TTransparentMode;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TTransparentMode));
	try
		lRasterImage.TransparentMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'TransparentMode', E.ClassName, E.Message);
	end;
end;

function VCLua_RasterImage_VCLuaGetTransparentMode(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:TTransparentMode;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	try
		ret := lRasterImage.TransparentMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RasterImage', 'TransparentMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TRasterImage; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TRasterImage',v);
end;

begin
	RasterImageFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(RasterImageFuncs, 'Assign', @VCLua_RasterImage_Assign);
	TLuaMethodInfo.Create(RasterImageFuncs, 'Clear', @VCLua_RasterImage_Clear);
	TLuaMethodInfo.Create(RasterImageFuncs, 'BeginUpdate', @VCLua_RasterImage_BeginUpdate);
	TLuaMethodInfo.Create(RasterImageFuncs, 'EndUpdate', @VCLua_RasterImage_EndUpdate);
	TLuaMethodInfo.Create(RasterImageFuncs, 'FreeImage', @VCLua_RasterImage_FreeImage);
	TLuaMethodInfo.Create(RasterImageFuncs, 'BitmapHandleAllocated', @VCLua_RasterImage_BitmapHandleAllocated);
	TLuaMethodInfo.Create(RasterImageFuncs, 'MaskHandleAllocated', @VCLua_RasterImage_MaskHandleAllocated);
	TLuaMethodInfo.Create(RasterImageFuncs, 'PaletteAllocated', @VCLua_RasterImage_PaletteAllocated);
	TLuaMethodInfo.Create(RasterImageFuncs, 'LoadFromStream', @VCLua_RasterImage_LoadFromStream);
	TLuaMethodInfo.Create(RasterImageFuncs, 'LoadFromStream2', @VCLua_RasterImage_LoadFromStream2);
	TLuaMethodInfo.Create(RasterImageFuncs, 'LoadFromMimeStream', @VCLua_RasterImage_LoadFromMimeStream);
	TLuaMethodInfo.Create(RasterImageFuncs, 'SaveToStream', @VCLua_RasterImage_SaveToStream);
	TLuaMethodInfo.Create(RasterImageFuncs, 'GetSupportedSourceMimeTypes', @VCLua_RasterImage_GetSupportedSourceMimeTypes);
	TLuaMethodInfo.Create(RasterImageFuncs, 'GetSize', @VCLua_RasterImage_GetSize);
	TLuaMethodInfo.Create(RasterImageFuncs, 'Mask', @VCLua_RasterImage_Mask);
	TLuaMethodInfo.Create(RasterImageFuncs, 'ReleaseBitmapHandle', @VCLua_RasterImage_ReleaseBitmapHandle);
	TLuaMethodInfo.Create(RasterImageFuncs, 'ReleaseMaskHandle', @VCLua_RasterImage_ReleaseMaskHandle);
	TLuaMethodInfo.Create(RasterImageFuncs, 'Canvas', @VCLua_RasterImage_VCLuaGetCanvas, mfCall);
	TLuaMethodInfo.Create(RasterImageFuncs, 'HandleAllocated', @VCLua_RasterImage_HandleAllocated);
	TLuaMethodInfo.Create(RasterImageFuncs, 'BitmapHandle', @VCLua_RasterImage_VCLuaGetBitmapHandle, mfCall);
	TLuaMethodInfo.Create(RasterImageFuncs, 'Masked', @VCLua_RasterImage_VCLuaGetMasked, mfCall);
	TLuaMethodInfo.Create(RasterImageFuncs, 'MaskHandle', @VCLua_RasterImage_VCLuaGetMaskHandle, mfCall);
	TLuaMethodInfo.Create(RasterImageFuncs, 'PixelFormat', @VCLua_RasterImage_VCLuaGetPixelFormat, mfCall);
	TLuaMethodInfo.Create(RasterImageFuncs, 'TransparentColor', @VCLua_RasterImage_VCLuaGetTransparentColor, mfCall);
	TLuaMethodInfo.Create(RasterImageFuncs, 'TransparentMode', @VCLua_RasterImage_VCLuaGetTransparentMode, mfCall);
	RasterImageSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(RasterImageSets, 'BitmapHandle', @VCLua_RasterImage_VCLuaSetBitmapHandle, mfCall, TypeInfo(HBITMAP));
	TLuaMethodInfo.Create(RasterImageSets, 'Masked', @VCLua_RasterImage_VCLuaSetMasked, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(RasterImageSets, 'MaskHandle', @VCLua_RasterImage_VCLuaSetMaskHandle, mfCall, TypeInfo(HBITMAP));
	TLuaMethodInfo.Create(RasterImageSets, 'PixelFormat', @VCLua_RasterImage_VCLuaSetPixelFormat, mfCall, TypeInfo(TPixelFormat));
	TLuaMethodInfo.Create(RasterImageSets, 'TransparentColor', @VCLua_RasterImage_VCLuaSetTransparentColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(RasterImageSets, 'TransparentMode', @VCLua_RasterImage_VCLuaSetTransparentMode, mfCall, TypeInfo(TTransparentMode));
end.
