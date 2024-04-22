(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorListBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ColorBox;

function CreateColorListBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorListBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorListBox = class(TColorListBox)
    end;
var
    CustomColorListBoxFuncs: TLuaVmt;
    CustomColorListBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Dialogs, Graphics, LuaColorBoxEvents, LuaCommonDialogs, LuaEvent;

function VCLua_ColorListBox_VCLuaSetColorRectWidth(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	val:Integer;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lColorListBox.ColorRectWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'SetColorRectWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_VCLuaGetColorRectWidth(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	ret:Integer;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lColorListBox.ColorRectWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'GetColorRectWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorListBox_VCLuaSetColorRectOffset(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	val:Integer;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lColorListBox.ColorRectOffset := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'SetColorRectOffset', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_VCLuaGetColorRectOffset(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	ret:Integer;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lColorListBox.ColorRectOffset;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'GetColorRectOffset', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorListBox_Colors(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	Index:Integer;
	ret:TColor;
begin
	CheckArg(L, 2, 3);
	lColorListBox := TLuaColorListBox(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lColorListBox.Colors[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			ret := luaL_checkColor(L,3);
			lColorListBox.Colors[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'Colors', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_ColorNames(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2);
	lColorListBox := TLuaColorListBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lColorListBox.ColorNames[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'ColorNames', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_VCLuaSetSelected(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	val:TColor;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lColorListBox.Selected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'SetSelected', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_VCLuaGetSelected(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	ret:TColor;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lColorListBox.Selected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'GetSelected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorListBox_VCLuaSetDefaultColorColor(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	val:TColor;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lColorListBox.DefaultColorColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'SetDefaultColorColor', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_VCLuaGetDefaultColorColor(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	ret:TColor;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lColorListBox.DefaultColorColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'GetDefaultColorColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorListBox_VCLuaSetNoneColorColor(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	val:TColor;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	val := luaL_checkColor(L,2);
	try
		lColorListBox.NoneColorColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'SetNoneColorColor', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_VCLuaGetNoneColorColor(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	ret:TColor;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lColorListBox.NoneColorColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'GetNoneColorColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorListBox_VCLuaSetOnGetColors(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lColorListBox.OnGetColors));
	lColorListBox.OnGetColors := TLuaEvent.Factory<TLBGetColorsEvent,TLuaLBGetColorsEvent>(L);
	Result := 0;
end;

function VCLua_ColorListBox_VCLuaSetColorDialog(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	val:TColorDialog;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lColorListBox.ColorDialog := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'SetColorDialog', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorListBox_VCLuaGetColorDialog(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	ret:TColorDialog;
begin
	lColorListBox := TLuaColorListBox(GetLuaObjectUnsafe(L, 1));
	try
		ret := lColorListBox.ColorDialog;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorListBox', 'GetColorDialog', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TColorListBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomColorListBox',v);
end;
function CreateColorListBox(L: Plua_State): Integer; cdecl;
var
	lColorListBox:TLuaColorListBox;
	Parent:TWinControl;
	Name:String;
begin
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lColorListBox := TLuaColorListBox.Create(Parent);
	lColorListBox.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomColorListBox',lColorListBox);
	InitControl(L,lColorListBox,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'ColorListBox', E.ClassName, E.Message);
	end;
end;

begin
	CustomColorListBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'ColorRectWidth', @VCLua_ColorListBox_VCLuaGetColorRectWidth, mfCall);
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'ColorRectOffset', @VCLua_ColorListBox_VCLuaGetColorRectOffset, mfCall);
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'Colors', @VCLua_ColorListBox_Colors);
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'ColorNames', @VCLua_ColorListBox_ColorNames);
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'Selected', @VCLua_ColorListBox_VCLuaGetSelected, mfCall);
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'DefaultColorColor', @VCLua_ColorListBox_VCLuaGetDefaultColorColor, mfCall);
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'NoneColorColor', @VCLua_ColorListBox_VCLuaGetNoneColorColor, mfCall);
	TLuaMethodInfo.Create(CustomColorListBoxFuncs, 'ColorDialog', @VCLua_ColorListBox_VCLuaGetColorDialog, mfCall);
	CustomColorListBoxSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomColorListBoxSets, 'ColorRectWidth', @VCLua_ColorListBox_VCLuaSetColorRectWidth, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomColorListBoxSets, 'ColorRectOffset', @VCLua_ColorListBox_VCLuaSetColorRectOffset, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CustomColorListBoxSets, 'Selected', @VCLua_ColorListBox_VCLuaSetSelected, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomColorListBoxSets, 'DefaultColorColor', @VCLua_ColorListBox_VCLuaSetDefaultColorColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomColorListBoxSets, 'NoneColorColor', @VCLua_ColorListBox_VCLuaSetNoneColorColor, mfCall, TypeInfo(TColor));
	TLuaMethodInfo.Create(CustomColorListBoxSets, 'OnGetColors', @VCLua_ColorListBox_VCLuaSetOnGetColors, mfCall, TypeInfo(TLBGetColorsEvent));
	TLuaMethodInfo.Create(CustomColorListBoxSets, 'ColorDialog', @VCLua_ColorListBox_VCLuaSetColorDialog, mfCall, TypeInfo(TColorDialog));
end.
