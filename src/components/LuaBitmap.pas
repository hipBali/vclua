(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitmap;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType, TypInfo;

function CreateCustomBitmap(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCustomBitmap; pti: PTypeInfo = nil); overload; inline;
procedure CustomBitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCustomBitmap = class(TCustomBitmap)
    public
      L:Plua_State;
    end;

function CreateBitmap(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBitmap; pti: PTypeInfo = nil); overload; inline;
procedure BitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBitmap = class(TBitmap)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_CustomBitmap_Assign(L: Plua_State): Integer; cdecl;
var 
	lCustomBitmap:TLuaCustomBitmap;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lCustomBitmap := TLuaCustomBitmap(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
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
	ResourceType := lua_toStringCP(L,2);
	ret := lCustomBitmap.LazarusResourceTypeValid(ResourceType);
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	ABitmap := lua_tointeger(L,2);
	AMask := lua_tointeger(L,3);
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
	AWidth := lua_tointeger(L,2);
	AHeight := lua_tointeger(L,3);
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
	lua_pushstring(L,PChar(ret));
	
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
	AStream := TStream(GetLuaObject(L,2));
	ASize := lua_tointeger(L,3);
	lBitmap.LoadFromStream(AStream,ASize);
	
	Result := 0;
end;

function VCLua_Bitmap_CustomBitmap(L: Plua_State): Integer; cdecl;
var
  b: TLuaBitmap;
begin
  b := TLuaBitmap(GetLuaObject(L, 1));
  CustomBitmapToTable(L, -1, b);
  Result := 1;
end;

procedure lua_push(L: Plua_State; const v: TCustomBitmap; pti: PTypeInfo);
begin
	CustomBitmapToTable(L,-1,v);
end;
procedure CustomBitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_CustomBitmap_Assign);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_CustomBitmap_Clear);
	LuaSetTableFunction(L, Index, 'FreeImage', @VCLua_CustomBitmap_FreeImage);
	LuaSetTableFunction(L, Index, 'LazarusResourceTypeValid', @VCLua_CustomBitmap_LazarusResourceTypeValid);
	LuaSetTableFunction(L, Index, 'BitmapHandleAllocated', @VCLua_CustomBitmap_BitmapHandleAllocated);
	LuaSetTableFunction(L, Index, 'MaskHandleAllocated', @VCLua_CustomBitmap_MaskHandleAllocated);
	LuaSetTableFunction(L, Index, 'PaletteAllocated', @VCLua_CustomBitmap_PaletteAllocated);
	LuaSetTableFunction(L, Index, 'ReleaseHandle', @VCLua_CustomBitmap_ReleaseHandle);
	LuaSetTableFunction(L, Index, 'SetHandles', @VCLua_CustomBitmap_SetHandles);
	LuaSetTableFunction(L, Index, 'SetSize', @VCLua_CustomBitmap_SetSize);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCustomBitmap(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
begin
	lCustomBitmap := TLuaCustomBitmap.Create;
	CustomBitmapToTable(L, -1, lCustomBitmap);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TBitmap; pti: PTypeInfo);
begin
	BitmapToTable(L,-1,v);
end;
procedure BitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'GetResourceType', @VCLua_Bitmap_GetResourceType);
	LuaSetTableFunction(L, Index, 'LoadFromStream', @VCLua_Bitmap_LoadFromStream);
	LuaSetTableFunction(L, Index, 'CustomBitmap', @VCLua_Bitmap_CustomBitmap);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateBitmap(L: Plua_State): Integer; cdecl;
var
	lBitmap:TLuaBitmap;
begin
	lBitmap := TLuaBitmap.Create;
	BitmapToTable(L, -1, lBitmap);
	Result := 1;
end;
end.
