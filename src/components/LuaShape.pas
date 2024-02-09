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

type
    TLuaShape = class(TShape)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    ShapeFuncs: aoluaL_Reg;


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
	CreateTableForKnownType(L,'TShape',v);
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
	lShape.LuaCtl := TVCLuaControl.Create(lShape as TComponent,L,nil,'TShape');
	InitControl(L,lShape,Name);
	CreateTableForKnownType(L,'TShape',lShape);
	Result := 1;
end;

begin
	SetLength(ShapeFuncs, 2+1);
	ShapeFuncs[0].name:='Paint';
	ShapeFuncs[0].func:=@VCLua_Shape_Paint;
	ShapeFuncs[1].name:='StyleChanged';
	ShapeFuncs[1].func:=@VCLua_Shape_StyleChanged;
	ShapeFuncs[2].name:=nil;
	ShapeFuncs[2].func:=nil;

end.
