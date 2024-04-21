(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTextStrings;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, TextStrings;

function CreateTextStrings(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTextStrings; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTextStrings = class(TTextStrings)
    end;
var
    TextStringsFuncs: TLuaVmt;
    TextStringsSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaEvent;

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

function VCLua_TextStrings_VCLuaSetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	val:string;
begin
	lTextStrings := TLuaTextStrings(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTextStrings.Text := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'SetText', E.ClassName, E.Message);
	end;
end;

function VCLua_TextStrings_VCLuaGetText(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
	ret:string;
begin
	lTextStrings := TLuaTextStrings(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTextStrings.Text;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TextStrings', 'GetText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TextStrings_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	lTextStrings := TLuaTextStrings(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTextStrings.OnChange));
	lTextStrings.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_TextStrings_VCLuaSetOnChanging(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	lTextStrings := TLuaTextStrings(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTextStrings.OnChanging));
	lTextStrings.OnChanging := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TTextStrings; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTextStrings',v);
end;
function CreateTextStrings(L: Plua_State): Integer; cdecl;
var
	lTextStrings:TLuaTextStrings;
begin
	try
	lTextStrings := TLuaTextStrings.Create;
	CreateTableForKnownType(L,'TTextStrings',lTextStrings);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TextStrings', E.ClassName, E.Message);
	end;
end;
begin
	TextStringsFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TextStringsFuncs, 'MakeTextBufferUnique', @VCLua_TextStrings_MakeTextBufferUnique);
	TLuaMethodInfo.Create(TextStringsFuncs, 'BeginUpdate', @VCLua_TextStrings_BeginUpdate);
	TLuaMethodInfo.Create(TextStringsFuncs, 'EndUpdate', @VCLua_TextStrings_EndUpdate);
	TLuaMethodInfo.Create(TextStringsFuncs, 'Text', @VCLua_TextStrings_VCLuaGetText, mfCall);
	TextStringsSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TextStringsSets, 'Text', @VCLua_TextStrings_VCLuaSetText, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(TextStringsSets, 'OnChange', @VCLua_TextStrings_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(TextStringsSets, 'OnChanging', @VCLua_TextStrings_VCLuaSetOnChanging, mfCall, TypeInfo(TNotifyEvent));
end.
