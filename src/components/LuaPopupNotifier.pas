(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPopupNotifier;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, PopupNotifier, Controls;

function CreatePopupNotifier(L: Plua_State): Integer; cdecl;
procedure PopupNotifierToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPopupNotifier = class(TPopupNotifier)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_PopupNotifier_Hide(L: Plua_State): Integer; cdecl;
var 
	lPopupNotifier:TLuaPopupNotifier;
begin
	CheckArg(L, 1);
	lPopupNotifier := TLuaPopupNotifier(GetLuaObject(L, 1));
	lPopupNotifier.Hide();
	
	Result := 0;
end;

function VCLua_PopupNotifier_Show(L: Plua_State): Integer; cdecl;
var 
	lPopupNotifier:TLuaPopupNotifier;
begin
	CheckArg(L, 1);
	lPopupNotifier := TLuaPopupNotifier(GetLuaObject(L, 1));
	lPopupNotifier.Show();
	
	Result := 0;
end;

function VCLua_PopupNotifier_ShowAtPos(L: Plua_State): Integer; cdecl;
var 
	lPopupNotifier:TLuaPopupNotifier;
	x:Integer;
	y:Integer;
begin
	CheckArg(L, 3);
	lPopupNotifier := TLuaPopupNotifier(GetLuaObject(L, 1));
	x := lua_tointeger(L,2);
	y := lua_tointeger(L,3);
	lPopupNotifier.ShowAtPos(x,y);
	
	Result := 0;
end;

procedure PopupNotifierToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Hide', @VCLua_PopupNotifier_Hide);
	LuaSetTableFunction(L, Index, 'Show', @VCLua_PopupNotifier_Show);
	LuaSetTableFunction(L, Index, 'ShowAtPos', @VCLua_PopupNotifier_ShowAtPos);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreatePopupNotifier(L: Plua_State): Integer; cdecl;
var
	lPopupNotifier:TLuaPopupNotifier;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPopupNotifier := TLuaPopupNotifier.Create(Parent);
	// := TWinControl(Parent);
	lPopupNotifier.LuaCtl := TVCLuaControl.Create(TControl(lPopupNotifier),L,@PopupNotifierToTable);
	InitControl(L,lPopupNotifier,Name);
	PopupNotifierToTable(L, -1, lPopupNotifier);
	Result := 1;
end;

end.
