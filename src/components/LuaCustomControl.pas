(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCustomControl;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Controls;

function CreateCustomControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCustomControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCustomControl = class(TCustomControl)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomControlFuncs: TLuaVmt;
    CustomControlSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Graphics, LuaCanvas, LuaClassesEvents, LuaEvent;

function VCLua_CustomControl_VCLuaSetCanvas(L: Plua_State): Integer; cdecl;
var
	lCustomControl:TLuaCustomControl;
	val:TCanvas;
begin
	lCustomControl := TLuaCustomControl(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCustomControl.Canvas := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CustomControl', 'Canvas', E.ClassName, E.Message);
	end;
end;

function VCLua_CustomControl_VCLuaGetCanvas(L: Plua_State): Integer; cdecl;
var
	lCustomControl:TLuaCustomControl;
	ret:TCanvas;
begin
	lCustomControl := TLuaCustomControl(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCustomControl.Canvas;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CustomControl', 'Canvas', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CustomControl_VCLuaSetOnPaint(L: Plua_State): Integer; cdecl;
var
	lCustomControl:TLuaCustomControl;
begin
	lCustomControl := TLuaCustomControl(GetLuaObjectUnsafe(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lCustomControl.OnPaint));
	lCustomControl.OnPaint := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: TCustomControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomControl',v);
end;
function CreateCustomControl(L: Plua_State): Integer; cdecl;
var
	lCustomControl:TLuaCustomControl;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCustomControl := TLuaCustomControl.Create(Parent);
	lCustomControl.Parent := TWinControl(Parent);
	lCustomControl.LuaCtl := TVCLuaControl.Create(lCustomControl as TComponent,L,nil,'TCustomControl');
	CreateTableForKnownType(L,'TCustomControl',lCustomControl);
	InitControl(L,lCustomControl,Name);
	Result := 1;
end;

begin
	CustomControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomControlFuncs, 'Canvas', @VCLua_CustomControl_VCLuaGetCanvas, mfCall);
	CustomControlSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomControlSets, 'Canvas', @VCLua_CustomControl_VCLuaSetCanvas, mfCall, TypeInfo(TCanvas));
	TLuaMethodInfo.Create(CustomControlSets, 'OnPaint', @VCLua_CustomControl_VCLuaSetOnPaint, mfCall, TypeInfo(TNotifyEvent));
end.
