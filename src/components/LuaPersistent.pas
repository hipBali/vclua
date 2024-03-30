(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPersistent;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Classes;

procedure lua_push(L: Plua_State; const v: TPersistent; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPersistent = class(TPersistent)
    end;
var
    PersistentFuncs: TLuaVmt;
    PersistentSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils;

function VCLua_Persistent_Assign(L: Plua_State): Integer; cdecl;
var
	lPersistent:TLuaPersistent;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lPersistent := TLuaPersistent(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lPersistent.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Persistent', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_Persistent_FPOAttachObserver(L: Plua_State): Integer; cdecl;
var
	lPersistent:TLuaPersistent;
	AObserver:TObject;
begin
	CheckArg(L, 2);
	lPersistent := TLuaPersistent(GetLuaObject(L, 1));
	luaL_check(L,2,@AObserver);
	try
		lPersistent.FPOAttachObserver(AObserver);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Persistent', 'FPOAttachObserver', E.ClassName, E.Message);
	end;
end;

function VCLua_Persistent_FPODetachObserver(L: Plua_State): Integer; cdecl;
var
	lPersistent:TLuaPersistent;
	AObserver:TObject;
begin
	CheckArg(L, 2);
	lPersistent := TLuaPersistent(GetLuaObject(L, 1));
	luaL_check(L,2,@AObserver);
	try
		lPersistent.FPODetachObserver(AObserver);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Persistent', 'FPODetachObserver', E.ClassName, E.Message);
	end;
end;

function VCLua_Persistent_FPONotifyObservers(L: Plua_State): Integer; cdecl;
var
	lPersistent:TLuaPersistent;
	ASender:TObject;
	AOperation:TFPObservedOperation;
	Data:Pointer;
begin
	CheckArg(L, 4);
	lPersistent := TLuaPersistent(GetLuaObject(L, 1));
	luaL_check(L,2,@ASender);
	luaL_check(L,3,@AOperation,TypeInfo(TFPObservedOperation));
	Data := lua_touserdata(L,4);
	try
		lPersistent.FPONotifyObservers(ASender,AOperation,Data);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Persistent', 'FPONotifyObservers', E.ClassName, E.Message);
	end;
end;

function VCLua_Persistent_GetNamePath(L: Plua_State): Integer; cdecl;
var
	lPersistent:TLuaPersistent;
	ret:string;
begin
	CheckArg(L, 1);
	lPersistent := TLuaPersistent(GetLuaObject(L, 1));
	try
		ret := lPersistent.GetNamePath();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Persistent', 'GetNamePath', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TPersistent; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TPersistent',v);
end;

begin
	PersistentFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PersistentFuncs, 'Assign', @VCLua_Persistent_Assign);
	TLuaMethodInfo.Create(PersistentFuncs, 'FPOAttachObserver', @VCLua_Persistent_FPOAttachObserver);
	TLuaMethodInfo.Create(PersistentFuncs, 'FPODetachObserver', @VCLua_Persistent_FPODetachObserver);
	TLuaMethodInfo.Create(PersistentFuncs, 'FPONotifyObservers', @VCLua_Persistent_FPONotifyObservers);
	TLuaMethodInfo.Create(PersistentFuncs, 'GetNamePath', @VCLua_Persistent_GetNamePath);
	PersistentSets := TLuaVmt.Create;
	
end.
