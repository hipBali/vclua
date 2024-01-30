(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaFont;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics;

procedure FontToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaFont = class(TFont)
		public
			L:Plua_State;   
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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
	lua_pushboolean(L,ret);
	
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

procedure FontToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Font_Assign);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_Font_BeginUpdate);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_Font_EndUpdate);
	LuaSetTableFunction(L, Index, 'HandleAllocated', @VCLua_Font_HandleAllocated);
	LuaSetTableFunction(L, Index, 'IsDefault', @VCLua_Font_IsDefault);
	LuaSetTableFunction(L, Index, 'IsEqual', @VCLua_Font_IsEqual);
	LuaSetTableFunction(L, Index, 'SetDefault', @VCLua_Font_SetDefault);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
