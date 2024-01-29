(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPopupNotifier;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, PopupNotifier, Controls, TypInfo;

function CreatePopupNotifier(L: Plua_State): Integer; cdecl;
function IsPopupNotifier(L: Plua_State): Integer; cdecl;
function AsPopupNotifier(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPopupNotifier; pti: PTypeInfo = nil); overload; inline;
procedure PopupNotifierToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPopupNotifier = class(TPopupNotifier)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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

function IsPopupNotifier(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TPopupNotifier);
end;
function AsPopupNotifier(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TPopupNotifier then
    lua_push(L, TPopupNotifier(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TPopupNotifier; pti: PTypeInfo);
begin
	PopupNotifierToTable(L,-1,v);
end;
procedure PopupNotifierToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
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
	lPopupNotifier.LuaCtl := TVCLuaControl.Create(lPopupNotifier as TComponent,L,@PopupNotifierToTable);
	InitControl(L,lPopupNotifier,Name);
	PopupNotifierToTable(L, -1, lPopupNotifier);
	Result := 1;
end;

end.
