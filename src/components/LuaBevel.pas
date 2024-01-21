(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBevel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreateBevel(L: Plua_State): Integer; cdecl;
procedure BevelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBevel = class(TBevel)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Bevel_Assign(L: Plua_State): Integer; cdecl;
var 
	lBevel:TLuaBevel;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lBevel := TLuaBevel(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lBevel.Assign(Source);
	
	Result := 0;
end;

procedure BevelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Bevel_Assign);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateBevel(L: Plua_State): Integer; cdecl;
var
	lBevel:TLuaBevel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBevel := TLuaBevel.Create(Parent);
	lBevel.Parent := TWinControl(Parent);
	lBevel.LuaCtl := TVCLuaControl.Create(TControl(lBevel),L,@BevelToTable);
	InitControl(L,lBevel,Name);
	BevelToTable(L, -1, lBevel);
	Result := 1;
end;

end.
