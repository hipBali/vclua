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

type
    TLuaCalendar = class(TCalendar)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCalendarFuncs: aoluaL_Reg;


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
	SetLength(CustomCalendarFuncs, 2+1);
	CustomCalendarFuncs[0].name:='HitTest';
	CustomCalendarFuncs[0].func:=@VCLua_Calendar_HitTest;
	CustomCalendarFuncs[1].name:='GetCalendarView';
	CustomCalendarFuncs[1].func:=@VCLua_Calendar_GetCalendarView;
	CustomCalendarFuncs[2].name:=nil;
	CustomCalendarFuncs[2].func:=nil;

end.
