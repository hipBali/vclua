(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaImageList;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ImgList, Controls, TypInfo, LuaVmt;

function CreateImageList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TImageList; pti: PTypeInfo = nil); overload; inline;

type
    TLuaImageList = class(TImageList)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomImageListFuncs: TLuaVmt;
    CustomImageListSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, GraphType, Graphics, Types;

function VCLua_ImageList_AssignTo(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Dest:TPersistent;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Dest);
	try
		lImageList.AssignTo(Dest);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AssignTo', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Assign(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Source);
	try
		lImageList.Assign(Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_WriteData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lImageList.WriteData(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'WriteData', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_ReadData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lImageList.ReadData(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ReadData', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_WriteAdvData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lImageList.WriteAdvData(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'WriteAdvData', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_ReadAdvData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AStream);
	try
		lImageList.ReadAdvData(AStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ReadAdvData', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Equals(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Obj:TObject;
	ret:boolean;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Obj);
	try
		ret := lImageList.Equals(Obj);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Equals', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		lImageList.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		lImageList.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Add(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomBitmap;
	Mask:TCustomBitmap;
	ret:Integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Image);
	luaL_check(L,3,@Mask);
	try
		ret := lImageList.Add(Image,Mask);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_AddSliced(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomBitmap;
	AHorizontalCount:Integer;
	AVerticalCount:Integer;
	ret:Integer;
begin
	CheckArg(L, 4);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Image);
	luaL_check(L,3,@AHorizontalCount);
	luaL_check(L,4,@AVerticalCount);
	try
		ret := lImageList.AddSliced(Image,AHorizontalCount,AVerticalCount);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddSliced', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_AddSlice(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomBitmap;
	AImageRect:TRect;
	ret:Integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Image);
	luaL_check(L,3,@AImageRect);
	try
		ret := lImageList.AddSlice(Image,AImageRect);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddSlice', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_AddSliceCentered(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomBitmap;
	ret:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Image);
	try
		ret := lImageList.AddSliceCentered(Image);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddSliceCentered', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_AddIcon(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomIcon;
	ret:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Image);
	try
		ret := lImageList.AddIcon(Image);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddIcon', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_AddImages(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AValue:TCustomImageList;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AValue);
	try
		lImageList.AddImages(AValue);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddImages', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_AddMasked(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TBitmap;
	MaskColor:TColor;
	ret:Integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Image);
	luaL_check(L,3,@MaskColor);
	try
		ret := lImageList.AddMasked(Image,MaskColor);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddMasked', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_AddLazarusResource(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ResourceName:string;
	MaskColor:TColor;
	ret:integer;
begin
	CheckArg(L, 2, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ResourceName);
	TTrait<TColor>.luaL_optcheck(L, 3, @MaskColor, clNone);
	try
		ret := lImageList.AddLazarusResource(ResourceName,MaskColor);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddLazarusResource', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_AddResourceName(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Instance:THandle;
	ResourceName:string;
	MaskColor:TColor;
	ret:integer;
begin
	CheckArg(L, 3, 4);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Instance);
	luaL_check(L,3,@ResourceName);
	TTrait<TColor>.luaL_optcheck(L, 4, @MaskColor, clNone);
	try
		ret := lImageList.AddResourceName(Instance,ResourceName,MaskColor);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AddResourceName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_Change(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		lImageList.Change();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Change', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Clear(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		lImageList.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Delete(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	try
		lImageList.Delete(AIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Draw(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	AEnabled:Boolean;
begin
	CheckArg(L, 5, 6);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	TTrait<Boolean>.luaL_optcheck(L, 6, @AEnabled, True);
	try
		lImageList.Draw(ACanvas,AX,AY,AIndex,AEnabled);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Draw', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Draw2(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	ADrawEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 6);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@ADrawEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.Draw(ACanvas,AX,AY,AIndex,ADrawEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Draw', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Draw3(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	ADrawingStyle:TDrawingStyle;
	AImageType:TImageType;
	AEnabled:Boolean;
begin
	CheckArg(L, 7, 8);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@ADrawingStyle,TypeInfo(TDrawingStyle));
	luaL_check(L,7,@AImageType,TypeInfo(TImageType));
	TTrait<Boolean>.luaL_optcheck(L, 8, @AEnabled, True);
	try
		lImageList.Draw(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,AEnabled);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Draw', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Draw4(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	ADrawingStyle:TDrawingStyle;
	AImageType:TImageType;
	ADrawEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 8);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@ADrawingStyle,TypeInfo(TDrawingStyle));
	luaL_check(L,7,@AImageType,TypeInfo(TImageType));
	luaL_check(L,8,@ADrawEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.Draw(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,ADrawEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Draw', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_DrawForPPI(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	AImageWidthAt96PPI:Integer;
	ATargetPPI:Integer;
	ACanvasFactor:Double;
	AEnabled:Boolean;
begin
	CheckArg(L, 8, 9);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@AImageWidthAt96PPI);
	luaL_check(L,7,@ATargetPPI);
	luaL_check(L,8,@ACanvasFactor);
	TTrait<Boolean>.luaL_optcheck(L, 9, @AEnabled, True);
	try
		lImageList.DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,AEnabled);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DrawForPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_DrawForPPI2(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	AImageWidthAt96PPI:Integer;
	ATargetPPI:Integer;
	ACanvasFactor:Double;
	ADrawEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 9);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@AImageWidthAt96PPI);
	luaL_check(L,7,@ATargetPPI);
	luaL_check(L,8,@ACanvasFactor);
	luaL_check(L,9,@ADrawEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,ADrawEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DrawForPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_DrawOverlay(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	AOverlay:TOverlay;
	AEnabled:Boolean;
begin
	CheckArg(L, 6, 7);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@AOverlay);
	TTrait<Boolean>.luaL_optcheck(L, 7, @AEnabled, True);
	try
		lImageList.DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,AEnabled);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DrawOverlay', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_DrawOverlay2(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	AOverlay:TOverlay;
	ADrawEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 7);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@AOverlay);
	luaL_check(L,7,@ADrawEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,ADrawEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DrawOverlay', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_DrawOverlay3(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACanvas:TCanvas;
	AX:Integer;
	AY:Integer;
	AIndex:Integer;
	AOverlay:TOverlay;
	ADrawingStyle:TDrawingStyle;
	AImageType:TImageType;
	ADrawEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 9);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACanvas);
	luaL_check(L,3,@AX);
	luaL_check(L,4,@AY);
	luaL_check(L,5,@AIndex);
	luaL_check(L,6,@AOverlay);
	luaL_check(L,7,@ADrawingStyle,TypeInfo(TDrawingStyle));
	luaL_check(L,8,@AImageType,TypeInfo(TImageType));
	luaL_check(L,9,@ADrawEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,ADrawingStyle,AImageType,ADrawEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DrawOverlay', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_GetBitmap(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	Image:TCustomBitmap;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@Image);
	try
		lImageList.GetBitmap(Index,Image);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'GetBitmap', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_GetBitmap2(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	Image:TCustomBitmap;
	AEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 4);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@Image);
	luaL_check(L,4,@AEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.GetBitmap(Index,Image,AEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'GetBitmap', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_GetFullBitmap(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomBitmap;
	AEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 2, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Image);
	TTraitPti<TGraphicsDrawEffect>.luaL_optcheck(L, 3, @AEffect, gdeNormal, TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.GetFullBitmap(Image,AEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'GetFullBitmap', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_GetIcon(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	Image:TIcon;
	AEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 4);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@Image);
	luaL_check(L,4,@AEffect,TypeInfo(TGraphicsDrawEffect));
	try
		lImageList.GetIcon(Index,Image,AEffect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'GetIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_GetIcon2(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	Image:TIcon;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@Image);
	try
		lImageList.GetIcon(Index,Image);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'GetIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_GetHotSpot(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.GetHotSpot();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'GetHotSpot', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_Insert(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AImage:TCustomBitmap;
	AMask:TCustomBitmap;
begin
	CheckArg(L, 4);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	luaL_check(L,3,@AImage);
	luaL_check(L,4,@AMask);
	try
		lImageList.Insert(AIndex,AImage,AMask);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Insert', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_InsertIcon(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AIcon:TCustomIcon;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	luaL_check(L,3,@AIcon);
	try
		lImageList.InsertIcon(AIndex,AIcon);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'InsertIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_InsertMasked(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	AImage:TCustomBitmap;
	MaskColor:TColor;
begin
	CheckArg(L, 4);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@AImage);
	luaL_check(L,4,@MaskColor);
	try
		lImageList.InsertMasked(Index,AImage,MaskColor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'InsertMasked', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Move(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACurIndex:Integer;
	ANewIndex:Integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@ACurIndex);
	luaL_check(L,3,@ANewIndex);
	try
		lImageList.Move(ACurIndex,ANewIndex);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Move', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_Overlay(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	Overlay:TOverlay;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	luaL_check(L,3,@Overlay);
	try
		lImageList.Overlay(AIndex,Overlay);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Overlay', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetHasOverlays(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:boolean;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.HasOverlays;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'HasOverlays', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_Replace(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AImage:TCustomBitmap;
	AMask:TCustomBitmap;
	AllResolutions:Boolean;
begin
	CheckArg(L, 4, 5);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	luaL_check(L,3,@AImage);
	luaL_check(L,4,@AMask);
	TTrait<Boolean>.luaL_optcheck(L, 5, @AllResolutions, True);
	try
		lImageList.Replace(AIndex,AImage,AMask,AllResolutions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Replace', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_ReplaceSlice(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	Image:TCustomBitmap;
	AImageRect:TRect;
	AllResolutions:Boolean;
begin
	CheckArg(L, 4, 5);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	luaL_check(L,3,@Image);
	luaL_check(L,4,@AImageRect);
	TTrait<Boolean>.luaL_optcheck(L, 5, @AllResolutions, True);
	try
		lImageList.ReplaceSlice(AIndex,Image,AImageRect,AllResolutions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ReplaceSlice', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_ReplaceSliceCentered(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AImageWidth:Integer;
	Image:TCustomBitmap;
	AllResolutions:Boolean;
begin
	CheckArg(L, 4, 5);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	luaL_check(L,3,@AImageWidth);
	luaL_check(L,4,@Image);
	TTrait<Boolean>.luaL_optcheck(L, 5, @AllResolutions, True);
	try
		lImageList.ReplaceSliceCentered(AIndex,AImageWidth,Image,AllResolutions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ReplaceSliceCentered', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_ReplaceIcon(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AIcon:TCustomIcon;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AIndex);
	luaL_check(L,3,@AIcon);
	try
		lImageList.ReplaceIcon(AIndex,AIcon);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ReplaceIcon', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_ReplaceMasked(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	NewImage:TCustomBitmap;
	MaskColor:TColor;
	AllResolutions:Boolean;
begin
	CheckArg(L, 4, 5);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	luaL_check(L,3,@NewImage);
	luaL_check(L,4,@MaskColor);
	TTrait<Boolean>.luaL_optcheck(L, 5, @AllResolutions, True);
	try
		lImageList.ReplaceMasked(Index,NewImage,MaskColor,AllResolutions);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ReplaceMasked', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_RegisterChanges(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Value:TChangeLink;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Value);
	try
		lImageList.RegisterChanges(Value);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'RegisterChanges', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_StretchDraw(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Canvas:TCanvas;
	Index:Integer;
	ARect:TRect;
	Enabled:Boolean;
begin
	CheckArg(L, 4, 5);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Canvas);
	luaL_check(L,3,@Index);
	luaL_check(L,4,@ARect);
	TTrait<Boolean>.luaL_optcheck(L, 5, @Enabled, True);
	try
		lImageList.StretchDraw(Canvas,Index,ARect,Enabled);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'StretchDraw', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_UnRegisterChanges(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Value:TChangeLink;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@Value);
	try
		lImageList.UnRegisterChanges(Value);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'UnRegisterChanges', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_RegisterResolutions(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AResolutionWidths:array of Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	TTrait<Integer>.luaL_checkArray(L, 2, @AResolutionWidths);
	try
		lImageList.RegisterResolutions(AResolutionWidths);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'RegisterResolutions', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_DeleteResolution(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AWidth:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AWidth);
	try
		lImageList.DeleteResolution(AWidth);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DeleteResolution', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaSetAllocBy(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.AllocBy := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AllocBy', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetAllocBy(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:Integer;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.AllocBy;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'AllocBy', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaSetBlendColor(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:TColor;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.BlendColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'BlendColor', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetBlendColor(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:TColor;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.BlendColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'BlendColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaSetBkColor(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:TColor;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.BkColor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'BkColor', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetBkColor(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:TColor;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.BkColor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'BkColor', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaGetCount(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:Integer;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.Count;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Count', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaSetDrawingStyle(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:TDrawingStyle;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TDrawingStyle));
	try
		lImageList.DrawingStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DrawingStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetDrawingStyle(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:TDrawingStyle;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.DrawingStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'DrawingStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ImageList_VCLuaSetHeight(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.Height := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Height', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:Integer;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Height', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_HeightForPPI(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AImageWidth:Integer;
	APPI:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AImageWidth);
	luaL_check(L,3,@APPI);
	try
		ret := lImageList.HeightForPPI[AImageWidth,APPI];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'HeightForPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_HeightForWidth(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AWidth:Integer;
	ret:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AWidth);
	try
		ret := lImageList.HeightForWidth[AWidth];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'HeightForWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaSetWidth(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.Width := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Width', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetWidth(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:Integer;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.Width;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Width', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_WidthForPPI(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AImageWidth:Integer;
	APPI:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AImageWidth);
	luaL_check(L,3,@APPI);
	try
		ret := lImageList.WidthForPPI[AImageWidth,APPI];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'WidthForPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_SizeForPPI(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AImageWidth:Integer;
	APPI:Integer;
	ret:TSize;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@AImageWidth);
	luaL_check(L,3,@APPI);
	try
		ret := lImageList.SizeForPPI[AImageWidth,APPI];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'SizeForPPI', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaSetMasked(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:boolean;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.Masked := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Masked', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetMasked(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:boolean;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.Masked;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Masked', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaGetResolutionCount(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:Integer;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.ResolutionCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ResolutionCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaSetScaled(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.Scaled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Scaled', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetScaled(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.Scaled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'Scaled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaSetShareImages(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:Boolean;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lImageList.ShareImages := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ShareImages', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetShareImages(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.ShareImages;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ShareImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ImageList_VCLuaSetImageType(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	val:TImageType;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TImageType));
	try
		lImageList.ImageType := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ImageType', E.ClassName, E.Message);
	end;
end;

function VCLua_ImageList_VCLuaGetImageType(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:TImageType;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	try
		ret := lImageList.ImageType;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ImageList', 'ImageType', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TImageList; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomImageList',v);
end;
function CreateImageList(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lImageList := TLuaImageList.Create(Parent);
	// := TWinControl(Parent);
	lImageList.LuaCtl := TVCLuaControl.Create(lImageList as TComponent,L,nil,'TCustomImageList');
	InitControl(L,lImageList,Name);
	CreateTableForKnownType(L,'TCustomImageList',lImageList);
	Result := 1;
end;

begin
	CustomImageListFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AssignTo', @VCLua_ImageList_AssignTo);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Assign', @VCLua_ImageList_Assign);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'WriteData', @VCLua_ImageList_WriteData);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ReadData', @VCLua_ImageList_ReadData);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'WriteAdvData', @VCLua_ImageList_WriteAdvData);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ReadAdvData', @VCLua_ImageList_ReadAdvData);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Equals', @VCLua_ImageList_Equals);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'BeginUpdate', @VCLua_ImageList_BeginUpdate);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'EndUpdate', @VCLua_ImageList_EndUpdate);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Add', @VCLua_ImageList_Add);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddSliced', @VCLua_ImageList_AddSliced);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddSlice', @VCLua_ImageList_AddSlice);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddSliceCentered', @VCLua_ImageList_AddSliceCentered);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddIcon', @VCLua_ImageList_AddIcon);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddImages', @VCLua_ImageList_AddImages);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddMasked', @VCLua_ImageList_AddMasked);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddLazarusResource', @VCLua_ImageList_AddLazarusResource);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AddResourceName', @VCLua_ImageList_AddResourceName);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Change', @VCLua_ImageList_Change);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Clear', @VCLua_ImageList_Clear);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Delete', @VCLua_ImageList_Delete);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Draw', @VCLua_ImageList_Draw);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Draw2', @VCLua_ImageList_Draw2);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Draw3', @VCLua_ImageList_Draw3);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Draw4', @VCLua_ImageList_Draw4);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'DrawForPPI', @VCLua_ImageList_DrawForPPI);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'DrawForPPI2', @VCLua_ImageList_DrawForPPI2);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'DrawOverlay', @VCLua_ImageList_DrawOverlay);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'DrawOverlay2', @VCLua_ImageList_DrawOverlay2);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'DrawOverlay3', @VCLua_ImageList_DrawOverlay3);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'GetBitmap', @VCLua_ImageList_GetBitmap);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'GetBitmap2', @VCLua_ImageList_GetBitmap2);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'GetFullBitmap', @VCLua_ImageList_GetFullBitmap);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'GetIcon', @VCLua_ImageList_GetIcon);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'GetIcon2', @VCLua_ImageList_GetIcon2);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'GetHotSpot', @VCLua_ImageList_GetHotSpot);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Insert', @VCLua_ImageList_Insert);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'InsertIcon', @VCLua_ImageList_InsertIcon);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'InsertMasked', @VCLua_ImageList_InsertMasked);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Move', @VCLua_ImageList_Move);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Overlay', @VCLua_ImageList_Overlay);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'HasOverlays', @VCLua_ImageList_VCLuaGetHasOverlays, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Replace', @VCLua_ImageList_Replace);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ReplaceSlice', @VCLua_ImageList_ReplaceSlice);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ReplaceSliceCentered', @VCLua_ImageList_ReplaceSliceCentered);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ReplaceIcon', @VCLua_ImageList_ReplaceIcon);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ReplaceMasked', @VCLua_ImageList_ReplaceMasked);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'RegisterChanges', @VCLua_ImageList_RegisterChanges);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'StretchDraw', @VCLua_ImageList_StretchDraw);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'UnRegisterChanges', @VCLua_ImageList_UnRegisterChanges);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'RegisterResolutions', @VCLua_ImageList_RegisterResolutions);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'DeleteResolution', @VCLua_ImageList_DeleteResolution);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'AllocBy', @VCLua_ImageList_VCLuaGetAllocBy, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'BlendColor', @VCLua_ImageList_VCLuaGetBlendColor, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'BkColor', @VCLua_ImageList_VCLuaGetBkColor, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Count', @VCLua_ImageList_VCLuaGetCount, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'DrawingStyle', @VCLua_ImageList_VCLuaGetDrawingStyle, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Height', @VCLua_ImageList_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'HeightForPPI', @VCLua_ImageList_HeightForPPI);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'HeightForWidth', @VCLua_ImageList_HeightForWidth);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Width', @VCLua_ImageList_VCLuaGetWidth, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'WidthForPPI', @VCLua_ImageList_WidthForPPI);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'SizeForPPI', @VCLua_ImageList_SizeForPPI);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Masked', @VCLua_ImageList_VCLuaGetMasked, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ResolutionCount', @VCLua_ImageList_VCLuaGetResolutionCount, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'Scaled', @VCLua_ImageList_VCLuaGetScaled, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ShareImages', @VCLua_ImageList_VCLuaGetShareImages, mfCall);
	TLuaMethodInfo.Create(CustomImageListFuncs, 'ImageType', @VCLua_ImageList_VCLuaGetImageType, mfCall);
	CustomImageListSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomImageListSets, 'AllocBy', @VCLua_ImageList_VCLuaSetAllocBy, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'BlendColor', @VCLua_ImageList_VCLuaSetBlendColor, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'BkColor', @VCLua_ImageList_VCLuaSetBkColor, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'DrawingStyle', @VCLua_ImageList_VCLuaSetDrawingStyle, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'Height', @VCLua_ImageList_VCLuaSetHeight, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'Width', @VCLua_ImageList_VCLuaSetWidth, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'Masked', @VCLua_ImageList_VCLuaSetMasked, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'Scaled', @VCLua_ImageList_VCLuaSetScaled, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'ShareImages', @VCLua_ImageList_VCLuaSetShareImages, mfCall);
	TLuaMethodInfo.Create(CustomImageListSets, 'ImageType', @VCLua_ImageList_VCLuaSetImageType, mfCall);
end.
