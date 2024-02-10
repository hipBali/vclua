(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaEdit;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateEdit(L: Plua_State): Integer; cdecl;
function IsEdit(L: Plua_State): Integer; cdecl;
function AsEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TEdit; pti: PTypeInfo = nil); overload; inline;

type
    TLuaEdit = class(TEdit)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomEditFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Edit_Clear(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.Clear();
	
	Result := 0;
end;

function VCLua_Edit_SelectAll(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.SelectAll();
	
	Result := 0;
end;

function VCLua_Edit_ClearSelection(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.ClearSelection();
	
	Result := 0;
end;

function VCLua_Edit_CopyToClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.CopyToClipboard();
	
	Result := 0;
end;

function VCLua_Edit_CutToClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.CutToClipboard();
	
	Result := 0;
end;

function VCLua_Edit_PasteFromClipboard(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.PasteFromClipboard();
	
	Result := 0;
end;

function VCLua_Edit_Undo(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
begin
	CheckArg(L, 1);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	lEdit.Undo();
	
	Result := 0;
end;

function VCLua_Edit_RemoveAllHandlersOfObject(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	AnObject:TObject;
begin
	CheckArg(L, 2);
	lEdit := TLuaEdit(GetLuaObject(L, 1));
	luaL_check(L,2,@AnObject);
	lEdit.RemoveAllHandlersOfObject(AnObject);
	
	Result := 0;
end;

function IsEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TEdit);
end;
function AsEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TEdit then
    lua_push(L, TEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TEdit; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomEdit',v);
end;
function CreateEdit(L: Plua_State): Integer; cdecl;
var
	lEdit:TLuaEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lEdit := TLuaEdit.Create(Parent);
	lEdit.Parent := TWinControl(Parent);
	lEdit.LuaCtl := TVCLuaControl.Create(lEdit as TComponent,L,nil,'TCustomEdit');
	InitControl(L,lEdit,Name);
	CreateTableForKnownType(L,'TCustomEdit',lEdit);
	Result := 1;
end;

begin
	SetLength(CustomEditFuncs, 8+1);
	CustomEditFuncs[0].name:='Clear';
	CustomEditFuncs[0].func:=@VCLua_Edit_Clear;
	CustomEditFuncs[1].name:='SelectAll';
	CustomEditFuncs[1].func:=@VCLua_Edit_SelectAll;
	CustomEditFuncs[2].name:='ClearSelection';
	CustomEditFuncs[2].func:=@VCLua_Edit_ClearSelection;
	CustomEditFuncs[3].name:='CopyToClipboard';
	CustomEditFuncs[3].func:=@VCLua_Edit_CopyToClipboard;
	CustomEditFuncs[4].name:='CutToClipboard';
	CustomEditFuncs[4].func:=@VCLua_Edit_CutToClipboard;
	CustomEditFuncs[5].name:='PasteFromClipboard';
	CustomEditFuncs[5].func:=@VCLua_Edit_PasteFromClipboard;
	CustomEditFuncs[6].name:='Undo';
	CustomEditFuncs[6].func:=@VCLua_Edit_Undo;
	CustomEditFuncs[7].name:='RemoveAllHandlersOfObject';
	CustomEditFuncs[7].func:=@VCLua_Edit_RemoveAllHandlersOfObject;
	CustomEditFuncs[8].name:=nil;
	CustomEditFuncs[8].func:=nil;

end.
