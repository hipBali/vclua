(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaPaintBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreatePaintBox(L: Plua_State): Integer; cdecl;
function IsPaintBox(L: Plua_State): Integer; cdecl;
function AsPaintBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TPaintBox; pti: PTypeInfo = nil); overload; inline;
procedure PaintBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPaintBox = class(TPaintBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsPaintBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TPaintBox);
end;
function AsPaintBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TPaintBox then
    lua_push(L, TPaintBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TPaintBox; pti: PTypeInfo);
begin
	PaintBoxToTable(L,-1,v);
end;
procedure PaintBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreatePaintBox(L: Plua_State): Integer; cdecl;
var
	lPaintBox:TLuaPaintBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lPaintBox := TLuaPaintBox.Create(Parent);
	lPaintBox.Parent := TWinControl(Parent);
	lPaintBox.LuaCtl := TVCLuaControl.Create(lPaintBox as TComponent,L,@PaintBoxToTable);
	InitControl(L,lPaintBox,Name);
	PaintBoxToTable(L, -1, lPaintBox);
	Result := 1;
end;

end.
