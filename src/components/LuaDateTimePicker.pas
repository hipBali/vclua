(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDateTimePicker;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, DateTimePicker, Controls, TypInfo;

function CreateDateTimePicker(L: Plua_State): Integer; cdecl;
function IsDateTimePicker(L: Plua_State): Integer; cdecl;
function AsDateTimePicker(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDateTimePicker; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDateTimePicker = class(TDateTimePicker)
        LuaCtl: TVCLuaControl;
    end;
var
    DateTimePickerFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsDateTimePicker(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TDateTimePicker);
end;
function AsDateTimePicker(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TDateTimePicker then
    lua_push(L, TDateTimePicker(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TDateTimePicker; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDateTimePicker',v);
end;
function CreateDateTimePicker(L: Plua_State): Integer; cdecl;
var
	lDateTimePicker:TLuaDateTimePicker;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lDateTimePicker := TLuaDateTimePicker.Create(Parent);
	lDateTimePicker.Parent := TWinControl(Parent);
	lDateTimePicker.LuaCtl := TVCLuaControl.Create(lDateTimePicker as TComponent,L,nil,'TDateTimePicker');
	InitControl(L,lDateTimePicker,Name);
	CreateTableForKnownType(L,'TDateTimePicker',lDateTimePicker);
	Result := 1;
end;

begin
	SetLength(DateTimePickerFuncs, 0+1);
	
	DateTimePickerFuncs[0].name:=nil;
	DateTimePickerFuncs[0].func:=nil;

end.
