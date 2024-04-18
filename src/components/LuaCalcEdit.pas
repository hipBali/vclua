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


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaEvent;

function VCLua_CalcEdit_VCLuaSetOnButtonClick(L: Plua_State): Integer; cdecl;
var
	lCalcEdit:TLuaCalcEdit;
begin
	lCalcEdit := TLuaCalcEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCalcEdit.OnButtonClick));
	lCalcEdit.OnButtonClick := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
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
	CreateTableForKnownType(L,'TCustomEditButton',lCalcEdit);
	InitControl(L,lCalcEdit,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'CalcEdit', E.ClassName, E.Message);
	end;
end;

begin
end.
