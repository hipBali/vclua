(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDateTimePicker;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, DateTimePicker, Controls, TypInfo;

function CreateDateTimePicker(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDateTimePicker; pti: PTypeInfo = nil); overload; inline;
procedure DateTimePickerToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDateTimePicker = class(TDateTimePicker)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TDateTimePicker; pti: PTypeInfo);
begin
	DateTimePickerToTable(L,-1,v);
end;
procedure DateTimePickerToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lDateTimePicker.LuaCtl := TVCLuaControl.Create(lDateTimePicker as TComponent,L,@DateTimePickerToTable);
	InitControl(L,lDateTimePicker,Name);
	DateTimePickerToTable(L, -1, lDateTimePicker);
	Result := 1;
end;

end.
