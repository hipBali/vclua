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
        LuaCtl: TVCLuaControl;
    end;
var
    DateTimePickerFuncs: TLuaVmt;
    DateTimePickerSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


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
	CreateTableForKnownType(L,'TDateTimePicker',lDateTimePicker);
	InitControl(L,lDateTimePicker,Name);
	Result := 1;
end;

begin
	DateTimePickerFuncs := TLuaVmt.Create;
	
	DateTimePickerSets := TLuaVmt.Create;
	
end.
