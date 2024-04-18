(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPicture;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Graphics;

function CreatePicture(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPicture; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPicture = class(TPicture)
    end;
var
    PictureFuncs: TLuaVmt;
    PictureSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LCLType, LuaClassesEvents, LuaEvent, LuaFPImageEvents, LuaGraphic;

function VCLua_Picture_Clear(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	CheckArg(L, 1);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	try
		lPicture.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Filename:string;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Filename);
	try
		lPicture.LoadFromFile(Filename);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_LoadFromResourceName(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Instance:THandle;
	ResName:String;
begin
	CheckArg(L, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@ResName);
	try
		lPicture.LoadFromResourceName(Instance,ResName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromResourceName', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lPicture.LoadFromStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_LoadFromStreamWithFileExt(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
	FileExt:string;
begin
	CheckArg(L, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@FileExt);
	try
		lPicture.LoadFromStreamWithFileExt(Stream,FileExt);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'LoadFromStreamWithFileExt', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Filename:string;
	FileExt:string;
begin
	CheckArg(L, 2, 3);
	lPicture := TLuaPicture(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Filename);
	TTrait<string>.luaL_optcheck(L, 3, @FileExt, '');
	try
		lPicture.SaveToFile(Filename,FileExt);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	try
		lPicture.SaveToStream(Stream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_SaveToStreamWithFileExt(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Stream:TStream;
	FileExt:string;
begin
	CheckArg(L, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Stream);
	luaL_check(L,3,@FileExt);
	try
		lPicture.SaveToStreamWithFileExt(Stream,FileExt);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SaveToStreamWithFileExt', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_SupportsClipboardFormat(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	FormatID:TClipboardFormat;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@FormatID);
	try
		ret := lPicture.SupportsClipboardFormat(FormatID);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SupportsClipboardFormat', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_Assign(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lPicture.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaSetBitmap(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	val:TBitmap;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPicture.Bitmap := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SetBitmap', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaGetBitmap(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:TBitmap;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.Bitmap;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetBitmap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaSetIcon(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	val:TIcon;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPicture.Icon := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SetIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaGetIcon(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:TIcon;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.Icon;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Picture_VCLuaSetJpeg(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	val:TJpegImage;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPicture.Jpeg := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SetJpeg', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaGetJpeg(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:TJpegImage;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.Jpeg;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetJpeg', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaSetPixmap(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	val:TPixmap;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPicture.Pixmap := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SetPixmap', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaGetPixmap(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:TPixmap;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.Pixmap;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetPixmap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaSetPNG(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	val:TPortableNetworkGraphic;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPicture.PNG := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SetPNG', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaGetPNG(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:TPortableNetworkGraphic;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.PNG;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetPNG', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaSetPNM(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	val:TPortableAnyMapGraphic;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPicture.PNM := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SetPNM', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaGetPNM(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:TPortableAnyMapGraphic;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.PNM;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetPNM', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaSetGraphic(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	val:TGraphic;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lPicture.Graphic := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Picture', 'SetGraphic', E.ClassName, E.Message);
	end;
end;

function VCLua_Picture_VCLuaGetGraphic(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:TGraphic;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.Graphic;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetGraphic', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:Integer;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaGetWidth(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
	ret:Integer;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	try
		ret := lPicture.Width;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Picture', 'GetWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Picture_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lPicture.OnChange));
	lPicture.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_Picture_VCLuaSetOnProgress(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	lPicture := TLuaPicture(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lPicture.OnProgress));
	lPicture.OnProgress := TLuaEvent.Factory<TProgressEvent,TLuaFPImgProgressEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TPicture; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPicture',v);
end;
function CreatePicture(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	try
	lPicture := TLuaPicture.Create;
	CreateTableForKnownType(L,'TPicture',lPicture);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'Picture', E.ClassName, E.Message);
	end;
end;
begin
	PictureFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PictureFuncs, 'Clear', @VCLua_Picture_Clear);
	TLuaMethodInfo.Create(PictureFuncs, 'LoadFromFile', @VCLua_Picture_LoadFromFile);
	TLuaMethodInfo.Create(PictureFuncs, 'LoadFromResourceName', @VCLua_Picture_LoadFromResourceName);
	TLuaMethodInfo.Create(PictureFuncs, 'LoadFromStream', @VCLua_Picture_LoadFromStream);
	TLuaMethodInfo.Create(PictureFuncs, 'LoadFromStreamWithFileExt', @VCLua_Picture_LoadFromStreamWithFileExt);
	TLuaMethodInfo.Create(PictureFuncs, 'SaveToFile', @VCLua_Picture_SaveToFile);
	TLuaMethodInfo.Create(PictureFuncs, 'SaveToStream', @VCLua_Picture_SaveToStream);
	TLuaMethodInfo.Create(PictureFuncs, 'SaveToStreamWithFileExt', @VCLua_Picture_SaveToStreamWithFileExt);
	TLuaMethodInfo.Create(PictureFuncs, 'SupportsClipboardFormat', @VCLua_Picture_SupportsClipboardFormat);
	TLuaMethodInfo.Create(PictureFuncs, 'Assign', @VCLua_Picture_Assign);
	TLuaMethodInfo.Create(PictureFuncs, 'Bitmap', @VCLua_Picture_VCLuaGetBitmap, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'Icon', @VCLua_Picture_VCLuaGetIcon, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'Jpeg', @VCLua_Picture_VCLuaGetJpeg, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'Pixmap', @VCLua_Picture_VCLuaGetPixmap, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'PNG', @VCLua_Picture_VCLuaGetPNG, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'PNM', @VCLua_Picture_VCLuaGetPNM, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'Graphic', @VCLua_Picture_VCLuaGetGraphic, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'Height', @VCLua_Picture_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(PictureFuncs, 'Width', @VCLua_Picture_VCLuaGetWidth, mfCall);
	PictureSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(PictureSets, 'Bitmap', @VCLua_Picture_VCLuaSetBitmap, mfCall, TypeInfo(TBitmap));
	TLuaMethodInfo.Create(PictureSets, 'Icon', @VCLua_Picture_VCLuaSetIcon, mfCall, TypeInfo(TIcon));
	TLuaMethodInfo.Create(PictureSets, 'Jpeg', @VCLua_Picture_VCLuaSetJpeg, mfCall, TypeInfo(TJpegImage));
	TLuaMethodInfo.Create(PictureSets, 'Pixmap', @VCLua_Picture_VCLuaSetPixmap, mfCall, TypeInfo(TPixmap));
	TLuaMethodInfo.Create(PictureSets, 'PNG', @VCLua_Picture_VCLuaSetPNG, mfCall, TypeInfo(TPortableNetworkGraphic));
	TLuaMethodInfo.Create(PictureSets, 'PNM', @VCLua_Picture_VCLuaSetPNM, mfCall, TypeInfo(TPortableAnyMapGraphic));
	TLuaMethodInfo.Create(PictureSets, 'Graphic', @VCLua_Picture_VCLuaSetGraphic, mfCall, TypeInfo(TGraphic));
	TLuaMethodInfo.Create(PictureSets, 'OnChange', @VCLua_Picture_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(PictureSets, 'OnProgress', @VCLua_Picture_VCLuaSetOnProgress, mfCall, TypeInfo(TProgressEvent));
end.
