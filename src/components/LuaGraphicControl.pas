(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGraphicControl;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Controls;

function CreateGraphicControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TGraphicControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaGraphicControl = class(TGraphicControl)
    end;
var
    GraphicControlFuncs: TLuaVmt;
    GraphicControlSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Graphics, LuaCanvas, LuaClassesEvents, LuaEvent;

function VCLua_GraphicControl_VCLuaSetOnPaint(L: Plua_State): Integer; cdecl;
var
	lGraphicControl:TLuaGraphicControl;
begin
	lGraphicControl := TLuaGraphicControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lGraphicControl.OnPaint));
	lGraphicControl.OnPaint := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_GraphicControl_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lGraphicControl:TLuaGraphicControl;
	ret:TCanvas;
begin
	lGraphicControl := TLuaGraphicControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lGraphicControl.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'GraphicControl', 'GetCanvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TGraphicControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TGraphicControl',v);
end;
function CreateGraphicControl(L: Plua_State): Integer; cdecl;
var
	lGraphicControl:TLuaGraphicControl;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lGraphicControl := TLuaGraphicControl.Create(Parent);
	lGraphicControl.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TGraphicControl',lGraphicControl);
	InitControl(L,lGraphicControl,Name);
	Result := 1;
end;

begin
	GraphicControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(GraphicControlFuncs, 'Canvas', @VCLua_GraphicControl_VCLuaGetCanvas, mfCall);
	GraphicControlSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(GraphicControlSets, 'OnPaint', @VCLua_GraphicControl_VCLuaSetOnPaint, mfCall, TypeInfo(TNotifyEvent));
end.
