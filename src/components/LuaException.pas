(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaException;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, SysUtils;

procedure lua_push(L: Plua_State; const v: Exception; pti: PTypeInfo = nil); overload; inline;

type
    TLuaException = class(Exception)
    end;
var
    ExceptionFuncs: TLuaVmt;
    ExceptionSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper;

function VCLua_Exception_ToString(L: Plua_State): Integer; cdecl;
var
	lException:TLuaException;
	ret:String;
begin
	CheckArg(L, 1);
	lException := TLuaException(GetLuaObject(L, 1));
	try
		ret := lException.ToString();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Exception', 'ToString', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Exception_VCLuaSetHelpContext(L: Plua_State): Integer; cdecl;
var
	lException:TLuaException;
	val:longint;
begin
	lException := TLuaException(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lException.HelpContext := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Exception', 'SetHelpContext', E.ClassName, E.Message);
	end;
end;

function VCLua_Exception_VCLuaGetHelpContext(L: Plua_State): Integer; cdecl;
var
	lException:TLuaException;
	ret:longint;
begin
	lException := TLuaException(GetLuaObjectUnsafe(L, 1));
	try
		ret := lException.HelpContext;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Exception', 'GetHelpContext', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Exception_VCLuaSetMessage(L: Plua_State): Integer; cdecl;
var
	lException:TLuaException;
	val:string;
begin
	lException := TLuaException(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lException.Message := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Exception', 'SetMessage', E.ClassName, E.Message);
	end;
end;

function VCLua_Exception_VCLuaGetMessage(L: Plua_State): Integer; cdecl;
var
	lException:TLuaException;
	ret:string;
begin
	lException := TLuaException(GetLuaObjectUnsafe(L, 1));
	try
		ret := lException.Message;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Exception', 'GetMessage', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: Exception; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'Exception',v);
end;

begin
	ExceptionFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ExceptionFuncs, 'ToString', @VCLua_Exception_ToString);
	TLuaMethodInfo.Create(ExceptionFuncs, 'HelpContext', @VCLua_Exception_VCLuaGetHelpContext, mfCall);
	TLuaMethodInfo.Create(ExceptionFuncs, 'Message', @VCLua_Exception_VCLuaGetMessage, mfCall);
	ExceptionSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(ExceptionSets, 'HelpContext', @VCLua_Exception_VCLuaSetHelpContext, mfCall, TypeInfo(longint));
	TLuaMethodInfo.Create(ExceptionSets, 'Message', @VCLua_Exception_VCLuaSetMessage, mfCall, TypeInfo(string));
end.
