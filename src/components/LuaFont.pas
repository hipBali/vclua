(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFont;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo;

function IsFont(L: Plua_State): Integer; cdecl;
function AsFont(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TFont; pti: PTypeInfo = nil); overload; inline;
procedure FontToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFont = class(TFont)
    public
      L:Plua_State;
    end;
var
    FontFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Font_Assign(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lFont := TLuaFont(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lFont.Assign(Source);
	
	Result := 0;
end;

function VCLua_Font_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	lFont.BeginUpdate();
	
	Result := 0;
end;

function VCLua_Font_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	lFont.EndUpdate();
	
	Result := 0;
end;

function VCLua_Font_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
	ret:boolean;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	ret := lFont.HandleAllocated();
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
	ret := lFont.IsDefault();
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
	AFont := TFont(GetLuaObject(L,2));
	ret := lFont.IsEqual(AFont);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Font_SetDefault(L: Plua_State): Integer; cdecl;
var
	lFont:TLuaFont;
begin
	CheckArg(L, 1);
	lFont := TLuaFont(GetLuaObject(L, 1));
	lFont.SetDefault();
	
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
	FontToTable(L,-1,v);
end;
procedure FontToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TFont');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
