(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTrayIcon;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateTrayIcon(L: Plua_State): Integer; cdecl;
function IsTrayIcon(L: Plua_State): Integer; cdecl;
function AsTrayIcon(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTrayIcon; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTrayIcon = class(TTrayIcon)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomTrayIconFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_TrayIcon_Hide(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Hide();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Hide', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_Show(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.Show();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'Show', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TrayIcon_InternalUpdate(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		lTrayIcon.InternalUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'InternalUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_ShowBalloonHint(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		lTrayIcon.ShowBalloonHint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'ShowBalloonHint', E.ClassName, E.Message);
	end;
end;

function VCLua_TrayIcon_GetPosition(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	try
		ret := lTrayIcon.GetPosition();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TrayIcon', 'GetPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function IsTrayIcon(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTrayIcon);
end;
function AsTrayIcon(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTrayIcon then
    lua_push(L, TTrayIcon(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTrayIcon; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomTrayIcon',v);
end;
function CreateTrayIcon(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTrayIcon := TLuaTrayIcon.Create(Parent);
	// := TWinControl(Parent);
	lTrayIcon.LuaCtl := TVCLuaControl.Create(lTrayIcon as TComponent,L,nil,'TCustomTrayIcon');
	InitControl(L,lTrayIcon,Name);
	CreateTableForKnownType(L,'TCustomTrayIcon',lTrayIcon);
	Result := 1;
end;

begin
	CustomTrayIconFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Hide', @VCLua_TrayIcon_Hide);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'Show', @VCLua_TrayIcon_Show);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'InternalUpdate', @VCLua_TrayIcon_InternalUpdate);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'ShowBalloonHint', @VCLua_TrayIcon_ShowBalloonHint);
	TLuaMethodInfo.Create(CustomTrayIconFuncs, 'GetPosition', @VCLua_TrayIcon_GetPosition);
end.
