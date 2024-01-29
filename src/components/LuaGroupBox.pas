(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGroupBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateGroupBox(L: Plua_State): Integer; cdecl;
function IsGroupBox(L: Plua_State): Integer; cdecl;
function AsGroupBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGroupBox; pti: PTypeInfo = nil); overload; inline;
procedure GroupBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaGroupBox = class(TGroupBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsGroupBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TGroupBox);
end;
function AsGroupBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TGroupBox then
    lua_push(L, TGroupBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TGroupBox; pti: PTypeInfo);
begin
	GroupBoxToTable(L,-1,v);
end;
procedure GroupBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateGroupBox(L: Plua_State): Integer; cdecl;
var
	lGroupBox:TLuaGroupBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lGroupBox := TLuaGroupBox.Create(Parent);
	lGroupBox.Parent := TWinControl(Parent);
	lGroupBox.LuaCtl := TVCLuaControl.Create(lGroupBox as TComponent,L,@GroupBoxToTable);
	InitControl(L,lGroupBox,Name);
	GroupBoxToTable(L, -1, lGroupBox);
	Result := 1;
end;

end.
