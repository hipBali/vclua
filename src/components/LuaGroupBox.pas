(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGroupBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateGroupBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGroupBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGroupBox = class(TGroupBox)
    end;
var
    GroupBoxFuncs: TLuaVmt;
    GroupBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TGroupBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TGroupBox',v);
end;
function CreateGroupBox(L: Plua_State): Integer; cdecl;
var
	lGroupBox:TLuaGroupBox;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lGroupBox := TLuaGroupBox.Create(Parent);
	lGroupBox.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TGroupBox',lGroupBox);
	InitControl(L,lGroupBox,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'GroupBox', E.ClassName, E.Message);
	end;
end;

begin
	GroupBoxFuncs := TLuaVmt.Create;
	
	GroupBoxSets := TLuaVmt.Create;
	
end.
