(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBrush;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, Graphics, TypInfo, LuaVmt;

procedure lua_push(L: Plua_State; const v: TBrush; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBrush = class(TBrush)
    public
      L:Plua_State;
    end;
var
    BrushFuncs: TLuaVmt;
    BrushSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LuaBitmap;

function VCLua_Brush_Assign(L: Plua_State): Integer; cdecl;
var
	lBrush:TLuaBrush;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lBrush.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Brush', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Brush_EqualsBrush(L: Plua_State): Integer; cdecl;
var
	lBrush:TLuaBrush;
	ABrush:TBrush;
	ret:boolean;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	luaL_check(L,2,@ABrush);
	try
		ret := lBrush.EqualsBrush(ABrush);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Brush', 'EqualsBrush', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Brush_VCLuaSetBitmap(L: Plua_State): Integer; cdecl;
var
	lBrush:TLuaBrush;
	val:TCustomBitmap;
begin
	CheckArg(L, 2);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lBrush.Bitmap := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Brush', 'Bitmap', E.ClassName, E.Message);
	end;
end;

function VCLua_Brush_VCLuaGetBitmap(L: Plua_State): Integer; cdecl;
var
	lBrush:TLuaBrush;
	ret:TCustomBitmap;
begin
	CheckArg(L, 1);
	lBrush := TLuaBrush(GetLuaObject(L, 1));
	try
		ret := lBrush.Bitmap;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Brush', 'Bitmap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TBrush; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBrush',v);
end;

begin
	BrushFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(BrushFuncs, 'Assign', @VCLua_Brush_Assign);
	TLuaMethodInfo.Create(BrushFuncs, 'EqualsBrush', @VCLua_Brush_EqualsBrush);
	TLuaMethodInfo.Create(BrushFuncs, 'Bitmap', @VCLua_Brush_VCLuaGetBitmap, mfCall);
	BrushSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(BrushSets, 'Bitmap', @VCLua_Brush_VCLuaSetBitmap, mfCall);
end.
