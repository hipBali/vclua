(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCanvas;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, GraphType;

procedure CanvasToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCanvas = class(TCanvas)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Canvas_Lock(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	lCanvas.Lock();
	
	Result := 0;
end;

function VCLua_Canvas_TryLock(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ret := lCanvas.TryLock();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Canvas_Unlock(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	lCanvas.Unlock();
	
	Result := 0;
end;

function VCLua_Canvas_Refresh(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	lCanvas.Refresh();
	
	Result := 0;
end;

function VCLua_Canvas_Changing(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	lCanvas.Changing();
	
	Result := 0;
end;

function VCLua_Canvas_Changed(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	lCanvas.Changed();
	
	Result := 0;
end;

function VCLua_Canvas_SaveHandleState(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	lCanvas.SaveHandleState();
	
	Result := 0;
end;

function VCLua_Canvas_RestoreHandleState(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	lCanvas.RestoreHandleState();
	
	Result := 0;
end;

function VCLua_Canvas_Arc(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ALeft:Integer;
	ATop:Integer;
	ARight:Integer;
	ABottom:Integer;
	Angle16Deg:Integer;
	Angle16DegLength:Integer;
begin
	CheckArg(L, 7);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ALeft := lua_tointeger(L,2);
	ATop := lua_tointeger(L,3);
	ARight := lua_tointeger(L,4);
	ABottom := lua_tointeger(L,5);
	Angle16Deg := lua_tointeger(L,6);
	Angle16DegLength := lua_tointeger(L,7);
	lCanvas.Arc(ALeft,ATop,ARight,ABottom,Angle16Deg,Angle16DegLength);
	
	Result := 0;
end;

function VCLua_Canvas_Arc2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ALeft:Integer;
	ATop:Integer;
	ARight:Integer;
	ABottom:Integer;
	SX:Integer;
	SY:Integer;
	EX:Integer;
	EY:Integer;
begin
	CheckArg(L, 9);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ALeft := lua_tointeger(L,2);
	ATop := lua_tointeger(L,3);
	ARight := lua_tointeger(L,4);
	ABottom := lua_tointeger(L,5);
	SX := lua_tointeger(L,6);
	SY := lua_tointeger(L,7);
	EX := lua_tointeger(L,8);
	EY := lua_tointeger(L,9);
	lCanvas.Arc(ALeft,ATop,ARight,ABottom,SX,SY,EX,EY);
	
	Result := 0;
end;

function VCLua_Canvas_AngleArc(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	X:Integer;
	Y:Integer;
	Radius:Longword;
	StartAngle:Single;
	SweepAngle:Single;
begin
	CheckArg(L, 6);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	Radius := lua_tointeger(L,4);
	StartAngle := lua_tonumber(L,5);
	SweepAngle := lua_tonumber(L,6);
	lCanvas.AngleArc(X,Y,Radius,StartAngle,SweepAngle);
	
	Result := 0;
end;

function VCLua_Canvas_BrushCopy(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ADestRect:TRect;
	ABitmap:TBitmap;
	ASourceRect:TRect;
	ATransparentColor:TColor;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ADestRect := lua_toTRect(L,2);
	ABitmap := TBitmap(GetLuaObject(L,3));
	ASourceRect := lua_toTRect(L,4);
	ATransparentColor := TColor(lua_tointeger(L,5));
	lCanvas.BrushCopy(ADestRect,ABitmap,ASourceRect,ATransparentColor);
	
	Result := 0;
end;

function VCLua_Canvas_Chord(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	x1:Integer;
	y1:Integer;
	x2:Integer;
	y2:Integer;
	Angle16Deg:Integer;
	Angle16DegLength:Integer;
begin
	CheckArg(L, 7);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	x1 := lua_tointeger(L,2);
	y1 := lua_tointeger(L,3);
	x2 := lua_tointeger(L,4);
	y2 := lua_tointeger(L,5);
	Angle16Deg := lua_tointeger(L,6);
	Angle16DegLength := lua_tointeger(L,7);
	lCanvas.Chord(x1,y1,x2,y2,Angle16Deg,Angle16DegLength);
	
	Result := 0;
end;

function VCLua_Canvas_Chord2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	x1:Integer;
	y1:Integer;
	x2:Integer;
	y2:Integer;
	SX:Integer;
	SY:Integer;
	EX:Integer;
	EY:Integer;
begin
	CheckArg(L, 9);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	x1 := lua_tointeger(L,2);
	y1 := lua_tointeger(L,3);
	x2 := lua_tointeger(L,4);
	y2 := lua_tointeger(L,5);
	SX := lua_tointeger(L,6);
	SY := lua_tointeger(L,7);
	EX := lua_tointeger(L,8);
	EY := lua_tointeger(L,9);
	lCanvas.Chord(x1,y1,x2,y2,SX,SY,EX,EY);
	
	Result := 0;
end;

function VCLua_Canvas_CopyRect(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Dest:TRect;
	SrcCanvas:TCanvas;
	Source:TRect;
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Dest := lua_toTRect(L,2);
	SrcCanvas := TCanvas(GetLuaObject(L,3));
	Source := lua_toTRect(L,4);
	lCanvas.CopyRect(Dest,SrcCanvas,Source);
	
	Result := 0;
end;

function VCLua_Canvas_Draw(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	X:Integer;
	Y:Integer;
	SrcGraphic:TGraphic;
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	SrcGraphic := TGraphic(GetLuaObject(L,4));
	lCanvas.Draw(X,Y,SrcGraphic);
	
	Result := 0;
end;

function VCLua_Canvas_DrawFocusRect(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	lCanvas.DrawFocusRect(ARect);
	
	Result := 0;
end;

function VCLua_Canvas_StretchDraw(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	DestRect:TRect;
	SrcGraphic:TGraphic;
begin
	CheckArg(L, 3);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	DestRect := lua_toTRect(L,2);
	SrcGraphic := TGraphic(GetLuaObject(L,3));
	lCanvas.StretchDraw(DestRect,SrcGraphic);
	
	Result := 0;
end;

function VCLua_Canvas_Ellipse(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	lCanvas.Ellipse(ARect);
	
	Result := 0;
end;

function VCLua_Canvas_Ellipse2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	x1:Integer;
	y1:Integer;
	x2:Integer;
	y2:Integer;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	x1 := lua_tointeger(L,2);
	y1 := lua_tointeger(L,3);
	x2 := lua_tointeger(L,4);
	y2 := lua_tointeger(L,5);
	lCanvas.Ellipse(x1,y1,x2,y2);
	
	Result := 0;
end;

function VCLua_Canvas_FillRect(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	lCanvas.FillRect(ARect);
	
	Result := 0;
end;

function VCLua_Canvas_FillRect2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	X1:Integer;
	Y1:Integer;
	X2:Integer;
	Y2:Integer;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X1 := lua_tointeger(L,2);
	Y1 := lua_tointeger(L,3);
	X2 := lua_tointeger(L,4);
	Y2 := lua_tointeger(L,5);
	lCanvas.FillRect(X1,Y1,X2,Y2);
	
	Result := 0;
end;

function VCLua_Canvas_FloodFill(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	X:Integer;
	Y:Integer;
	FillColor:TColor;
	FillStyle:TFillStyle;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	FillColor := TColor(lua_tointeger(L,4));
	FillStyle := TFillStyle(GetLuaObject(L,5));
	lCanvas.FloodFill(X,Y,FillColor,FillStyle);
	
	Result := 0;
end;

function VCLua_Canvas_Frame3d(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
	FrameWidth:integer;
	Style:TGraphicsBevelCut;
begin
	CheckArg(L, 3);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	FrameWidth := lua_tointeger(L,2);
	Style := TGraphicsBevelCut(GetLuaObject(L,3));
	lCanvas.Frame3d(ARect,FrameWidth,Style);
	lua_pushTRect(L,ARect);
	Result := 1;
end;

function VCLua_Canvas_Frame3D_(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
	TopColor:TColor;
	BottomColor:TColor;
	FrameWidth:integer;
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	TopColor := TColor(lua_tointeger(L,2));
	BottomColor := TColor(lua_tointeger(L,3));
	FrameWidth := lua_tointeger(L,4);
	lCanvas.Frame3D(ARect,TopColor,BottomColor,FrameWidth);
	lua_pushTRect(L,ARect);
	Result := 1;
end;

function VCLua_Canvas_GradientFill(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
	AStart:TColor;
	AStop:TColor;
	ADirection:TGradientDirection;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	AStart := TColor(lua_tointeger(L,3));
	AStop := TColor(lua_tointeger(L,4));
	ADirection := TGradientDirection(GetLuaObject(L,5));
	lCanvas.GradientFill(ARect,AStart,AStop,ADirection);
	
	Result := 0;
end;

function VCLua_Canvas_RadialPie(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	x1:Integer;
	y1:Integer;
	x2:Integer;
	y2:Integer;
	StartAngle16Deg:Integer;
	Angle16DegLength:Integer;
begin
	CheckArg(L, 7);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	x1 := lua_tointeger(L,2);
	y1 := lua_tointeger(L,3);
	x2 := lua_tointeger(L,4);
	y2 := lua_tointeger(L,5);
	StartAngle16Deg := lua_tointeger(L,6);
	Angle16DegLength := lua_tointeger(L,7);
	lCanvas.RadialPie(x1,y1,x2,y2,StartAngle16Deg,Angle16DegLength);
	
	Result := 0;
end;

function VCLua_Canvas_Pie(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	EllipseX1:Integer;
	EllipseY1:Integer;
	EllipseX2:Integer;
	EllipseY2:Integer;
	StartX:Integer;
	StartY:Integer;
	EndX:Integer;
	EndY:Integer;
begin
	CheckArg(L, 9);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	EllipseX1 := lua_tointeger(L,2);
	EllipseY1 := lua_tointeger(L,3);
	EllipseX2 := lua_tointeger(L,4);
	EllipseY2 := lua_tointeger(L,5);
	StartX := lua_tointeger(L,6);
	StartY := lua_tointeger(L,7);
	EndX := lua_tointeger(L,8);
	EndY := lua_tointeger(L,9);
	lCanvas.Pie(EllipseX1,EllipseY1,EllipseX2,EllipseY2,StartX,StartY,EndX,EndY);
	
	Result := 0;
end;

function VCLua_Canvas_PolyBezier(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
	Filled:boolean;
	Continuous:boolean;
begin
	CheckArg(L, -1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Points := lua_toTPointArray(L,2);
	Filled := luaL_optbool(L,3,False);
	Continuous := luaL_optbool(L,4,True);
	lCanvas.PolyBezier(Points,Filled,Continuous);
	
	Result := 0;
end;

function VCLua_Canvas_Polygon(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
	Winding:Boolean;
	StartIndex:Integer;
	NumPts:Integer;
begin
	CheckArg(L, -1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Points := lua_toTPointArray(L,2);
	Winding := lua_toboolean(L,3);
	StartIndex := luaL_optint(L,4,0);
	NumPts := luaL_optint(L,5,-1);
	lCanvas.Polygon(Points,Winding,StartIndex,NumPts);
	
	Result := 0;
end;

function VCLua_Canvas_Polygon2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Points := lua_toTPointArray(L,2);
	lCanvas.Polygon(Points);
	
	Result := 0;
end;

function VCLua_Canvas_Polyline(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
	StartIndex:Integer;
	NumPts:Integer;
begin
	CheckArg(L, -1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Points := lua_toTPointArray(L,2);
	StartIndex := lua_tointeger(L,3);
	NumPts := luaL_optint(L,4,-1);
	lCanvas.Polyline(Points,StartIndex,NumPts);
	
	Result := 0;
end;

function VCLua_Canvas_Polyline2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Points := lua_toTPointArray(L,2);
	lCanvas.Polyline(Points);
	
	Result := 0;
end;

function VCLua_Canvas_Rectangle(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	X1:Integer;
	Y1:Integer;
	X2:Integer;
	Y2:Integer;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X1 := lua_tointeger(L,2);
	Y1 := lua_tointeger(L,3);
	X2 := lua_tointeger(L,4);
	Y2 := lua_tointeger(L,5);
	lCanvas.Rectangle(X1,Y1,X2,Y2);
	
	Result := 0;
end;

function VCLua_Canvas_Rectangle2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	lCanvas.Rectangle(ARect);
	
	Result := 0;
end;

function VCLua_Canvas_RoundRect(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	X1:Integer;
	Y1:Integer;
	X2:Integer;
	Y2:Integer;
	RX:Integer;
	RY:Integer;
begin
	CheckArg(L, 7);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X1 := lua_tointeger(L,2);
	Y1 := lua_tointeger(L,3);
	X2 := lua_tointeger(L,4);
	Y2 := lua_tointeger(L,5);
	RX := lua_tointeger(L,6);
	RY := lua_tointeger(L,7);
	lCanvas.RoundRect(X1,Y1,X2,Y2,RX,RY);
	
	Result := 0;
end;

function VCLua_Canvas_RoundRect2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Rect:TRect;
	RX:Integer;
	RY:Integer;
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Rect := lua_toTRect(L,2);
	RX := lua_tointeger(L,3);
	RY := lua_tointeger(L,4);
	lCanvas.RoundRect(Rect,RX,RY);
	
	Result := 0;
end;

function VCLua_Canvas_TextOut(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	X:Integer;
	Y:Integer;
	Text:String;
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	Text := lua_toStringCP(L,4);
	lCanvas.TextOut(X,Y,Text);
	
	Result := 0;
end;

function VCLua_Canvas_TextRect(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
	X:integer;
	Y:integer;
	Text:string;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	X := lua_tointeger(L,3);
	Y := lua_tointeger(L,4);
	Text := lua_toStringCP(L,5);
	lCanvas.TextRect(ARect,X,Y,Text);
	
	Result := 0;
end;

function VCLua_Canvas_TextRect2(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ARect:TRect;
	X:integer;
	Y:integer;
	Text:string;
	Style:TTextStyle;
begin
	CheckArg(L, 6);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ARect := lua_toTRect(L,2);
	X := lua_tointeger(L,3);
	Y := lua_tointeger(L,4);
	Text := lua_toStringCP(L,5);
	Style := lua_toTextStyle(L,6);
	lCanvas.TextRect(ARect,X,Y,Text,Style);
	
	Result := 0;
end;

function VCLua_Canvas_TextHeight(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Text:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Text := lua_toStringCP(L,2);
	ret := lCanvas.TextHeight(Text);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Canvas_TextWidth(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Text:string;
	ret:Integer;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Text := lua_toStringCP(L,2);
	ret := lCanvas.TextWidth(Text);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Canvas_TextFitInfo(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	Text:string;
	MaxWidth:Integer;
	ret:Integer;
begin
	CheckArg(L, 3);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	Text := lua_toStringCP(L,2);
	MaxWidth := lua_tointeger(L,3);
	ret := lCanvas.TextFitInfo(Text,MaxWidth);
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

function VCLua_Canvas_HandleAllocated(L: Plua_State): Integer; cdecl;
var 
	lCanvas:TLuaCanvas;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	ret := lCanvas.HandleAllocated();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Canvas_SetPixel(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
  	X:Integer;
	Y:Integer;
	C:TColor;    
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	C := TColor(lua_tointeger(L,4));
	lCanvas.Pixels[X,Y] := C; 
    Result := 0;
end;

procedure CanvasToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Lock', @VCLua_Canvas_Lock);
	LuaSetTableFunction(L, Index, 'TryLock', @VCLua_Canvas_TryLock);
	LuaSetTableFunction(L, Index, 'Unlock', @VCLua_Canvas_Unlock);
	LuaSetTableFunction(L, Index, 'Refresh', @VCLua_Canvas_Refresh);
	LuaSetTableFunction(L, Index, 'Changing', @VCLua_Canvas_Changing);
	LuaSetTableFunction(L, Index, 'Changed', @VCLua_Canvas_Changed);
	LuaSetTableFunction(L, Index, 'SaveHandleState', @VCLua_Canvas_SaveHandleState);
	LuaSetTableFunction(L, Index, 'RestoreHandleState', @VCLua_Canvas_RestoreHandleState);
	LuaSetTableFunction(L, Index, 'Arc', @VCLua_Canvas_Arc);
	LuaSetTableFunction(L, Index, 'Arc2', @VCLua_Canvas_Arc2);
	LuaSetTableFunction(L, Index, 'AngleArc', @VCLua_Canvas_AngleArc);
	LuaSetTableFunction(L, Index, 'BrushCopy', @VCLua_Canvas_BrushCopy);
	LuaSetTableFunction(L, Index, 'Chord', @VCLua_Canvas_Chord);
	LuaSetTableFunction(L, Index, 'Chord2', @VCLua_Canvas_Chord2);
	LuaSetTableFunction(L, Index, 'CopyRect', @VCLua_Canvas_CopyRect);
	LuaSetTableFunction(L, Index, 'Draw', @VCLua_Canvas_Draw);
	LuaSetTableFunction(L, Index, 'DrawFocusRect', @VCLua_Canvas_DrawFocusRect);
	LuaSetTableFunction(L, Index, 'StretchDraw', @VCLua_Canvas_StretchDraw);
	LuaSetTableFunction(L, Index, 'Ellipse', @VCLua_Canvas_Ellipse);
	LuaSetTableFunction(L, Index, 'Ellipse2', @VCLua_Canvas_Ellipse2);
	LuaSetTableFunction(L, Index, 'FillRect', @VCLua_Canvas_FillRect);
	LuaSetTableFunction(L, Index, 'FillRect2', @VCLua_Canvas_FillRect2);
	LuaSetTableFunction(L, Index, 'FloodFill', @VCLua_Canvas_FloodFill);
	LuaSetTableFunction(L, Index, 'Frame3d', @VCLua_Canvas_Frame3d);
	LuaSetTableFunction(L, Index, 'Frame3D', @VCLua_Canvas_Frame3D_);
	LuaSetTableFunction(L, Index, 'GradientFill', @VCLua_Canvas_GradientFill);
	LuaSetTableFunction(L, Index, 'RadialPie', @VCLua_Canvas_RadialPie);
	LuaSetTableFunction(L, Index, 'Pie', @VCLua_Canvas_Pie);
	LuaSetTableFunction(L, Index, 'PolyBezier', @VCLua_Canvas_PolyBezier);
	LuaSetTableFunction(L, Index, 'Polygon', @VCLua_Canvas_Polygon);
	LuaSetTableFunction(L, Index, 'Polygon2', @VCLua_Canvas_Polygon2);
	LuaSetTableFunction(L, Index, 'Polyline', @VCLua_Canvas_Polyline);
	LuaSetTableFunction(L, Index, 'Polyline2', @VCLua_Canvas_Polyline2);
	LuaSetTableFunction(L, Index, 'Rectangle', @VCLua_Canvas_Rectangle);
	LuaSetTableFunction(L, Index, 'Rectangle2', @VCLua_Canvas_Rectangle2);
	LuaSetTableFunction(L, Index, 'RoundRect', @VCLua_Canvas_RoundRect);
	LuaSetTableFunction(L, Index, 'RoundRect2', @VCLua_Canvas_RoundRect2);
	LuaSetTableFunction(L, Index, 'TextOut', @VCLua_Canvas_TextOut);
	LuaSetTableFunction(L, Index, 'TextRect', @VCLua_Canvas_TextRect);
	LuaSetTableFunction(L, Index, 'TextRect2', @VCLua_Canvas_TextRect2);
	LuaSetTableFunction(L, Index, 'TextHeight', @VCLua_Canvas_TextHeight);
	LuaSetTableFunction(L, Index, 'TextWidth', @VCLua_Canvas_TextWidth);
	LuaSetTableFunction(L, Index, 'TextFitInfo', @VCLua_Canvas_TextFitInfo);
	LuaSetTableFunction(L, Index, 'HandleAllocated', @VCLua_Canvas_HandleAllocated);
	LuaSetTableFunction(L, Index, 'SetPixel', @VCLua_Canvas_SetPixel);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
