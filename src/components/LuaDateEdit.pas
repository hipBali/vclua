(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDateEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, EditBtn;

function CreateDateEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDateEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDateEdit = class(TDateEdit)
    end;
var
    DateEditFuncs: TLuaVmt;
    DateEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_DateEdit_GetDateFormat(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
	ret:string;
begin
	CheckArg(L, 1);
	lDateEdit := TLuaDateEdit(GetLuaObject(L, 1));
	try
		ret := lDateEdit.GetDateFormat();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DateEdit', 'GetDateFormat', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DateEdit_VCLuaSetDate(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
	val:TDateTime;
begin
	lDateEdit := TLuaDateEdit(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDateEdit.Date := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DateEdit', 'SetDate', E.ClassName, E.Message);
	end;
end;

function VCLua_DateEdit_VCLuaGetDate(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
	ret:TDateTime;
begin
	lDateEdit := TLuaDateEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDateEdit.Date;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DateEdit', 'GetDate', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DateEdit_VCLuaGetDroppedDown(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
	ret:Boolean;
begin
	lDateEdit := TLuaDateEdit(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDateEdit.DroppedDown;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DateEdit', 'GetDroppedDown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TDateEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDateEdit',v);
end;
function CreateDateEdit(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lDateEdit := TLuaDateEdit.Create(Parent);
	lDateEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TDateEdit',lDateEdit);
	InitControl(L,lDateEdit,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'DateEdit', E.ClassName, E.Message);
	end;
end;

begin
	DateEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(DateEditFuncs, 'GetDateFormat', @VCLua_DateEdit_GetDateFormat);
	TLuaMethodInfo.Create(DateEditFuncs, 'Date', @VCLua_DateEdit_VCLuaGetDate, mfCall);
	TLuaMethodInfo.Create(DateEditFuncs, 'DroppedDown', @VCLua_DateEdit_VCLuaGetDroppedDown, mfCall);
	DateEditSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(DateEditSets, 'Date', @VCLua_DateEdit_VCLuaSetDate, mfCall, TypeInfo(TDateTime));
end.
