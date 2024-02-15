(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFont;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo;

function IsFont(L: Plua_State): Integer; cdecl;
function AsFont(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFont; pti: PTypeInfo = nil); overload; inline;

type
    TLuaFont = class(TFont)
    public
      L:Plua_State;
    end;
var
    FontFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

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
	except
		on E: Exception do
			CallError(L, 'Font', 'Assign', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_Font_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		lFont.BeginUpdate();
	except
		on E: Exception do
			CallError(L, 'Font', 'BeginUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function VCLua_Font_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		lFont.EndUpdate();
	except
		on E: Exception do
			CallError(L, 'Font', 'EndUpdate', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Font', 'HandleAllocated', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'Font', 'IsDefault', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'Font', 'IsEqual', E.ClassName, E.Message);
	end;

	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Font_SetDefault(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	try
		lFont.SetDefault();
	except
		on E: Exception do
			CallError(L, 'Font', 'SetDefault', E.ClassName, E.Message);
	end;

	
	Result := 0;
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
	SetLength(FontFuncs, 7+1);
	FontFuncs[0].name:='Assign';
	FontFuncs[0].func:=@VCLua_Font_Assign;
	FontFuncs[1].name:='BeginUpdate';
	FontFuncs[1].func:=@VCLua_Font_BeginUpdate;
	FontFuncs[2].name:='EndUpdate';
	FontFuncs[2].func:=@VCLua_Font_EndUpdate;
	FontFuncs[3].name:='HandleAllocated';
	FontFuncs[3].func:=@VCLua_Font_HandleAllocated;
	FontFuncs[4].name:='IsDefault';
	FontFuncs[4].func:=@VCLua_Font_IsDefault;
	FontFuncs[5].name:='IsEqual';
	FontFuncs[5].func:=@VCLua_Font_IsEqual;
	FontFuncs[6].name:='SetDefault';
	FontFuncs[6].func:=@VCLua_Font_SetDefault;
	FontFuncs[7].name:=nil;
	FontFuncs[7].func:=nil;

end.
