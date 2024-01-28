(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBoundLabel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateBoundLabel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBoundLabel; pti: PTypeInfo = nil); overload; inline;
procedure BoundLabelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBoundLabel = class(TBoundLabel)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TBoundLabel; pti: PTypeInfo);
begin
	BoundLabelToTable(L,-1,v);
end;
procedure BoundLabelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lBoundLabel.LuaCtl := TVCLuaControl.Create(lBoundLabel as TComponent,L,@BoundLabelToTable);
	InitControl(L,lBoundLabel,Name);
	BoundLabelToTable(L, -1, lBoundLabel);
	Result := 1;
end;

end.
