(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDateTimePicker;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, DateTimePicker, TypInfo, LuaVmt;

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
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


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
	DateTimePickerFuncs := TLuaVmt.Create;
	
	DateTimePickerSets := TLuaVmt.Create;
	
end.
