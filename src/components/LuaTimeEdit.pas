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


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaEvent;

function VCLua_TimeEdit_VCLuaSetOnButtonClick(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
begin
	lTimeEdit := TLuaTimeEdit(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lTimeEdit.OnButtonClick));
	lTimeEdit.OnButtonClick := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TTimeEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateTimeEdit(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lTimeEdit := TLuaTimeEdit.Create(Parent);
	lTimeEdit.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomEditButton',lTimeEdit);
	InitControl(L,lTimeEdit,Name);
	Result := 1;
end;

begin
end.
