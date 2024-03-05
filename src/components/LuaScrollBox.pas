(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaScrollBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, Forms, TypInfo, LuaVmt;

function CreateScrollBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TScrollBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaScrollBox = class(TScrollBox)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    ScrollBoxFuncs: TLuaVmt;
    ScrollBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TScrollBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TScrollBox',v);
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
	lScrollBox.LuaCtl := TVCLuaControl.Create(lScrollBox as TComponent,L,nil,'TScrollBox');
	InitControl(L,lScrollBox,Name);
	CreateTableForKnownType(L,'TScrollBox',lScrollBox);
	Result := 1;
end;

begin
	ScrollBoxFuncs := TLuaVmt.Create;
	
	ScrollBoxSets := TLuaVmt.Create;
	
end.
