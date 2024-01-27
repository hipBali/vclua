(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckGroup;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreateCheckGroup(L: Plua_State): Integer; cdecl;
procedure CheckGroupToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCheckGroup = class(TCheckGroup)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_CheckGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var 
	lCheckGroup:TLuaCheckGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	AllLevels := lua_toboolean(L,2);
	lCheckGroup.FlipChildren(AllLevels);
	
	Result := 0;
end;

function VCLua_CheckGroup_Rows(L: Plua_State): Integer; cdecl;
var 
	lCheckGroup:TLuaCheckGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	ret := lCheckGroup.Rows();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

procedure CheckGroupToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'FlipChildren', @VCLua_CheckGroup_FlipChildren);
	LuaSetTableFunction(L, Index, 'Rows', @VCLua_CheckGroup_Rows);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCheckGroup(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckGroup := TLuaCheckGroup.Create(Parent);
	lCheckGroup.Parent := TWinControl(Parent);
	lCheckGroup.LuaCtl := TVCLuaControl.Create(lCheckGroup as TComponent,L,@CheckGroupToTable);
	InitControl(L,lCheckGroup,Name);
	CheckGroupToTable(L, -1, lCheckGroup);
	Result := 1;
end;

end.
