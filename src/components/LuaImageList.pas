(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaImageList;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ImgList, Controls, Graphics, GraphType;

function CreateImageList(L: Plua_State): Integer; cdecl;
procedure ImageListToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaImageList = class(TImageList)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

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
	lua_pushboolean(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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
	lua_pushinteger(L,ret);
	
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

function VCLua_ImageList_GetIcon(L: Plua_State): Integer; cdecl;
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
	lua_pushTPoint(L,ret);
	
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

function VCLua_ImageList_Resolutions(L: Plua_State): Integer; cdecl;
var 
	lImageList:TLuaImageList;
	ret:TCustomImageListResolutionEnumerator;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ret := lImageList.Resolutions();
	ImageListToTable(L,-1,ret);
	
	Result := 1;
end;

function VCLua_ImageList_ResolutionsDesc(L: Plua_State): Integer; cdecl;
var 
	lImageList:TLuaImageList;
	ret:TCustomImageListResolutionEnumerator;
begin
	CheckArg(L, 1);
	lImageList := TLuaImageList(GetLuaObject(L, 1));
	ret := lImageList.ResolutionsDesc();
	ImageListToTable(L,-1,ret);
	
	Result := 1;
end;

procedure ImageListToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AssignTo', @VCLua_ImageList_AssignTo);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_ImageList_Assign);
	LuaSetTableFunction(L, Index, 'WriteData', @VCLua_ImageList_WriteData);
	LuaSetTableFunction(L, Index, 'ReadData', @VCLua_ImageList_ReadData);
	LuaSetTableFunction(L, Index, 'WriteAdvData', @VCLua_ImageList_WriteAdvData);
	LuaSetTableFunction(L, Index, 'ReadAdvData', @VCLua_ImageList_ReadAdvData);
	LuaSetTableFunction(L, Index, 'Equals', @VCLua_ImageList_Equals);
	LuaSetTableFunction(L, Index, 'BeginUpdate', @VCLua_ImageList_BeginUpdate);
	LuaSetTableFunction(L, Index, 'EndUpdate', @VCLua_ImageList_EndUpdate);
	LuaSetTableFunction(L, Index, 'Add', @VCLua_ImageList_Add);
	LuaSetTableFunction(L, Index, 'AddSliced', @VCLua_ImageList_AddSliced);
	LuaSetTableFunction(L, Index, 'AddSlice', @VCLua_ImageList_AddSlice);
	LuaSetTableFunction(L, Index, 'AddSliceCentered', @VCLua_ImageList_AddSliceCentered);
	LuaSetTableFunction(L, Index, 'AddIcon', @VCLua_ImageList_AddIcon);
	LuaSetTableFunction(L, Index, 'AddImages', @VCLua_ImageList_AddImages);
	LuaSetTableFunction(L, Index, 'AddMasked', @VCLua_ImageList_AddMasked);
	LuaSetTableFunction(L, Index, 'AddLazarusResource', @VCLua_ImageList_AddLazarusResource);
	LuaSetTableFunction(L, Index, 'AddResourceName', @VCLua_ImageList_AddResourceName);
	LuaSetTableFunction(L, Index, 'Change', @VCLua_ImageList_Change);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_ImageList_Clear);
	LuaSetTableFunction(L, Index, 'Delete', @VCLua_ImageList_Delete);
	LuaSetTableFunction(L, Index, 'Draw', @VCLua_ImageList_Draw);
	LuaSetTableFunction(L, Index, 'Draw2', @VCLua_ImageList_Draw2);
	LuaSetTableFunction(L, Index, 'DrawForPPI', @VCLua_ImageList_DrawForPPI);
	LuaSetTableFunction(L, Index, 'DrawOverlay', @VCLua_ImageList_DrawOverlay);
	LuaSetTableFunction(L, Index, 'GetBitmap', @VCLua_ImageList_GetBitmap);
	LuaSetTableFunction(L, Index, 'GetIcon', @VCLua_ImageList_GetIcon);
	LuaSetTableFunction(L, Index, 'GetHotSpot', @VCLua_ImageList_GetHotSpot);
	LuaSetTableFunction(L, Index, 'Insert', @VCLua_ImageList_Insert);
	LuaSetTableFunction(L, Index, 'InsertIcon', @VCLua_ImageList_InsertIcon);
	LuaSetTableFunction(L, Index, 'InsertMasked', @VCLua_ImageList_InsertMasked);
	LuaSetTableFunction(L, Index, 'Move', @VCLua_ImageList_Move);
	LuaSetTableFunction(L, Index, 'Overlay', @VCLua_ImageList_Overlay);
	LuaSetTableFunction(L, Index, 'Replace', @VCLua_ImageList_Replace);
	LuaSetTableFunction(L, Index, 'ReplaceSlice', @VCLua_ImageList_ReplaceSlice);
	LuaSetTableFunction(L, Index, 'ReplaceSliceCentered', @VCLua_ImageList_ReplaceSliceCentered);
	LuaSetTableFunction(L, Index, 'ReplaceIcon', @VCLua_ImageList_ReplaceIcon);
	LuaSetTableFunction(L, Index, 'ReplaceMasked', @VCLua_ImageList_ReplaceMasked);
	LuaSetTableFunction(L, Index, 'RegisterChanges', @VCLua_ImageList_RegisterChanges);
	LuaSetTableFunction(L, Index, 'StretchDraw', @VCLua_ImageList_StretchDraw);
	LuaSetTableFunction(L, Index, 'UnRegisterChanges', @VCLua_ImageList_UnRegisterChanges);
	LuaSetTableFunction(L, Index, 'DeleteResolution', @VCLua_ImageList_DeleteResolution);
	LuaSetTableFunction(L, Index, 'Resolutions', @VCLua_ImageList_Resolutions);
	LuaSetTableFunction(L, Index, 'ResolutionsDesc', @VCLua_ImageList_ResolutionsDesc);
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

end.
