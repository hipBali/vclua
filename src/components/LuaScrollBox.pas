(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaScrollBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Forms;

function CreateScrollBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TScrollBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaScrollBox = class(TScrollBox)
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lScrollBox := TLuaScrollBox.Create(Parent);
	lScrollBox.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TScrollBox',lScrollBox);
	InitControl(L,lScrollBox,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'ScrollBox', E.ClassName, E.Message);
	end;
end;

begin
	ScrollBoxFuncs := TLuaVmt.Create;
	
	ScrollBoxSets := TLuaVmt.Create;
	
end.
