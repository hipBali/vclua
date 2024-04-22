(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCalcEdit;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, EditBtn;

function CreateCalcEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCalcEdit = class(TCalcEdit)
    end;
var
    CalcEditFuncs: TLuaVmt;
    CalcEditSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_CalcEdit_RunDialog(L: Plua_State): Integer; cdecl;
var
	lCalcEdit:TLuaCalcEdit;
begin
	CheckArg(L, 1);
	lCalcEdit := TLuaCalcEdit(GetLuaObject(L, 1));
	try
		lCalcEdit.RunDialog();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CalcEdit', 'RunDialog', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCalcEdit',v);
end;
function CreateCalcEdit(L: Plua_State): Integer; cdecl;
var
	lCalcEdit:TLuaCalcEdit;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lCalcEdit := TLuaCalcEdit.Create(Parent);
	lCalcEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCalcEdit',lCalcEdit);
	InitControl(L,lCalcEdit,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'CalcEdit', E.ClassName, E.Message);
	end;
end;

begin
	CalcEditFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CalcEditFuncs, 'RunDialog', @VCLua_CalcEdit_RunDialog);
	CalcEditSets := TLuaVmt.Create;
	
end.
