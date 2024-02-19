(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaListBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo;

function CreateListBox(L: Plua_State): Integer; cdecl;
function IsListBox(L: Plua_State): Integer; cdecl;
function AsListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TListBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaListBox = class(TListBox)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomListBoxFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

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

function IsListBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TListBox);
end;
function AsListBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TListBox then
    lua_push(L, TListBox(o))
  else
    lua_pushnil(L);
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
	SetLength(CustomListBoxFuncs, 19+1);
	CustomListBoxFuncs[0].name:='AddItem';
	CustomListBoxFuncs[0].func:=@VCLua_ListBox_AddItem;
	CustomListBoxFuncs[1].name:='Clear';
	CustomListBoxFuncs[1].func:=@VCLua_ListBox_Clear;
	CustomListBoxFuncs[2].name:='ClearSelection';
	CustomListBoxFuncs[2].func:=@VCLua_ListBox_ClearSelection;
	CustomListBoxFuncs[3].name:='GetIndexAtXY';
	CustomListBoxFuncs[3].func:=@VCLua_ListBox_GetIndexAtXY;
	CustomListBoxFuncs[4].name:='GetIndexAtY';
	CustomListBoxFuncs[4].func:=@VCLua_ListBox_GetIndexAtY;
	CustomListBoxFuncs[5].name:='GetSelectedText';
	CustomListBoxFuncs[5].func:=@VCLua_ListBox_GetSelectedText;
	CustomListBoxFuncs[6].name:='ItemAtPos';
	CustomListBoxFuncs[6].func:=@VCLua_ListBox_ItemAtPos;
	CustomListBoxFuncs[7].name:='ItemRect';
	CustomListBoxFuncs[7].func:=@VCLua_ListBox_ItemRect;
	CustomListBoxFuncs[8].name:='ItemVisible';
	CustomListBoxFuncs[8].func:=@VCLua_ListBox_ItemVisible;
	CustomListBoxFuncs[9].name:='ItemFullyVisible';
	CustomListBoxFuncs[9].func:=@VCLua_ListBox_ItemFullyVisible;
	CustomListBoxFuncs[10].name:='LockSelectionChange';
	CustomListBoxFuncs[10].func:=@VCLua_ListBox_LockSelectionChange;
	CustomListBoxFuncs[11].name:='MakeCurrentVisible';
	CustomListBoxFuncs[11].func:=@VCLua_ListBox_MakeCurrentVisible;
	CustomListBoxFuncs[12].name:='MeasureItem';
	CustomListBoxFuncs[12].func:=@VCLua_ListBox_MeasureItem;
	CustomListBoxFuncs[13].name:='MeasureItem2';
	CustomListBoxFuncs[13].func:=@VCLua_ListBox_MeasureItem2;
	CustomListBoxFuncs[14].name:='SelectAll';
	CustomListBoxFuncs[14].func:=@VCLua_ListBox_SelectAll;
	CustomListBoxFuncs[15].name:='SelectRange';
	CustomListBoxFuncs[15].func:=@VCLua_ListBox_SelectRange;
	CustomListBoxFuncs[16].name:='DeleteSelected';
	CustomListBoxFuncs[16].func:=@VCLua_ListBox_DeleteSelected;
	CustomListBoxFuncs[17].name:='UnlockSelectionChange';
	CustomListBoxFuncs[17].func:=@VCLua_ListBox_UnlockSelectionChange;
	CustomListBoxFuncs[18].name:='Selected';
	CustomListBoxFuncs[18].func:=@VCLua_ListBox_Selected;
	CustomListBoxFuncs[19].name:=nil;
	CustomListBoxFuncs[19].func:=nil;

end.
