(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaCustomBitmap;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType;

procedure CustomBitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCustomBitmap = class(TCustomBitmap)
		public
			L:Plua_State;   
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

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
	ResourceType := lua_tostring(L,2);
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

procedure CustomBitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
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

end.
