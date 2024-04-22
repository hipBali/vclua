(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTimeEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, EditBtn;

function CreateTimeEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTimeEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaTimeEdit = class(TTimeEdit)
    end;
var
    TimeEditFuncs: TLuaVmt;
    TimeEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_TimeEdit_VCLuaSetTime(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
	val:TDateTime;
begin
	lTimeEdit := TLuaTimeEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lTimeEdit.Time := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'TimeEdit', 'SetTime', E.ClassName, E.Message);
	end;
end;

function VCLua_TimeEdit_VCLuaGetTime(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
	ret:TDateTime;
begin
	lTimeEdit := TLuaTimeEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTimeEdit.Time;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TimeEdit', 'GetTime', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_TimeEdit_VCLuaGetDroppedDown(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
	ret:Boolean;
begin
	lTimeEdit := TLuaTimeEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lTimeEdit.DroppedDown;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'TimeEdit', 'GetDroppedDown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TTimeEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TTimeEdit',v);
end;
function CreateTimeEdit(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lTimeEdit := TLuaTimeEdit.Create(Parent);
	lTimeEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TTimeEdit',lTimeEdit);
	InitControl(L,lTimeEdit,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'TimeEdit', E.ClassName, E.Message);
	end;
end;

begin
	TimeEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(TimeEditFuncs, 'Time', @VCLua_TimeEdit_VCLuaGetTime, mfCall);
	TLuaMethodInfo.Create(TimeEditFuncs, 'DroppedDown', @VCLua_TimeEdit_VCLuaGetDroppedDown, mfCall);
	TimeEditSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(TimeEditSets, 'Time', @VCLua_TimeEdit_VCLuaSetTime, mfCall, TypeInfo(TDateTime));
end.
