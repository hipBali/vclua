(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckListBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, CheckLst, TypInfo;

function CreateCheckListBox(L: Plua_State): Integer; cdecl;
function IsCheckListBox(L: Plua_State): Integer; cdecl;
function AsCheckListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCheckListBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCheckListBox = class(TCheckListBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCheckListBoxFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils, Controls, StdCtrls;

function VCLua_CheckListBox_MeasureItem(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	Index:Integer;
	TheHeight:Integer;
begin
	CheckArg(L, 2);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lCheckListBox.MeasureItem(Index,TheHeight);
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'MeasureItem', E.ClassName, E.Message);
	end;
	lua_push(L,TheHeight);
	Result := 1;
end;

function VCLua_CheckListBox_MeasureItem2(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	Index:Integer;
	TheHeight:Integer;
begin
	CheckArg(L, 3);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@TheHeight);
	try
		lCheckListBox.MeasureItem(Index,TheHeight);
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'MeasureItem', E.ClassName, E.Message);
	end;
	lua_push(L,TheHeight);
	Result := 1;
end;

function VCLua_CheckListBox_Toggle(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	AIndex:Integer;
begin
	CheckArg(L, 2);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		lCheckListBox.Toggle(AIndex);
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'Toggle', E.ClassName, E.Message);
	end;
	Result := 0;
end;

function VCLua_CheckListBox_CheckAll(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	AState:TCheckBoxState;
	aAllowGrayed:Boolean;
	aAllowDisabled:Boolean;
begin
	CheckArg(L, 2, 4);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@AState,TypeInfo(TCheckBoxState));
	TTrait<Boolean>.luaL_optcheck(L, 3, @aAllowGrayed, True);
	TTrait<Boolean>.luaL_optcheck(L, 4, @aAllowDisabled, True);
	try
		lCheckListBox.CheckAll(AState,aAllowGrayed,aAllowDisabled);
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'CheckAll', E.ClassName, E.Message);
	end;
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
	luaL_check(L,2,@AIndex1);
	luaL_check(L,3,@AIndex2);
	try
		lCheckListBox.Exchange(AIndex1,AIndex2);
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'Exchange', E.ClassName, E.Message);
	end;
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

function IsCheckListBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCheckListBox);
end;
function AsCheckListBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCheckListBox then
    lua_push(L, TCheckListBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCheckListBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCheckListBox',v);
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
	lCheckListBox.LuaCtl := TVCLuaControl.Create(lCheckListBox as TComponent,L,nil,'TCustomCheckListBox');
	InitControl(L,lCheckListBox,Name);
	CreateTableForKnownType(L,'TCustomCheckListBox',lCheckListBox);
	Result := 1;
end;

begin
	SetLength(CustomCheckListBoxFuncs, 7+1);
	CustomCheckListBoxFuncs[0].name:='MeasureItem';
	CustomCheckListBoxFuncs[0].func:=@VCLua_CheckListBox_MeasureItem;
	CustomCheckListBoxFuncs[1].name:='MeasureItem2';
	CustomCheckListBoxFuncs[1].func:=@VCLua_CheckListBox_MeasureItem2;
	CustomCheckListBoxFuncs[2].name:='Toggle';
	CustomCheckListBoxFuncs[2].func:=@VCLua_CheckListBox_Toggle;
	CustomCheckListBoxFuncs[3].name:='CheckAll';
	CustomCheckListBoxFuncs[3].func:=@VCLua_CheckListBox_CheckAll;
	CustomCheckListBoxFuncs[4].name:='Exchange';
	CustomCheckListBoxFuncs[4].func:=@VCLua_CheckListBox_Exchange;
	CustomCheckListBoxFuncs[5].name:='GetChecked';
	CustomCheckListBoxFuncs[5].func:=@VCLua_CheckListBox_CheckListBoxGetChecked;
	CustomCheckListBoxFuncs[6].name:='SetChecked';
	CustomCheckListBoxFuncs[6].func:=@VCLua_CheckListBox_CheckListBoxSetChecked;
	CustomCheckListBoxFuncs[7].name:=nil;
	CustomCheckListBoxFuncs[7].func:=nil;

end.
