(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaComboBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateComboBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TComboBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaComboBox = class(TComboBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomComboBoxFuncs: TLuaVmt;
    CustomComboBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LCLType, LuaCanvas, LuaStrings;

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

function VCLua_ComboBox_VCLuaSetCharCase(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:TEditCharCase;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TEditCharCase));
	try
		lComboBox.CharCase := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'CharCase', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetCharCase(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:TEditCharCase;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.CharCase;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'CharCase', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ComboBox_VCLuaSetDroppedDown(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.DroppedDown := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'DroppedDown', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetDroppedDown(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.DroppedDown;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'DroppedDown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetDroppingDown(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.DroppingDown := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'DroppingDown', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetDroppingDown(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.DroppingDown;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'DroppingDown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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

function VCLua_ComboBox_VCLuaSetAutoComplete(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.AutoComplete := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoComplete', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetAutoComplete(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.AutoComplete;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoComplete', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetAutoCompleteText(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:TComboBoxAutoCompleteText;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TComboBoxAutoCompleteText));
	try
		lComboBox.AutoCompleteText := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoCompleteText', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetAutoCompleteText(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:TComboBoxAutoCompleteText;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.AutoCompleteText;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoCompleteText', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ComboBox_VCLuaSetAutoDropDown(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.AutoDropDown := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoDropDown', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetAutoDropDown(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.AutoDropDown;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoDropDown', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetAutoSelect(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.AutoSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetAutoSelect(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.AutoSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetAutoSelected(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.AutoSelected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoSelected', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetAutoSelected(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.AutoSelected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'AutoSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetArrowKeysTraverseList(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.ArrowKeysTraverseList := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'ArrowKeysTraverseList', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetArrowKeysTraverseList(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.ArrowKeysTraverseList;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'ArrowKeysTraverseList', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:TCanvas;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'Canvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetDropDownCount(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Integer;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.DropDownCount := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'DropDownCount', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetDropDownCount(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.DropDownCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'DropDownCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaGetEmulatedTextHintStatus(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:TEmulatedTextHintStatus;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.EmulatedTextHintStatus;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'EmulatedTextHintStatus', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ComboBox_VCLuaSetItems(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:TStrings;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.Items := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetItems(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:TStrings;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.Items;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'Items', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetItemIndex(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:integer;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.ItemIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'ItemIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetItemIndex(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:integer;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.ItemIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'ItemIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetReadOnly(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.ReadOnly := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'ReadOnly', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetReadOnly(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.ReadOnly;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'ReadOnly', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetSelText(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:String;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.SelText := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'SelText', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetSelText(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:String;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.SelText;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'SelText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ComboBox_VCLuaSetStyle(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:TComboBoxStyle;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TComboBoxStyle));
	try
		lComboBox.Style := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'Style', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetStyle(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:TComboBoxStyle;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.Style;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'Style', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ComboBox_VCLuaSetTextHint(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	val:TTranslateString;
begin
	CheckArg(L, 2);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lComboBox.TextHint := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'TextHint', E.ClassName, E.Message);
	end;
end;

function VCLua_ComboBox_VCLuaGetTextHint(L: Plua_State): Integer; cdecl;
var
	lComboBox:TLuaComboBox;
	ret:TTranslateString;
begin
	CheckArg(L, 1);
	lComboBox := TLuaComboBox(GetLuaObject(L, 1));
	try
		ret := lComboBox.TextHint;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ComboBox', 'TextHint', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'CharCase', @VCLua_ComboBox_VCLuaGetCharCase, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'DroppedDown', @VCLua_ComboBox_VCLuaGetDroppedDown, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'DroppingDown', @VCLua_ComboBox_VCLuaGetDroppingDown, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'SelectAll', @VCLua_ComboBox_SelectAll);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AutoComplete', @VCLua_ComboBox_VCLuaGetAutoComplete, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AutoCompleteText', @VCLua_ComboBox_VCLuaGetAutoCompleteText, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AutoDropDown', @VCLua_ComboBox_VCLuaGetAutoDropDown, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AutoSelect', @VCLua_ComboBox_VCLuaGetAutoSelect, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'AutoSelected', @VCLua_ComboBox_VCLuaGetAutoSelected, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'ArrowKeysTraverseList', @VCLua_ComboBox_VCLuaGetArrowKeysTraverseList, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'Canvas', @VCLua_ComboBox_VCLuaGetCanvas, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'DropDownCount', @VCLua_ComboBox_VCLuaGetDropDownCount, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'EmulatedTextHintStatus', @VCLua_ComboBox_VCLuaGetEmulatedTextHintStatus, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'Items', @VCLua_ComboBox_VCLuaGetItems, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'ItemIndex', @VCLua_ComboBox_VCLuaGetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'ReadOnly', @VCLua_ComboBox_VCLuaGetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'SelText', @VCLua_ComboBox_VCLuaGetSelText, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'Style', @VCLua_ComboBox_VCLuaGetStyle, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxFuncs, 'TextHint', @VCLua_ComboBox_VCLuaGetTextHint, mfCall);
	CustomComboBoxSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomComboBoxSets, 'CharCase', @VCLua_ComboBox_VCLuaSetCharCase, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'DroppedDown', @VCLua_ComboBox_VCLuaSetDroppedDown, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'DroppingDown', @VCLua_ComboBox_VCLuaSetDroppingDown, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'AutoComplete', @VCLua_ComboBox_VCLuaSetAutoComplete, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'AutoCompleteText', @VCLua_ComboBox_VCLuaSetAutoCompleteText, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'AutoDropDown', @VCLua_ComboBox_VCLuaSetAutoDropDown, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'AutoSelect', @VCLua_ComboBox_VCLuaSetAutoSelect, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'AutoSelected', @VCLua_ComboBox_VCLuaSetAutoSelected, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'ArrowKeysTraverseList', @VCLua_ComboBox_VCLuaSetArrowKeysTraverseList, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'DropDownCount', @VCLua_ComboBox_VCLuaSetDropDownCount, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'Items', @VCLua_ComboBox_VCLuaSetItems, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'ItemIndex', @VCLua_ComboBox_VCLuaSetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'ReadOnly', @VCLua_ComboBox_VCLuaSetReadOnly, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'SelText', @VCLua_ComboBox_VCLuaSetSelText, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'Style', @VCLua_ComboBox_VCLuaSetStyle, mfCall);
	TLuaMethodInfo.Create(CustomComboBoxSets, 'TextHint', @VCLua_ComboBox_VCLuaSetTextHint, mfCall);
end.
