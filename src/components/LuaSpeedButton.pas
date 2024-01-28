(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSpeedButton;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Buttons, Controls, TypInfo;

function CreateSpeedButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo = nil); overload; inline;
procedure SpeedButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSpeedButton = class(TSpeedButton)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TSpeedButton; pti: PTypeInfo);
begin
	SpeedButtonToTable(L,-1,v);
end;
procedure SpeedButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateSpeedButton(L: Plua_State): Integer; cdecl;
var
	lSpeedButton:TLuaSpeedButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lSpeedButton := TLuaSpeedButton.Create(Parent);
	lSpeedButton.Parent := TWinControl(Parent);
	lSpeedButton.LuaCtl := TVCLuaControl.Create(lSpeedButton as TComponent,L,@SpeedButtonToTable);
	InitControl(L,lSpeedButton,Name);
	SpeedButtonToTable(L, -1, lSpeedButton);
	Result := 1;
end;

end.
