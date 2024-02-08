(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaImageList;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ImgList, Controls, Graphics, GraphType, TypInfo;

function CreateImageList(L: Plua_State): Integer; cdecl;
function IsImageList(L: Plua_State): Integer; cdecl;
function AsImageList(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TImageList; pti: PTypeInfo = nil); overload; inline;
procedure ImageListToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaImageList = class(TImageList)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomImageListFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_ImageList_AssignTo(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Dest:TPersistent;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Dest := TPersistent(GetLuaObject(L,2));
	lImageList.AssignTo(Dest);
	
	Result := 0;
end;

function VCLua_ImageList_Assign(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lImageList.Assign(Source);
	
	Result := 0;
end;

function VCLua_ImageList_WriteData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	lImageList.WriteData(AStream);
	
	Result := 0;
end;

function VCLua_ImageList_ReadData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	lImageList.ReadData(AStream);
	
	Result := 0;
end;

function VCLua_ImageList_WriteAdvData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	lImageList.WriteAdvData(AStream);
	
	Result := 0;
end;

function VCLua_ImageList_ReadAdvData(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AStream:TStream;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	lImageList.ReadAdvData(AStream);
	
	Result := 0;
end;

function VCLua_ImageList_Equals(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Obj:TObject;
	ret:boolean;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Obj := TObject(GetLuaObject(L,2));
	ret := lImageList.Equals(Obj);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ImageList_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	lImageList.BeginUpdate();
	
	Result := 0;
end;

function VCLua_ImageList_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	lImageList.EndUpdate();
	
	Result := 0;
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
	Image := TCustomBitmap(GetLuaObject(L,2));
	Mask := TCustomBitmap(GetLuaObject(L,3));
	ret := lImageList.Add(Image,Mask);
	lua_push(L,ret);
	
	Result := 1;
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
	Image := TCustomBitmap(GetLuaObject(L,2));
	AHorizontalCount := lua_tointeger(L,3);
	AVerticalCount := lua_tointeger(L,4);
	ret := lImageList.AddSliced(Image,AHorizontalCount,AVerticalCount);
	lua_push(L,ret);
	
	Result := 1;
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
	Image := TCustomBitmap(GetLuaObject(L,2));
	AImageRect := lua_toTRect(L,3);
	ret := lImageList.AddSlice(Image,AImageRect);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ImageList_AddSliceCentered(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomBitmap;
	ret:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Image := TCustomBitmap(GetLuaObject(L,2));
	ret := lImageList.AddSliceCentered(Image);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ImageList_AddIcon(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomIcon;
	ret:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Image := TCustomIcon(GetLuaObject(L,2));
	ret := lImageList.AddIcon(Image);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ImageList_AddImages(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AValue:TCustomImageList;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AValue := TCustomImageList(GetLuaObject(L,2));
	lImageList.AddImages(AValue);
	
	Result := 0;
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
	Image := TBitmap(GetLuaObject(L,2));
	MaskColor := TColor(lua_tointeger(L,3));
	ret := lImageList.AddMasked(Image,MaskColor);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ImageList_AddLazarusResource(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ResourceName:string;
	MaskColor:TColor;
	ret:integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ResourceName := lua_toStringCP(L,2);
	MaskColor := TColor(lua_tointeger(L,3));
	ret := lImageList.AddLazarusResource(ResourceName,MaskColor);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ImageList_AddResourceName(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Instance:THandle;
	ResourceName:string;
	MaskColor:TColor;
	ret:integer;
begin
	CheckArg(L, 4);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Instance := THandle(lua_tointeger(L,2));
	ResourceName := lua_toStringCP(L,3);
	MaskColor := TColor(lua_tointeger(L,4));
	ret := lImageList.AddResourceName(Instance,ResourceName,MaskColor);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_ImageList_Change(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	lImageList.Change();
	
	Result := 0;
end;

function VCLua_ImageList_Clear(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	lImageList.Clear();
	
	Result := 0;
end;

function VCLua_ImageList_Delete(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	lImageList.Delete(AIndex);
	
	Result := 0;
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
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	AEnabled := luaL_optbool(L,6,True);
	lImageList.Draw(ACanvas,AX,AY,AIndex,AEnabled);
	
	Result := 0;
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
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	ADrawEffect := TGraphicsDrawEffect(GetLuaObject(L,6));
	lImageList.Draw(ACanvas,AX,AY,AIndex,ADrawEffect);
	
	Result := 0;
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
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	ADrawingStyle := TDrawingStyle(GetLuaObject(L,6));
	AImageType := TImageType(GetLuaObject(L,7));
	AEnabled := luaL_optbool(L,8,True);
	lImageList.Draw(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,AEnabled);
	
	Result := 0;
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
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	ADrawingStyle := TDrawingStyle(GetLuaObject(L,6));
	AImageType := TImageType(GetLuaObject(L,7));
	ADrawEffect := TGraphicsDrawEffect(GetLuaObject(L,8));
	lImageList.Draw(ACanvas,AX,AY,AIndex,ADrawingStyle,AImageType,ADrawEffect);
	
	Result := 0;
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
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	AImageWidthAt96PPI := lua_tointeger(L,6);
	ATargetPPI := lua_tointeger(L,7);
	ACanvasFactor := lua_tonumber(L,8);
	AEnabled := luaL_optbool(L,9,True);
	lImageList.DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,AEnabled);
	
	Result := 0;
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
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	AImageWidthAt96PPI := lua_tointeger(L,6);
	ATargetPPI := lua_tointeger(L,7);
	ACanvasFactor := lua_tonumber(L,8);
	ADrawEffect := TGraphicsDrawEffect(GetLuaObject(L,9));
	lImageList.DrawForPPI(ACanvas,AX,AY,AIndex,AImageWidthAt96PPI,ATargetPPI,ACanvasFactor,ADrawEffect);
	
	Result := 0;
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
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	AOverlay := lua_tointeger(L,6);
	AEnabled := luaL_optbool(L,7,True);
	lImageList.DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,AEnabled);
	
	Result := 0;
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
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	AOverlay := lua_tointeger(L,6);
	ADrawEffect := TGraphicsDrawEffect(GetLuaObject(L,7));
	lImageList.DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,ADrawEffect);
	
	Result := 0;
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
	ACanvas := TCanvas(GetLuaObject(L,2));
	AX := lua_tointeger(L,3);
	AY := lua_tointeger(L,4);
	AIndex := lua_tointeger(L,5);
	AOverlay := lua_tointeger(L,6);
	ADrawingStyle := TDrawingStyle(GetLuaObject(L,7));
	AImageType := TImageType(GetLuaObject(L,8));
	ADrawEffect := TGraphicsDrawEffect(GetLuaObject(L,9));
	lImageList.DrawOverlay(ACanvas,AX,AY,AIndex,AOverlay,ADrawingStyle,AImageType,ADrawEffect);
	
	Result := 0;
end;

function VCLua_ImageList_GetBitmap(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	Image:TCustomBitmap;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	Image := TCustomBitmap(GetLuaObject(L,3));
	lImageList.GetBitmap(Index,Image);
	
	Result := 0;
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
	Index := lua_tointeger(L,2);
	Image := TCustomBitmap(GetLuaObject(L,3));
	AEffect := TGraphicsDrawEffect(GetLuaObject(L,4));
	lImageList.GetBitmap(Index,Image,AEffect);
	
	Result := 0;
end;

function VCLua_ImageList_GetFullBitmap(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Image:TCustomBitmap;
	AEffect:TGraphicsDrawEffect;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Image := TCustomBitmap(GetLuaObject(L,2));
	AEffect := TGraphicsDrawEffect(GetLuaObject(L,3));
	lImageList.GetFullBitmap(Image,AEffect);
	
	Result := 0;
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
	Index := lua_tointeger(L,2);
	Image := TIcon(GetLuaObject(L,3));
	AEffect := TGraphicsDrawEffect(GetLuaObject(L,4));
	lImageList.GetIcon(Index,Image,AEffect);
	
	Result := 0;
end;

function VCLua_ImageList_GetIcon2(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	Image:TIcon;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	Image := TIcon(GetLuaObject(L,3));
	lImageList.GetIcon(Index,Image);
	
	Result := 0;
end;

function VCLua_ImageList_GetHotSpot(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ret:TPoint;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ret := lImageList.GetHotSpot();
	lua_push(L,ret);
	
	Result := 1;
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
	AIndex := lua_tointeger(L,2);
	AImage := TCustomBitmap(GetLuaObject(L,3));
	AMask := TCustomBitmap(GetLuaObject(L,4));
	lImageList.Insert(AIndex,AImage,AMask);
	
	Result := 0;
end;

function VCLua_ImageList_InsertIcon(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AIcon:TCustomIcon;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	AIcon := TCustomIcon(GetLuaObject(L,3));
	lImageList.InsertIcon(AIndex,AIcon);
	
	Result := 0;
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
	Index := lua_tointeger(L,2);
	AImage := TCustomBitmap(GetLuaObject(L,3));
	MaskColor := TColor(lua_tointeger(L,4));
	lImageList.InsertMasked(Index,AImage,MaskColor);
	
	Result := 0;
end;

function VCLua_ImageList_Move(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	ACurIndex:Integer;
	ANewIndex:Integer;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ACurIndex := lua_tointeger(L,2);
	ANewIndex := lua_tointeger(L,3);
	lImageList.Move(ACurIndex,ANewIndex);
	
	Result := 0;
end;

function VCLua_ImageList_Overlay(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	Overlay:TOverlay;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	Overlay := lua_tointeger(L,3);
	lImageList.Overlay(AIndex,Overlay);
	
	Result := 0;
end;

function VCLua_ImageList_Replace(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AImage:TCustomBitmap;
	AMask:TCustomBitmap;
	AllResolutions:Boolean;
begin
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	AImage := TCustomBitmap(GetLuaObject(L,3));
	AMask := TCustomBitmap(GetLuaObject(L,4));
	AllResolutions := luaL_optbool(L,5,True);
	lImageList.Replace(AIndex,AImage,AMask,AllResolutions);
	
	Result := 0;
end;

function VCLua_ImageList_ReplaceSlice(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	Image:TCustomBitmap;
	AImageRect:TRect;
	AllResolutions:Boolean;
begin
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	Image := TCustomBitmap(GetLuaObject(L,3));
	AImageRect := lua_toTRect(L,4);
	AllResolutions := luaL_optbool(L,5,True);
	lImageList.ReplaceSlice(AIndex,Image,AImageRect,AllResolutions);
	
	Result := 0;
end;

function VCLua_ImageList_ReplaceSliceCentered(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AImageWidth:Integer;
	Image:TCustomBitmap;
	AllResolutions:Boolean;
begin
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	AImageWidth := lua_tointeger(L,3);
	Image := TCustomBitmap(GetLuaObject(L,4));
	AllResolutions := luaL_optbool(L,5,True);
	lImageList.ReplaceSliceCentered(AIndex,AImageWidth,Image,AllResolutions);
	
	Result := 0;
end;

function VCLua_ImageList_ReplaceIcon(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AIndex:Integer;
	AIcon:TCustomIcon;
begin
	CheckArg(L, 3);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AIndex := lua_tointeger(L,2);
	AIcon := TCustomIcon(GetLuaObject(L,3));
	lImageList.ReplaceIcon(AIndex,AIcon);
	
	Result := 0;
end;

function VCLua_ImageList_ReplaceMasked(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Index:Integer;
	NewImage:TCustomBitmap;
	MaskColor:TColor;
	AllResolutions:Boolean;
begin
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Index := lua_tointeger(L,2);
	NewImage := TCustomBitmap(GetLuaObject(L,3));
	MaskColor := TColor(lua_tointeger(L,4));
	AllResolutions := luaL_optbool(L,5,True);
	lImageList.ReplaceMasked(Index,NewImage,MaskColor,AllResolutions);
	
	Result := 0;
end;

function VCLua_ImageList_RegisterChanges(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Value:TChangeLink;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Value := TChangeLink(GetLuaObject(L,2));
	lImageList.RegisterChanges(Value);
	
	Result := 0;
end;

function VCLua_ImageList_StretchDraw(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Canvas:TCanvas;
	Index:Integer;
	ARect:TRect;
	Enabled:Boolean;
begin
	CheckArg(L, -1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Canvas := TCanvas(GetLuaObject(L,2));
	Index := lua_tointeger(L,3);
	ARect := lua_toTRect(L,4);
	Enabled := luaL_optbool(L,5,True);
	lImageList.StretchDraw(Canvas,Index,ARect,Enabled);
	
	Result := 0;
end;

function VCLua_ImageList_UnRegisterChanges(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	Value:TChangeLink;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	Value := TChangeLink(GetLuaObject(L,2));
	lImageList.UnRegisterChanges(Value);
	
	Result := 0;
end;

function VCLua_ImageList_DeleteResolution(L: Plua_State): Integer; cdecl;
var
	lImageList:TLuaImageList;
	AWidth:Integer;
begin
	CheckArg(L, 2);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	AWidth := lua_tointeger(L,2);
	lImageList.DeleteResolution(AWidth);
	
	Result := 0;
end;

function IsImageList(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TImageList);
end;
function AsImageList(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TImageList then
    lua_push(L, TImageList(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TImageList; pti: PTypeInfo);
begin
	ImageListToTable(L,-1,v);
end;
procedure ImageListToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomImageList');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lImageList.LuaCtl := TVCLuaControl.Create(lImageList as TComponent,L,@ImageListToTable);
	InitControl(L,lImageList,Name);
	ImageListToTable(L, -1, lImageList);
	Result := 1;
end;

begin
	SetLength(CustomImageListFuncs, 50+1);
	CustomImageListFuncs[0].name:='AssignTo';
	CustomImageListFuncs[0].func:=@VCLua_ImageList_AssignTo;
	CustomImageListFuncs[1].name:='Assign';
	CustomImageListFuncs[1].func:=@VCLua_ImageList_Assign;
	CustomImageListFuncs[2].name:='WriteData';
	CustomImageListFuncs[2].func:=@VCLua_ImageList_WriteData;
	CustomImageListFuncs[3].name:='ReadData';
	CustomImageListFuncs[3].func:=@VCLua_ImageList_ReadData;
	CustomImageListFuncs[4].name:='WriteAdvData';
	CustomImageListFuncs[4].func:=@VCLua_ImageList_WriteAdvData;
	CustomImageListFuncs[5].name:='ReadAdvData';
	CustomImageListFuncs[5].func:=@VCLua_ImageList_ReadAdvData;
	CustomImageListFuncs[6].name:='Equals';
	CustomImageListFuncs[6].func:=@VCLua_ImageList_Equals;
	CustomImageListFuncs[7].name:='BeginUpdate';
	CustomImageListFuncs[7].func:=@VCLua_ImageList_BeginUpdate;
	CustomImageListFuncs[8].name:='EndUpdate';
	CustomImageListFuncs[8].func:=@VCLua_ImageList_EndUpdate;
	CustomImageListFuncs[9].name:='Add';
	CustomImageListFuncs[9].func:=@VCLua_ImageList_Add;
	CustomImageListFuncs[10].name:='AddSliced';
	CustomImageListFuncs[10].func:=@VCLua_ImageList_AddSliced;
	CustomImageListFuncs[11].name:='AddSlice';
	CustomImageListFuncs[11].func:=@VCLua_ImageList_AddSlice;
	CustomImageListFuncs[12].name:='AddSliceCentered';
	CustomImageListFuncs[12].func:=@VCLua_ImageList_AddSliceCentered;
	CustomImageListFuncs[13].name:='AddIcon';
	CustomImageListFuncs[13].func:=@VCLua_ImageList_AddIcon;
	CustomImageListFuncs[14].name:='AddImages';
	CustomImageListFuncs[14].func:=@VCLua_ImageList_AddImages;
	CustomImageListFuncs[15].name:='AddMasked';
	CustomImageListFuncs[15].func:=@VCLua_ImageList_AddMasked;
	CustomImageListFuncs[16].name:='AddLazarusResource';
	CustomImageListFuncs[16].func:=@VCLua_ImageList_AddLazarusResource;
	CustomImageListFuncs[17].name:='AddResourceName';
	CustomImageListFuncs[17].func:=@VCLua_ImageList_AddResourceName;
	CustomImageListFuncs[18].name:='Change';
	CustomImageListFuncs[18].func:=@VCLua_ImageList_Change;
	CustomImageListFuncs[19].name:='Clear';
	CustomImageListFuncs[19].func:=@VCLua_ImageList_Clear;
	CustomImageListFuncs[20].name:='Delete';
	CustomImageListFuncs[20].func:=@VCLua_ImageList_Delete;
	CustomImageListFuncs[21].name:='Draw';
	CustomImageListFuncs[21].func:=@VCLua_ImageList_Draw;
	CustomImageListFuncs[22].name:='Draw2';
	CustomImageListFuncs[22].func:=@VCLua_ImageList_Draw2;
	CustomImageListFuncs[23].name:='Draw3';
	CustomImageListFuncs[23].func:=@VCLua_ImageList_Draw3;
	CustomImageListFuncs[24].name:='Draw4';
	CustomImageListFuncs[24].func:=@VCLua_ImageList_Draw4;
	CustomImageListFuncs[25].name:='DrawForPPI';
	CustomImageListFuncs[25].func:=@VCLua_ImageList_DrawForPPI;
	CustomImageListFuncs[26].name:='DrawForPPI2';
	CustomImageListFuncs[26].func:=@VCLua_ImageList_DrawForPPI2;
	CustomImageListFuncs[27].name:='DrawOverlay';
	CustomImageListFuncs[27].func:=@VCLua_ImageList_DrawOverlay;
	CustomImageListFuncs[28].name:='DrawOverlay2';
	CustomImageListFuncs[28].func:=@VCLua_ImageList_DrawOverlay2;
	CustomImageListFuncs[29].name:='DrawOverlay3';
	CustomImageListFuncs[29].func:=@VCLua_ImageList_DrawOverlay3;
	CustomImageListFuncs[30].name:='GetBitmap';
	CustomImageListFuncs[30].func:=@VCLua_ImageList_GetBitmap;
	CustomImageListFuncs[31].name:='GetBitmap2';
	CustomImageListFuncs[31].func:=@VCLua_ImageList_GetBitmap2;
	CustomImageListFuncs[32].name:='GetFullBitmap';
	CustomImageListFuncs[32].func:=@VCLua_ImageList_GetFullBitmap;
	CustomImageListFuncs[33].name:='GetIcon';
	CustomImageListFuncs[33].func:=@VCLua_ImageList_GetIcon;
	CustomImageListFuncs[34].name:='GetIcon2';
	CustomImageListFuncs[34].func:=@VCLua_ImageList_GetIcon2;
	CustomImageListFuncs[35].name:='GetHotSpot';
	CustomImageListFuncs[35].func:=@VCLua_ImageList_GetHotSpot;
	CustomImageListFuncs[36].name:='Insert';
	CustomImageListFuncs[36].func:=@VCLua_ImageList_Insert;
	CustomImageListFuncs[37].name:='InsertIcon';
	CustomImageListFuncs[37].func:=@VCLua_ImageList_InsertIcon;
	CustomImageListFuncs[38].name:='InsertMasked';
	CustomImageListFuncs[38].func:=@VCLua_ImageList_InsertMasked;
	CustomImageListFuncs[39].name:='Move';
	CustomImageListFuncs[39].func:=@VCLua_ImageList_Move;
	CustomImageListFuncs[40].name:='Overlay';
	CustomImageListFuncs[40].func:=@VCLua_ImageList_Overlay;
	CustomImageListFuncs[41].name:='Replace';
	CustomImageListFuncs[41].func:=@VCLua_ImageList_Replace;
	CustomImageListFuncs[42].name:='ReplaceSlice';
	CustomImageListFuncs[42].func:=@VCLua_ImageList_ReplaceSlice;
	CustomImageListFuncs[43].name:='ReplaceSliceCentered';
	CustomImageListFuncs[43].func:=@VCLua_ImageList_ReplaceSliceCentered;
	CustomImageListFuncs[44].name:='ReplaceIcon';
	CustomImageListFuncs[44].func:=@VCLua_ImageList_ReplaceIcon;
	CustomImageListFuncs[45].name:='ReplaceMasked';
	CustomImageListFuncs[45].func:=@VCLua_ImageList_ReplaceMasked;
	CustomImageListFuncs[46].name:='RegisterChanges';
	CustomImageListFuncs[46].func:=@VCLua_ImageList_RegisterChanges;
	CustomImageListFuncs[47].name:='StretchDraw';
	CustomImageListFuncs[47].func:=@VCLua_ImageList_StretchDraw;
	CustomImageListFuncs[48].name:='UnRegisterChanges';
	CustomImageListFuncs[48].func:=@VCLua_ImageList_UnRegisterChanges;
	CustomImageListFuncs[49].name:='DeleteResolution';
	CustomImageListFuncs[49].func:=@VCLua_ImageList_DeleteResolution;
	CustomImageListFuncs[50].name:=nil;
	CustomImageListFuncs[50].func:=nil;

end.
