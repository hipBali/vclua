(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCustomApplication;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, CustApp;

procedure lua_push(L: Plua_State; const v: TCustomApplication; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomApplication = class(TCustomApplication)
    end;
var
    CustomApplicationFuncs: TLuaVmt;
    CustomApplicationSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LuaCustAppEvents, LuaEvent, singleinstance;

function VCLua_CustomApplication_HandleException(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lCustomApplication.HandleException(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'HandleException', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_Initialize(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
begin
	CheckArg(L, 1);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	try
		lCustomApplication.Initialize();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'Initialize', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_Run(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
begin
	CheckArg(L, 1);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	try
		lCustomApplication.Run();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'Run', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_ShowException(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	E:Exception;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@E);
	try
		lCustomApplication.ShowException(E);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'ShowException', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_Terminate(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
begin
	CheckArg(L, 1);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	try
		lCustomApplication.Terminate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'Terminate', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_Terminate2(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	AExitCode:Integer;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@AExitCode);
	try
		lCustomApplication.Terminate(AExitCode);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'Terminate', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_FindOptionIndex(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	S:String;
	Longopt:Boolean;
	StartAt:Integer;
	ret:Integer;
begin
	CheckArg(L, 2, 3);
	lCustomApplication := TLuaCustomApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@S);
	TTrait<Integer>.luaL_optcheck(L, 3, @StartAt, -1);
	try
		ret := lCustomApplication.FindOptionIndex(S,Longopt,StartAt);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'FindOptionIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,Longopt);
end;

function VCLua_CustomApplication_FindOptionIndex2(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	S:String;
	Longopt:Boolean;
	StartAt:Integer;
	ret:Integer;
begin
	CheckArg(L, 3, 4);
	lCustomApplication := TLuaCustomApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@S);
	luaL_check(L,3,@Longopt);
	TTrait<Integer>.luaL_optcheck(L, 4, @StartAt, -1);
	try
		ret := lCustomApplication.FindOptionIndex(S,Longopt,StartAt);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'FindOptionIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,Longopt);
end;

function VCLua_CustomApplication_GetOptionValue(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	S:String;
	ret:String;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lCustomApplication.GetOptionValue(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetOptionValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_GetOptionValue2(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	C:Char;
	S:String;
	ret:String;
begin
	CheckArg(L, 3);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@C);
	luaL_check(L,3,@S);
	try
		ret := lCustomApplication.GetOptionValue(C,S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetOptionValue', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_GetOptionValues(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	C:Char;
	S:String;
	ret:TStringArray;
begin
	CheckArg(L, 3);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@C);
	luaL_check(L,3,@S);
	try
		ret := lCustomApplication.GetOptionValues(C,S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetOptionValues', E.ClassName, E.Message);
	end;
	lua_pushArray<string>(L, ret);
end;

function VCLua_CustomApplication_HasOption(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	S:String;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@S);
	try
		ret := lCustomApplication.HasOption(S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'HasOption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_HasOption2(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	C:Char;
	S:String;
	ret:Boolean;
begin
	CheckArg(L, 3);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@C);
	luaL_check(L,3,@S);
	try
		ret := lCustomApplication.HasOption(C,S);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'HasOption', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_CheckOptions(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ShortOptions:String;
	Longopts:TStrings;
	Opts:TStrings;
	NonOpts:TStrings;
	AllErrors:Boolean;
	LongoptsNeedsFree:Boolean = False;
	OptsNeedsFree:Boolean = False;
	NonOptsNeedsFree:Boolean = False;
	ret:String;
begin
	CheckArg(L, 5, 6);
	lCustomApplication := TLuaCustomApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@ShortOptions);
	LongoptsNeedsFree := luaL_checkOrFromTable(L,3,@Longopts,@luaL_checkStringList);
	OptsNeedsFree := luaL_checkOrFromTable(L,4,@Opts,@luaL_checkStringList);
	NonOptsNeedsFree := luaL_checkOrFromTable(L,5,@NonOpts,@luaL_checkStringList);
	TTrait<Boolean>.luaL_optcheck(L, 6, @AllErrors, False);
	try
		ret := lCustomApplication.CheckOptions(ShortOptions,Longopts,Opts,NonOpts,AllErrors);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'CheckOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	if LongoptsNeedsFree then Longopts.Free;
	if OptsNeedsFree then Opts.Free;
	if NonOptsNeedsFree then NonOpts.Free;
end;

function VCLua_CustomApplication_CheckOptions2(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ShortOptions:String;
	Longopts:Array of string;
	Opts:TStrings;
	NonOpts:TStrings;
	AllErrors:Boolean;
	OptsNeedsFree:Boolean = False;
	NonOptsNeedsFree:Boolean = False;
	ret:String;
begin
	CheckArg(L, 5, 6);
	lCustomApplication := TLuaCustomApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@ShortOptions);
	TTrait<string>.luaL_checkArray(L, 3, @Longopts);
	OptsNeedsFree := luaL_checkOrFromTable(L,4,@Opts,@luaL_checkStringList);
	NonOptsNeedsFree := luaL_checkOrFromTable(L,5,@NonOpts,@luaL_checkStringList);
	TTrait<Boolean>.luaL_optcheck(L, 6, @AllErrors, False);
	try
		ret := lCustomApplication.CheckOptions(ShortOptions,Longopts,Opts,NonOpts,AllErrors);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'CheckOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	if OptsNeedsFree then Opts.Free;
	if NonOptsNeedsFree then NonOpts.Free;
end;

function VCLua_CustomApplication_CheckOptions3(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ShortOptions:String;
	Longopts:TStrings;
	AllErrors:Boolean;
	LongoptsNeedsFree:Boolean = False;
	ret:String;
begin
	CheckArg(L, 3, 4);
	lCustomApplication := TLuaCustomApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@ShortOptions);
	LongoptsNeedsFree := luaL_checkOrFromTable(L,3,@Longopts,@luaL_checkStringList);
	TTrait<Boolean>.luaL_optcheck(L, 4, @AllErrors, False);
	try
		ret := lCustomApplication.CheckOptions(ShortOptions,Longopts,AllErrors);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'CheckOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	if LongoptsNeedsFree then Longopts.Free;
end;

function VCLua_CustomApplication_CheckOptions4(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ShortOptions:String;
	LongOpts:Array of string;
	AllErrors:Boolean;
	ret:String;
begin
	CheckArg(L, 3, 4);
	lCustomApplication := TLuaCustomApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@ShortOptions);
	TTrait<string>.luaL_checkArray(L, 3, @LongOpts);
	TTrait<Boolean>.luaL_optcheck(L, 4, @AllErrors, False);
	try
		ret := lCustomApplication.CheckOptions(ShortOptions,LongOpts,AllErrors);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'CheckOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_CheckOptions5(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ShortOptions:String;
	LongOpts:String;
	AllErrors:Boolean;
	ret:String;
begin
	CheckArg(L, 3, 4);
	lCustomApplication := TLuaCustomApplication(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@ShortOptions);
	luaL_check(L,3,@LongOpts);
	TTrait<Boolean>.luaL_optcheck(L, 4, @AllErrors, False);
	try
		ret := lCustomApplication.CheckOptions(ShortOptions,LongOpts,AllErrors);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'CheckOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_GetNonOptions(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ShortOptions:String;
	Longopts:Array of string;
	ret:TStringArray;
begin
	CheckArg(L, 3);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@ShortOptions);
	TTrait<string>.luaL_checkArray(L, 3, @Longopts);
	try
		ret := lCustomApplication.GetNonOptions(ShortOptions,Longopts);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetNonOptions', E.ClassName, E.Message);
	end;
	lua_pushArray<string>(L, ret);
end;

function VCLua_CustomApplication_GetNonOptions2(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ShortOptions:String;
	Longopts:Array of string;
	NonOptions:TStrings;
	NonOptionsNeedsFree:Boolean = False;
begin
	CheckArg(L, 4);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@ShortOptions);
	TTrait<string>.luaL_checkArray(L, 3, @Longopts);
	NonOptionsNeedsFree := luaL_checkOrFromTable(L,4,@NonOptions,@luaL_checkStringList);
	try
		lCustomApplication.GetNonOptions(ShortOptions,Longopts,NonOptions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetNonOptions', E.ClassName, E.Message);
	end;
	if NonOptionsNeedsFree then NonOptions.Free;
end;

function VCLua_CustomApplication_GetEnvironmentList(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	List:TStrings;
	NamesOnly:Boolean;
	ListNeedsFree:Boolean = False;
begin
	CheckArg(L, 3);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	ListNeedsFree := luaL_checkOrFromTable(L,2,@List,@luaL_checkStringList);
	luaL_check(L,3,@NamesOnly);
	try
		lCustomApplication.GetEnvironmentList(List,NamesOnly);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetEnvironmentList', E.ClassName, E.Message);
	end;
	if ListNeedsFree then List.Free;
end;

function VCLua_CustomApplication_GetEnvironmentList2(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	List:TStrings;
	ListNeedsFree:Boolean = False;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	ListNeedsFree := luaL_checkOrFromTable(L,2,@List,@luaL_checkStringList);
	try
		lCustomApplication.GetEnvironmentList(List);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetEnvironmentList', E.ClassName, E.Message);
	end;
	if ListNeedsFree then List.Free;
end;

function VCLua_CustomApplication_Log(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	EventType:TEventType;
	Msg:String;
begin
	CheckArg(L, 3);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@EventType,TypeInfo(TEventType));
	luaL_check(L,3,@Msg);
	try
		lCustomApplication.Log(EventType,Msg);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'Log', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetExeName(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:string;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.ExeName;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetExeName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaSetHelpFile(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:string;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomApplication.HelpFile := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetHelpFile', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetHelpFile(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:string;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.HelpFile;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetHelpFile', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaGetTerminated(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.Terminated;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetTerminated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaSetTitle(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:string;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomApplication.Title := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetTitle', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetTitle(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:string;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.Title;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetTitle', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaSetOnException(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomApplication.OnException));
	lCustomApplication.OnException := TLuaEvent.Factory<TExceptionEvent,TLuaExceptionEvent>(L);
	Result := 0;
end;

function VCLua_CustomApplication_VCLuaGetConsoleApplication(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.ConsoleApplication;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetConsoleApplication', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaGetLocation(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:String;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.Location;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetLocation', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_Params(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	Index:integer;
	ret:String;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lCustomApplication.Params[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'Params', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetParamCount(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Integer;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.ParamCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetParamCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_EnvironmentVariable(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	envName:String;
	ret:String;
begin
	CheckArg(L, 2);
	lCustomApplication := TLuaCustomApplication(GetLuaObject(L, 1));
	luaL_check(L,2,@envName);
	try
		ret := lCustomApplication.EnvironmentVariable[envName];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'EnvironmentVariable', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaSetOptionChar(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:Char;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomApplication.OptionChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetOptionChar', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetOptionChar(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Char;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.OptionChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetOptionChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaSetCaseSensitiveOptions(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomApplication.CaseSensitiveOptions := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetCaseSensitiveOptions', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetCaseSensitiveOptions(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.CaseSensitiveOptions;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetCaseSensitiveOptions', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaSetStopOnException(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomApplication.StopOnException := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetStopOnException', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetStopOnException(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.StopOnException;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetStopOnException', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaSetExceptionExitCode(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:Longint;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomApplication.ExceptionExitCode := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetExceptionExitCode', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetExceptionExitCode(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Longint;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.ExceptionExitCode;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetExceptionExitCode', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomApplication_VCLuaSetEventLogFilter(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:TEventLogTypes;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TEventLogTypes));
	try
		lCustomApplication.EventLogFilter := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetEventLogFilter', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetEventLogFilter(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:TEventLogTypes;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.EventLogFilter;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetEventLogFilter', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CustomApplication_VCLuaSetSingleInstanceEnabled(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	val:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomApplication.SingleInstanceEnabled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'SetSingleInstanceEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomApplication_VCLuaGetSingleInstanceEnabled(L: Plua_State): Integer; cdecl;
var
	lCustomApplication:TLuaCustomApplication;
	ret:Boolean;
begin
	lCustomApplication := TLuaCustomApplication(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomApplication.SingleInstanceEnabled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomApplication', 'GetSingleInstanceEnabled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TCustomApplication; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomApplication',v);
end;

begin
	CustomApplicationFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'HandleException', @VCLua_CustomApplication_HandleException);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Initialize', @VCLua_CustomApplication_Initialize);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Run', @VCLua_CustomApplication_Run);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'ShowException', @VCLua_CustomApplication_ShowException);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Terminate', @VCLua_CustomApplication_Terminate);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Terminate2', @VCLua_CustomApplication_Terminate2);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'FindOptionIndex', @VCLua_CustomApplication_FindOptionIndex);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'FindOptionIndex2', @VCLua_CustomApplication_FindOptionIndex2);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'GetOptionValue', @VCLua_CustomApplication_GetOptionValue);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'GetOptionValue2', @VCLua_CustomApplication_GetOptionValue2);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'GetOptionValues', @VCLua_CustomApplication_GetOptionValues);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'HasOption', @VCLua_CustomApplication_HasOption);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'HasOption2', @VCLua_CustomApplication_HasOption2);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'CheckOptions', @VCLua_CustomApplication_CheckOptions);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'CheckOptions2', @VCLua_CustomApplication_CheckOptions2);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'CheckOptions3', @VCLua_CustomApplication_CheckOptions3);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'CheckOptions4', @VCLua_CustomApplication_CheckOptions4);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'CheckOptions5', @VCLua_CustomApplication_CheckOptions5);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'GetNonOptions', @VCLua_CustomApplication_GetNonOptions);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'GetNonOptions2', @VCLua_CustomApplication_GetNonOptions2);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'GetEnvironmentList', @VCLua_CustomApplication_GetEnvironmentList);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'GetEnvironmentList2', @VCLua_CustomApplication_GetEnvironmentList2);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Log', @VCLua_CustomApplication_Log);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'ExeName', @VCLua_CustomApplication_VCLuaGetExeName, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'HelpFile', @VCLua_CustomApplication_VCLuaGetHelpFile, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Terminated', @VCLua_CustomApplication_VCLuaGetTerminated, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Title', @VCLua_CustomApplication_VCLuaGetTitle, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'ConsoleApplication', @VCLua_CustomApplication_VCLuaGetConsoleApplication, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Location', @VCLua_CustomApplication_VCLuaGetLocation, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'Params', @VCLua_CustomApplication_Params);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'ParamCount', @VCLua_CustomApplication_VCLuaGetParamCount, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'EnvironmentVariable', @VCLua_CustomApplication_EnvironmentVariable);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'OptionChar', @VCLua_CustomApplication_VCLuaGetOptionChar, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'CaseSensitiveOptions', @VCLua_CustomApplication_VCLuaGetCaseSensitiveOptions, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'StopOnException', @VCLua_CustomApplication_VCLuaGetStopOnException, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'ExceptionExitCode', @VCLua_CustomApplication_VCLuaGetExceptionExitCode, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'EventLogFilter', @VCLua_CustomApplication_VCLuaGetEventLogFilter, mfCall);
	TLuaMethodInfo.Create(CustomApplicationFuncs, 'SingleInstanceEnabled', @VCLua_CustomApplication_VCLuaGetSingleInstanceEnabled, mfCall);
	CustomApplicationSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomApplicationSets, 'HelpFile', @VCLua_CustomApplication_VCLuaSetHelpFile, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(CustomApplicationSets, 'Title', @VCLua_CustomApplication_VCLuaSetTitle, mfCall, TypeInfo(string));
	TLuaMethodInfo.Create(CustomApplicationSets, 'OnException', @VCLua_CustomApplication_VCLuaSetOnException, mfCall, TypeInfo(TExceptionEvent));
	TLuaMethodInfo.Create(CustomApplicationSets, 'OptionChar', @VCLua_CustomApplication_VCLuaSetOptionChar, mfCall, TypeInfo(Char));
	TLuaMethodInfo.Create(CustomApplicationSets, 'CaseSensitiveOptions', @VCLua_CustomApplication_VCLuaSetCaseSensitiveOptions, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomApplicationSets, 'StopOnException', @VCLua_CustomApplication_VCLuaSetStopOnException, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomApplicationSets, 'ExceptionExitCode', @VCLua_CustomApplication_VCLuaSetExceptionExitCode, mfCall, TypeInfo(Longint));
	TLuaMethodInfo.Create(CustomApplicationSets, 'EventLogFilter', @VCLua_CustomApplication_VCLuaSetEventLogFilter, mfCall, TypeInfo(TEventLogTypes));
	TLuaMethodInfo.Create(CustomApplicationSets, 'SingleInstanceEnabled', @VCLua_CustomApplication_VCLuaSetSingleInstanceEnabled, mfCall, TypeInfo(Boolean));
end.
