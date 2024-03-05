(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTextStrings;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TextStrings, TypInfo, LuaVmt;

function CreateTextStrings(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTextStrings; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTextStrings = class(TTextStrings)
    public
      L:Plua_State;
    end;
var
    TextStringsFuncs: TLuaVmt;
    TextStringsSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_TextStrings_Clear(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	try
		lTextStrings.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_SetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	TheText:PChar;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@TheText);
	try
		lTextStrings.SetText(TheText);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'SetText', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_Insert(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	Index:Integer;
	S:string;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@S);
	try
		lTextStrings.Insert(Index,S);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Insert', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_Delete(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	Index:Integer;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lTextStrings.Delete(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_Exchange(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	Index1:Integer;
	Index2:Integer;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@Index1);
	luaL_check(L,3,@Index2);
	try
		lTextStrings.Exchange(Index1,Index2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Exchange', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_Move(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	CurIndex:Integer;
	NewIndex:Integer;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@CurIndex);
	luaL_check(L,3,@NewIndex);
	try
		lTextStrings.Move(CurIndex,NewIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Move', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_MakeTextBufferUnique(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	try
		lTextStrings.MakeTextBufferUnique();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'MakeTextBufferUnique', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	try
		lTextStrings.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	try
		lTextStrings.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_GetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	ret:PChar;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	try
		ret := lTextStrings.GetText();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'GetText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TextStrings_IndexOf(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lTextStrings.IndexOf(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TextStrings_Add(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	S:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lTextStrings.Add(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TextStrings_AddObject(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	S:string;
	AObject:TObject;
	ret:Integer;
begin
	CheckArg(L, 3);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	luaL_check(L,3,@AObject);
	try
		ret := lTextStrings.AddObject(S,AObject);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'AddObject', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TextStrings_AddStrings(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	TheStrings:TStrings;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@TheStrings);
	try
		lTextStrings.AddStrings(TheStrings);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'AddStrings', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_LoadFromFile(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lTextStrings.LoadFromFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'LoadFromFile', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_SaveToFile(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	FileName:string;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lTextStrings.SaveToFile(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'SaveToFile', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_VCLuaSetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	val:string;
begin
	CheckArg(L, 2);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lTextStrings.Text := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Text', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_VCLuaGetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	ret:string;
begin
	CheckArg(L, 1);
	lTextStrings := TLuaTextStrings(GetLuaObject(L, 1));
	try
		ret := lTextStrings.Text;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'Text', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TTextStrings; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTextStrings',v);
end;
function CreateTextStrings(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	lTextStrings := TLuaTextStrings.Create;
	CreateTableForKnownType(L,'TTextStrings',lTextStrings);
	Result := 1;
end;
begin
	TextStringsFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TextStringsFuncs, 'Clear', @VCLua_TextStrings_Clear);
	TLuaMethodInfo.Create(TextStringsFuncs, 'SetText', @VCLua_TextStrings_SetText);
	TLuaMethodInfo.Create(TextStringsFuncs, 'Insert', @VCLua_TextStrings_Insert);
	TLuaMethodInfo.Create(TextStringsFuncs, 'Delete', @VCLua_TextStrings_Delete);
	TLuaMethodInfo.Create(TextStringsFuncs, 'Exchange', @VCLua_TextStrings_Exchange);
	TLuaMethodInfo.Create(TextStringsFuncs, 'Move', @VCLua_TextStrings_Move);
	TLuaMethodInfo.Create(TextStringsFuncs, 'MakeTextBufferUnique', @VCLua_TextStrings_MakeTextBufferUnique);
	TLuaMethodInfo.Create(TextStringsFuncs, 'BeginUpdate', @VCLua_TextStrings_BeginUpdate);
	TLuaMethodInfo.Create(TextStringsFuncs, 'EndUpdate', @VCLua_TextStrings_EndUpdate);
	TLuaMethodInfo.Create(TextStringsFuncs, 'GetText', @VCLua_TextStrings_GetText);
	TLuaMethodInfo.Create(TextStringsFuncs, 'IndexOf', @VCLua_TextStrings_IndexOf);
	TLuaMethodInfo.Create(TextStringsFuncs, 'Add', @VCLua_TextStrings_Add);
	TLuaMethodInfo.Create(TextStringsFuncs, 'AddObject', @VCLua_TextStrings_AddObject);
	TLuaMethodInfo.Create(TextStringsFuncs, 'AddStrings', @VCLua_TextStrings_AddStrings);
	TLuaMethodInfo.Create(TextStringsFuncs, 'LoadFromFile', @VCLua_TextStrings_LoadFromFile);
	TLuaMethodInfo.Create(TextStringsFuncs, 'SaveToFile', @VCLua_TextStrings_SaveToFile);
	TLuaMethodInfo.Create(TextStringsFuncs, 'Text', @VCLua_TextStrings_VCLuaGetText, mfCall);
	TextStringsSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TextStringsSets, 'Text', @VCLua_TextStrings_VCLuaSetText, mfCall);
end.
