(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFont;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo, LuaVmt;

function IsFont(L: Plua_State): Integer; cdecl;
function AsFont(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFont; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFont = class(TFont)
    public
      L:Plua_State;
    end;
var
    FontFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

function VCLua_Font_Assign(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lFont := TLuaFont(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lFont.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Font', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Font_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		lFont.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Font', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_Font_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		lFont.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Font', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_Font_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
	ret:boolean;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		ret := lFont.HandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Font', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Font_IsDefault(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
	ret:boolean;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		ret := lFont.IsDefault();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Font', 'IsDefault', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Font_IsEqual(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
	AFont:TFont;
	ret:boolean;
begin
	CheckArg(L, 2);
	lFont := TLuaFont(GetLuaObject(L, 1));
	luaL_check(L,2,@AFont);
	try
		ret := lFont.IsEqual(AFont);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Font', 'IsEqual', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Font_SetDefault(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		lFont.SetDefault();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Font', 'SetDefault', E.ClassName, E.Message);
	end;
end;

function IsFont(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TFont);
end;
function AsFont(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TFont then
    lua_push(L, TFont(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TFont; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TFont',v);
end;

begin
	FontFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FontFuncs, 'Assign', @VCLua_Font_Assign);
	TLuaMethodInfo.Create(FontFuncs, 'BeginUpdate', @VCLua_Font_BeginUpdate);
	TLuaMethodInfo.Create(FontFuncs, 'EndUpdate', @VCLua_Font_EndUpdate);
	TLuaMethodInfo.Create(FontFuncs, 'HandleAllocated', @VCLua_Font_HandleAllocated);
	TLuaMethodInfo.Create(FontFuncs, 'IsDefault', @VCLua_Font_IsDefault);
	TLuaMethodInfo.Create(FontFuncs, 'IsEqual', @VCLua_Font_IsEqual);
	TLuaMethodInfo.Create(FontFuncs, 'SetDefault', @VCLua_Font_SetDefault);
end.
