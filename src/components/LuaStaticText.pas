(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStaticText;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateStaticText(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStaticText; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStaticText = class(TStaticText)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomStaticTextFuncs: TLuaVmt;
    CustomStaticTextSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_StaticText_VCLuaSetAlignment(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	val:TAlignment;
begin
	CheckArg(L, 2);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAlignment));
	try
		lStaticText.Alignment := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'Alignment', E.ClassName, E.Message);
	end;
end;

function VCLua_StaticText_VCLuaGetAlignment(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	ret:TAlignment;
begin
	CheckArg(L, 1);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	try
		ret := lStaticText.Alignment;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'Alignment', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_StaticText_VCLuaSetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	val:TStaticBorderStyle;
begin
	CheckArg(L, 2);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TStaticBorderStyle));
	try
		lStaticText.BorderStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'BorderStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_StaticText_VCLuaGetBorderStyle(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	ret:TStaticBorderStyle;
begin
	CheckArg(L, 1);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	try
		ret := lStaticText.BorderStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'BorderStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_StaticText_VCLuaSetFocusControl(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	val:TWinControl;
begin
	CheckArg(L, 2);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lStaticText.FocusControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'FocusControl', E.ClassName, E.Message);
	end;
end;

function VCLua_StaticText_VCLuaGetFocusControl(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	ret:TWinControl;
begin
	CheckArg(L, 1);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	try
		ret := lStaticText.FocusControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'FocusControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_StaticText_VCLuaSetShowAccelChar(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	val:boolean;
begin
	CheckArg(L, 2);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lStaticText.ShowAccelChar := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'ShowAccelChar', E.ClassName, E.Message);
	end;
end;

function VCLua_StaticText_VCLuaGetShowAccelChar(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	ret:boolean;
begin
	CheckArg(L, 1);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	try
		ret := lStaticText.ShowAccelChar;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'ShowAccelChar', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_StaticText_VCLuaSetTransparent(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	val:Boolean;
begin
	CheckArg(L, 2);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lStaticText.Transparent := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'Transparent', E.ClassName, E.Message);
	end;
end;

function VCLua_StaticText_VCLuaGetTransparent(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lStaticText := TLuaStaticText(GetLuaObject(L, 1));
	try
		ret := lStaticText.Transparent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'StaticText', 'Transparent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TStaticText; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomStaticText',v);
end;
function CreateStaticText(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lStaticText := TLuaStaticText.Create(Parent);
	lStaticText.Parent := TWinControl(Parent);
	lStaticText.LuaCtl := TVCLuaControl.Create(lStaticText as TComponent,L,nil,'TCustomStaticText');
	CreateTableForKnownType(L,'TCustomStaticText',lStaticText);
	InitControl(L,lStaticText,Name);
	Result := 1;
end;

begin
	CustomStaticTextFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomStaticTextFuncs, 'Alignment', @VCLua_StaticText_VCLuaGetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextFuncs, 'BorderStyle', @VCLua_StaticText_VCLuaGetBorderStyle, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextFuncs, 'FocusControl', @VCLua_StaticText_VCLuaGetFocusControl, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextFuncs, 'ShowAccelChar', @VCLua_StaticText_VCLuaGetShowAccelChar, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextFuncs, 'Transparent', @VCLua_StaticText_VCLuaGetTransparent, mfCall);
	CustomStaticTextSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomStaticTextSets, 'Alignment', @VCLua_StaticText_VCLuaSetAlignment, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextSets, 'BorderStyle', @VCLua_StaticText_VCLuaSetBorderStyle, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextSets, 'FocusControl', @VCLua_StaticText_VCLuaSetFocusControl, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextSets, 'ShowAccelChar', @VCLua_StaticText_VCLuaSetShowAccelChar, mfCall);
	TLuaMethodInfo.Create(CustomStaticTextSets, 'Transparent', @VCLua_StaticText_VCLuaSetTransparent, mfCall);
end.
