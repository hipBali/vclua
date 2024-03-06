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
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaEvent;

function VCLua_DateEdit_VCLuaSetOnButtonClick(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
begin
	CheckArg(L, 2);
	lDateEdit := TLuaDateEdit(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lDateEdit.OnButtonClick));
	lDateEdit.OnButtonClick := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TDateEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEditButton',v);
end;
function CreateDateEdit(L: Plua_State): Integer; cdecl;
var
	lDateEdit:TLuaDateEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lDateEdit := TLuaDateEdit.Create(Parent);
	lDateEdit.Parent := TWinControl(Parent);
	lDateEdit.LuaCtl := TVCLuaControl.Create(lDateEdit as TComponent,L,nil,'TCustomEditButton');
	InitControl(L,lDateEdit,Name);
	CreateTableForKnownType(L,'TCustomEditButton',lDateEdit);
	Result := 1;
end;

begin
end.
