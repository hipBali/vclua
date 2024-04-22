(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTrackBar;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

function CreateTrackBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTrackBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTrackBar = class(TTrackBar)
    end;
var
    CustomTrackBarFuncs: TLuaVmt;
    CustomTrackBarSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrackBar', 'SetTick', E.ClassName, E.Message);
	end;
end;

function VCLua_TrackBar_SetParams(L: Plua_State): Integer; cdecl;
var
	lTrackBar:TLuaTrackBar;
	APosition:Integer;
	AMin:Integer;
	AMax:Integer;
begin
	CheckArg(L, 4);
	lTrackBar := TLuaTrackBar(GetLuaObject(L, 1));
	luaL_check(L,2,@APosition);
	luaL_check(L,3,@AMin);
	luaL_check(L,4,@AMax);
	try
		lTrackBar.SetParams(APosition,AMin,AMax);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TrackBar', 'SetParams', E.ClassName, E.Message);
	end;
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lTrackBar := TLuaTrackBar.Create(Parent);
	lTrackBar.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomTrackBar',lTrackBar);
	InitControl(L,lTrackBar,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TrackBar', E.ClassName, E.Message);
	end;
end;

begin
	CustomTrackBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTrackBarFuncs, 'SetTick', @VCLua_TrackBar_SetTick);
	TLuaMethodInfo.Create(CustomTrackBarFuncs, 'SetParams', @VCLua_TrackBar_SetParams);
	CustomTrackBarSets := TLuaVmt.Create;
	
end.
