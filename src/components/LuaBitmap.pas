(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitmap;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType, TypInfo;

function IsCustomBitmap(L: Plua_State): Integer; cdecl;
function AsCustomBitmap(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCustomBitmap; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomBitmap = class(TCustomBitmap)
    public
      L:Plua_State;
    end;
var
    CustomBitmapFuncs: aoluaL_Reg;

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
    BitmapFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_CustomBitmap_Assign(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	lCustomBitmap.Assign(Source);
	
	Result := 0;
end;

function VCLua_CustomBitmap_Clear(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	lCustomBitmap.Clear();
	
	Result := 0;
end;

function VCLua_CustomBitmap_FreeImage(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	lCustomBitmap.FreeImage();
	
	Result := 0;
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
	ret := lCustomBitmap.LazarusResourceTypeValid(ResourceType);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomBitmap_BitmapHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	ret := lCustomBitmap.BitmapHandleAllocated();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomBitmap_MaskHandleAllocated(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	ret := lCustomBitmap.MaskHandleAllocated();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomBitmap_PaletteAllocated(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	ret := lCustomBitmap.PaletteAllocated();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_CustomBitmap_ReleaseHandle(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:HBITMAP;
begin
	CheckArg(L, 1);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	ret := lCustomBitmap.ReleaseHandle();
	lua_push(L,ret);
	
	Result := 1;
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
	lCustomBitmap.SetHandles(ABitmap,AMask);
	
	Result := 0;
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
	lCustomBitmap.SetSize(AWidth,AHeight);
	
	Result := 0;
end;

function VCLua_Bitmap_GetResourceType(L: Plua_State): Integer; cdecl;
var
	lBitmap:TLuaBitmap;
	ret:TResourceType;
begin
	CheckArg(L, 1);
	lBitmap := TLuaBitmap(GetLuaObject(L, 1));
	ret := lBitmap.GetResourceType();
	lua_push(L,ret);
	
	Result := 1;
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
	lBitmap.LoadFromStream(AStream,ASize);
	
	Result := 0;
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
	SetLength(CustomBitmapFuncs, 10+1);
	CustomBitmapFuncs[0].name:='Assign';
	CustomBitmapFuncs[0].func:=@VCLua_CustomBitmap_Assign;
	CustomBitmapFuncs[1].name:='Clear';
	CustomBitmapFuncs[1].func:=@VCLua_CustomBitmap_Clear;
	CustomBitmapFuncs[2].name:='FreeImage';
	CustomBitmapFuncs[2].func:=@VCLua_CustomBitmap_FreeImage;
	CustomBitmapFuncs[3].name:='LazarusResourceTypeValid';
	CustomBitmapFuncs[3].func:=@VCLua_CustomBitmap_LazarusResourceTypeValid;
	CustomBitmapFuncs[4].name:='BitmapHandleAllocated';
	CustomBitmapFuncs[4].func:=@VCLua_CustomBitmap_BitmapHandleAllocated;
	CustomBitmapFuncs[5].name:='MaskHandleAllocated';
	CustomBitmapFuncs[5].func:=@VCLua_CustomBitmap_MaskHandleAllocated;
	CustomBitmapFuncs[6].name:='PaletteAllocated';
	CustomBitmapFuncs[6].func:=@VCLua_CustomBitmap_PaletteAllocated;
	CustomBitmapFuncs[7].name:='ReleaseHandle';
	CustomBitmapFuncs[7].func:=@VCLua_CustomBitmap_ReleaseHandle;
	CustomBitmapFuncs[8].name:='SetHandles';
	CustomBitmapFuncs[8].func:=@VCLua_CustomBitmap_SetHandles;
	CustomBitmapFuncs[9].name:='SetSize';
	CustomBitmapFuncs[9].func:=@VCLua_CustomBitmap_SetSize;
	CustomBitmapFuncs[10].name:=nil;
	CustomBitmapFuncs[10].func:=nil;

	SetLength(BitmapFuncs, 2+1);
	BitmapFuncs[0].name:='GetResourceType';
	BitmapFuncs[0].func:=@VCLua_Bitmap_GetResourceType;
	BitmapFuncs[1].name:='LoadFromStream';
	BitmapFuncs[1].func:=@VCLua_Bitmap_LoadFromStream;
	BitmapFuncs[2].name:=nil;
	BitmapFuncs[2].func:=nil;

end.
