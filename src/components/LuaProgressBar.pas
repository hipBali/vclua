(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaProgressBar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls;

function CreateProgressBar(L: Plua_State): Integer; cdecl;
procedure ProgressBarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaProgressBar = class(TProgressBar)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_ProgressBar_StepIt(L: Plua_State): Integer; cdecl;
var 
	lProgressBar:TLuaProgressBar;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	lProgressBar.StepIt();
	
	Result := 0;
end;

function VCLua_ProgressBar_StepBy(L: Plua_State): Integer; cdecl;
var 
	lProgressBar:TLuaProgressBar;
	Delta:Integer;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	Delta := lua_tointeger(L,2);
	lProgressBar.StepBy(Delta);
	
	Result := 0;
end;

procedure ProgressBarToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'StepIt', @VCLua_ProgressBar_StepIt);
	LuaSetTableFunction(L, Index, 'StepBy', @VCLua_ProgressBar_StepBy);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateProgressBar(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lProgressBar := TLuaProgressBar.Create(Parent);
	lProgressBar.Parent := TWinControl(Parent);
	lProgressBar.LuaCtl := TVCLuaControl.Create(TControl(lProgressBar),L,@ProgressBarToTable);
	InitControl(L,lProgressBar,Name);
	ProgressBarToTable(L, -1, lProgressBar);
	Result := 1;
end;

end.
