(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDateEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls, TypInfo;

function CreateDateEdit(L: Plua_State): Integer; cdecl;
function IsDateEdit(L: Plua_State): Integer; cdecl;
function AsDateEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDateEdit; pti: PTypeInfo = nil); overload; inline;
procedure DateEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaDateEdit = class(TDateEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsDateEdit(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TDateEdit);
end;
function AsDateEdit(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TDateEdit then
    lua_push(L, TDateEdit(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TDateEdit; pti: PTypeInfo);
begin
	DateEditToTable(L,-1,v);
end;
procedure DateEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomEditButton');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lDateEdit.LuaCtl := TVCLuaControl.Create(lDateEdit as TComponent,L,@DateEditToTable);
	InitControl(L,lDateEdit,Name);
	DateEditToTable(L, -1, lDateEdit);
	Result := 1;
end;

begin
end.
