(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCoolBar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls;

function CreateCoolBar(L: Plua_State): Integer; cdecl;
procedure CoolBarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCoolBar = class(TCoolBar)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_CoolBar_AutosizeBands(L: Plua_State): Integer; cdecl;
var 
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	lCoolBar.AutosizeBands();
	
	Result := 0;
end;

function VCLua_CoolBar_EndUpdate(L: Plua_State): Integer; cdecl;
var 
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	lCoolBar.EndUpdate();
	
	Result := 0;
end;

function VCLua_CoolBar_Invalidate(L: Plua_State): Integer; cdecl;
var 
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	lCoolBar.Invalidate();
	
	Result := 0;
end;

function VCLua_CoolBar_InsertControl(L: Plua_State): Integer; cdecl;
var 
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
	Index:integer;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	Index := lua_tointeger(L,3);
	lCoolBar.InsertControl(AControl,Index);
	
	Result := 0;
end;

function VCLua_CoolBar_MouseToBandPos(L: Plua_State): Integer; cdecl;
var 
	lCoolBar:TLuaCoolBar;
	X:Integer;
	Y:Integer;
	ABand:Integer;
	AGrabber:Boolean;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	lCoolBar.MouseToBandPos(X,Y,ABand,AGrabber);
	lua_pushinteger(L,ABand);
	lua_pushboolean(L,AGrabber);
	Result := 2;
end;

function VCLua_CoolBar_RemoveControl(L: Plua_State): Integer; cdecl;
var 
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	lCoolBar.RemoveControl(AControl);
	
	Result := 0;
end;

procedure CoolBarToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AutosizeBands', @VCLua_CoolBar_AutosizeBands);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_CoolBar_EndUpdate);
	LuaSetTableFunction(L, Index, 'Invalidate', @VCLua_CoolBar_Invalidate);
	LuaSetTableFunction(L, Index, 'InsertControl', @VCLua_CoolBar_InsertControl);
	LuaSetTableFunction(L, Index, 'MouseToBandPos', @VCLua_CoolBar_MouseToBandPos);
	LuaSetTableFunction(L, Index, 'RemoveControl', @VCLua_CoolBar_RemoveControl);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCoolBar(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCoolBar := TLuaCoolBar.Create(Parent);
	lCoolBar.Parent := TWinControl(Parent);
	lCoolBar.LuaCtl := TVCLuaControl.Create(TControl(lCoolBar),L,@CoolBarToTable);
	InitControl(L,lCoolBar,Name);
	CoolBarToTable(L, -1, lCoolBar);
	Result := 1;
end;

end.
