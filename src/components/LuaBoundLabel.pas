(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBoundLabel;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ExtCtrls;

function CreateBoundLabel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBoundLabel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBoundLabel = class(TBoundLabel)
        LuaCtl: TVCLuaControl;
    end;
var
    BoundLabelFuncs: TLuaVmt;
    BoundLabelSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TBoundLabel; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBoundLabel',v);
end;
function CreateBoundLabel(L: Plua_State): Integer; cdecl;
var
	lBoundLabel:TLuaBoundLabel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBoundLabel := TLuaBoundLabel.Create(Parent);
	lBoundLabel.Parent := TWinControl(Parent);
	lBoundLabel.LuaCtl := TVCLuaControl.Create(lBoundLabel as TComponent,L,nil,'TBoundLabel');
	CreateTableForKnownType(L,'TBoundLabel',lBoundLabel);
	InitControl(L,lBoundLabel,Name);
	Result := 1;
end;

begin
	BoundLabelFuncs := TLuaVmt.Create;
	
	BoundLabelSets := TLuaVmt.Create;
	
end.
