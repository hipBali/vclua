(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTrackBar;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateTrackBar(L: Plua_State): Integer; cdecl;
function IsTrackBar(L: Plua_State): Integer; cdecl;
function AsTrackBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTrackBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTrackBar = class(TTrackBar)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomTrackBarFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;

function VCLua_TrackBar_SetTick(L: Plua_State): Integer; cdecl;
var
	lTrackBar:TLuaTrackBar;
	Value:Integer;
begin
	CheckArg(L, 2);
	lTrackBar := TLuaTrackBar(GetLuaObject(L, 1));
	luaL_check(L,2,@Value);
	try
		lTrackBar.SetTick(Value);
	except
		on E: Exception do
			CallError(L, 'TrackBar', 'SetTick', E.ClassName, E.Message);
	end;

	
	Result := 0;
end;

function IsTrackBar(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TTrackBar);
end;
function AsTrackBar(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TTrackBar then
    lua_push(L, TTrackBar(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TTrackBar; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomTrackBar',v);
end;
function CreateTrackBar(L: Plua_State): Integer; cdecl;
var
	lTrackBar:TLuaTrackBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTrackBar := TLuaTrackBar.Create(Parent);
	lTrackBar.Parent := TWinControl(Parent);
	lTrackBar.LuaCtl := TVCLuaControl.Create(lTrackBar as TComponent,L,nil,'TCustomTrackBar');
	InitControl(L,lTrackBar,Name);
	CreateTableForKnownType(L,'TCustomTrackBar',lTrackBar);
	Result := 1;
end;

begin
	SetLength(CustomTrackBarFuncs, 1+1);
	CustomTrackBarFuncs[0].name:='SetTick';
	CustomTrackBarFuncs[0].func:=@VCLua_TrackBar_SetTick;
	CustomTrackBarFuncs[1].name:=nil;
	CustomTrackBarFuncs[1].func:=nil;

end.
