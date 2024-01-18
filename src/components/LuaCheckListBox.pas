(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaCheckListBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, CheckLst, Controls, StdCtrls;

function CreateCheckListBox(L: Plua_State): Integer; cdecl;
procedure CheckListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCheckListBox = class(TCheckListBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_CheckListBox_MeasureItem(L: Plua_State): Integer; cdecl;
var 
	lCheckListBox:TLuaCheckListBox;
	Index:Integer;
	TheHeight:Integer;
begin
	CheckArg(L, 2);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	lCheckListBox.MeasureItem(Index,TheHeight);
	lua_pushinteger(L,TheHeight);
	Result := 1;
end;

function VCLua_CheckListBox_Toggle(L: Plua_State): Integer; cdecl;
var 
	lCheckListBox:TLuaCheckListBox;
	AIndex:Integer;
begin
	CheckArg(L, 2);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	lCheckListBox.Toggle(AIndex);
	
	Result := 0;
end;

function VCLua_CheckListBox_CheckAll(L: Plua_State): Integer; cdecl;
var 
	lCheckListBox:TLuaCheckListBox;
	AState:TCheckBoxState;
	aAllowGrayed:Boolean;
	aAllowDisabled:Boolean;
begin
	CheckArg(L, -1);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	AState := TCheckBoxState(GetLuaObject(L,2));
	aAllowGrayed := luaL_optbool(L,3,True);
	aAllowDisabled := luaL_optbool(L,4,True);
	lCheckListBox.CheckAll(AState,aAllowGrayed,aAllowDisabled);
	
	Result := 0;
end;

function VCLua_CheckListBox_Exchange(L: Plua_State): Integer; cdecl;
var 
	lCheckListBox:TLuaCheckListBox;
	AIndex1:Integer;
	AIndex2:Integer;
begin
	CheckArg(L, 3);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	AIndex1 := lua_tointeger(L,2);
	AIndex2 := lua_tointeger(L,3);
	lCheckListBox.Exchange(AIndex1,AIndex2);
	
	Result := 0;
end;

function VCLua_CheckListBox_CheckListBoxGetChecked(L: Plua_State): Integer; cdecl;
var
  b: TCustomCheckListBox;
  idx: Integer;
begin
  CheckArg(L, 2);
  b := TCustomCheckListBox(GetLuaObject(L, 1));
  idx := lua_tointeger(L,2);
  lua_pushboolean(L, b.Checked[idx]);
  Result := 1;
end;

function VCLua_CheckListBox_CheckListBoxSetChecked(L: Plua_State): Integer; cdecl;
var
  b: TCustomCheckListBox;
  idx: Integer;
  c: boolean;
begin
  CheckArg(L, 3);
  b := TCustomCheckListBox(GetLuaObject(L, 1));
  idx := lua_tointeger(L,2);
  c := lua_toboolean(L,3);
  b.Checked[idx] := c;
  Result := 0;
end;

procedure CheckListBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'MeasureItem', @VCLua_CheckListBox_MeasureItem);
	LuaSetTableFunction(L, Index, 'Toggle', @VCLua_CheckListBox_Toggle);
	LuaSetTableFunction(L, Index, 'CheckAll', @VCLua_CheckListBox_CheckAll);
	LuaSetTableFunction(L, Index, 'Exchange', @VCLua_CheckListBox_Exchange);
	LuaSetTableFunction(L, Index, 'GetChecked', @VCLua_CheckListBox_CheckListBoxGetChecked);
	LuaSetTableFunction(L, Index, 'SetChecked', @VCLua_CheckListBox_CheckListBoxSetChecked);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCheckListBox(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckListBox := TLuaCheckListBox.Create(Parent);
	lCheckListBox.Parent := TWinControl(Parent);
	lCheckListBox.LuaCtl := TVCLuaControl.Create(TControl(lCheckListBox),L,@CheckListBoxToTable);
	InitControl(L,lCheckListBox,Name);
	CheckListBoxToTable(L, -1, lCheckListBox);
	Result := 1;
end;

end.
