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

type
    TLuaPopupNotifier = class(TPopupNotifier)
        LuaCtl: TVCLuaControl;
    end;
var
    PopupNotifierFuncs: aoluaL_Reg;


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
	CreateTableForKnownType(L,'TPopupNotifier',v);
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
	lPopupNotifier.LuaCtl := TVCLuaControl.Create(lPopupNotifier as TComponent,L,nil,'TPopupNotifier');
	InitControl(L,lPopupNotifier,Name);
	CreateTableForKnownType(L,'TPopupNotifier',lPopupNotifier);
	Result := 1;
end;

begin
	SetLength(PopupNotifierFuncs, 3+1);
	PopupNotifierFuncs[0].name:='Hide';
	PopupNotifierFuncs[0].func:=@VCLua_PopupNotifier_Hide;
	PopupNotifierFuncs[1].name:='Show';
	PopupNotifierFuncs[1].func:=@VCLua_PopupNotifier_Show;
	PopupNotifierFuncs[2].name:='ShowAtPos';
	PopupNotifierFuncs[2].func:=@VCLua_PopupNotifier_ShowAtPos;
	PopupNotifierFuncs[3].name:=nil;
	PopupNotifierFuncs[3].func:=nil;

end.
