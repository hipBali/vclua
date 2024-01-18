(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaDateTimePicker;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, DateTimePicker, Controls;

function CreateDateTimePicker(L: Plua_State): Integer; cdecl;
procedure DateTimePickerToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDateTimePicker = class(TDateTimePicker)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 


procedure DateTimePickerToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
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
	lDateTimePicker.LuaCtl := TVCLuaControl.Create(TControl(lDateTimePicker),L,@DateTimePickerToTable);
	InitControl(L,lDateTimePicker,Name);
	DateTimePickerToTable(L, -1, lDateTimePicker);
	Result := 1;
end;

end.
