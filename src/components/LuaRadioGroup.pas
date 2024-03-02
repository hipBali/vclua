(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRadioGroup;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateRadioGroup(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TRadioGroup; pti: PTypeInfo = nil); overload; inline;

type
    TLuaRadioGroup = class(TRadioGroup)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomRadioGroupFuncs: TLuaVmt;
    CustomRadioGroupSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LuaStrings;

function VCLua_RadioGroup_CanModify(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.CanModify();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'CanModify', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RadioGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@AllLevels);
	try
		lRadioGroup.FlipChildren(AllLevels);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'FlipChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_RadioGroup_Rows(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.Rows();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'Rows', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RadioGroup_VCLuaSetAutoFill(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	val:Boolean;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lRadioGroup.AutoFill := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'AutoFill', E.ClassName, E.Message);
	end;
end;

function VCLua_RadioGroup_VCLuaGetAutoFill(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.AutoFill;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'AutoFill', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RadioGroup_VCLuaSetItemIndex(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	val:integer;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lRadioGroup.ItemIndex := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'ItemIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_RadioGroup_VCLuaGetItemIndex(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.ItemIndex;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'ItemIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RadioGroup_VCLuaSetItems(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	val:TStrings;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lRadioGroup.Items := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_RadioGroup_VCLuaGetItems(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:TStrings;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.Items;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'Items', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RadioGroup_VCLuaSetColumns(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	val:integer;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lRadioGroup.Columns := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'Columns', E.ClassName, E.Message);
	end;
end;

function VCLua_RadioGroup_VCLuaGetColumns(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.Columns;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'Columns', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RadioGroup_VCLuaSetColumnLayout(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	val:TColumnLayout;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TColumnLayout));
	try
		lRadioGroup.ColumnLayout := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'ColumnLayout', E.ClassName, E.Message);
	end;
end;

function VCLua_RadioGroup_VCLuaGetColumnLayout(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:TColumnLayout;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.ColumnLayout;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'ColumnLayout', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TRadioGroup; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomRadioGroup',v);
end;
function CreateRadioGroup(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lRadioGroup := TLuaRadioGroup.Create(Parent);
	lRadioGroup.Parent := TWinControl(Parent);
	lRadioGroup.LuaCtl := TVCLuaControl.Create(lRadioGroup as TComponent,L,nil,'TCustomRadioGroup');
	InitControl(L,lRadioGroup,Name);
	CreateTableForKnownType(L,'TCustomRadioGroup',lRadioGroup);
	Result := 1;
end;

begin
	CustomRadioGroupFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'CanModify', @VCLua_RadioGroup_CanModify);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'FlipChildren', @VCLua_RadioGroup_FlipChildren);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'Rows', @VCLua_RadioGroup_Rows);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'AutoFill', @VCLua_RadioGroup_VCLuaGetAutoFill, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'ItemIndex', @VCLua_RadioGroup_VCLuaGetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'Items', @VCLua_RadioGroup_VCLuaGetItems, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'Columns', @VCLua_RadioGroup_VCLuaGetColumns, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'ColumnLayout', @VCLua_RadioGroup_VCLuaGetColumnLayout, mfCall);
	CustomRadioGroupSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomRadioGroupSets, 'AutoFill', @VCLua_RadioGroup_VCLuaSetAutoFill, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupSets, 'ItemIndex', @VCLua_RadioGroup_VCLuaSetItemIndex, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupSets, 'Items', @VCLua_RadioGroup_VCLuaSetItems, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupSets, 'Columns', @VCLua_RadioGroup_VCLuaSetColumns, mfCall);
	TLuaMethodInfo.Create(CustomRadioGroupSets, 'ColumnLayout', @VCLua_RadioGroup_VCLuaSetColumnLayout, mfCall);
end.
