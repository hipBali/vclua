(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTrayIcon;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateTrayIcon(L: Plua_State): Integer; cdecl;
function IsTrayIcon(L: Plua_State): Integer; cdecl;
function AsTrayIcon(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTrayIcon; pti: PTypeInfo = nil); overload; inline;
procedure TrayIconToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTrayIcon = class(TTrayIcon)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_TrayIcon_Hide(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	ret := lTrayIcon.Hide();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TrayIcon_Show(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	ret := lTrayIcon.Show();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_TrayIcon_InternalUpdate(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	lTrayIcon.InternalUpdate();
	
	Result := 0;
end;

function VCLua_TrayIcon_ShowBalloonHint(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	lTrayIcon.ShowBalloonHint();
	
	Result := 0;
end;

function VCLua_TrayIcon_GetPosition(L: Plua_State): Integer; cdecl;
var
	lTrayIcon:TLuaTrayIcon;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lTrayIcon := TLuaTrayIcon(GetLuaObject(L, 1));
	ret := lTrayIcon.GetPosition();
	lua_push(L,ret);
	
	Result := 1;
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
	TrayIconToTable(L,-1,v);
end;
procedure TrayIconToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Hide', @VCLua_TrayIcon_Hide);
	LuaSetTableFunction(L, Index, 'Show', @VCLua_TrayIcon_Show);
	LuaSetTableFunction(L, Index, 'InternalUpdate', @VCLua_TrayIcon_InternalUpdate);
	LuaSetTableFunction(L, Index, 'ShowBalloonHint', @VCLua_TrayIcon_ShowBalloonHint);
	LuaSetTableFunction(L, Index, 'GetPosition', @VCLua_TrayIcon_GetPosition);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lTrayIcon.LuaCtl := TVCLuaControl.Create(lTrayIcon as TComponent,L,@TrayIconToTable);
	InitControl(L,lTrayIcon,Name);
	TrayIconToTable(L, -1, lTrayIcon);
	Result := 1;
end;

end.
