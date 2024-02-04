(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCalendar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Calendar, Controls, TypInfo;

function CreateCalendar(L: Plua_State): Integer; cdecl;
function IsCalendar(L: Plua_State): Integer; cdecl;
function AsCalendar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCalendar; pti: PTypeInfo = nil); overload; inline;
procedure CalendarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCalendar = class(TCalendar)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Calendar_HitTest(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	APoint:TPoint;
	ret:TCalendarPart;
begin
	CheckArg(L, 2);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	APoint := lua_toTPoint(L,2);
	ret := lCalendar.HitTest(APoint);
	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function VCLua_Calendar_GetCalendarView(L: Plua_State): Integer; cdecl;
var
	lCalendar:TLuaCalendar;
	ret:TCalendarView;
begin
	CheckArg(L, 1);
	lCalendar := TLuaCalendar(GetLuaObject(L, 1));
	ret := lCalendar.GetCalendarView();
	lua_push(L,ret,TypeInfo(ret));
	
	Result := 1;
end;

function IsCalendar(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCalendar);
end;
function AsCalendar(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCalendar then
    lua_push(L, TCalendar(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCalendar; pti: PTypeInfo);
begin
	CalendarToTable(L,-1,v);
end;
procedure CalendarToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'HitTest', @VCLua_Calendar_HitTest);
	LuaSetTableFunction(L, Index, 'GetCalendarView', @VCLua_Calendar_GetCalendarView);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lCalendar.LuaCtl := TVCLuaControl.Create(lCalendar as TComponent,L,@CalendarToTable);
	InitControl(L,lCalendar,Name);
	CalendarToTable(L, -1, lCalendar);
	Result := 1;
end;

end.
