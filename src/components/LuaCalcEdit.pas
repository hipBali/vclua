(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCalcEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls, TypInfo;

function CreateCalcEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo = nil); overload; inline;
procedure CalcEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCalcEdit = class(TCalcEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TCalcEdit; pti: PTypeInfo);
begin
	CalcEditToTable(L,-1,v);
end;
procedure CalcEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCalcEdit(L: Plua_State): Integer; cdecl;
var
	lCalcEdit:TLuaCalcEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCalcEdit := TLuaCalcEdit.Create(Parent);
	lCalcEdit.Parent := TWinControl(Parent);
	lCalcEdit.LuaCtl := TVCLuaControl.Create(lCalcEdit as TComponent,L,@CalcEditToTable);
	InitControl(L,lCalcEdit,Name);
	CalcEditToTable(L, -1, lCalcEdit);
	Result := 1;
end;

end.
