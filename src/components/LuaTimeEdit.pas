(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaTimeEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls, TypInfo;

function CreateTimeEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TTimeEdit; pti: PTypeInfo = nil); overload; inline;
procedure TimeEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaTimeEdit = class(TTimeEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TTimeEdit; pti: PTypeInfo);
begin
	TimeEditToTable(L,-1,v);
end;
procedure TimeEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lTimeEdit.LuaCtl := TVCLuaControl.Create(lTimeEdit as TComponent,L,@TimeEditToTable);
	InitControl(L,lTimeEdit,Name);
	TimeEditToTable(L, -1, lTimeEdit);
	Result := 1;
end;

end.
