(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaComboBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateComboBox(L: Plua_State): Integer; cdecl;
function IsComboBox(L: Plua_State): Integer; cdecl;
function AsComboBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TComboBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaComboBox = class(TComboBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomComboBoxFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_ComboBox_IntfGetItems(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		lComboBox.IntfGetItems();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'IntfGetItems', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_AddItem(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	Item:String;
	AnObject:TObject;
begin
	CheckArg(L, 3);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Item);
	luaL_check(L,3,@AnObject);
	try
		lComboBox.AddItem(Item,AnObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AddItem', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Item);
	luaL_check(L,3,@MaxHistoryCount);
	luaL_check(L,4,@SetAsText);
	luaL_check(L,5,@CaseSensitive);
	try
		lComboBox.AddHistoryItem(Item,MaxHistoryCount,SetAsText,CaseSensitive);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AddHistoryItem', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Item);
	luaL_check(L,3,@AnObject);
	luaL_check(L,4,@MaxHistoryCount);
	luaL_check(L,5,@SetAsText);
	luaL_check(L,6,@CaseSensitive);
	try
		lComboBox.AddHistoryItem(Item,AnObject,MaxHistoryCount,SetAsText,CaseSensitive);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AddHistoryItem', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_Clear(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		lComboBox.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_SelectAll(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		lComboBox.SelectAll();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'SelectAll', E.ClassName, E.Message);
	end;
end;

function IsComboBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TComboBox);
end;
function AsComboBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TComboBox then
    lua_push(L, TComboBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TComboBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomComboBox',v);
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
	lComboBox.LuaCtl := TVCLuaControl.Create(lComboBox as TComponent,L,nil,'TCustomComboBox');
	InitControl(L,lComboBox,Name);
	CreateTableForKnownType(L,'TCustomComboBox',lComboBox);
	Result := 1;
end;

begin
	CustomComboBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'IntfGetItems', @VCLua_ComboBox_IntfGetItems);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AddItem', @VCLua_ComboBox_AddItem);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AddHistoryItem', @VCLua_ComboBox_AddHistoryItem);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AddHistoryItem2', @VCLua_ComboBox_AddHistoryItem2);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'Clear', @VCLua_ComboBox_Clear);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'SelectAll', @VCLua_ComboBox_SelectAll);
end.
