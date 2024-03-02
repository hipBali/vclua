(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaListBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo, LuaVmt;

function CreateListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListBox = class(TListBox)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomListBoxFuncs: TLuaVmt;
    CustomListBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, Graphics, LuaCanvas, LuaStrings;

function VCLua_ListBox_AddItem(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Item:String;
	AnObject:TObject;
begin
	CheckArg(L, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Item);
	luaL_check(L,3,@AnObject);
	try
		lListBox.AddItem(Item,AnObject);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'AddItem', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_Clear(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		lListBox.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_ClearSelection(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		lListBox.ClearSelection();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ClearSelection', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_GetIndexAtXY(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	X:integer;
	Y:integer;
	ret:integer;
begin
	CheckArg(L, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		ret := lListBox.GetIndexAtXY(X,Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'GetIndexAtXY', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_GetIndexAtY(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Y:integer;
	ret:integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Y);
	try
		ret := lListBox.GetIndexAtY(Y);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'GetIndexAtY', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_GetSelectedText(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:string;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.GetSelectedText();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'GetSelectedText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_ItemAtPos(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Pos:TPoint;
	Existing:Boolean;
	ret:Integer;
begin
	CheckArg(L, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Pos);
	luaL_check(L,3,@Existing);
	try
		ret := lListBox.ItemAtPos(Pos,Existing);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemAtPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_ItemRect(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Index:Integer;
	ret:TRect;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lListBox.ItemRect(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_ItemVisible(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Index:Integer;
	ret:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lListBox.ItemVisible(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_ItemFullyVisible(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Index:Integer;
	ret:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lListBox.ItemFullyVisible(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemFullyVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_LockSelectionChange(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		lListBox.LockSelectionChange();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'LockSelectionChange', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_MakeCurrentVisible(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		lListBox.MakeCurrentVisible();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'MakeCurrentVisible', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_MeasureItem(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Index:Integer;
	TheHeight:Integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lListBox.MeasureItem(Index,TheHeight);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'MeasureItem', E.ClassName, E.Message);
	end;
	lua_push(L,TheHeight);
end;

function VCLua_ListBox_MeasureItem2(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Index:Integer;
	TheHeight:Integer;
begin
	CheckArg(L, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@TheHeight);
	try
		lListBox.MeasureItem(Index,TheHeight);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'MeasureItem', E.ClassName, E.Message);
	end;
	lua_push(L,TheHeight);
end;

function VCLua_ListBox_SelectAll(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		lListBox.SelectAll();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'SelectAll', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_SelectRange(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ALow:integer;
	AHigh:integer;
	ASelected:boolean;
begin
	CheckArg(L, 4);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@ALow);
	luaL_check(L,3,@AHigh);
	luaL_check(L,4,@ASelected);
	try
		lListBox.SelectRange(ALow,AHigh,ASelected);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'SelectRange', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_DeleteSelected(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		lListBox.DeleteSelected();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'DeleteSelected', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_UnlockSelectionChange(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		lListBox.UnlockSelectionChange();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'UnlockSelectionChange', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:TCanvas;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Canvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetClickOnSelChange(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.ClickOnSelChange := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ClickOnSelChange', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetClickOnSelChange(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:boolean;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.ClickOnSelChange;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ClickOnSelChange', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetColumns(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:Integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.Columns := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Columns', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetColumns(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.Columns;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Columns', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetExtendedSelect(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.ExtendedSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ExtendedSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetExtendedSelect(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:boolean;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.ExtendedSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ExtendedSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetItemHeight(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:Integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.ItemHeight := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetItemHeight(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.ItemHeight;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetItemIndex(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.ItemIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetItemIndex(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:integer;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.ItemIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ItemIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetItems(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:TStrings;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.Items := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetItems(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:TStrings;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.Items;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Items', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.MultiSelect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'MultiSelect', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetMultiSelect(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:boolean;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.MultiSelect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'MultiSelect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetOptions(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:TListBoxOptions;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_checkSet(L,2,@val,TypeInfo(TListBoxOptions));
	try
		lListBox.Options := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Options', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetOptions(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:TListBoxOptions;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.Options;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Options', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ListBox_VCLuaSetScrollWidth(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:Integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.ScrollWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ScrollWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetScrollWidth(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.ScrollWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'ScrollWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaGetSelCount(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:integer;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.SelCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'SelCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_Selected(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Index:integer;
	ret:boolean;
begin
	CheckArg(L, 2, 3);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lListBox.Selected[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lListBox.Selected[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Selected', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaSetSorted(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:boolean;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.Sorted := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Sorted', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetSorted(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:boolean;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.Sorted;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Sorted', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ListBox_VCLuaSetStyle(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:TListBoxStyle;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TListBoxStyle));
	try
		lListBox.Style := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Style', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetStyle(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:TListBoxStyle;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.Style;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'Style', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ListBox_VCLuaSetTopIndex(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	val:Integer;
begin
	CheckArg(L, 2);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lListBox.TopIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'TopIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_ListBox_VCLuaGetTopIndex(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lListBox := TLuaListBox(GetLuaObject(L, 1));
	try
		ret := lListBox.TopIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ListBox', 'TopIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TListBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomListBox',v);
end;
function CreateListBox(L: Plua_State): Integer; cdecl;
var
	lListBox:TLuaListBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lListBox := TLuaListBox.Create(Parent);
	lListBox.Parent := TWinControl(Parent);
	lListBox.LuaCtl := TVCLuaControl.Create(lListBox as TComponent,L,nil,'TCustomListBox');
	InitControl(L,lListBox,Name);
	CreateTableForKnownType(L,'TCustomListBox',lListBox);
	Result := 1;
end;

begin
	CustomListBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'AddItem', @VCLua_ListBox_AddItem);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Clear', @VCLua_ListBox_Clear);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ClearSelection', @VCLua_ListBox_ClearSelection);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'GetIndexAtXY', @VCLua_ListBox_GetIndexAtXY);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'GetIndexAtY', @VCLua_ListBox_GetIndexAtY);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'GetSelectedText', @VCLua_ListBox_GetSelectedText);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ItemAtPos', @VCLua_ListBox_ItemAtPos);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ItemRect', @VCLua_ListBox_ItemRect);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ItemVisible', @VCLua_ListBox_ItemVisible);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ItemFullyVisible', @VCLua_ListBox_ItemFullyVisible);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'LockSelectionChange', @VCLua_ListBox_LockSelectionChange);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'MakeCurrentVisible', @VCLua_ListBox_MakeCurrentVisible);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'MeasureItem', @VCLua_ListBox_MeasureItem);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'MeasureItem2', @VCLua_ListBox_MeasureItem2);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'SelectAll', @VCLua_ListBox_SelectAll);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'SelectRange', @VCLua_ListBox_SelectRange);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'DeleteSelected', @VCLua_ListBox_DeleteSelected);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'UnlockSelectionChange', @VCLua_ListBox_UnlockSelectionChange);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Canvas', @VCLua_ListBox_VCLuaGetCanvas, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ClickOnSelChange', @VCLua_ListBox_VCLuaGetClickOnSelChange, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Columns', @VCLua_ListBox_VCLuaGetColumns, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ExtendedSelect', @VCLua_ListBox_VCLuaGetExtendedSelect, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ItemHeight', @VCLua_ListBox_VCLuaGetItemHeight, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ItemIndex', @VCLua_ListBox_VCLuaGetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Items', @VCLua_ListBox_VCLuaGetItems, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'MultiSelect', @VCLua_ListBox_VCLuaGetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Options', @VCLua_ListBox_VCLuaGetOptions, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'ScrollWidth', @VCLua_ListBox_VCLuaGetScrollWidth, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'SelCount', @VCLua_ListBox_VCLuaGetSelCount, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Selected', @VCLua_ListBox_Selected);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Sorted', @VCLua_ListBox_VCLuaGetSorted, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'Style', @VCLua_ListBox_VCLuaGetStyle, mfCall);
	TLuaMethodInfo.Create(CustomListBoxFuncs, 'TopIndex', @VCLua_ListBox_VCLuaGetTopIndex, mfCall);
	CustomListBoxSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomListBoxSets, 'ClickOnSelChange', @VCLua_ListBox_VCLuaSetClickOnSelChange, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'Columns', @VCLua_ListBox_VCLuaSetColumns, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'ExtendedSelect', @VCLua_ListBox_VCLuaSetExtendedSelect, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'ItemHeight', @VCLua_ListBox_VCLuaSetItemHeight, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'ItemIndex', @VCLua_ListBox_VCLuaSetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'Items', @VCLua_ListBox_VCLuaSetItems, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'MultiSelect', @VCLua_ListBox_VCLuaSetMultiSelect, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'Options', @VCLua_ListBox_VCLuaSetOptions, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'ScrollWidth', @VCLua_ListBox_VCLuaSetScrollWidth, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'Sorted', @VCLua_ListBox_VCLuaSetSorted, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'Style', @VCLua_ListBox_VCLuaSetStyle, mfCall);
	TLuaMethodInfo.Create(CustomListBoxSets, 'TopIndex', @VCLua_ListBox_VCLuaSetTopIndex, mfCall);
end.
