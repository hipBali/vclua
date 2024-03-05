(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTrackBar;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

function CreateTrackBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTrackBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTrackBar = class(TTrackBar)
        LuaCtl: TVCLuaControl;
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
	CustomTrackBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomTrackBarFuncs, 'SetTick', @VCLua_TrackBar_SetTick);
	CustomTrackBarSets := TLuaVmt.Create;
	
end.
