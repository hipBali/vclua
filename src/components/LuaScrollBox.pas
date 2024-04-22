(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaScrollBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Forms;

function CreateScrollBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TScrollBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaScrollBox = class(TScrollBox)
    end;
var
    ScrollingWinControlFuncs: TLuaVmt;
    ScrollingWinControlSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Types;

function VCLua_ScrollBox_UpdateScrollbars(L: Plua_State): Integer; cdecl;
var
	lScrollBox:TLuaScrollBox;
begin
	CheckArg(L, 1);
	lScrollBox := TLuaScrollBox(GetLuaObject(L, 1));
	try
		lScrollBox.UpdateScrollbars();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ScrollBox', 'UpdateScrollbars', E.ClassName, E.Message);
	end;
end;

function VCLua_ScrollBox_GetControlClassDefaultSize(L: Plua_State): Integer; cdecl;
var
	lScrollBox:TLuaScrollBox;
	ret:TSize;
begin
	CheckArg(L, 1);
	lScrollBox := TLuaScrollBox(GetLuaObject(L, 1));
	try
		ret := lScrollBox.GetControlClassDefaultSize();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ScrollBox', 'GetControlClassDefaultSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ScrollBox_ScrollInView(L: Plua_State): Integer; cdecl;
var
	lScrollBox:TLuaScrollBox;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lScrollBox := TLuaScrollBox(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lScrollBox.ScrollInView(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ScrollBox', 'ScrollInView', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TScrollBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TScrollingWinControl',v);
end;
function CreateScrollBox(L: Plua_State): Integer; cdecl;
var
	lScrollBox:TLuaScrollBox;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lScrollBox := TLuaScrollBox.Create(Parent);
	lScrollBox.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TScrollingWinControl',lScrollBox);
	InitControl(L,lScrollBox,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'ScrollBox', E.ClassName, E.Message);
	end;
end;

begin
	ScrollingWinControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(ScrollingWinControlFuncs, 'UpdateScrollbars', @VCLua_ScrollBox_UpdateScrollbars);
	TLuaMethodInfo.Create(ScrollingWinControlFuncs, 'GetControlClassDefaultSize', @VCLua_ScrollBox_GetControlClassDefaultSize);
	TLuaMethodInfo.Create(ScrollingWinControlFuncs, 'ScrollInView', @VCLua_ScrollBox_ScrollInView);
	ScrollingWinControlSets := TLuaVmt.Create;
	
end.
