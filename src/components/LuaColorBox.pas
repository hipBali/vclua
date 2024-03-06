(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaColorBox;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ColorBox;

function CreateColorBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TColorBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaColorBox = class(TColorBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomColorBoxFuncs: TLuaVmt;
    CustomColorBoxSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Dialogs, Graphics, LuaColorBoxEvents, LuaCommonDialogs, LuaEvent;

function VCLua_ColorBox_VCLuaSetColorRectWidth(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	val:Integer;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lColorBox.ColorRectWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorRectWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_VCLuaGetColorRectWidth(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	try
		ret := lColorBox.ColorRectWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorRectWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorBox_VCLuaSetColorRectOffset(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	val:Integer;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lColorBox.ColorRectOffset := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorRectOffset', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_VCLuaGetColorRectOffset(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	ret:Integer;
begin
	CheckArg(L, 1);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	try
		ret := lColorBox.ColorRectOffset;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorRectOffset', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorBox_Colors(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	Index:Integer;
	ret:TColor;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lColorBox.Colors[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'Colors', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_ColorNames(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	Index:Integer;
	ret:string;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lColorBox.ColorNames[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorNames', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_VCLuaSetSelected(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	val:TColor;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lColorBox.Selected := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'Selected', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_VCLuaGetSelected(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	ret:TColor;
begin
	CheckArg(L, 1);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	try
		ret := lColorBox.Selected;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'Selected', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorBox_VCLuaSetDefaultColorColor(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	val:TColor;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lColorBox.DefaultColorColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'DefaultColorColor', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_VCLuaGetDefaultColorColor(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	ret:TColor;
begin
	CheckArg(L, 1);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	try
		ret := lColorBox.DefaultColorColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'DefaultColorColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorBox_VCLuaSetNoneColorColor(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	val:TColor;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lColorBox.NoneColorColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'NoneColorColor', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_VCLuaGetNoneColorColor(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	ret:TColor;
begin
	CheckArg(L, 1);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	try
		ret := lColorBox.NoneColorColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'NoneColorColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ColorBox_VCLuaSetOnGetColors(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lColorBox.OnGetColors));
	lColorBox.OnGetColors := TLuaEvent.Factory<TGetColorsEvent,TLuaGetColorsEvent>(L);
	Result := 0;
end;

function VCLua_ColorBox_VCLuaSetColorDialog(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	val:TcolorDialog;
begin
	CheckArg(L, 2);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lColorBox.ColorDialog := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorDialog', E.ClassName, E.Message);
	end;
end;

function VCLua_ColorBox_VCLuaGetColorDialog(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	ret:TcolorDialog;
begin
	CheckArg(L, 1);
	lColorBox := TLuaColorBox(GetLuaObject(L, 1));
	try
		ret := lColorBox.ColorDialog;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ColorBox', 'ColorDialog', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TColorBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomColorBox',v);
end;
function CreateColorBox(L: Plua_State): Integer; cdecl;
var
	lColorBox:TLuaColorBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lColorBox := TLuaColorBox.Create(Parent);
	lColorBox.Parent := TWinControl(Parent);
	lColorBox.LuaCtl := TVCLuaControl.Create(lColorBox as TComponent,L,nil,'TCustomColorBox');
	CreateTableForKnownType(L,'TCustomColorBox',lColorBox);
	InitControl(L,lColorBox,Name);
	Result := 1;
end;

begin
	CustomColorBoxFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'ColorRectWidth', @VCLua_ColorBox_VCLuaGetColorRectWidth, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'ColorRectOffset', @VCLua_ColorBox_VCLuaGetColorRectOffset, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'Colors', @VCLua_ColorBox_Colors);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'ColorNames', @VCLua_ColorBox_ColorNames);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'Selected', @VCLua_ColorBox_VCLuaGetSelected, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'DefaultColorColor', @VCLua_ColorBox_VCLuaGetDefaultColorColor, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'NoneColorColor', @VCLua_ColorBox_VCLuaGetNoneColorColor, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxFuncs, 'ColorDialog', @VCLua_ColorBox_VCLuaGetColorDialog, mfCall);
	CustomColorBoxSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomColorBoxSets, 'ColorRectWidth', @VCLua_ColorBox_VCLuaSetColorRectWidth, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxSets, 'ColorRectOffset', @VCLua_ColorBox_VCLuaSetColorRectOffset, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxSets, 'Selected', @VCLua_ColorBox_VCLuaSetSelected, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxSets, 'DefaultColorColor', @VCLua_ColorBox_VCLuaSetDefaultColorColor, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxSets, 'NoneColorColor', @VCLua_ColorBox_VCLuaSetNoneColorColor, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxSets, 'OnGetColors', @VCLua_ColorBox_VCLuaSetOnGetColors, mfCall);
	TLuaMethodInfo.Create(CustomColorBoxSets, 'ColorDialog', @VCLua_ColorBox_VCLuaSetColorDialog, mfCall);
end.
