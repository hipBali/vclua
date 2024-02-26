(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaProgressBar;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

function CreateProgressBar(L: Plua_State): Integer; cdecl;
function IsProgressBar(L: Plua_State): Integer; cdecl;
function AsProgressBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TProgressBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaProgressBar = class(TProgressBar)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomProgressBarFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_ProgressBar_StepIt(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		lProgressBar.StepIt();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'StepIt', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_StepBy(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	Delta:Integer;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@Delta);
	try
		lProgressBar.StepBy(Delta);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'StepBy', E.ClassName, E.Message);
	end;
end;

function IsProgressBar(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TProgressBar);
end;
function AsProgressBar(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TProgressBar then
    lua_push(L, TProgressBar(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TProgressBar; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomProgressBar',v);
end;
function CreateProgressBar(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lProgressBar := TLuaProgressBar.Create(Parent);
	lProgressBar.Parent := TWinControl(Parent);
	lProgressBar.LuaCtl := TVCLuaControl.Create(lProgressBar as TComponent,L,nil,'TCustomProgressBar');
	InitControl(L,lProgressBar,Name);
	CreateTableForKnownType(L,'TCustomProgressBar',lProgressBar);
	Result := 1;
end;

begin
	CustomProgressBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'StepIt', @VCLua_ProgressBar_StepIt);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'StepBy', @VCLua_ProgressBar_StepBy);
end.
