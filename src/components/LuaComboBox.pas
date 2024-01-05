(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaComboBox;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateComboBox(L: Plua_State): Integer; cdecl;
procedure ComboBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaComboBox = class(TComboBox)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_ComboBox_IntfGetItems(L: Plua_State): Integer; cdecl;
var 
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	lComboBox.IntfGetItems();
	
	Result := 0;
end;

function VCLua_ComboBox_AddItem(L: Plua_State): Integer; cdecl;
var 
	lComboBox:TLuaComboBox;
	Item:String;
	AnObject:TObject;
begin
	CheckArg(L, 3);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	Item := lua_toStringCP(L,2);
	AnObject := TObject(GetLuaObject(L,3));
	lComboBox.AddItem(Item,AnObject);
	
	Result := 0;
end;

function VCLua_ComboBox_AddHistoryItem(L: Plua_State): Integer; cdecl;
var 
	lComboBox:TLuaComboBox;
	Item:string;
	MaxHistoryCount:integer;
	SetAsText:boolean;
	CaseSensitive:boolean;
begin
	CheckArg(L, 5);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	Item := lua_toStringCP(L,2);
	MaxHistoryCount := lua_tointeger(L,3);
	SetAsText := lua_toboolean(L,4);
	CaseSensitive := lua_toboolean(L,5);
	lComboBox.AddHistoryItem(Item,MaxHistoryCount,SetAsText,CaseSensitive);
	
	Result := 0;
end;

function VCLua_ComboBox_AddHistoryItem2(L: Plua_State): Integer; cdecl;
var 
	lComboBox:TLuaComboBox;
	Item:string;
	AnObject:TObject;
	MaxHistoryCount:integer;
	SetAsText:boolean;
	CaseSensitive:boolean;
begin
	CheckArg(L, 6);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	Item := lua_toStringCP(L,2);
	AnObject := TObject(GetLuaObject(L,3));
	MaxHistoryCount := lua_tointeger(L,4);
	SetAsText := lua_toboolean(L,5);
	CaseSensitive := lua_toboolean(L,6);
	lComboBox.AddHistoryItem(Item,AnObject,MaxHistoryCount,SetAsText,CaseSensitive);
	
	Result := 0;
end;

function VCLua_ComboBox_Clear(L: Plua_State): Integer; cdecl;
var 
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	lComboBox.Clear();
	
	Result := 0;
end;

function VCLua_ComboBox_SelectAll(L: Plua_State): Integer; cdecl;
var 
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	lComboBox.SelectAll();
	
	Result := 0;
end;

procedure ComboBoxToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'IntfGetItems', @VCLua_ComboBox_IntfGetItems);
	LuaSetTableFunction(L, Index, 'AddItem', @VCLua_ComboBox_AddItem);
	LuaSetTableFunction(L, Index, 'AddHistoryItem', @VCLua_ComboBox_AddHistoryItem);
	LuaSetTableFunction(L, Index, 'AddHistoryItem2', @VCLua_ComboBox_AddHistoryItem2);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_ComboBox_Clear);
	LuaSetTableFunction(L, Index, 'SelectAll', @VCLua_ComboBox_SelectAll);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateComboBox(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lComboBox := TLuaComboBox.Create(Parent);
	lComboBox.Parent := TWinControl(Parent);
	lComboBox.LuaCtl := TVCLuaControl.Create(TControl(lComboBox),L,@ComboBoxToTable);
	InitControl(L,lComboBox,Name);
	ComboBoxToTable(L, -1, lComboBox);
	Result := 1;
end;

end.
