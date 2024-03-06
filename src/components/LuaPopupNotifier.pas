(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPopupNotifier;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, PopupNotifier;

function CreatePopupNotifier(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPopupNotifier; pti: PTypeInfo = nil); overload; inline;

type
    TLuaPopupNotifier = class(TPopupNotifier)
        LuaCtl: TVCLuaControl;
    end;
var
    PopupNotifierFuncs: TLuaVmt;
    PopupNotifierSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Forms, LuaEvent, LuaFormsEvents;

function VCLua_PopupNotifier_Hide(L: Plua_State): Integer; cdecl;
var
	lPopupNotifier:TLuaPopupNotifier;
begin
	CheckArg(L, 1);
	lPopupNotifier := TLuaPopupNotifier(GetLuaObject(L, 1));
	try
		lPopupNotifier.Hide();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PopupNotifier', 'Hide', E.ClassName, E.Message);
	end;
end;

function VCLua_PopupNotifier_Show(L: Plua_State): Integer; cdecl;
var
	lPopupNotifier:TLuaPopupNotifier;
begin
	CheckArg(L, 1);
	lPopupNotifier := TLuaPopupNotifier(GetLuaObject(L, 1));
	try
		lPopupNotifier.Show();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PopupNotifier', 'Show', E.ClassName, E.Message);
	end;
end;

function VCLua_PopupNotifier_ShowAtPos(L: Plua_State): Integer; cdecl;
var
	lPopupNotifier:TLuaPopupNotifier;
	x:Integer;
	y:Integer;
begin
	CheckArg(L, 3);
	lPopupNotifier := TLuaPopupNotifier(GetLuaObject(L, 1));
	luaL_check(L,2,@x);
	luaL_check(L,3,@y);
	try
		lPopupNotifier.ShowAtPos(x,y);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'PopupNotifier', 'ShowAtPos', E.ClassName, E.Message);
	end;
end;

function VCLua_PopupNotifier_VCLuaSetOnClose(L: Plua_State): Integer; cdecl;
var
	lPopupNotifier:TLuaPopupNotifier;
begin
	CheckArg(L, 2);
	lPopupNotifier := TLuaPopupNotifier(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lPopupNotifier.OnClose));
	lPopupNotifier.OnClose := TLuaEvent.Factory<TCloseEvent,TLuaCloseEvent>(L);
	Result := 0;
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
	PopupNotifierFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(PopupNotifierFuncs, 'Hide', @VCLua_PopupNotifier_Hide);
	TLuaMethodInfo.Create(PopupNotifierFuncs, 'Show', @VCLua_PopupNotifier_Show);
	TLuaMethodInfo.Create(PopupNotifierFuncs, 'ShowAtPos', @VCLua_PopupNotifier_ShowAtPos);
	PopupNotifierSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(PopupNotifierSets, 'OnClose', @VCLua_PopupNotifier_VCLuaSetOnClose, mfCall);
end.
