(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRasterImage;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType, Types, TypInfo;

function IsRasterImage(L: Plua_State): Integer; cdecl;
function AsRasterImage(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TRasterImage; pti: PTypeInfo = nil); overload; inline;

type
    TLuaRasterImage = class(TRasterImage)
    public
      L:Plua_State;
    end;
var
    RasterImageFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_RasterImage_Assign(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	lRasterImage.Assign(Source);
	
	Result := 0;
end;

function VCLua_RasterImage_Clear(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	lRasterImage.Clear();
	
	Result := 0;
end;

function VCLua_RasterImage_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ACanvasOnly:Boolean;
begin
	CheckArg(L, 1, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @ACanvasOnly, False);
	lRasterImage.BeginUpdate(ACanvasOnly);
	
	Result := 0;
end;

function VCLua_RasterImage_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStreamIsValid:Boolean;
begin
	CheckArg(L, 1, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	TTrait<Boolean>.luaL_optcheck(L, 2, @AStreamIsValid, False);
	lRasterImage.EndUpdate(AStreamIsValid);
	
	Result := 0;
end;

function VCLua_RasterImage_FreeImage(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	lRasterImage.FreeImage();
	
	Result := 0;
end;

function VCLua_RasterImage_BitmapHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ret := lRasterImage.BitmapHandleAllocated();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_RasterImage_MaskHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ret := lRasterImage.MaskHandleAllocated();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_RasterImage_PaletteAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ret := lRasterImage.PaletteAllocated();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_RasterImage_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	lRasterImage.LoadFromStream(AStream);
	
	Result := 0;
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
	lRasterImage.LoadFromStream(AStream,ASize);
	
	Result := 0;
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
	lRasterImage.LoadFromMimeStream(AStream,AMimeType);
	
	Result := 0;
end;

function VCLua_RasterImage_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	lRasterImage.SaveToStream(AStream);
	
	Result := 0;
end;

function VCLua_RasterImage_GetSupportedSourceMimeTypes(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	List:TStrings;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@List);
	lRasterImage.GetSupportedSourceMimeTypes(List);
	
	Result := 0;
end;

function VCLua_RasterImage_GetSize(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	AWidth:Integer;
	AHeight:Integer;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	
	lRasterImage.GetSize(AWidth,AHeight);
	lua_push(L,AWidth);
	lua_push(L,AHeight);
	Result := 2;
end;

function VCLua_RasterImage_Mask(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ATransparentColor:TColor;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	luaL_check(L,2,@ATransparentColor);
	lRasterImage.Mask(ATransparentColor);
	
	Result := 0;
end;

function VCLua_RasterImage_ReleaseBitmapHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ret := lRasterImage.ReleaseBitmapHandle();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_RasterImage_ReleaseMaskHandle(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ret := lRasterImage.ReleaseMaskHandle();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_RasterImage_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lRasterImage:TLuaRasterImage;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ret := lRasterImage.HandleAllocated();
	lua_push(L,ret);
	
	Result := 1;
end;

function IsRasterImage(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TRasterImage);
end;
function AsRasterImage(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TRasterImage then
    lua_push(L, TRasterImage(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TRasterImage; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TRasterImage',v);
end;

begin
	SetLength(RasterImageFuncs, 18+1);
	RasterImageFuncs[0].name:='Assign';
	RasterImageFuncs[0].func:=@VCLua_RasterImage_Assign;
	RasterImageFuncs[1].name:='Clear';
	RasterImageFuncs[1].func:=@VCLua_RasterImage_Clear;
	RasterImageFuncs[2].name:='BeginUpdate';
	RasterImageFuncs[2].func:=@VCLua_RasterImage_BeginUpdate;
	RasterImageFuncs[3].name:='EndUpdate';
	RasterImageFuncs[3].func:=@VCLua_RasterImage_EndUpdate;
	RasterImageFuncs[4].name:='FreeImage';
	RasterImageFuncs[4].func:=@VCLua_RasterImage_FreeImage;
	RasterImageFuncs[5].name:='BitmapHandleAllocated';
	RasterImageFuncs[5].func:=@VCLua_RasterImage_BitmapHandleAllocated;
	RasterImageFuncs[6].name:='MaskHandleAllocated';
	RasterImageFuncs[6].func:=@VCLua_RasterImage_MaskHandleAllocated;
	RasterImageFuncs[7].name:='PaletteAllocated';
	RasterImageFuncs[7].func:=@VCLua_RasterImage_PaletteAllocated;
	RasterImageFuncs[8].name:='LoadFromStream';
	RasterImageFuncs[8].func:=@VCLua_RasterImage_LoadFromStream;
	RasterImageFuncs[9].name:='LoadFromStream2';
	RasterImageFuncs[9].func:=@VCLua_RasterImage_LoadFromStream2;
	RasterImageFuncs[10].name:='LoadFromMimeStream';
	RasterImageFuncs[10].func:=@VCLua_RasterImage_LoadFromMimeStream;
	RasterImageFuncs[11].name:='SaveToStream';
	RasterImageFuncs[11].func:=@VCLua_RasterImage_SaveToStream;
	RasterImageFuncs[12].name:='GetSupportedSourceMimeTypes';
	RasterImageFuncs[12].func:=@VCLua_RasterImage_GetSupportedSourceMimeTypes;
	RasterImageFuncs[13].name:='GetSize';
	RasterImageFuncs[13].func:=@VCLua_RasterImage_GetSize;
	RasterImageFuncs[14].name:='Mask';
	RasterImageFuncs[14].func:=@VCLua_RasterImage_Mask;
	RasterImageFuncs[15].name:='ReleaseBitmapHandle';
	RasterImageFuncs[15].func:=@VCLua_RasterImage_ReleaseBitmapHandle;
	RasterImageFuncs[16].name:='ReleaseMaskHandle';
	RasterImageFuncs[16].func:=@VCLua_RasterImage_ReleaseMaskHandle;
	RasterImageFuncs[17].name:='HandleAllocated';
	RasterImageFuncs[17].func:=@VCLua_RasterImage_HandleAllocated;
	RasterImageFuncs[18].name:=nil;
	RasterImageFuncs[18].func:=nil;

end.
