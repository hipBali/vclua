(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTrackBar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateTrackBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTrackBar; pti: PTypeInfo = nil); overload; inline;
procedure TrackBarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTrackBar = class(TTrackBar)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_TrackBar_SetTick(L: Plua_State): Integer; cdecl;
var 
	lTrackBar:TLuaTrackBar;
	Value:Integer;
begin
	CheckArg(L, 2);
	lTrackBar := TLuaTrackBar(GetLuaObject(L, 1));
	Value := lua_tointeger(L,2);
	lTrackBar.SetTick(Value);
	
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TTrackBar; pti: PTypeInfo);
begin
	TrackBarToTable(L,-1,v);
end;
procedure TrackBarToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'SetTick', @VCLua_TrackBar_SetTick);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lTrackBar.LuaCtl := TVCLuaControl.Create(lTrackBar as TComponent,L,@TrackBarToTable);
	InitControl(L,lTrackBar,Name);
	TrackBarToTable(L, -1, lTrackBar);
	Result := 1;
end;

end.
