(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCalendar;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Calendar, TypInfo, LuaVmt;

function CreateCalendar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCalendar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCalendar = class(TCalendar)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCalendarFuncs: TLuaVmt;
    CustomCalendarSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_Calendar_HitTest(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	APoint:TPoint;
	ret:TCalendarPart;
begin
	CheckArg(L, 2);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	luaL_check(L,2,@APoint);
	try
		ret := lCalendar.HitTest(APoint);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'HitTest', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Calendar_GetCalendarView(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	ret:TCalendarView;
begin
	CheckArg(L, 1);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	try
		ret := lCalendar.GetCalendarView();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'GetCalendarView', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Calendar_VCLuaSetDate(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	val:String;
begin
	CheckArg(L, 2);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCalendar.Date := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'Date', E.ClassName, E.Message);
	end;
end;

function VCLua_Calendar_VCLuaGetDate(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	ret:String;
begin
	CheckArg(L, 1);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	try
		ret := lCalendar.Date;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'Date', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Calendar_VCLuaSetDateTime(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	val:TDateTime;
begin
	CheckArg(L, 2);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCalendar.DateTime := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'DateTime', E.ClassName, E.Message);
	end;
end;

function VCLua_Calendar_VCLuaGetDateTime(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	ret:TDateTime;
begin
	CheckArg(L, 1);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	try
		ret := lCalendar.DateTime;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'DateTime', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Calendar_VCLuaSetDisplaySettings(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	val:TDisplaySettings;
begin
	CheckArg(L, 2);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TDisplaySettings));
	try
		lCalendar.DisplaySettings := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'DisplaySettings', E.ClassName, E.Message);
	end;
end;

function VCLua_Calendar_VCLuaGetDisplaySettings(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	ret:TDisplaySettings;
begin
	CheckArg(L, 1);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	try
		ret := lCalendar.DisplaySettings;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'DisplaySettings', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Calendar_VCLuaSetFirstDayOfWeek(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	val:TCalDayOfWeek;
begin
	CheckArg(L, 2);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TCalDayOfWeek));
	try
		lCalendar.FirstDayOfWeek := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'FirstDayOfWeek', E.ClassName, E.Message);
	end;
end;

function VCLua_Calendar_VCLuaGetFirstDayOfWeek(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	ret:TCalDayOfWeek;
begin
	CheckArg(L, 1);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	try
		ret := lCalendar.FirstDayOfWeek;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Calendar', 'FirstDayOfWeek', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TCalendar; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCalendar',v);
end;
function CreateCalendar(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCalendar := TLuaCalendar.Create(Parent);
	lCalendar.Parent := TWinControl(Parent);
	lCalendar.LuaCtl := TVCLuaControl.Create(lCalendar as TComponent,L,nil,'TCustomCalendar');
	InitControl(L,lCalendar,Name);
	CreateTableForKnownType(L,'TCustomCalendar',lCalendar);
	Result := 1;
end;

begin
	CustomCalendarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCalendarFuncs, 'HitTest', @VCLua_Calendar_HitTest);
	TLuaMethodInfo.Create(CustomCalendarFuncs, 'GetCalendarView', @VCLua_Calendar_GetCalendarView);
	TLuaMethodInfo.Create(CustomCalendarFuncs, 'Date', @VCLua_Calendar_VCLuaGetDate, mfCall);
	TLuaMethodInfo.Create(CustomCalendarFuncs, 'DateTime', @VCLua_Calendar_VCLuaGetDateTime, mfCall);
	TLuaMethodInfo.Create(CustomCalendarFuncs, 'DisplaySettings', @VCLua_Calendar_VCLuaGetDisplaySettings, mfCall);
	TLuaMethodInfo.Create(CustomCalendarFuncs, 'FirstDayOfWeek', @VCLua_Calendar_VCLuaGetFirstDayOfWeek, mfCall);
	CustomCalendarSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCalendarSets, 'Date', @VCLua_Calendar_VCLuaSetDate, mfCall);
	TLuaMethodInfo.Create(CustomCalendarSets, 'DateTime', @VCLua_Calendar_VCLuaSetDateTime, mfCall);
	TLuaMethodInfo.Create(CustomCalendarSets, 'DisplaySettings', @VCLua_Calendar_VCLuaSetDisplaySettings, mfCall);
	TLuaMethodInfo.Create(CustomCalendarSets, 'FirstDayOfWeek', @VCLua_Calendar_VCLuaSetFirstDayOfWeek, mfCall);
end.
