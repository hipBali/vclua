(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCanvas;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Graphics, TypInfo, LuaVmt;

function IsCanvas(L: Plua_State): Integer; cdecl;
function AsCanvas(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCanvas; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCanvas = class(TCanvas)
    public
      L:Plua_State;
    end;
var
    CanvasFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, GraphType;

function VCLua_Canvas_Lock(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		lCanvas.Lock();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Lock', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_TryLock(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		ret := lCanvas.TryLock();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'TryLock', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Canvas_Unlock(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		lCanvas.Unlock();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Unlock', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Refresh(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		lCanvas.Refresh();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Refresh', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Changing(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		lCanvas.Changing();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Changing', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Changed(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		lCanvas.Changed();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Changed', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_SaveHandleState(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		lCanvas.SaveHandleState();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'SaveHandleState', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_RestoreHandleState(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		lCanvas.RestoreHandleState();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'RestoreHandleState', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Arc(ALeft,ATop,ARight,ABottom,Angle16Deg,Angle16DegLength);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Arc', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Arc(ALeft,ATop,ARight,ABottom,SX,SY,EX,EY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Arc', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.AngleArc(X,Y,Radius,StartAngle,SweepAngle);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'AngleArc', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.BrushCopy(ADestRect,ABitmap,ASourceRect,ATransparentColor);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'BrushCopy', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Chord(x1,y1,x2,y2,Angle16Deg,Angle16DegLength);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Chord', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Chord(x1,y1,x2,y2,SX,SY,EX,EY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Chord', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.CopyRect(Dest,SrcCanvas,Source);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'CopyRect', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Draw(X,Y,SrcGraphic);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Draw', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_DrawFocusRect(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@ARect);
	try
		lCanvas.DrawFocusRect(ARect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'DrawFocusRect', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.StretchDraw(DestRect,SrcGraphic);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'StretchDraw', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Ellipse(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@ARect);
	try
		lCanvas.Ellipse(ARect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Ellipse', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Ellipse(x1,y1,x2,y2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Ellipse', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_FillRect(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@ARect);
	try
		lCanvas.FillRect(ARect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'FillRect', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.FillRect(X1,Y1,X2,Y2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'FillRect', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.FloodFill(X,Y,FillColor,FillStyle);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'FloodFill', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Frame3d(ARect,FrameWidth,Style);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Frame3d', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
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
	try
		lCanvas.Frame3d(ARect,FrameWidth,Style);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Frame3d', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
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
	try
		lCanvas.Frame3D(ARect,TopColor,BottomColor,FrameWidth);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Frame3D', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
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
	try
		lCanvas.Frame3D(ARect,TopColor,BottomColor,FrameWidth);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Frame3D', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
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
	try
		lCanvas.GradientFill(ARect,AStart,AStop,ADirection);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'GradientFill', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.RadialPie(x1,y1,x2,y2,StartAngle16Deg,Angle16DegLength);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'RadialPie', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Pie(EllipseX1,EllipseY1,EllipseX2,EllipseY2,StartX,StartY,EndX,EndY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Pie', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_PolyBezier(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
	Filled:boolean;
	Continuous:boolean;
begin
	CheckArg(L, 2, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	TTrait<TPoint>.luaL_checkArray(L, 2, @Points);
	TTrait<boolean>.luaL_optcheck(L, 3, @Filled, False);
	TTrait<boolean>.luaL_optcheck(L, 4, @Continuous, True);
	try
		lCanvas.PolyBezier(Points,Filled,Continuous);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'PolyBezier', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Polygon(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
	Winding:Boolean;
	StartIndex:Integer;
	NumPts:Integer;
begin
	CheckArg(L, 3, 5);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	TTrait<TPoint>.luaL_checkArray(L, 2, @Points);
	luaL_check(L,3,@Winding);
	TTrait<Integer>.luaL_optcheck(L, 4, @StartIndex, 0);
	TTrait<Integer>.luaL_optcheck(L, 5, @NumPts, -1);
	try
		lCanvas.Polygon(Points,Winding,StartIndex,NumPts);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Polygon', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Polygon2(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	TTrait<TPoint>.luaL_checkArray(L, 2, @Points);
	try
		lCanvas.Polygon(Points);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Polygon', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Polyline(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
	StartIndex:Integer;
	NumPts:Integer;
begin
	CheckArg(L, 3, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	TTrait<TPoint>.luaL_checkArray(L, 2, @Points);
	luaL_check(L,3,@StartIndex);
	TTrait<Integer>.luaL_optcheck(L, 4, @NumPts, -1);
	try
		lCanvas.Polyline(Points,StartIndex,NumPts);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Polyline', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Polyline2(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	Points:array of TPoint;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	TTrait<TPoint>.luaL_checkArray(L, 2, @Points);
	try
		lCanvas.Polyline(Points);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Polyline', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.Rectangle(X1,Y1,X2,Y2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Rectangle', E.ClassName, E.Message);
	end;
end;

function VCLua_Canvas_Rectangle2(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@ARect);
	try
		lCanvas.Rectangle(ARect);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Rectangle', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.RoundRect(X1,Y1,X2,Y2,RX,RY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'RoundRect', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.RoundRect(Rect,RX,RY);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'RoundRect', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.TextOut(X,Y,Text);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'TextOut', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.TextRect(ARect,X,Y,Text);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'TextRect', E.ClassName, E.Message);
	end;
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
	try
		lCanvas.TextRect(ARect,X,Y,Text,Style);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'TextRect', E.ClassName, E.Message);
	end;
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
	try
		ret := lCanvas.TextHeight(Text);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'TextHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	try
		ret := lCanvas.TextWidth(Text);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'TextWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	try
		ret := lCanvas.TextFitInfo(Text,MaxWidth);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'TextFitInfo', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Canvas_HandleAllocated(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	ret:boolean;
begin
	CheckArg(L, 1);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	try
		ret := lCanvas.HandleAllocated();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'HandleAllocated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Canvas_Pixels(L: Plua_State): Integer; cdecl;
var
	lCanvas:TLuaCanvas;
	X:Integer;
	Y:Integer;
	ret:TColor;
begin
	CheckArg(L, 3, 4);
	lCanvas := TLuaCanvas(GetLuaObject(L, 1));
	luaL_check(L,2,@X);
	luaL_check(L,3,@Y);
	try
		if lua_isnone(L, 4) then begin
			ret := lCanvas.Pixels[X,Y];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,4,@ret);
			lCanvas.Pixels[X,Y] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'Canvas', 'Pixels', E.ClassName, E.Message);
	end;
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
	CanvasFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CanvasFuncs, 'Lock', @VCLua_Canvas_Lock);
	TLuaMethodInfo.Create(CanvasFuncs, 'TryLock', @VCLua_Canvas_TryLock);
	TLuaMethodInfo.Create(CanvasFuncs, 'Unlock', @VCLua_Canvas_Unlock);
	TLuaMethodInfo.Create(CanvasFuncs, 'Refresh', @VCLua_Canvas_Refresh);
	TLuaMethodInfo.Create(CanvasFuncs, 'Changing', @VCLua_Canvas_Changing);
	TLuaMethodInfo.Create(CanvasFuncs, 'Changed', @VCLua_Canvas_Changed);
	TLuaMethodInfo.Create(CanvasFuncs, 'SaveHandleState', @VCLua_Canvas_SaveHandleState);
	TLuaMethodInfo.Create(CanvasFuncs, 'RestoreHandleState', @VCLua_Canvas_RestoreHandleState);
	TLuaMethodInfo.Create(CanvasFuncs, 'Arc', @VCLua_Canvas_Arc);
	TLuaMethodInfo.Create(CanvasFuncs, 'Arc2', @VCLua_Canvas_Arc2);
	TLuaMethodInfo.Create(CanvasFuncs, 'AngleArc', @VCLua_Canvas_AngleArc);
	TLuaMethodInfo.Create(CanvasFuncs, 'BrushCopy', @VCLua_Canvas_BrushCopy);
	TLuaMethodInfo.Create(CanvasFuncs, 'Chord', @VCLua_Canvas_Chord);
	TLuaMethodInfo.Create(CanvasFuncs, 'Chord2', @VCLua_Canvas_Chord2);
	TLuaMethodInfo.Create(CanvasFuncs, 'CopyRect', @VCLua_Canvas_CopyRect);
	TLuaMethodInfo.Create(CanvasFuncs, 'Draw', @VCLua_Canvas_Draw);
	TLuaMethodInfo.Create(CanvasFuncs, 'DrawFocusRect', @VCLua_Canvas_DrawFocusRect);
	TLuaMethodInfo.Create(CanvasFuncs, 'StretchDraw', @VCLua_Canvas_StretchDraw);
	TLuaMethodInfo.Create(CanvasFuncs, 'Ellipse', @VCLua_Canvas_Ellipse);
	TLuaMethodInfo.Create(CanvasFuncs, 'Ellipse2', @VCLua_Canvas_Ellipse2);
	TLuaMethodInfo.Create(CanvasFuncs, 'FillRect', @VCLua_Canvas_FillRect);
	TLuaMethodInfo.Create(CanvasFuncs, 'FillRect2', @VCLua_Canvas_FillRect2);
	TLuaMethodInfo.Create(CanvasFuncs, 'FloodFill', @VCLua_Canvas_FloodFill);
	TLuaMethodInfo.Create(CanvasFuncs, 'Frame3d', @VCLua_Canvas_Frame3d);
	TLuaMethodInfo.Create(CanvasFuncs, 'Frame3d2', @VCLua_Canvas_Frame3d2);
	TLuaMethodInfo.Create(CanvasFuncs, 'Frame3D3', @VCLua_Canvas_Frame3D3);
	TLuaMethodInfo.Create(CanvasFuncs, 'Frame3D4', @VCLua_Canvas_Frame3D4);
	TLuaMethodInfo.Create(CanvasFuncs, 'GradientFill', @VCLua_Canvas_GradientFill);
	TLuaMethodInfo.Create(CanvasFuncs, 'RadialPie', @VCLua_Canvas_RadialPie);
	TLuaMethodInfo.Create(CanvasFuncs, 'Pie', @VCLua_Canvas_Pie);
	TLuaMethodInfo.Create(CanvasFuncs, 'PolyBezier', @VCLua_Canvas_PolyBezier);
	TLuaMethodInfo.Create(CanvasFuncs, 'Polygon', @VCLua_Canvas_Polygon);
	TLuaMethodInfo.Create(CanvasFuncs, 'Polygon2', @VCLua_Canvas_Polygon2);
	TLuaMethodInfo.Create(CanvasFuncs, 'Polyline', @VCLua_Canvas_Polyline);
	TLuaMethodInfo.Create(CanvasFuncs, 'Polyline2', @VCLua_Canvas_Polyline2);
	TLuaMethodInfo.Create(CanvasFuncs, 'Rectangle', @VCLua_Canvas_Rectangle);
	TLuaMethodInfo.Create(CanvasFuncs, 'Rectangle2', @VCLua_Canvas_Rectangle2);
	TLuaMethodInfo.Create(CanvasFuncs, 'RoundRect', @VCLua_Canvas_RoundRect);
	TLuaMethodInfo.Create(CanvasFuncs, 'RoundRect2', @VCLua_Canvas_RoundRect2);
	TLuaMethodInfo.Create(CanvasFuncs, 'TextOut', @VCLua_Canvas_TextOut);
	TLuaMethodInfo.Create(CanvasFuncs, 'TextRect', @VCLua_Canvas_TextRect);
	TLuaMethodInfo.Create(CanvasFuncs, 'TextRect2', @VCLua_Canvas_TextRect2);
	TLuaMethodInfo.Create(CanvasFuncs, 'TextHeight', @VCLua_Canvas_TextHeight);
	TLuaMethodInfo.Create(CanvasFuncs, 'TextWidth', @VCLua_Canvas_TextWidth);
	TLuaMethodInfo.Create(CanvasFuncs, 'TextFitInfo', @VCLua_Canvas_TextFitInfo);
	TLuaMethodInfo.Create(CanvasFuncs, 'HandleAllocated', @VCLua_Canvas_HandleAllocated);
	TLuaMethodInfo.Create(CanvasFuncs, 'Pixels', @VCLua_Canvas_Pixels);
	TLuaMethodInfo.Create(CanvasFuncs, 'SetPixel', @VCLua_Canvas_SetPixel);
end.
