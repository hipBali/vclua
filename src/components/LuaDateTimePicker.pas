(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDateTimePicker;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, DateTimePicker;

function CreateDateTimePicker(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDateTimePicker; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDateTimePicker = class(TDateTimePicker)
    end;
var
    CustomDateTimePickerFuncs: TLuaVmt;
    CustomDateTimePickerSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaEvent;

function VCLua_DateTimePicker_VCLuaSetOnChange(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
begin
	lDateTimePicker := TLuaDateTimePicker(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lDateTimePicker.OnChange));
	lDateTimePicker.OnChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_DateTimePicker_VCLuaSetOnCheckBoxChange(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
begin
	lDateTimePicker := TLuaDateTimePicker(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lDateTimePicker.OnCheckBoxChange));
	lDateTimePicker.OnCheckBoxChange := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_DateTimePicker_VCLuaSetOnDropDown(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
begin
	lDateTimePicker := TLuaDateTimePicker(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lDateTimePicker.OnDropDown));
	lDateTimePicker.OnDropDown := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_DateTimePicker_VCLuaSetOnCloseUp(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
begin
	lDateTimePicker := TLuaDateTimePicker(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lDateTimePicker.OnCloseUp));
	lDateTimePicker.OnCloseUp := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_DateTimePicker_DateIsNull(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lDateTimePicker := TLuaDateTimePicker(GetLuaObject(L, 1));
	try
		ret := lDateTimePicker.DateIsNull();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DateTimePicker', 'DateIsNull', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DateTimePicker_SelectDate(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
begin
	CheckArg(L, 1);
	lDateTimePicker := TLuaDateTimePicker(GetLuaObject(L, 1));
	try
		lDateTimePicker.SelectDate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DateTimePicker', 'SelectDate', E.ClassName, E.Message);
	end;
end;

function VCLua_DateTimePicker_SelectTime(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
begin
	CheckArg(L, 1);
	lDateTimePicker := TLuaDateTimePicker(GetLuaObject(L, 1));
	try
		lDateTimePicker.SelectTime();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DateTimePicker', 'SelectTime', E.ClassName, E.Message);
	end;
end;

function VCLua_DateTimePicker_SendExternalKey(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
	aKey:Char;
begin
	CheckArg(L, 2);
	lDateTimePicker := TLuaDateTimePicker(GetLuaObject(L, 1));
	luaL_check(L,2,@aKey);
	try
		lDateTimePicker.SendExternalKey(aKey);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DateTimePicker', 'SendExternalKey', E.ClassName, E.Message);
	end;
end;

function VCLua_DateTimePicker_SendExternalKeyCode(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
	Key:Word;
begin
	CheckArg(L, 2);
	lDateTimePicker := TLuaDateTimePicker(GetLuaObject(L, 1));
	luaL_check(L,2,@Key);
	try
		lDateTimePicker.SendExternalKeyCode(Key);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DateTimePicker', 'SendExternalKeyCode', E.ClassName, E.Message);
	end;
end;

function VCLua_DateTimePicker_Paint(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
begin
	CheckArg(L, 1);
	lDateTimePicker := TLuaDateTimePicker(GetLuaObject(L, 1));
	try
		lDateTimePicker.Paint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DateTimePicker', 'Paint', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TDateTimePicker; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomDateTimePicker',v);
end;
function CreateDateTimePicker(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lDateTimePicker := TLuaDateTimePicker.Create(Parent);
	lDateTimePicker.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomDateTimePicker',lDateTimePicker);
	InitControl(L,lDateTimePicker,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'DateTimePicker', E.ClassName, E.Message);
	end;
end;

begin
	CustomDateTimePickerFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomDateTimePickerFuncs, 'DateIsNull', @VCLua_DateTimePicker_DateIsNull);
	TLuaMethodInfo.Create(CustomDateTimePickerFuncs, 'SelectDate', @VCLua_DateTimePicker_SelectDate);
	TLuaMethodInfo.Create(CustomDateTimePickerFuncs, 'SelectTime', @VCLua_DateTimePicker_SelectTime);
	TLuaMethodInfo.Create(CustomDateTimePickerFuncs, 'SendExternalKey', @VCLua_DateTimePicker_SendExternalKey);
	TLuaMethodInfo.Create(CustomDateTimePickerFuncs, 'SendExternalKeyCode', @VCLua_DateTimePicker_SendExternalKeyCode);
	TLuaMethodInfo.Create(CustomDateTimePickerFuncs, 'Paint', @VCLua_DateTimePicker_Paint);
	CustomDateTimePickerSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomDateTimePickerSets, 'OnChange', @VCLua_DateTimePicker_VCLuaSetOnChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomDateTimePickerSets, 'OnCheckBoxChange', @VCLua_DateTimePicker_VCLuaSetOnCheckBoxChange, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomDateTimePickerSets, 'OnDropDown', @VCLua_DateTimePicker_VCLuaSetOnDropDown, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomDateTimePickerSets, 'OnCloseUp', @VCLua_DateTimePicker_VCLuaSetOnCloseUp, mfCall, TypeInfo(TNotifyEvent));
end.
