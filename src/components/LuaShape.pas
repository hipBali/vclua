(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaShape;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateShape(L: Plua_State): Integer; cdecl;
function IsShape(L: Plua_State): Integer; cdecl;
function AsShape(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TShape; pti: PTypeInfo = nil); overload; inline;
procedure ShapeToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaShape = class(TShape)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Shape_Paint(L: Plua_State): Integer; cdecl;
var 
	lShape:TLuaShape;
begin
	CheckArg(L, 1);
	lShape := TLuaShape(GetLuaObject(L, 1));
	lShape.Paint();
	
	Result := 0;
end;

function VCLua_Shape_StyleChanged(L: Plua_State): Integer; cdecl;
var 
	lShape:TLuaShape;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lShape := TLuaShape(GetLuaObject(L, 1));
	Sender := TObject(GetLuaObject(L,2));
	lShape.StyleChanged(Sender);
	
	Result := 0;
end;

function IsShape(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TShape);
end;
function AsShape(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TShape then
    lua_push(L, TShape(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TShape; pti: PTypeInfo);
begin
	ShapeToTable(L,-1,v);
end;
procedure ShapeToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Paint', @VCLua_Shape_Paint);
	LuaSetTableFunction(L, Index, 'StyleChanged', @VCLua_Shape_StyleChanged);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateShape(L: Plua_State): Integer; cdecl;
var
	lShape:TLuaShape;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lShape := TLuaShape.Create(Parent);
	lShape.Parent := TWinControl(Parent);
	lShape.LuaCtl := TVCLuaControl.Create(lShape as TComponent,L,@ShapeToTable);
	InitControl(L,lShape,Name);
	ShapeToTable(L, -1, lShape);
	Result := 1;
end;

end.
