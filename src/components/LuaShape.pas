(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaShape;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ExtCtrls;

function CreateShape(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TShape; pti: PTypeInfo = nil); overload; inline;

type
    TLuaShape = class(TShape)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    ShapeFuncs: TLuaVmt;
    ShapeSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_Shape_Paint(L: Plua_State): Integer; cdecl;
var
	lShape:TLuaShape;
begin
	CheckArg(L, 1);
	lShape := TLuaShape(GetLuaObject(L, 1));
	try
		lShape.Paint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Shape', 'Paint', E.ClassName, E.Message);
	end;
end;

function VCLua_Shape_StyleChanged(L: Plua_State): Integer; cdecl;
var
	lShape:TLuaShape;
	Sender:TObject;
begin
	CheckArg(L, 2);
	lShape := TLuaShape(GetLuaObject(L, 1));
	luaL_check(L,2,@Sender);
	try
		lShape.StyleChanged(Sender);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Shape', 'StyleChanged', E.ClassName, E.Message);
	end;
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
	ShapeFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ShapeFuncs, 'Paint', @VCLua_Shape_Paint);
	TLuaMethodInfo.Create(ShapeFuncs, 'StyleChanged', @VCLua_Shape_StyleChanged);
	ShapeSets := TLuaVmt.Create;
	
end.
