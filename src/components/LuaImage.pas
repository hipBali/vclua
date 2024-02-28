(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaImage;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateImage(L: Plua_State): Integer; cdecl;
function IsImage(L: Plua_State): Integer; cdecl;
function AsImage(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TImage; pti: PTypeInfo = nil); overload; inline;

type
    TLuaImage = class(TImage)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomImageFuncs: TLuaVmt;
    CustomImageSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, Graphics, LuaCanvas, LuaPicture;

function VCLua_Image_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TCanvas;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'Canvas', E.ClassName, E.Message);
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

function VCLua_Image_Invalidate(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		lImage.Invalidate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'Invalidate', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaSetAntialiasingMode(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:TAntialiasingMode;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAntialiasingMode));
	try
		lImage.AntialiasingMode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'AntialiasingMode', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetAntialiasingMode(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TAntialiasingMode;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.AntialiasingMode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'AntialiasingMode', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Image_VCLuaSetCenter(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Center := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'Center', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetCenter(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.Center;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'Center', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetKeepOriginXWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.KeepOriginXWhenClipped := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'KeepOriginXWhenClipped', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetKeepOriginXWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.KeepOriginXWhenClipped;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'KeepOriginXWhenClipped', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetKeepOriginYWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.KeepOriginYWhenClipped := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'KeepOriginYWhenClipped', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetKeepOriginYWhenClipped(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.KeepOriginYWhenClipped;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'KeepOriginYWhenClipped', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetPicture(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:TPicture;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Picture := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'Picture', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetPicture(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TPicture;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.Picture;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'Picture', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetStretch(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Stretch := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'Stretch', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetStretch(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.Stretch;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'Stretch', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetStretchOutEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.StretchOutEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'StretchOutEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetStretchOutEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.StretchOutEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'StretchOutEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetStretchInEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.StretchInEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'StretchInEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetStretchInEnabled(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.StretchInEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'StretchInEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetTransparent(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Transparent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'Transparent', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetTransparent(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.Transparent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'Transparent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Image_VCLuaSetProportional(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImage := TLuaImage(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImage.Proportional := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Image', 'Proportional', E.ClassName, E.Message);
	end;
end;

function VCLua_Image_VCLuaGetProportional(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.Proportional;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Image', 'Proportional', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function IsImage(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TImage);
end;
function AsImage(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TImage then
    lua_push(L, TImage(o))
  else
    lua_pushnil(L);
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
	GetControlParents(L,TWinControl(Parent),Name);
	lImage := TLuaImage.Create(Parent);
	lImage.Parent := TWinControl(Parent);
	lImage.LuaCtl := TVCLuaControl.Create(lImage as TComponent,L,nil,'TCustomImage');
	InitControl(L,lImage,Name);
	CreateTableForKnownType(L,'TCustomImage',lImage);
	Result := 1;
end;

begin
	CustomImageFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomImageFuncs, 'Canvas', @VCLua_Image_VCLuaGetCanvas, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'DestRect', @VCLua_Image_DestRect);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Invalidate', @VCLua_Image_Invalidate);
	TLuaMethodInfo.Create(CustomImageFuncs, 'AntialiasingMode', @VCLua_Image_VCLuaGetAntialiasingMode, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Center', @VCLua_Image_VCLuaGetCenter, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'KeepOriginXWhenClipped', @VCLua_Image_VCLuaGetKeepOriginXWhenClipped, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'KeepOriginYWhenClipped', @VCLua_Image_VCLuaGetKeepOriginYWhenClipped, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Picture', @VCLua_Image_VCLuaGetPicture, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Stretch', @VCLua_Image_VCLuaGetStretch, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'StretchOutEnabled', @VCLua_Image_VCLuaGetStretchOutEnabled, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'StretchInEnabled', @VCLua_Image_VCLuaGetStretchInEnabled, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Transparent', @VCLua_Image_VCLuaGetTransparent, mfCall);
	TLuaMethodInfo.Create(CustomImageFuncs, 'Proportional', @VCLua_Image_VCLuaGetProportional, mfCall);
	CustomImageSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomImageSets, 'AntialiasingMode', @VCLua_Image_VCLuaSetAntialiasingMode, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'Center', @VCLua_Image_VCLuaSetCenter, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'KeepOriginXWhenClipped', @VCLua_Image_VCLuaSetKeepOriginXWhenClipped, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'KeepOriginYWhenClipped', @VCLua_Image_VCLuaSetKeepOriginYWhenClipped, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'Picture', @VCLua_Image_VCLuaSetPicture, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'Stretch', @VCLua_Image_VCLuaSetStretch, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'StretchOutEnabled', @VCLua_Image_VCLuaSetStretchOutEnabled, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'StretchInEnabled', @VCLua_Image_VCLuaSetStretchInEnabled, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'Transparent', @VCLua_Image_VCLuaSetTransparent, mfCall);
	TLuaMethodInfo.Create(CustomImageSets, 'Proportional', @VCLua_Image_VCLuaSetProportional, mfCall);
end.
