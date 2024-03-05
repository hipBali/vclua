(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckListBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, CheckLst;

function CreateCheckListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCheckListBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCheckListBox = class(TCheckListBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCheckListBoxFuncs: TLuaVmt;
    CustomCheckListBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, StdCtrls;

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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'MeasureItem', E.ClassName, E.Message);
	end;
	lua_push(L,TheHeight);
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
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'MeasureItem', E.ClassName, E.Message);
	end;
	lua_push(L,TheHeight);
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'Toggle', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'CheckAll', E.ClassName, E.Message);
	end;
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
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'Exchange', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_VCLuaSetAllowGrayed(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	val:Boolean;
begin
	CheckArg(L, 2);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCheckListBox.AllowGrayed := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'AllowGrayed', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_VCLuaGetAllowGrayed(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	try
		ret := lCheckListBox.AllowGrayed;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'AllowGrayed', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckListBox_Checked(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	AIndex:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2, 3);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckListBox.Checked[AIndex];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCheckListBox.Checked[AIndex] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'Checked', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_Header(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	AIndex:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2, 3);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckListBox.Header[AIndex];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCheckListBox.Header[AIndex] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'Header', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_ItemEnabled(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	AIndex:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2, 3);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckListBox.ItemEnabled[AIndex];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCheckListBox.ItemEnabled[AIndex] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'ItemEnabled', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_State(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	AIndex:Integer;
	ret:TCheckBoxState;
begin
	CheckArg(L, 2, 3);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckListBox.State[AIndex];
			lua_push(L,ret,TypeInfo(ret));
			Result := 1;
		end else begin
			luaL_check(L,3,@ret,TypeInfo(TCheckBoxState));
			lCheckListBox.State[AIndex] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'State', E.ClassName, E.Message);
	end;
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
	CustomCheckListBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'MeasureItem', @VCLua_CheckListBox_MeasureItem);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'MeasureItem2', @VCLua_CheckListBox_MeasureItem2);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Toggle', @VCLua_CheckListBox_Toggle);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'CheckAll', @VCLua_CheckListBox_CheckAll);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Exchange', @VCLua_CheckListBox_Exchange);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'AllowGrayed', @VCLua_CheckListBox_VCLuaGetAllowGrayed, mfCall);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Checked', @VCLua_CheckListBox_Checked);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Header', @VCLua_CheckListBox_Header);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'ItemEnabled', @VCLua_CheckListBox_ItemEnabled);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'State', @VCLua_CheckListBox_State);
	CustomCheckListBoxSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckListBoxSets, 'AllowGrayed', @VCLua_CheckListBox_VCLuaSetAllowGrayed, mfCall);
end.
