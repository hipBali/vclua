(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckGroup;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateCheckGroup(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCheckGroup; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCheckGroup = class(TCheckGroup)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCheckGroupFuncs: TLuaVmt;
    CustomCheckGroupSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaStrings;

function VCLua_CheckGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@AllLevels);
	try
		lCheckGroup.FlipChildren(AllLevels);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'FlipChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_Rows(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	try
		ret := lCheckGroup.Rows();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Rows', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckGroup_VCLuaSetAutoFill(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	val:boolean;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCheckGroup.AutoFill := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'AutoFill', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_VCLuaGetAutoFill(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	try
		ret := lCheckGroup.AutoFill;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'AutoFill', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckGroup_VCLuaSetItems(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	val:TStrings;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCheckGroup.Items := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_VCLuaGetItems(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	ret:TStrings;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	try
		ret := lCheckGroup.Items;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Items', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckGroup_Checked(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	Index:integer;
	ret:boolean;
begin
	CheckArg(L, 2, 3);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckGroup.Checked[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCheckGroup.Checked[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Checked', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_CheckEnabled(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	Index:integer;
	ret:boolean;
begin
	CheckArg(L, 2, 3);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckGroup.CheckEnabled[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCheckGroup.CheckEnabled[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'CheckEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_VCLuaSetColumns(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	val:integer;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCheckGroup.Columns := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Columns', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_VCLuaGetColumns(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	try
		ret := lCheckGroup.Columns;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Columns', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckGroup_VCLuaSetColumnLayout(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	val:TColumnLayout;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TColumnLayout));
	try
		lCheckGroup.ColumnLayout := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'ColumnLayout', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_VCLuaGetColumnLayout(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	ret:TColumnLayout;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	try
		ret := lCheckGroup.ColumnLayout;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'ColumnLayout', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TCheckGroup; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCheckGroup',v);
end;
function CreateCheckGroup(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckGroup := TLuaCheckGroup.Create(Parent);
	lCheckGroup.Parent := TWinControl(Parent);
	lCheckGroup.LuaCtl := TVCLuaControl.Create(lCheckGroup as TComponent,L,nil,'TCustomCheckGroup');
	InitControl(L,lCheckGroup,Name);
	CreateTableForKnownType(L,'TCustomCheckGroup',lCheckGroup);
	Result := 1;
end;

begin
	CustomCheckGroupFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'FlipChildren', @VCLua_CheckGroup_FlipChildren);
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'Rows', @VCLua_CheckGroup_Rows);
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'AutoFill', @VCLua_CheckGroup_VCLuaGetAutoFill, mfCall);
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'Items', @VCLua_CheckGroup_VCLuaGetItems, mfCall);
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'Checked', @VCLua_CheckGroup_Checked);
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'CheckEnabled', @VCLua_CheckGroup_CheckEnabled);
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'Columns', @VCLua_CheckGroup_VCLuaGetColumns, mfCall);
	TLuaMethodInfo.Create(CustomCheckGroupFuncs, 'ColumnLayout', @VCLua_CheckGroup_VCLuaGetColumnLayout, mfCall);
	CustomCheckGroupSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckGroupSets, 'AutoFill', @VCLua_CheckGroup_VCLuaSetAutoFill, mfCall);
	TLuaMethodInfo.Create(CustomCheckGroupSets, 'Items', @VCLua_CheckGroup_VCLuaSetItems, mfCall);
	TLuaMethodInfo.Create(CustomCheckGroupSets, 'Columns', @VCLua_CheckGroup_VCLuaSetColumns, mfCall);
	TLuaMethodInfo.Create(CustomCheckGroupSets, 'ColumnLayout', @VCLua_CheckGroup_VCLuaSetColumnLayout, mfCall);
end.
