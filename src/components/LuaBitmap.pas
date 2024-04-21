(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitmap;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Graphics;

procedure lua_push(L: Plua_State; const v: TCustomBitmap; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomBitmap = class(TCustomBitmap)
    end;
var
    CustomBitmapFuncs: TLuaVmt;
    CustomBitmapSets: TLuaVmt;

function CreateBitmap(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBitmap; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBitmap = class(TBitmap)
    end;
var
    BitmapFuncs: TLuaVmt;
    BitmapSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LCLType;

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

function VCLua_CustomBitmap_VCLuaSetHandle(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	val:HBITMAP;
begin
	lCustomBitmap := TLuaCustomBitmap(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomBitmap.Handle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'SetHandle', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomBitmap_VCLuaGetHandle(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:HBITMAP;
begin
	lCustomBitmap := TLuaCustomBitmap(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomBitmap.Handle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'GetHandle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomBitmap_VCLuaSetHandleType(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	val:TBitmapHandleType;
begin
	lCustomBitmap := TLuaCustomBitmap(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TBitmapHandleType));
	try
		lCustomBitmap.HandleType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'SetHandleType', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomBitmap_VCLuaGetHandleType(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:TBitmapHandleType;
begin
	lCustomBitmap := TLuaCustomBitmap(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomBitmap.HandleType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'GetHandleType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomBitmap_VCLuaSetMonochrome(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	val:Boolean;
begin
	lCustomBitmap := TLuaCustomBitmap(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomBitmap.Monochrome := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'SetMonochrome', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomBitmap_VCLuaGetMonochrome(L: Plua_State): Integer; cdecl;
var
	lCustomBitmap:TLuaCustomBitmap;
	ret:Boolean;
begin
	lCustomBitmap := TLuaCustomBitmap(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomBitmap.Monochrome;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomBitmap', 'GetMonochrome', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;


procedure lua_push(L: Plua_State; const v: TCustomBitmap; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomBitmap',v);
end;

procedure lua_push(L: Plua_State; const v: TBitmap; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBitmap',v);
end;
function CreateBitmap(L: Plua_State): Integer; cdecl;
var
	lBitmap:TLuaBitmap;
begin
	try
	lBitmap := TLuaBitmap.Create;
	CreateTableForKnownType(L,'TBitmap',lBitmap);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'Bitmap', E.ClassName, E.Message);
	end;
end;
begin
	CustomBitmapFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'ReleaseHandle', @VCLua_CustomBitmap_ReleaseHandle);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'SetSize', @VCLua_CustomBitmap_SetSize);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'Handle', @VCLua_CustomBitmap_VCLuaGetHandle, mfCall);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'HandleType', @VCLua_CustomBitmap_VCLuaGetHandleType, mfCall);
	TLuaMethodInfo.Create(CustomBitmapFuncs, 'Monochrome', @VCLua_CustomBitmap_VCLuaGetMonochrome, mfCall);
	CustomBitmapSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomBitmapSets, 'Handle', @VCLua_CustomBitmap_VCLuaSetHandle, mfCall, TypeInfo(HBITMAP));
	TLuaMethodInfo.Create(CustomBitmapSets, 'HandleType', @VCLua_CustomBitmap_VCLuaSetHandleType, mfCall, TypeInfo(TBitmapHandleType));
	TLuaMethodInfo.Create(CustomBitmapSets, 'Monochrome', @VCLua_CustomBitmap_VCLuaSetMonochrome, mfCall, TypeInfo(Boolean));
	BitmapFuncs := TLuaVmt.Create;
	
	BitmapSets := TLuaVmt.Create;
	
end.
