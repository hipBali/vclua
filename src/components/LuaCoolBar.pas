(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCoolBar;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, ComCtrls, TypInfo, LuaVmt;

function CreateCoolBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCoolBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCoolBar = class(TCoolBar)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomCoolBarFuncs: TLuaVmt;
    CustomCoolBarSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, Graphics, ImgList, LuaBitmap, LuaImageList;

function VCLua_CoolBar_AutosizeBands(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		lCoolBar.AutosizeBands();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'AutosizeBands', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		lCoolBar.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_Invalidate(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		lCoolBar.Invalidate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Invalidate', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_InsertControl(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
	Index:integer;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	luaL_check(L,3,@Index);
	try
		lCoolBar.InsertControl(AControl,Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'InsertControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_MouseToBandPos(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	X:Integer;
	Y:Integer;
	ABand:Integer;
	AGrabber:Boolean;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		lCoolBar.MouseToBandPos(X,Y,ABand,AGrabber);
		Result := 2;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'MouseToBandPos', E.ClassName, E.Message);
	end;
	lua_push(L,ABand);
	lua_push(L,AGrabber);
end;

function VCLua_CoolBar_RemoveControl(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lCoolBar.RemoveControl(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'RemoveControl', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaSetBandBorderStyle(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:TBorderStyle;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TBorderStyle));
	try
		lCoolBar.BandBorderStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'BandBorderStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetBandBorderStyle(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:TBorderStyle;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.BandBorderStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'BandBorderStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CoolBar_VCLuaSetBandMaximize(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:TCoolBandMaximize;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TCoolBandMaximize));
	try
		lCoolBar.BandMaximize := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'BandMaximize', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetBandMaximize(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:TCoolBandMaximize;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.BandMaximize;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'BandMaximize', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CoolBar_VCLuaSetBitmap(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:TBitmap;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.Bitmap := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Bitmap', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetBitmap(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:TBitmap;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.Bitmap;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Bitmap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetFixedSize(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Boolean;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.FixedSize := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'FixedSize', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetFixedSize(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.FixedSize;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'FixedSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetFixedOrder(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Boolean;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.FixedOrder := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'FixedOrder', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetFixedOrder(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.FixedOrder;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'FixedOrder', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetGrabStyle(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:TGrabStyle;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TGrabStyle));
	try
		lCoolBar.GrabStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'GrabStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetGrabStyle(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:TGrabStyle;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.GrabStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'GrabStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CoolBar_VCLuaSetGrabWidth(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.GrabWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'GrabWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetGrabWidth(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.GrabWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'GrabWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetHorizontalSpacing(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.HorizontalSpacing := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'HorizontalSpacing', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetHorizontalSpacing(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.HorizontalSpacing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'HorizontalSpacing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetImages(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:TCustomImageList;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.Images := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Images', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetImages(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:TCustomImageList;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.Images;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Images', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_CoolBar_VCLuaSetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.ImagesWidth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'ImagesWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetImagesWidth(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.ImagesWidth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'ImagesWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetShowText(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Boolean;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.ShowText := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'ShowText', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetShowText(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.ShowText;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'ShowText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetThemed(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Boolean;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.Themed := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Themed', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetThemed(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.Themed;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Themed', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetVertical(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Boolean;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.Vertical := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Vertical', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetVertical(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.Vertical;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'Vertical', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CoolBar_VCLuaSetVerticalSpacing(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lCoolBar.VerticalSpacing := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'VerticalSpacing', E.ClassName, E.Message);
	end;
end;

function VCLua_CoolBar_VCLuaGetVerticalSpacing(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	try
		ret := lCoolBar.VerticalSpacing;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CoolBar', 'VerticalSpacing', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TCoolBar; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCoolBar',v);
end;
function CreateCoolBar(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCoolBar := TLuaCoolBar.Create(Parent);
	lCoolBar.Parent := TWinControl(Parent);
	lCoolBar.LuaCtl := TVCLuaControl.Create(lCoolBar as TComponent,L,nil,'TCustomCoolBar');
	InitControl(L,lCoolBar,Name);
	CreateTableForKnownType(L,'TCustomCoolBar',lCoolBar);
	Result := 1;
end;

begin
	CustomCoolBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'AutosizeBands', @VCLua_CoolBar_AutosizeBands);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'EndUpdate', @VCLua_CoolBar_EndUpdate);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'Invalidate', @VCLua_CoolBar_Invalidate);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'InsertControl', @VCLua_CoolBar_InsertControl);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'MouseToBandPos', @VCLua_CoolBar_MouseToBandPos);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'RemoveControl', @VCLua_CoolBar_RemoveControl);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'BandBorderStyle', @VCLua_CoolBar_VCLuaGetBandBorderStyle, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'BandMaximize', @VCLua_CoolBar_VCLuaGetBandMaximize, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'Bitmap', @VCLua_CoolBar_VCLuaGetBitmap, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'FixedSize', @VCLua_CoolBar_VCLuaGetFixedSize, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'FixedOrder', @VCLua_CoolBar_VCLuaGetFixedOrder, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'GrabStyle', @VCLua_CoolBar_VCLuaGetGrabStyle, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'GrabWidth', @VCLua_CoolBar_VCLuaGetGrabWidth, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'HorizontalSpacing', @VCLua_CoolBar_VCLuaGetHorizontalSpacing, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'Images', @VCLua_CoolBar_VCLuaGetImages, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'ImagesWidth', @VCLua_CoolBar_VCLuaGetImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'ShowText', @VCLua_CoolBar_VCLuaGetShowText, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'Themed', @VCLua_CoolBar_VCLuaGetThemed, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'Vertical', @VCLua_CoolBar_VCLuaGetVertical, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarFuncs, 'VerticalSpacing', @VCLua_CoolBar_VCLuaGetVerticalSpacing, mfCall);
	CustomCoolBarSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomCoolBarSets, 'BandBorderStyle', @VCLua_CoolBar_VCLuaSetBandBorderStyle, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'BandMaximize', @VCLua_CoolBar_VCLuaSetBandMaximize, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'Bitmap', @VCLua_CoolBar_VCLuaSetBitmap, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'FixedSize', @VCLua_CoolBar_VCLuaSetFixedSize, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'FixedOrder', @VCLua_CoolBar_VCLuaSetFixedOrder, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'GrabStyle', @VCLua_CoolBar_VCLuaSetGrabStyle, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'GrabWidth', @VCLua_CoolBar_VCLuaSetGrabWidth, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'HorizontalSpacing', @VCLua_CoolBar_VCLuaSetHorizontalSpacing, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'Images', @VCLua_CoolBar_VCLuaSetImages, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'ImagesWidth', @VCLua_CoolBar_VCLuaSetImagesWidth, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'ShowText', @VCLua_CoolBar_VCLuaSetShowText, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'Themed', @VCLua_CoolBar_VCLuaSetThemed, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'Vertical', @VCLua_CoolBar_VCLuaSetVertical, mfCall);
	TLuaMethodInfo.Create(CustomCoolBarSets, 'VerticalSpacing', @VCLua_CoolBar_VCLuaSetVerticalSpacing, mfCall);
end.
