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
    end;
var
    CustomCheckListBoxFuncs: TLuaVmt;
    CustomCheckListBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, LuaClassesEvents, LuaEvent, StdCtrls;

function VCLua_CheckListBox_CalculateStandardItemHeight(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCheckListBox := TLuaCheckListBox(GetLuaObject(L, 1));
	try
		ret := lCheckListBox.CalculateStandardItemHeight();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'CalculateStandardItemHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	lCheckListBox := TLuaCheckListBox(CheckLuaObjectPop(L, 1));
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
	lCheckListBox := TLuaCheckListBox(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCheckListBox.AllowGrayed := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'SetAllowGrayed', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_VCLuaGetAllowGrayed(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	ret:Boolean;
begin
	lCheckListBox := TLuaCheckListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCheckListBox.AllowGrayed;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'GetAllowGrayed', E.ClassName, E.Message);
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
	lCheckListBox := TLuaCheckListBox(CheckLuaObjectPop(L, 1));
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
	lCheckListBox := TLuaCheckListBox(CheckLuaObjectPop(L, 1));
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

function VCLua_CheckListBox_VCLuaSetHeaderBackgroundColor(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	val:TColor;
begin
	lCheckListBox := TLuaCheckListBox(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lCheckListBox.HeaderBackgroundColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'SetHeaderBackgroundColor', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_VCLuaGetHeaderBackgroundColor(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	ret:TColor;
begin
	lCheckListBox := TLuaCheckListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCheckListBox.HeaderBackgroundColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'GetHeaderBackgroundColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckListBox_VCLuaSetHeaderColor(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	val:TColor;
begin
	lCheckListBox := TLuaCheckListBox(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lCheckListBox.HeaderColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'SetHeaderColor', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckListBox_VCLuaGetHeaderColor(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	ret:TColor;
begin
	lCheckListBox := TLuaCheckListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCheckListBox.HeaderColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckListBox', 'GetHeaderColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckListBox_ItemEnabled(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
	AIndex:Integer;
	ret:Boolean;
begin
	CheckArg(L, 2, 3);
	lCheckListBox := TLuaCheckListBox(CheckLuaObjectPop(L, 1));
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
	lCheckListBox := TLuaCheckListBox(CheckLuaObjectPop(L, 1));
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

function VCLua_CheckListBox_VCLuaSetOnClickCheck(L: Plua_State): Integer; cdecl;
var
	lCheckListBox:TLuaCheckListBox;
begin
	lCheckListBox := TLuaCheckListBox(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCheckListBox.OnClickCheck));
	lCheckListBox.OnClickCheck := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckListBox := TLuaCheckListBox.Create(Parent);
	lCheckListBox.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomCheckListBox',lCheckListBox);
	InitControl(L,lCheckListBox,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'CheckListBox', E.ClassName, E.Message);
	end;
end;

begin
	CustomCheckListBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'CalculateStandardItemHeight', @VCLua_CheckListBox_CalculateStandardItemHeight);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Toggle', @VCLua_CheckListBox_Toggle);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'CheckAll', @VCLua_CheckListBox_CheckAll);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Exchange', @VCLua_CheckListBox_Exchange);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'AllowGrayed', @VCLua_CheckListBox_VCLuaGetAllowGrayed, mfCall);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Checked', @VCLua_CheckListBox_Checked);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'Header', @VCLua_CheckListBox_Header);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'HeaderBackgroundColor', @VCLua_CheckListBox_VCLuaGetHeaderBackgroundColor, mfCall);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'HeaderColor', @VCLua_CheckListBox_VCLuaGetHeaderColor, mfCall);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'ItemEnabled', @VCLua_CheckListBox_ItemEnabled);
	TLuaMethodInfo.Create(CustomCheckListBoxFuncs, 'State', @VCLua_CheckListBox_State);
	CustomCheckListBoxSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCheckListBoxSets, 'AllowGrayed', @VCLua_CheckListBox_VCLuaSetAllowGrayed, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(CustomCheckListBoxSets, 'HeaderBackgroundColor', @VCLua_CheckListBox_VCLuaSetHeaderBackgroundColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomCheckListBoxSets, 'HeaderColor', @VCLua_CheckListBox_VCLuaSetHeaderColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomCheckListBoxSets, 'OnClickCheck', @VCLua_CheckListBox_VCLuaSetOnClickCheck, mfCall, TypeInfo(TNotifyEvent));
end.
