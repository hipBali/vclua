(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitmap;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo, LuaVmt;

function IsCustomBitmap(L: Plua_State): Integer; cdecl;
function AsCustomBitmap(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCustomBitmap; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomBitmap = class(TCustomBitmap)
    public
      L:Plua_State;
    end;
var
    CustomBitmapFuncs: TLuaVmt;

function CreateBitmap(L: Plua_State): Integer; cdecl;
function IsBitmap(L: Plua_State): Integer; cdecl;
function AsBitmap(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBitmap; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBitmap = class(TBitmap)
    public
      L:Plua_State;
    end;
var
    BitmapFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LCLType;

function VCLua_CustomBitmap_Assign(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lCustomBitmap.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomBitmap_Clear(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	try
		lCustomBitmap.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomBitmap_FreeImage(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	try
		lCustomBitmap.FreeImage();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'FreeImage', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomBitmap_LazarusResourceTypeValid(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ResourceType:string;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	luaL_check(L,2,@ResourceType);
	try
		ret := lCustomBitmap.LazarusResourceTypeValid(ResourceType);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'LazarusResourceTypeValid', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomBitmap_BitmapHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	try
		ret := lCustomBitmap.BitmapHandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'BitmapHandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomBitmap_MaskHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	try
		ret := lCustomBitmap.MaskHandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'MaskHandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomBitmap_PaletteAllocated(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	try
		ret := lCustomBitmap.PaletteAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'PaletteAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomBitmap_ReleaseHandle(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	try
		ret := lCustomBitmap.ReleaseHandle();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'ReleaseHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomBitmap_SetHandles(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ABitmap:HBITMAP;
	AMask:HBITMAP;
begin
	CheckArg(L, 3);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	luaL_check(L,2,@ABitmap);
	luaL_check(L,3,@AMask);
	try
		lCustomBitmap.SetHandles(ABitmap,AMask);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'SetHandles', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomBitmap_SetSize(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	AWidth:integer;
	AHeight:integer;
begin
	CheckArg(L, 3);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	luaL_check(L,2,@AWidth);
	luaL_check(L,3,@AHeight);
	try
		lCustomBitmap.SetSize(AWidth,AHeight);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'SetSize', E.ClassName, E.Message);
	end;
end;

function VCLua_Bitmap_GetResourceType(L: Plua_State): Integer; cdecl;
var
	lBitmap:TLuaBitmap;
	ret:TResourceType;
begin
	CheckArg(L, 1);
	lBitmap := TLuaBitmap(GetLuaObject(L, 1));
	try
		ret := lBitmap.GetResourceType();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Bitmap', 'GetResourceType', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Bitmap_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lBitmap:TLuaBitmap;
	AStream:TStream;
	ASize:Cardinal;
begin
	CheckArg(L, 3);
	lBitmap := TLuaBitmap(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	luaL_check(L,3,@ASize);
	try
		lBitmap.LoadFromStream(AStream,ASize);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Bitmap', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function IsCustomBitmap(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCustomBitmap);
end;
function AsCustomBitmap(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCustomBitmap then
    lua_push(L, TCustomBitmap(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCustomBitmap; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomBitmap',v);
end;

function IsBitmap(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TBitmap);
end;
function AsBitmap(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TBitmap then
    lua_push(L, TBitmap(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TBitmap; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBitmap',v);
end;
function CreateBitmap(L: Plua_State): Integer; cdecl;
var
	lBitmap:TLuaBitmap;
begin
	lBitmap := TLuaBitmap.Create;
	CreateTableForKnownType(L,'TBitmap',lBitmap);
	Result := 1;
end;
begin
	CustomBitmapFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'Assign', @VCLua_CustomBitmap_Assign);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'Clear', @VCLua_CustomBitmap_Clear);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'FreeImage', @VCLua_CustomBitmap_FreeImage);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'LazarusResourceTypeValid', @VCLua_CustomBitmap_LazarusResourceTypeValid);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'BitmapHandleAllocated', @VCLua_CustomBitmap_BitmapHandleAllocated);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'MaskHandleAllocated', @VCLua_CustomBitmap_MaskHandleAllocated);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'PaletteAllocated', @VCLua_CustomBitmap_PaletteAllocated);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'ReleaseHandle', @VCLua_CustomBitmap_ReleaseHandle);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'SetHandles', @VCLua_CustomBitmap_SetHandles);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'SetSize', @VCLua_CustomBitmap_SetSize);
	BitmapFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(BitmapFuncs, 'GetResourceType', @VCLua_Bitmap_GetResourceType);
	TLuaMethodInfo.Create(BitmapFuncs, 'LoadFromStream', @VCLua_Bitmap_LoadFromStream);
end.
