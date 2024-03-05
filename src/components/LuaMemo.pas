(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMemo;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateMemo(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMemo; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMemo = class(TMemo)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomMemoFuncs: TLuaVmt;
    CustomMemoSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaStrings;

function VCLua_Memo_Append(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	AValue:String;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		lMemo.Append(AValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'Append', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_ScrollBy(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	DeltaX:Integer;
	DeltaY:Integer;
begin
	CheckArg(L, 3);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@DeltaX);
	luaL_check(L,3,@DeltaY);
	try
		lMemo.ScrollBy(DeltaX,DeltaY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'ScrollBy', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaSetLines(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	val:TStrings;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMemo.Lines := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'Lines', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaGetLines(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	ret:TStrings;
begin
	CheckArg(L, 1);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	try
		ret := lMemo.Lines;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Memo', 'Lines', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Memo_VCLuaSetHorzScrollBar(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	val:TMemoScrollBar;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMemo.HorzScrollBar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'HorzScrollBar', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaGetHorzScrollBar(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	ret:TMemoScrollBar;
begin
	CheckArg(L, 1);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	try
		ret := lMemo.HorzScrollBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Memo', 'HorzScrollBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Memo_VCLuaSetVertScrollBar(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	val:TMemoScrollBar;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMemo.VertScrollBar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'VertScrollBar', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaGetVertScrollBar(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	ret:TMemoScrollBar;
begin
	CheckArg(L, 1);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	try
		ret := lMemo.VertScrollBar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Memo', 'VertScrollBar', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Memo_VCLuaSetScrollBars(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	val:TScrollStyle;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TScrollStyle));
	try
		lMemo.ScrollBars := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'ScrollBars', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaGetScrollBars(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	ret:TScrollStyle;
begin
	CheckArg(L, 1);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	try
		ret := lMemo.ScrollBars;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Memo', 'ScrollBars', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Memo_VCLuaSetWantReturns(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	val:Boolean;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMemo.WantReturns := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'WantReturns', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaGetWantReturns(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	try
		ret := lMemo.WantReturns;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Memo', 'WantReturns', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Memo_VCLuaSetWantTabs(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	val:Boolean;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMemo.WantTabs := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'WantTabs', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaGetWantTabs(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	try
		ret := lMemo.WantTabs;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Memo', 'WantTabs', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Memo_VCLuaSetWordWrap(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	val:Boolean;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lMemo.WordWrap := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Memo', 'WordWrap', E.ClassName, E.Message);
	end;
end;

function VCLua_Memo_VCLuaGetWordWrap(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	try
		ret := lMemo.WordWrap;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Memo', 'WordWrap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TMemo; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomMemo',v);
end;
function CreateMemo(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMemo := TLuaMemo.Create(Parent);
	lMemo.Parent := TWinControl(Parent);
	lMemo.LuaCtl := TVCLuaControl.Create(lMemo as TComponent,L,nil,'TCustomMemo');
	InitControl(L,lMemo,Name);
	CreateTableForKnownType(L,'TCustomMemo',lMemo);
	Result := 1;
end;

begin
	CustomMemoFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomMemoFuncs, 'Append', @VCLua_Memo_Append);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'ScrollBy', @VCLua_Memo_ScrollBy);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'Lines', @VCLua_Memo_VCLuaGetLines, mfCall);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'HorzScrollBar', @VCLua_Memo_VCLuaGetHorzScrollBar, mfCall);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'VertScrollBar', @VCLua_Memo_VCLuaGetVertScrollBar, mfCall);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'ScrollBars', @VCLua_Memo_VCLuaGetScrollBars, mfCall);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'WantReturns', @VCLua_Memo_VCLuaGetWantReturns, mfCall);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'WantTabs', @VCLua_Memo_VCLuaGetWantTabs, mfCall);
	TLuaMethodInfo.Create(CustomMemoFuncs, 'WordWrap', @VCLua_Memo_VCLuaGetWordWrap, mfCall);
	CustomMemoSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomMemoSets, 'Lines', @VCLua_Memo_VCLuaSetLines, mfCall);
	TLuaMethodInfo.Create(CustomMemoSets, 'HorzScrollBar', @VCLua_Memo_VCLuaSetHorzScrollBar, mfCall);
	TLuaMethodInfo.Create(CustomMemoSets, 'VertScrollBar', @VCLua_Memo_VCLuaSetVertScrollBar, mfCall);
	TLuaMethodInfo.Create(CustomMemoSets, 'ScrollBars', @VCLua_Memo_VCLuaSetScrollBars, mfCall);
	TLuaMethodInfo.Create(CustomMemoSets, 'WantReturns', @VCLua_Memo_VCLuaSetWantReturns, mfCall);
	TLuaMethodInfo.Create(CustomMemoSets, 'WantTabs', @VCLua_Memo_VCLuaSetWantTabs, mfCall);
	TLuaMethodInfo.Create(CustomMemoSets, 'WordWrap', @VCLua_Memo_VCLuaSetWordWrap, mfCall);
end.
