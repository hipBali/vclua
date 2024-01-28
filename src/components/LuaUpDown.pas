(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaUpDown;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateUpDown(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TUpDown; pti: PTypeInfo = nil); overload; inline;
procedure UpDownToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaUpDown = class(TUpDown)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TUpDown; pti: PTypeInfo);
begin
	UpDownToTable(L,-1,v);
end;
procedure UpDownToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateUpDown(L: Plua_State): Integer; cdecl;
var
	lUpDown:TLuaUpDown;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lUpDown := TLuaUpDown.Create(Parent);
	lUpDown.Parent := TWinControl(Parent);
	lUpDown.LuaCtl := TVCLuaControl.Create(lUpDown as TComponent,L,@UpDownToTable);
	InitControl(L,lUpDown,Name);
	UpDownToTable(L, -1, lUpDown);
	Result := 1;
end;

end.
