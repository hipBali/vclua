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
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaEvent;

function VCLua_TimeEdit_VCLuaSetOnButtonClick(L: Plua_State): Integer; cdecl;
var
	lTimeEdit:TLuaTimeEdit;
begin
	CheckArg(L, 2);
	lTimeEdit := TLuaTimeEdit(GetLuaObject(L, 1));
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
	lTimeEdit.LuaCtl := TVCLuaControl.Create(lTimeEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lTimeEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lTimeEdit);
	Result := 1;
end;

begin
end.
