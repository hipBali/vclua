(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCoolBar;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

function CreateCoolBar(L: Plua_State): Integer; cdecl;
function IsCoolBar(L: Plua_State): Integer; cdecl;
function AsCoolBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCoolBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCoolBar = class(TCoolBar)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomCoolBarFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_CoolBar_AutosizeBands(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		lCoolBar.AutosizeBands();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'AutosizeBands', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		lCoolBar.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_Invalidate(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		lCoolBar.Invalidate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Invalidate', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_InsertControl(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
	Index:integer;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	luaL_check(L,3,@Index);
	try
		lCoolBar.InsertControl(AControl,Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'InsertControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_MouseToBandPos(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	X:Integer;
	Y:Integer;
	ABand:Integer;
	AGrabber:Boolean;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		lCoolBar.MouseToBandPos(X,Y,ABand,AGrabber);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'MouseToBandPos', E.ClassName, E.Message);
	end;
	lua_push(L,ABand);
	lua_push(L,AGrabber);
end;

function VCLua_CoolBar_RemoveControl(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lCoolBar.RemoveControl(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'RemoveControl', E.ClassName, E.Message);
	end;
end;

function IsCoolBar(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCoolBar);
end;
function AsCoolBar(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCoolBar then
    lua_push(L, TCoolBar(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCoolBar; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCoolBar',v);
end;
function CreateCoolBar(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCoolBar := TLuaCoolBar.Create(Parent);
	lCoolBar.Parent := TWinControl(Parent);
	lCoolBar.LuaCtl := TVCLuaControl.Create(lCoolBar as TComponent,L,nil,'TCustomCoolBar');
	InitControl(L,lCoolBar,Name);
	CreateTableForKnownType(L,'TCustomCoolBar',lCoolBar);
	Result := 1;
end;

begin
	CustomCoolBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'AutosizeBands', @VCLua_CoolBar_AutosizeBands);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'EndUpdate', @VCLua_CoolBar_EndUpdate);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'Invalidate', @VCLua_CoolBar_Invalidate);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'InsertControl', @VCLua_CoolBar_InsertControl);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'MouseToBandPos', @VCLua_CoolBar_MouseToBandPos);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'RemoveControl', @VCLua_CoolBar_RemoveControl);
end.
