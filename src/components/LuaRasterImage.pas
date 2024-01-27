(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRasterImage;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType, Types;

procedure RasterImageToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaRasterImage = class(TRasterImage)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_RasterImage_Assign(L: Plua_State): Integer; cdecl;
var 
	lRasterImage:TLuaRasterImage;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
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
	CheckArg(L, -1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ACanvasOnly := luaL_optbool(L,2,False);
	lRasterImage.BeginUpdate(ACanvasOnly);
	
	Result := 0;
end;

function VCLua_RasterImage_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lRasterImage:TLuaRasterImage;
	AStreamIsValid:Boolean;
begin
	CheckArg(L, -1);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	AStreamIsValid := luaL_optbool(L,2,False);
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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_RasterImage_LoadFromStream(L: Plua_State): Integer; cdecl;
var 
	lRasterImage:TLuaRasterImage;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
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
	AStream := TStream(GetLuaObject(L,2));
	ASize := lua_tointeger(L,3);
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
	AStream := TStream(GetLuaObject(L,2));
	AMimeType := lua_toStringCP(L,3);
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
	AStream := TStream(GetLuaObject(L,2));
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
	List := TStrings(GetLuaObject(L,2));
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
	lua_pushinteger(L,AWidth);
	lua_pushinteger(L,AHeight);
	Result := 2;
end;

function VCLua_RasterImage_Mask(L: Plua_State): Integer; cdecl;
var 
	lRasterImage:TLuaRasterImage;
	ATransparentColor:TColor;
begin
	CheckArg(L, 2);
	lRasterImage := TLuaRasterImage(GetLuaObject(L, 1));
	ATransparentColor := TColor(lua_tointeger(L,2));
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

procedure RasterImageToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_RasterImage_Assign);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_RasterImage_Clear);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_RasterImage_BeginUpdate);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_RasterImage_EndUpdate);
	LuaSetTableFunction(L, Index, 'FreeImage', @VCLua_RasterImage_FreeImage);
	LuaSetTableFunction(L, Index, 'BitmapHandleAllocated', @VCLua_RasterImage_BitmapHandleAllocated);
	LuaSetTableFunction(L, Index, 'MaskHandleAllocated', @VCLua_RasterImage_MaskHandleAllocated);
	LuaSetTableFunction(L, Index, 'PaletteAllocated', @VCLua_RasterImage_PaletteAllocated);
	LuaSetTableFunction(L, Index, 'LoadFromStream', @VCLua_RasterImage_LoadFromStream);
	LuaSetTableFunction(L, Index, 'LoadFromStream2', @VCLua_RasterImage_LoadFromStream2);
	LuaSetTableFunction(L, Index, 'LoadFromMimeStream', @VCLua_RasterImage_LoadFromMimeStream);
	LuaSetTableFunction(L, Index, 'SaveToStream', @VCLua_RasterImage_SaveToStream);
	LuaSetTableFunction(L, Index, 'GetSupportedSourceMimeTypes', @VCLua_RasterImage_GetSupportedSourceMimeTypes);
	LuaSetTableFunction(L, Index, 'GetSize', @VCLua_RasterImage_GetSize);
	LuaSetTableFunction(L, Index, 'Mask', @VCLua_RasterImage_Mask);
	LuaSetTableFunction(L, Index, 'ReleaseBitmapHandle', @VCLua_RasterImage_ReleaseBitmapHandle);
	LuaSetTableFunction(L, Index, 'ReleaseMaskHandle', @VCLua_RasterImage_ReleaseMaskHandle);
	LuaSetTableFunction(L, Index, 'HandleAllocated', @VCLua_RasterImage_HandleAllocated);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
