(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaScrollBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Forms, Controls, TypInfo;

function CreateScrollBox(L: Plua_State): Integer; cdecl;
function IsScrollBox(L: Plua_State): Integer; cdecl;
function AsScrollBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TScrollBox; pti: PTypeInfo = nil); overload; inline;
procedure ScrollBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaScrollBox = class(TScrollBox)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsScrollBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TScrollBox);
end;
function AsScrollBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TScrollBox then
    lua_push(L, TScrollBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TScrollBox; pti: PTypeInfo);
begin
	ScrollBoxToTable(L,-1,v);
end;
procedure ScrollBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateScrollBox(L: Plua_State): Integer; cdecl;
var
	lScrollBox:TLuaScrollBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lScrollBox := TLuaScrollBox.Create(Parent);
	lScrollBox.Parent := TWinControl(Parent);
	lScrollBox.LuaCtl := TVCLuaControl.Create(lScrollBox as TComponent,L,@ScrollBoxToTable);
	InitControl(L,lScrollBox,Name);
	ScrollBoxToTable(L, -1, lScrollBox);
	Result := 1;
end;

end.
