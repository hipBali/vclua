(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaLabeledEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateLabeledEdit(L: Plua_State): Integer; cdecl;
function IsLabeledEdit(L: Plua_State): Integer; cdecl;
function AsLabeledEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TLabeledEdit; pti: PTypeInfo = nil); overload; inline;
procedure LabeledEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaLabeledEdit = class(TLabeledEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsLabeledEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TLabeledEdit);
end;
function AsLabeledEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TLabeledEdit then
    lua_push(L, TLabeledEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TLabeledEdit; pti: PTypeInfo);
begin
	LabeledEditToTable(L,-1,v);
end;
procedure LabeledEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateLabeledEdit(L: Plua_State): Integer; cdecl;
var
	lLabeledEdit:TLuaLabeledEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lLabeledEdit := TLuaLabeledEdit.Create(Parent);
	lLabeledEdit.Parent := TWinControl(Parent);
	lLabeledEdit.LuaCtl := TVCLuaControl.Create(lLabeledEdit as TComponent,L,@LabeledEditToTable);
	InitControl(L,lLabeledEdit,Name);
	LabeledEditToTable(L, -1, lLabeledEdit);
	Result := 1;
end;

end.
