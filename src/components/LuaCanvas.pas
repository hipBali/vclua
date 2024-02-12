(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCanvas;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, GraphType, TypInfo;

function IsCanvas(L: Plua_State): Integer; cdecl;
function AsCanvas(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCanvas; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCanvas = class(TCanvas)
    public
      L:Plua_State;
    end;
var
    CanvasFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,ret);
	
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
	luaL_check(L,2,@ALeft);
	luaL_check(L,3,@ATop);
	luaL_check(L,4,@ARight);
	luaL_check(L,5,@ABottom);
	luaL_check(L,6,@Angle16Deg);
	luaL_check(L,7,@Angle16DegLength);
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
	luaL_check(L,2,@ALeft);
	luaL_check(L,3,@ATop);
	luaL_check(L,4,@ARight);
	luaL_check(L,5,@ABottom);
	luaL_check(L,6,@SX);
	luaL_check(L,7,@SY);
	luaL_check(L,8,@EX);
	luaL_check(L,9,@EY);
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	luaL_check(L,4,@Radius);
	luaL_check(L,5,@StartAngle);
	luaL_check(L,6,@SweepAngle);
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
	luaL_check(L,2,@ADestRect);
	luaL_check(L,3,@ABitmap);
	luaL_check(L,4,@ASourceRect);
	luaL_check(L,5,@ATransparentColor);
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
	luaL_check(L,2,@x1);
	luaL_check(L,3,@y1);
	luaL_check(L,4,@x2);
	luaL_check(L,5,@y2);
	luaL_check(L,6,@Angle16Deg);
	luaL_check(L,7,@Angle16DegLength);
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
	luaL_check(L,2,@x1);
	luaL_check(L,3,@y1);
	luaL_check(L,4,@x2);
	luaL_check(L,5,@y2);
	luaL_check(L,6,@SX);
	luaL_check(L,7,@SY);
	luaL_check(L,8,@EX);
	luaL_check(L,9,@EY);
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
	luaL_check(L,2,@Dest);
	luaL_check(L,3,@SrcCanvas);
	luaL_check(L,4,@Source);
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	luaL_check(L,4,@SrcGraphic);
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
	luaL_check(L,2,@ARect);
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
	luaL_check(L,2,@DestRect);
	luaL_check(L,3,@SrcGraphic);
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
	luaL_check(L,2,@ARect);
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
	luaL_check(L,2,@x1);
	luaL_check(L,3,@y1);
	luaL_check(L,4,@x2);
	luaL_check(L,5,@y2);
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
	luaL_check(L,2,@ARect);
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
	luaL_check(L,2,@X1);
	luaL_check(L,3,@Y1);
	luaL_check(L,4,@X2);
	luaL_check(L,5,@Y2);
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	luaL_check(L,4,@FillColor);
	luaL_check(L,5,@FillStyle,TypeInfo(TFillStyle));
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
	luaL_check(L,2,@FrameWidth);
	luaL_check(L,3,@Style,TypeInfo(TGraphicsBevelCut));
	lCanvas.Frame3d(ARect,FrameWidth,Style);
	lua_push(L,ARect);
	Result := 1;
end;

function VCLua_Canvas_Frame3d2(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ARect:TRect;
	FrameWidth:integer;
	Style:TGraphicsBevelCut;
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@ARect);
	luaL_check(L,3,@FrameWidth);
	luaL_check(L,4,@Style,TypeInfo(TGraphicsBevelCut));
	lCanvas.Frame3d(ARect,FrameWidth,Style);
	lua_push(L,ARect);
	Result := 1;
end;

function VCLua_Canvas_Frame3D3(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ARect:TRect;
	TopColor:TColor;
	BottomColor:TColor;
	FrameWidth:integer;
begin
	CheckArg(L, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@TopColor);
	luaL_check(L,3,@BottomColor);
	luaL_check(L,4,@FrameWidth);
	lCanvas.Frame3D(ARect,TopColor,BottomColor,FrameWidth);
	lua_push(L,ARect);
	Result := 1;
end;

function VCLua_Canvas_Frame3D4(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ARect:TRect;
	TopColor:TColor;
	BottomColor:TColor;
	FrameWidth:integer;
begin
	CheckArg(L, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@ARect);
	luaL_check(L,3,@TopColor);
	luaL_check(L,4,@BottomColor);
	luaL_check(L,5,@FrameWidth);
	lCanvas.Frame3D(ARect,TopColor,BottomColor,FrameWidth);
	lua_push(L,ARect);
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
	luaL_check(L,2,@ARect);
	luaL_check(L,3,@AStart);
	luaL_check(L,4,@AStop);
	luaL_check(L,5,@ADirection,TypeInfo(TGradientDirection));
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
	luaL_check(L,2,@x1);
	luaL_check(L,3,@y1);
	luaL_check(L,4,@x2);
	luaL_check(L,5,@y2);
	luaL_check(L,6,@StartAngle16Deg);
	luaL_check(L,7,@Angle16DegLength);
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
	luaL_check(L,2,@EllipseX1);
	luaL_check(L,3,@EllipseY1);
	luaL_check(L,4,@EllipseX2);
	luaL_check(L,5,@EllipseY2);
	luaL_check(L,6,@StartX);
	luaL_check(L,7,@StartY);
	luaL_check(L,8,@EndX);
	luaL_check(L,9,@EndY);
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
	luaL_check(L,3,@Winding);
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
	luaL_check(L,3,@StartIndex);
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
	luaL_check(L,2,@X1);
	luaL_check(L,3,@Y1);
	luaL_check(L,4,@X2);
	luaL_check(L,5,@Y2);
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
	luaL_check(L,2,@ARect);
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
	luaL_check(L,2,@X1);
	luaL_check(L,3,@Y1);
	luaL_check(L,4,@X2);
	luaL_check(L,5,@Y2);
	luaL_check(L,6,@RX);
	luaL_check(L,7,@RY);
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
	luaL_check(L,2,@Rect);
	luaL_check(L,3,@RX);
	luaL_check(L,4,@RY);
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
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	luaL_check(L,4,@Text);
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
	luaL_check(L,2,@ARect);
	luaL_check(L,3,@X);
	luaL_check(L,4,@Y);
	luaL_check(L,5,@Text);
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
	luaL_check(L,2,@ARect);
	luaL_check(L,3,@X);
	luaL_check(L,4,@Y);
	luaL_check(L,5,@Text);
	luaL_check(L,6,@Style);
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
	luaL_check(L,2,@Text);
	ret := lCanvas.TextHeight(Text);
	lua_push(L,ret);
	
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
	luaL_check(L,2,@Text);
	ret := lCanvas.TextWidth(Text);
	lua_push(L,ret);
	
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
	luaL_check(L,2,@Text);
	luaL_check(L,3,@MaxWidth);
	ret := lCanvas.TextFitInfo(Text,MaxWidth);
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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

function IsCanvas(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCanvas);
end;
function AsCanvas(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCanvas then
    lua_push(L, TCanvas(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCanvas; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCanvas',v);
end;

begin
	SetLength(CanvasFuncs, 47+1);
	CanvasFuncs[0].name:='Lock';
	CanvasFuncs[0].func:=@VCLua_Canvas_Lock;
	CanvasFuncs[1].name:='TryLock';
	CanvasFuncs[1].func:=@VCLua_Canvas_TryLock;
	CanvasFuncs[2].name:='Unlock';
	CanvasFuncs[2].func:=@VCLua_Canvas_Unlock;
	CanvasFuncs[3].name:='Refresh';
	CanvasFuncs[3].func:=@VCLua_Canvas_Refresh;
	CanvasFuncs[4].name:='Changing';
	CanvasFuncs[4].func:=@VCLua_Canvas_Changing;
	CanvasFuncs[5].name:='Changed';
	CanvasFuncs[5].func:=@VCLua_Canvas_Changed;
	CanvasFuncs[6].name:='SaveHandleState';
	CanvasFuncs[6].func:=@VCLua_Canvas_SaveHandleState;
	CanvasFuncs[7].name:='RestoreHandleState';
	CanvasFuncs[7].func:=@VCLua_Canvas_RestoreHandleState;
	CanvasFuncs[8].name:='Arc';
	CanvasFuncs[8].func:=@VCLua_Canvas_Arc;
	CanvasFuncs[9].name:='Arc2';
	CanvasFuncs[9].func:=@VCLua_Canvas_Arc2;
	CanvasFuncs[10].name:='AngleArc';
	CanvasFuncs[10].func:=@VCLua_Canvas_AngleArc;
	CanvasFuncs[11].name:='BrushCopy';
	CanvasFuncs[11].func:=@VCLua_Canvas_BrushCopy;
	CanvasFuncs[12].name:='Chord';
	CanvasFuncs[12].func:=@VCLua_Canvas_Chord;
	CanvasFuncs[13].name:='Chord2';
	CanvasFuncs[13].func:=@VCLua_Canvas_Chord2;
	CanvasFuncs[14].name:='CopyRect';
	CanvasFuncs[14].func:=@VCLua_Canvas_CopyRect;
	CanvasFuncs[15].name:='Draw';
	CanvasFuncs[15].func:=@VCLua_Canvas_Draw;
	CanvasFuncs[16].name:='DrawFocusRect';
	CanvasFuncs[16].func:=@VCLua_Canvas_DrawFocusRect;
	CanvasFuncs[17].name:='StretchDraw';
	CanvasFuncs[17].func:=@VCLua_Canvas_StretchDraw;
	CanvasFuncs[18].name:='Ellipse';
	CanvasFuncs[18].func:=@VCLua_Canvas_Ellipse;
	CanvasFuncs[19].name:='Ellipse2';
	CanvasFuncs[19].func:=@VCLua_Canvas_Ellipse2;
	CanvasFuncs[20].name:='FillRect';
	CanvasFuncs[20].func:=@VCLua_Canvas_FillRect;
	CanvasFuncs[21].name:='FillRect2';
	CanvasFuncs[21].func:=@VCLua_Canvas_FillRect2;
	CanvasFuncs[22].name:='FloodFill';
	CanvasFuncs[22].func:=@VCLua_Canvas_FloodFill;
	CanvasFuncs[23].name:='Frame3d';
	CanvasFuncs[23].func:=@VCLua_Canvas_Frame3d;
	CanvasFuncs[24].name:='Frame3d2';
	CanvasFuncs[24].func:=@VCLua_Canvas_Frame3d2;
	CanvasFuncs[25].name:='Frame3D3';
	CanvasFuncs[25].func:=@VCLua_Canvas_Frame3D3;
	CanvasFuncs[26].name:='Frame3D4';
	CanvasFuncs[26].func:=@VCLua_Canvas_Frame3D4;
	CanvasFuncs[27].name:='GradientFill';
	CanvasFuncs[27].func:=@VCLua_Canvas_GradientFill;
	CanvasFuncs[28].name:='RadialPie';
	CanvasFuncs[28].func:=@VCLua_Canvas_RadialPie;
	CanvasFuncs[29].name:='Pie';
	CanvasFuncs[29].func:=@VCLua_Canvas_Pie;
	CanvasFuncs[30].name:='PolyBezier';
	CanvasFuncs[30].func:=@VCLua_Canvas_PolyBezier;
	CanvasFuncs[31].name:='Polygon';
	CanvasFuncs[31].func:=@VCLua_Canvas_Polygon;
	CanvasFuncs[32].name:='Polygon2';
	CanvasFuncs[32].func:=@VCLua_Canvas_Polygon2;
	CanvasFuncs[33].name:='Polyline';
	CanvasFuncs[33].func:=@VCLua_Canvas_Polyline;
	CanvasFuncs[34].name:='Polyline2';
	CanvasFuncs[34].func:=@VCLua_Canvas_Polyline2;
	CanvasFuncs[35].name:='Rectangle';
	CanvasFuncs[35].func:=@VCLua_Canvas_Rectangle;
	CanvasFuncs[36].name:='Rectangle2';
	CanvasFuncs[36].func:=@VCLua_Canvas_Rectangle2;
	CanvasFuncs[37].name:='RoundRect';
	CanvasFuncs[37].func:=@VCLua_Canvas_RoundRect;
	CanvasFuncs[38].name:='RoundRect2';
	CanvasFuncs[38].func:=@VCLua_Canvas_RoundRect2;
	CanvasFuncs[39].name:='TextOut';
	CanvasFuncs[39].func:=@VCLua_Canvas_TextOut;
	CanvasFuncs[40].name:='TextRect';
	CanvasFuncs[40].func:=@VCLua_Canvas_TextRect;
	CanvasFuncs[41].name:='TextRect2';
	CanvasFuncs[41].func:=@VCLua_Canvas_TextRect2;
	CanvasFuncs[42].name:='TextHeight';
	CanvasFuncs[42].func:=@VCLua_Canvas_TextHeight;
	CanvasFuncs[43].name:='TextWidth';
	CanvasFuncs[43].func:=@VCLua_Canvas_TextWidth;
	CanvasFuncs[44].name:='TextFitInfo';
	CanvasFuncs[44].func:=@VCLua_Canvas_TextFitInfo;
	CanvasFuncs[45].name:='HandleAllocated';
	CanvasFuncs[45].func:=@VCLua_Canvas_HandleAllocated;
	CanvasFuncs[46].name:='SetPixel';
	CanvasFuncs[46].func:=@VCLua_Canvas_SetPixel;
	CanvasFuncs[47].name:=nil;
	CanvasFuncs[47].func:=nil;

end.
