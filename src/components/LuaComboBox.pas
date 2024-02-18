(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaComboBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo;

function CreateComboBox(L: Plua_State): Integer; cdecl;
function IsComboBox(L: Plua_State): Integer; cdecl;
function AsComboBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TComboBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaComboBox = class(TComboBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomComboBoxFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils, Controls;

function VCLua_ComboBox_IntfGetItems(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		lComboBox.IntfGetItems();
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'IntfGetItems', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Item);
	luaL_check(L,3,@AnObject);
	try
		lComboBox.AddItem(Item,AnObject);
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AddItem', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Item);
	luaL_check(L,3,@MaxHistoryCount);
	luaL_check(L,4,@SetAsText);
	luaL_check(L,5,@CaseSensitive);
	try
		lComboBox.AddHistoryItem(Item,MaxHistoryCount,SetAsText,CaseSensitive);
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AddHistoryItem', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@Item);
	luaL_check(L,3,@AnObject);
	luaL_check(L,4,@MaxHistoryCount);
	luaL_check(L,5,@SetAsText);
	luaL_check(L,6,@CaseSensitive);
	try
		lComboBox.AddHistoryItem(Item,AnObject,MaxHistoryCount,SetAsText,CaseSensitive);
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AddHistoryItem', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_ComboBox_Clear(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		lComboBox.Clear();
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'Clear', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_ComboBox_SelectAll(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		lComboBox.SelectAll();
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'SelectAll', E.ClassName, E.Message);
	end;
	Result := 0;
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
	SetLength(CustomComboBoxFuncs, 6+1);
	CustomComboBoxFuncs[0].name:='IntfGetItems';
	CustomComboBoxFuncs[0].func:=@VCLua_ComboBox_IntfGetItems;
	CustomComboBoxFuncs[1].name:='AddItem';
	CustomComboBoxFuncs[1].func:=@VCLua_ComboBox_AddItem;
	CustomComboBoxFuncs[2].name:='AddHistoryItem';
	CustomComboBoxFuncs[2].func:=@VCLua_ComboBox_AddHistoryItem;
	CustomComboBoxFuncs[3].name:='AddHistoryItem2';
	CustomComboBoxFuncs[3].func:=@VCLua_ComboBox_AddHistoryItem2;
	CustomComboBoxFuncs[4].name:='Clear';
	CustomComboBoxFuncs[4].func:=@VCLua_ComboBox_Clear;
	CustomComboBoxFuncs[5].name:='SelectAll';
	CustomComboBoxFuncs[5].func:=@VCLua_ComboBox_SelectAll;
	CustomComboBoxFuncs[6].name:=nil;
	CustomComboBoxFuncs[6].func:=nil;

end.
