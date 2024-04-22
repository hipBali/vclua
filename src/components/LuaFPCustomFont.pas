(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFPCustomFont;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, FPCanvas;

procedure lua_push(L: Plua_State; const v: TFPCustomFont; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFPCustomFont = class(TFPCustomFont)
    end;
var
    FPCustomFontFuncs: TLuaVmt;
    FPCustomFontSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

function VCLua_FPCustomFont_CopyFont(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:TFPCustomFont;
begin
	CheckArg(L, 1);
	lFPCustomFont := TLuaFPCustomFont(GetLuaObject(L, 1));
	try
		ret := lFPCustomFont.CopyFont();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'CopyFont', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_GetTextSize(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	text:string;
	w:integer;
	h:integer;
begin
	CheckArg(L, 2);
	lFPCustomFont := TLuaFPCustomFont(GetLuaObject(L, 1));
	luaL_check(L,2,@text);
	try
		lFPCustomFont.GetTextSize(text,w,h);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetTextSize', E.ClassName, E.Message);
	end;
	lua_push(L,w);
	lua_push(L,h);
end;

function VCLua_FPCustomFont_GetTextSize2(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	text:string;
	w:integer;
	h:integer;
begin
	CheckArg(L, 4);
	lFPCustomFont := TLuaFPCustomFont(GetLuaObject(L, 1));
	luaL_check(L,2,@text);
	luaL_check(L,3,@w);
	luaL_check(L,4,@h);
	try
		lFPCustomFont.GetTextSize(text,w,h);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetTextSize', E.ClassName, E.Message);
	end;
	lua_push(L,w);
	lua_push(L,h);
end;

function VCLua_FPCustomFont_GetTextHeight(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	text:string;
	ret:integer;
begin
	CheckArg(L, 2);
	lFPCustomFont := TLuaFPCustomFont(GetLuaObject(L, 1));
	luaL_check(L,2,@text);
	try
		ret := lFPCustomFont.GetTextHeight(text);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetTextHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_GetTextWidth(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	text:string;
	ret:integer;
begin
	CheckArg(L, 2);
	lFPCustomFont := TLuaFPCustomFont(GetLuaObject(L, 1));
	luaL_check(L,2,@text);
	try
		ret := lFPCustomFont.GetTextWidth(text);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetTextWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_VCLuaSetName(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	val:string;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFPCustomFont.Name := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'SetName', E.ClassName, E.Message);
	end;
end;

function VCLua_FPCustomFont_VCLuaGetName(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:string;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFPCustomFont.Name;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_VCLuaSetSize(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	val:integer;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFPCustomFont.Size := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'SetSize', E.ClassName, E.Message);
	end;
end;

function VCLua_FPCustomFont_VCLuaGetSize(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:integer;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFPCustomFont.Size;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_VCLuaSetBold(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	val:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFPCustomFont.Bold := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'SetBold', E.ClassName, E.Message);
	end;
end;

function VCLua_FPCustomFont_VCLuaGetBold(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFPCustomFont.Bold;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetBold', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_VCLuaSetItalic(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	val:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFPCustomFont.Italic := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'SetItalic', E.ClassName, E.Message);
	end;
end;

function VCLua_FPCustomFont_VCLuaGetItalic(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFPCustomFont.Italic;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetItalic', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_VCLuaSetUnderline(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	val:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFPCustomFont.Underline := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'SetUnderline', E.ClassName, E.Message);
	end;
end;

function VCLua_FPCustomFont_VCLuaGetUnderline(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFPCustomFont.Underline;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetUnderline', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_VCLuaSetStrikeThrough(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	val:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFPCustomFont.StrikeThrough := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'SetStrikeThrough', E.ClassName, E.Message);
	end;
end;

function VCLua_FPCustomFont_VCLuaGetStrikeThrough(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:boolean;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFPCustomFont.StrikeThrough;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetStrikeThrough', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_FPCustomFont_VCLuaSetOrientation(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	val:Integer;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lFPCustomFont.Orientation := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'SetOrientation', E.ClassName, E.Message);
	end;
end;

function VCLua_FPCustomFont_VCLuaGetOrientation(L: Plua_State): Integer; cdecl;
var
	lFPCustomFont:TLuaFPCustomFont;
	ret:Integer;
begin
	lFPCustomFont := TLuaFPCustomFont(GetLuaObjectUnsafe(L, 1));
	try
		ret := lFPCustomFont.Orientation;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'FPCustomFont', 'GetOrientation', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TFPCustomFont; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TFPCustomFont',v);
end;

begin
	FPCustomFontFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'CopyFont', @VCLua_FPCustomFont_CopyFont);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'GetTextSize', @VCLua_FPCustomFont_GetTextSize);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'GetTextSize2', @VCLua_FPCustomFont_GetTextSize2);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'GetTextHeight', @VCLua_FPCustomFont_GetTextHeight);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'GetTextWidth', @VCLua_FPCustomFont_GetTextWidth);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'Name', @VCLua_FPCustomFont_VCLuaGetName, mfCall);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'Size', @VCLua_FPCustomFont_VCLuaGetSize, mfCall);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'Bold', @VCLua_FPCustomFont_VCLuaGetBold, mfCall);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'Italic', @VCLua_FPCustomFont_VCLuaGetItalic, mfCall);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'Underline', @VCLua_FPCustomFont_VCLuaGetUnderline, mfCall);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'StrikeThrough', @VCLua_FPCustomFont_VCLuaGetStrikeThrough, mfCall);
	TLuaMethodInfo.Create(FPCustomFontFuncs, 'Orientation', @VCLua_FPCustomFont_VCLuaGetOrientation, mfCall);
	FPCustomFontSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(FPCustomFontSets, 'Name', @VCLua_FPCustomFont_VCLuaSetName, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(FPCustomFontSets, 'Size', @VCLua_FPCustomFont_VCLuaSetSize, mfCall, TypeInfo(integer));
	TLuaMethodInfo.Create(FPCustomFontSets, 'Bold', @VCLua_FPCustomFont_VCLuaSetBold, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(FPCustomFontSets, 'Italic', @VCLua_FPCustomFont_VCLuaSetItalic, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(FPCustomFontSets, 'Underline', @VCLua_FPCustomFont_VCLuaSetUnderline, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(FPCustomFontSets, 'StrikeThrough', @VCLua_FPCustomFont_VCLuaSetStrikeThrough, mfCall, TypeInfo(boolean));
	TLuaMethodInfo.Create(FPCustomFontSets, 'Orientation', @VCLua_FPCustomFont_VCLuaSetOrientation, mfCall, TypeInfo(Integer));
end.
