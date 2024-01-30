(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRadioGroup;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreateRadioGroup(L: Plua_State): Integer; cdecl;
procedure RadioGroupToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaRadioGroup = class(TRadioGroup)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_RadioGroup_CanModify(L: Plua_State): Integer; cdecl;
var 
	lRadioGroup:TLuaRadioGroup;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	ret := lRadioGroup.CanModify();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_RadioGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var 
	lRadioGroup:TLuaRadioGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	AllLevels := lua_toboolean(L,2);
	lRadioGroup.FlipChildren(AllLevels);
	
	Result := 0;
end;

function VCLua_RadioGroup_Rows(L: Plua_State): Integer; cdecl;
var 
	lRadioGroup:TLuaRadioGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	ret := lRadioGroup.Rows();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

procedure RadioGroupToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'CanModify', @VCLua_RadioGroup_CanModify);
	LuaSetTableFunction(L, Index, 'FlipChildren', @VCLua_RadioGroup_FlipChildren);
	LuaSetTableFunction(L, Index, 'Rows', @VCLua_RadioGroup_Rows);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateRadioGroup(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lRadioGroup := TLuaRadioGroup.Create(Parent);
	lRadioGroup.Parent := TWinControl(Parent);
	lRadioGroup.LuaCtl := TVCLuaControl.Create(TControl(lRadioGroup),L,@RadioGroupToTable);
	InitControl(L,lRadioGroup,Name);
	RadioGroupToTable(L, -1, lRadioGroup);
	Result := 1;
end;

end.
