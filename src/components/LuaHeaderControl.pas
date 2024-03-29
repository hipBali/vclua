(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaHeaderControl;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

function CreateHeaderControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: THeaderControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaHeaderControl = class(THeaderControl)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomHeaderControlFuncs: TLuaVmt;
    CustomHeaderControlSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls, LuaClassesEvents, LuaComCtrlsEvents, LuaEvent;

function VCLua_HeaderControl_SectionFromOriginalIndex(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
	OriginalIndex:Integer;
	ret:THeaderSection;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	luaL_check(L,2,@OriginalIndex);
	try
		ret := lHeaderControl.SectionFromOriginalIndex[OriginalIndex];
		lua_push(L,ret,TypeInfo(ret));
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'HeaderControl', 'SectionFromOriginalIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_HeaderControl_Click(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 1);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	try
		lHeaderControl.Click();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'HeaderControl', 'Click', E.ClassName, E.Message);
	end;
end;

function VCLua_HeaderControl_DblClick(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 1);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	try
		lHeaderControl.DblClick();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'HeaderControl', 'DblClick', E.ClassName, E.Message);
	end;
end;

function VCLua_HeaderControl_GetSectionAt(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
	P:TPoint;
	ret:Integer;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	luaL_check(L,2,@P);
	try
		ret := lHeaderControl.GetSectionAt(P);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'HeaderControl', 'GetSectionAt', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_HeaderControl_Paint(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 1);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	try
		lHeaderControl.Paint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'HeaderControl', 'Paint', E.ClassName, E.Message);
	end;
end;

function VCLua_HeaderControl_PaintSection(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
	Index:Integer;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lHeaderControl.PaintSection(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'HeaderControl', 'PaintSection', E.ClassName, E.Message);
	end;
end;

function VCLua_HeaderControl_ChangeScale(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
	M:Integer;
	D:Integer;
begin
	CheckArg(L, 3);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	luaL_check(L,2,@M);
	luaL_check(L,3,@D);
	try
		lHeaderControl.ChangeScale(M,D);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'HeaderControl', 'ChangeScale', E.ClassName, E.Message);
	end;
end;

function VCLua_HeaderControl_VCLuaSetOnSectionDrag(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lHeaderControl.OnSectionDrag));
	lHeaderControl.OnSectionDrag := TLuaEvent.Factory<TSectionDragEvent,TLuaSectionDragEvent>(L);
	Result := 0;
end;

function VCLua_HeaderControl_VCLuaSetOnSectionEndDrag(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lHeaderControl.OnSectionEndDrag));
	lHeaderControl.OnSectionEndDrag := TLuaEvent.Factory<TNotifyEvent,TLuaNotifyEvent>(L);
	Result := 0;
end;

function VCLua_HeaderControl_VCLuaSetOnSectionClick(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lHeaderControl.OnSectionClick));
	lHeaderControl.OnSectionClick := TLuaEvent.Factory<TCustomSectionNotifyEvent,TLuaCustomSectionNotifyEvent>(L);
	Result := 0;
end;

function VCLua_HeaderControl_VCLuaSetOnSectionResize(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lHeaderControl.OnSectionResize));
	lHeaderControl.OnSectionResize := TLuaEvent.Factory<TCustomSectionNotifyEvent,TLuaCustomSectionNotifyEvent>(L);
	Result := 0;
end;

function VCLua_HeaderControl_VCLuaSetOnSectionTrack(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lHeaderControl.OnSectionTrack));
	lHeaderControl.OnSectionTrack := TLuaEvent.Factory<TCustomSectionTrackEvent,TLuaCustomSectionTrackEvent>(L);
	Result := 0;
end;

function VCLua_HeaderControl_VCLuaSetOnSectionSeparatorDblClick(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	TLuaEvent.MaybeFree(TLuaCb(lHeaderControl.OnSectionSeparatorDblClick));
	lHeaderControl.OnSectionSeparatorDblClick := TLuaEvent.Factory<TCustomSectionNotifyEvent,TLuaCustomSectionNotifyEvent>(L);
	Result := 0;
end;

procedure lua_push(L: Plua_State; const v: THeaderControl; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomHeaderControl',v);
end;
function CreateHeaderControl(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lHeaderControl := TLuaHeaderControl.Create(Parent);
	lHeaderControl.Parent := TWinControl(Parent);
	lHeaderControl.LuaCtl := TVCLuaControl.Create(lHeaderControl as TComponent,L,nil,'TCustomHeaderControl');
	CreateTableForKnownType(L,'TCustomHeaderControl',lHeaderControl);
	InitControl(L,lHeaderControl,Name);
	Result := 1;
end;

begin
	CustomHeaderControlFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomHeaderControlFuncs, 'SectionFromOriginalIndex', @VCLua_HeaderControl_SectionFromOriginalIndex);
	TLuaMethodInfo.Create(CustomHeaderControlFuncs, 'Click', @VCLua_HeaderControl_Click);
	TLuaMethodInfo.Create(CustomHeaderControlFuncs, 'DblClick', @VCLua_HeaderControl_DblClick);
	TLuaMethodInfo.Create(CustomHeaderControlFuncs, 'GetSectionAt', @VCLua_HeaderControl_GetSectionAt);
	TLuaMethodInfo.Create(CustomHeaderControlFuncs, 'Paint', @VCLua_HeaderControl_Paint);
	TLuaMethodInfo.Create(CustomHeaderControlFuncs, 'PaintSection', @VCLua_HeaderControl_PaintSection);
	TLuaMethodInfo.Create(CustomHeaderControlFuncs, 'ChangeScale', @VCLua_HeaderControl_ChangeScale);
	CustomHeaderControlSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomHeaderControlSets, 'OnSectionDrag', @VCLua_HeaderControl_VCLuaSetOnSectionDrag, mfCall, TypeInfo(TSectionDragEvent));
	TLuaMethodInfo.Create(CustomHeaderControlSets, 'OnSectionEndDrag', @VCLua_HeaderControl_VCLuaSetOnSectionEndDrag, mfCall, TypeInfo(TNotifyEvent));
	TLuaMethodInfo.Create(CustomHeaderControlSets, 'OnSectionClick', @VCLua_HeaderControl_VCLuaSetOnSectionClick, mfCall, TypeInfo(TCustomSectionNotifyEvent));
	TLuaMethodInfo.Create(CustomHeaderControlSets, 'OnSectionResize', @VCLua_HeaderControl_VCLuaSetOnSectionResize, mfCall, TypeInfo(TCustomSectionNotifyEvent));
	TLuaMethodInfo.Create(CustomHeaderControlSets, 'OnSectionTrack', @VCLua_HeaderControl_VCLuaSetOnSectionTrack, mfCall, TypeInfo(TCustomSectionTrackEvent));
	TLuaMethodInfo.Create(CustomHeaderControlSets, 'OnSectionSeparatorDblClick', @VCLua_HeaderControl_VCLuaSetOnSectionSeparatorDblClick, mfCall, TypeInfo(TCustomSectionNotifyEvent));
end.
