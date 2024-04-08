(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaDrag;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Controls;

function CreateDragObject(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDragObject; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDragObject = class(TDragObject)
    end;
var
    DragObjectFuncs: TLuaVmt;
    DragObjectSets: TLuaVmt;

function CreateDragControlObject(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDragControlObject; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDragControlObject = class(TDragControlObject)
    end;
var
    DragControlObjectFuncs: TLuaVmt;
    DragControlObjectSets: TLuaVmt;

function CreateDragControlObjectEx(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDragControlObjectEx; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDragControlObjectEx = class(TDragControlObjectEx)
    end;
var
    DragControlObjectExFuncs: TLuaVmt;
    DragControlObjectExSets: TLuaVmt;

function CreateDragDockObject(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDragDockObject; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDragDockObject = class(TDragDockObject)
    end;
var
    DragDockObjectFuncs: TLuaVmt;
    DragDockObjectSets: TLuaVmt;

function CreateDragDockObjectEx(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TDragDockObjectEx; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDragDockObjectEx = class(TDragDockObjectEx)
    end;
var
    DragDockObjectExFuncs: TLuaVmt;
    DragDockObjectExSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TDockZone; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDockZone = class(TDockZone)
    end;
var
    DockZoneFuncs: TLuaVmt;
    DockZoneSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TDockTree; pti: PTypeInfo = nil); overload; inline;

type
    TLuaDockTree = class(TDockTree)
    end;
var
    DockTreeFuncs: TLuaVmt;
    DockTreeSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, LuaControl;

function VCLua_DragObject_HideDragImage(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
begin
	CheckArg(L, 1);
	lDragObject := TLuaDragObject(GetLuaObject(L, 1));
	try
		lDragObject.HideDragImage();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'HideDragImage', E.ClassName, E.Message);
	end;
end;

function VCLua_DragObject_ShowDragImage(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
begin
	CheckArg(L, 1);
	lDragObject := TLuaDragObject(GetLuaObject(L, 1));
	try
		lDragObject.ShowDragImage();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'ShowDragImage', E.ClassName, E.Message);
	end;
end;

function VCLua_DragObject_VCLuaSetAlwaysShowDragImages(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	val:Boolean;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragObject.AlwaysShowDragImages := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'SetAlwaysShowDragImages', E.ClassName, E.Message);
	end;
end;

function VCLua_DragObject_VCLuaGetAlwaysShowDragImages(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:Boolean;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.AlwaysShowDragImages;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetAlwaysShowDragImages', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragObject_VCLuaGetAutoCreated(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:Boolean;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.AutoCreated;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetAutoCreated', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragObject_VCLuaGetAutoFree(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:Boolean;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.AutoFree;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetAutoFree', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragObject_VCLuaSetControl(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	val:TControl;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragObject.Control := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'SetControl', E.ClassName, E.Message);
	end;
end;

function VCLua_DragObject_VCLuaGetControl(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:TControl;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.Control;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragObject_VCLuaSetDragPos(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	val:TPoint;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragObject.DragPos := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'SetDragPos', E.ClassName, E.Message);
	end;
end;

function VCLua_DragObject_VCLuaGetDragPos(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:TPoint;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.DragPos;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetDragPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragObject_VCLuaSetDragTarget(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	val:TControl;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragObject.DragTarget := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'SetDragTarget', E.ClassName, E.Message);
	end;
end;

function VCLua_DragObject_VCLuaGetDragTarget(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:TControl;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.DragTarget;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetDragTarget', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragObject_VCLuaSetDragTargetPos(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	val:TPoint;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragObject.DragTargetPos := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'SetDragTargetPos', E.ClassName, E.Message);
	end;
end;

function VCLua_DragObject_VCLuaGetDragTargetPos(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:TPoint;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.DragTargetPos;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetDragTargetPos', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragObject_VCLuaGetDropped(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	ret:Boolean;
begin
	lDragObject := TLuaDragObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragObject.Dropped;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragObject', 'GetDropped', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;



function VCLua_DragDockObject_VCLuaSetDockOffset(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	val:TPoint;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragDockObject.DockOffset := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'SetDockOffset', E.ClassName, E.Message);
	end;
end;

function VCLua_DragDockObject_VCLuaGetDockOffset(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	ret:TPoint;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragDockObject.DockOffset;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'GetDockOffset', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragDockObject_VCLuaSetDockRect(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	val:TRect;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragDockObject.DockRect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'SetDockRect', E.ClassName, E.Message);
	end;
end;

function VCLua_DragDockObject_VCLuaGetDockRect(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	ret:TRect;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragDockObject.DockRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'GetDockRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragDockObject_VCLuaSetDropAlign(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	val:TAlign;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAlign));
	try
		lDragDockObject.DropAlign := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'SetDropAlign', E.ClassName, E.Message);
	end;
end;

function VCLua_DragDockObject_VCLuaGetDropAlign(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	ret:TAlign;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragDockObject.DropAlign;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'GetDropAlign', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_DragDockObject_VCLuaSetDropOnControl(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	val:TControl;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragDockObject.DropOnControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'SetDropOnControl', E.ClassName, E.Message);
	end;
end;

function VCLua_DragDockObject_VCLuaGetDropOnControl(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	ret:TControl;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragDockObject.DropOnControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'GetDropOnControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragDockObject_VCLuaSetFloating(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	val:Boolean;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragDockObject.Floating := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'SetFloating', E.ClassName, E.Message);
	end;
end;

function VCLua_DragDockObject_VCLuaGetFloating(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	ret:Boolean;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragDockObject.Floating;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'GetFloating', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragDockObject_VCLuaGetIncreaseDockArea(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	ret:Boolean;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragDockObject.IncreaseDockArea;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'GetIncreaseDockArea', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DragDockObject_VCLuaSetEraseDockRect(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	val:TRect;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDragDockObject.EraseDockRect := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'SetEraseDockRect', E.ClassName, E.Message);
	end;
end;

function VCLua_DragDockObject_VCLuaGetEraseDockRect(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	ret:TRect;
begin
	lDragDockObject := TLuaDragDockObject(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDragDockObject.EraseDockRect;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DragDockObject', 'GetEraseDockRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;


function VCLua_DockZone_FindZone(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	AControl:TControl;
	ret:TDockZone;
begin
	CheckArg(L, 2);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		ret := lDockZone.FindZone(AControl);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'FindZone', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_FirstVisibleChild(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	CheckArg(L, 1);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	try
		ret := lDockZone.FirstVisibleChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'FirstVisibleChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_GetNextVisibleZone(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	CheckArg(L, 1);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	try
		ret := lDockZone.GetNextVisibleZone();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetNextVisibleZone', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_NextVisible(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	CheckArg(L, 1);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	try
		ret := lDockZone.NextVisible();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'NextVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_PrevVisible(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	CheckArg(L, 1);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	try
		ret := lDockZone.PrevVisible();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'PrevVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_AddSibling(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	NewZone:TDockZone;
	InsertAt:TAlign;
begin
	CheckArg(L, 3);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	luaL_check(L,2,@NewZone);
	luaL_check(L,3,@InsertAt,TypeInfo(TAlign));
	try
		lDockZone.AddSibling(NewZone,InsertAt);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'AddSibling', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_AddAsFirstChild(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	NewChildZone:TDockZone;
begin
	CheckArg(L, 2);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	luaL_check(L,2,@NewChildZone);
	try
		lDockZone.AddAsFirstChild(NewChildZone);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'AddAsFirstChild', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_AddAsLastChild(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	NewChildZone:TDockZone;
begin
	CheckArg(L, 2);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	luaL_check(L,2,@NewChildZone);
	try
		lDockZone.AddAsLastChild(NewChildZone);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'AddAsLastChild', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_ReplaceChild(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	OldChild:TDockZone;
	NewChild:TDockZone;
begin
	CheckArg(L, 3);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	luaL_check(L,2,@OldChild);
	luaL_check(L,3,@NewChild);
	try
		lDockZone.ReplaceChild(OldChild,NewChild);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'ReplaceChild', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_GetLastChild(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	CheckArg(L, 1);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	try
		ret := lDockZone.GetLastChild();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetLastChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_GetIndex(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	CheckArg(L, 1);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	try
		ret := lDockZone.GetIndex();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_Remove(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ChildZone:TDockZone;
begin
	CheckArg(L, 2);
	lDockZone := TLuaDockZone(GetLuaObject(L, 1));
	luaL_check(L,2,@ChildZone);
	try
		lDockZone.Remove(ChildZone);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'Remove', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetChildControl(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TControl;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.ChildControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetChildControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaGetChildCount(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.ChildCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetChildCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaGetFirstChild(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.FirstChild;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetFirstChild', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaSetHeight(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	val:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDockZone.Height := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'SetHeight', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetHeight(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Height;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaSetLeft(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	val:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDockZone.Left := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'SetLeft', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetLeft(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Left;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetLeft', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaSetLimitBegin(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	val:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDockZone.LimitBegin := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'SetLimitBegin', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetLimitBegin(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.LimitBegin;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetLimitBegin', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaSetLimitSize(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	val:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDockZone.LimitSize := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'SetLimitSize', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetLimitSize(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.LimitSize;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetLimitSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaSetOrientation(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	val:TDockOrientation;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TDockOrientation));
	try
		lDockZone.Orientation := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'SetOrientation', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetOrientation(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockOrientation;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Orientation;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetOrientation', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_DockZone_VCLuaGetParent(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Parent;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetParent', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaSetTop(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	val:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDockZone.Top := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'SetTop', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetTop(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Top;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetTop', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaGetTree(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockTree;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Tree;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetTree', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaGetVisible(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Boolean;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Visible;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetVisible', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaGetVisibleChildCount(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.VisibleChildCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetVisibleChildCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaSetWidth(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	val:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDockZone.Width := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'SetWidth', E.ClassName, E.Message);
	end;
end;

function VCLua_DockZone_VCLuaGetWidth(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:Integer;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.Width;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetWidth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaGetNextSibling(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.NextSibling;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetNextSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockZone_VCLuaGetPrevSibling(L: Plua_State): Integer; cdecl;
var
	lDockZone:TLuaDockZone;
	ret:TDockZone;
begin
	lDockZone := TLuaDockZone(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockZone.PrevSibling;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockZone', 'GetPrevSibling', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_DockTree_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
begin
	CheckArg(L, 1);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	try
		lDockTree.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
begin
	CheckArg(L, 1);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	try
		lDockTree.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_AdjustDockRect(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AControl:TControl;
	ARect:TRect;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lDockTree.AdjustDockRect(AControl,ARect);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'AdjustDockRect', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
end;

function VCLua_DockTree_AdjustDockRect2(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AControl:TControl;
	ARect:TRect;
begin
	CheckArg(L, 3);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	luaL_check(L,3,@ARect);
	try
		lDockTree.AdjustDockRect(AControl,ARect);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'AdjustDockRect', E.ClassName, E.Message);
	end;
	lua_push(L,ARect);
end;

function VCLua_DockTree_GetControlBounds(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AControl:TControl;
	ControlBounds:TRect;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lDockTree.GetControlBounds(AControl,ControlBounds);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'GetControlBounds', E.ClassName, E.Message);
	end;
	lua_push(L,ControlBounds);
end;

function VCLua_DockTree_InsertControl(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AControl:TControl;
	InsertAt:TAlign;
	DropControl:TControl;
begin
	CheckArg(L, 4);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	luaL_check(L,3,@InsertAt,TypeInfo(TAlign));
	luaL_check(L,4,@DropControl);
	try
		lDockTree.InsertControl(AControl,InsertAt,DropControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'InsertControl', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_LoadFromStream(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	SrcStream:TStream;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@SrcStream);
	try
		lDockTree.LoadFromStream(SrcStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'LoadFromStream', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_PositionDockRect(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AClient:TControl;
	DropCtl:TControl;
	DropAlign:TAlign;
	DockRect:TRect;
begin
	CheckArg(L, 4);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AClient);
	luaL_check(L,3,@DropCtl);
	luaL_check(L,4,@DropAlign,TypeInfo(TAlign));
	try
		lDockTree.PositionDockRect(AClient,DropCtl,DropAlign,DockRect);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'PositionDockRect', E.ClassName, E.Message);
	end;
	lua_push(L,DockRect);
end;

function VCLua_DockTree_PositionDockRect2(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AClient:TControl;
	DropCtl:TControl;
	DropAlign:TAlign;
	DockRect:TRect;
begin
	CheckArg(L, 5);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AClient);
	luaL_check(L,3,@DropCtl);
	luaL_check(L,4,@DropAlign,TypeInfo(TAlign));
	luaL_check(L,5,@DockRect);
	try
		lDockTree.PositionDockRect(AClient,DropCtl,DropAlign,DockRect);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'PositionDockRect', E.ClassName, E.Message);
	end;
	lua_push(L,DockRect);
end;

function VCLua_DockTree_RemoveControl(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lDockTree.RemoveControl(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'RemoveControl', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_SaveToStream(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	DestStream:TStream;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@DestStream);
	try
		lDockTree.SaveToStream(DestStream);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'SaveToStream', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_SetReplacingControl(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lDockTree.SetReplacingControl(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'SetReplacingControl', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_ResetBounds(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	Force:Boolean;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@Force);
	try
		lDockTree.ResetBounds(Force);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'ResetBounds', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_DumpLayout(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	FileName:String;
begin
	CheckArg(L, 2);
	lDockTree := TLuaDockTree(GetLuaObject(L, 1));
	luaL_check(L,2,@FileName);
	try
		lDockTree.DumpLayout(FileName);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'DumpLayout', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_VCLuaSetDockSite(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	val:TWinControl;
begin
	lDockTree := TLuaDockTree(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lDockTree.DockSite := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'SetDockSite', E.ClassName, E.Message);
	end;
end;

function VCLua_DockTree_VCLuaGetDockSite(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	ret:TWinControl;
begin
	lDockTree := TLuaDockTree(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockTree.DockSite;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'GetDockSite', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_DockTree_VCLuaGetRootZone(L: Plua_State): Integer; cdecl;
var
	lDockTree:TLuaDockTree;
	ret:TDockZone;
begin
	lDockTree := TLuaDockTree(GetLuaObjectUnsafe(L, 1));
	try
		ret := lDockTree.RootZone;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'DockTree', 'GetRootZone', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TDragObject; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDragObject',v);
end;
function CreateDragObject(L: Plua_State): Integer; cdecl;
var
	lDragObject:TLuaDragObject;
	Parent:TControl;
begin
	luaL_check(L,1,@Parent,TypeInfo(Parent));
	lDragObject := TLuaDragObject.Create(Parent);
	CreateTableForKnownType(L,'TDragObject',lDragObject);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TDragControlObject; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDragControlObject',v);
end;
function CreateDragControlObject(L: Plua_State): Integer; cdecl;
var
	lDragControlObject:TLuaDragControlObject;
	Parent:TControl;
begin
	luaL_check(L,1,@Parent,TypeInfo(Parent));
	lDragControlObject := TLuaDragControlObject.Create(Parent);
	CreateTableForKnownType(L,'TDragControlObject',lDragControlObject);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TDragControlObjectEx; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDragControlObjectEx',v);
end;
function CreateDragControlObjectEx(L: Plua_State): Integer; cdecl;
var
	lDragControlObjectEx:TLuaDragControlObjectEx;
	Parent:TControl;
begin
	luaL_check(L,1,@Parent,TypeInfo(Parent));
	lDragControlObjectEx := TLuaDragControlObjectEx.Create(Parent);
	CreateTableForKnownType(L,'TDragControlObjectEx',lDragControlObjectEx);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TDragDockObject; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDragDockObject',v);
end;
function CreateDragDockObject(L: Plua_State): Integer; cdecl;
var
	lDragDockObject:TLuaDragDockObject;
	Parent:TControl;
begin
	luaL_check(L,1,@Parent,TypeInfo(Parent));
	lDragDockObject := TLuaDragDockObject.Create(Parent);
	CreateTableForKnownType(L,'TDragDockObject',lDragDockObject);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TDragDockObjectEx; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDragDockObjectEx',v);
end;
function CreateDragDockObjectEx(L: Plua_State): Integer; cdecl;
var
	lDragDockObjectEx:TLuaDragDockObjectEx;
	Parent:TControl;
begin
	luaL_check(L,1,@Parent,TypeInfo(Parent));
	lDragDockObjectEx := TLuaDragDockObjectEx.Create(Parent);
	CreateTableForKnownType(L,'TDragDockObjectEx',lDragDockObjectEx);
	Result := 1;
end;
procedure lua_push(L: Plua_State; const v: TDockZone; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDockZone',v);
end;

procedure lua_push(L: Plua_State; const v: TDockTree; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TDockTree',v);
end;

begin
	DragObjectFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(DragObjectFuncs, 'HideDragImage', @VCLua_DragObject_HideDragImage);
	TLuaMethodInfo.Create(DragObjectFuncs, 'ShowDragImage', @VCLua_DragObject_ShowDragImage);
	TLuaMethodInfo.Create(DragObjectFuncs, 'AlwaysShowDragImages', @VCLua_DragObject_VCLuaGetAlwaysShowDragImages, mfCall);
	TLuaMethodInfo.Create(DragObjectFuncs, 'AutoCreated', @VCLua_DragObject_VCLuaGetAutoCreated, mfCall);
	TLuaMethodInfo.Create(DragObjectFuncs, 'AutoFree', @VCLua_DragObject_VCLuaGetAutoFree, mfCall);
	TLuaMethodInfo.Create(DragObjectFuncs, 'Control', @VCLua_DragObject_VCLuaGetControl, mfCall);
	TLuaMethodInfo.Create(DragObjectFuncs, 'DragPos', @VCLua_DragObject_VCLuaGetDragPos, mfCall);
	TLuaMethodInfo.Create(DragObjectFuncs, 'DragTarget', @VCLua_DragObject_VCLuaGetDragTarget, mfCall);
	TLuaMethodInfo.Create(DragObjectFuncs, 'DragTargetPos', @VCLua_DragObject_VCLuaGetDragTargetPos, mfCall);
	TLuaMethodInfo.Create(DragObjectFuncs, 'Dropped', @VCLua_DragObject_VCLuaGetDropped, mfCall);
	DragObjectSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(DragObjectSets, 'AlwaysShowDragImages', @VCLua_DragObject_VCLuaSetAlwaysShowDragImages, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(DragObjectSets, 'Control', @VCLua_DragObject_VCLuaSetControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(DragObjectSets, 'DragPos', @VCLua_DragObject_VCLuaSetDragPos, mfCall, TypeInfo(TPoint));
	TLuaMethodInfo.Create(DragObjectSets, 'DragTarget', @VCLua_DragObject_VCLuaSetDragTarget, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(DragObjectSets, 'DragTargetPos', @VCLua_DragObject_VCLuaSetDragTargetPos, mfCall, TypeInfo(TPoint));
	DragControlObjectFuncs := TLuaVmt.Create;
	
	DragControlObjectSets := TLuaVmt.Create;
	
	DragControlObjectExFuncs := TLuaVmt.Create;
	
	DragControlObjectExSets := TLuaVmt.Create;
	
	DragDockObjectFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(DragDockObjectFuncs, 'DockOffset', @VCLua_DragDockObject_VCLuaGetDockOffset, mfCall);
	TLuaMethodInfo.Create(DragDockObjectFuncs, 'DockRect', @VCLua_DragDockObject_VCLuaGetDockRect, mfCall);
	TLuaMethodInfo.Create(DragDockObjectFuncs, 'DropAlign', @VCLua_DragDockObject_VCLuaGetDropAlign, mfCall);
	TLuaMethodInfo.Create(DragDockObjectFuncs, 'DropOnControl', @VCLua_DragDockObject_VCLuaGetDropOnControl, mfCall);
	TLuaMethodInfo.Create(DragDockObjectFuncs, 'Floating', @VCLua_DragDockObject_VCLuaGetFloating, mfCall);
	TLuaMethodInfo.Create(DragDockObjectFuncs, 'IncreaseDockArea', @VCLua_DragDockObject_VCLuaGetIncreaseDockArea, mfCall);
	TLuaMethodInfo.Create(DragDockObjectFuncs, 'EraseDockRect', @VCLua_DragDockObject_VCLuaGetEraseDockRect, mfCall);
	DragDockObjectSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(DragDockObjectSets, 'DockOffset', @VCLua_DragDockObject_VCLuaSetDockOffset, mfCall, TypeInfo(TPoint));
	TLuaMethodInfo.Create(DragDockObjectSets, 'DockRect', @VCLua_DragDockObject_VCLuaSetDockRect, mfCall, TypeInfo(TRect));
	TLuaMethodInfo.Create(DragDockObjectSets, 'DropAlign', @VCLua_DragDockObject_VCLuaSetDropAlign, mfCall, TypeInfo(TAlign));
	TLuaMethodInfo.Create(DragDockObjectSets, 'DropOnControl', @VCLua_DragDockObject_VCLuaSetDropOnControl, mfCall, TypeInfo(TControl));
	TLuaMethodInfo.Create(DragDockObjectSets, 'Floating', @VCLua_DragDockObject_VCLuaSetFloating, mfCall, TypeInfo(Boolean));
	TLuaMethodInfo.Create(DragDockObjectSets, 'EraseDockRect', @VCLua_DragDockObject_VCLuaSetEraseDockRect, mfCall, TypeInfo(TRect));
	DragDockObjectExFuncs := TLuaVmt.Create;
	
	DragDockObjectExSets := TLuaVmt.Create;
	
	DockZoneFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(DockZoneFuncs, 'FindZone', @VCLua_DockZone_FindZone);
	TLuaMethodInfo.Create(DockZoneFuncs, 'FirstVisibleChild', @VCLua_DockZone_FirstVisibleChild);
	TLuaMethodInfo.Create(DockZoneFuncs, 'GetNextVisibleZone', @VCLua_DockZone_GetNextVisibleZone);
	TLuaMethodInfo.Create(DockZoneFuncs, 'NextVisible', @VCLua_DockZone_NextVisible);
	TLuaMethodInfo.Create(DockZoneFuncs, 'PrevVisible', @VCLua_DockZone_PrevVisible);
	TLuaMethodInfo.Create(DockZoneFuncs, 'AddSibling', @VCLua_DockZone_AddSibling);
	TLuaMethodInfo.Create(DockZoneFuncs, 'AddAsFirstChild', @VCLua_DockZone_AddAsFirstChild);
	TLuaMethodInfo.Create(DockZoneFuncs, 'AddAsLastChild', @VCLua_DockZone_AddAsLastChild);
	TLuaMethodInfo.Create(DockZoneFuncs, 'ReplaceChild', @VCLua_DockZone_ReplaceChild);
	TLuaMethodInfo.Create(DockZoneFuncs, 'GetLastChild', @VCLua_DockZone_GetLastChild);
	TLuaMethodInfo.Create(DockZoneFuncs, 'GetIndex', @VCLua_DockZone_GetIndex);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Remove', @VCLua_DockZone_Remove);
	TLuaMethodInfo.Create(DockZoneFuncs, 'ChildControl', @VCLua_DockZone_VCLuaGetChildControl, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'ChildCount', @VCLua_DockZone_VCLuaGetChildCount, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'FirstChild', @VCLua_DockZone_VCLuaGetFirstChild, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Height', @VCLua_DockZone_VCLuaGetHeight, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Left', @VCLua_DockZone_VCLuaGetLeft, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'LimitBegin', @VCLua_DockZone_VCLuaGetLimitBegin, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'LimitSize', @VCLua_DockZone_VCLuaGetLimitSize, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Orientation', @VCLua_DockZone_VCLuaGetOrientation, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Parent', @VCLua_DockZone_VCLuaGetParent, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Top', @VCLua_DockZone_VCLuaGetTop, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Tree', @VCLua_DockZone_VCLuaGetTree, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Visible', @VCLua_DockZone_VCLuaGetVisible, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'VisibleChildCount', @VCLua_DockZone_VCLuaGetVisibleChildCount, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'Width', @VCLua_DockZone_VCLuaGetWidth, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'NextSibling', @VCLua_DockZone_VCLuaGetNextSibling, mfCall);
	TLuaMethodInfo.Create(DockZoneFuncs, 'PrevSibling', @VCLua_DockZone_VCLuaGetPrevSibling, mfCall);
	DockZoneSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(DockZoneSets, 'Height', @VCLua_DockZone_VCLuaSetHeight, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(DockZoneSets, 'Left', @VCLua_DockZone_VCLuaSetLeft, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(DockZoneSets, 'LimitBegin', @VCLua_DockZone_VCLuaSetLimitBegin, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(DockZoneSets, 'LimitSize', @VCLua_DockZone_VCLuaSetLimitSize, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(DockZoneSets, 'Orientation', @VCLua_DockZone_VCLuaSetOrientation, mfCall, TypeInfo(TDockOrientation));
	TLuaMethodInfo.Create(DockZoneSets, 'Top', @VCLua_DockZone_VCLuaSetTop, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(DockZoneSets, 'Width', @VCLua_DockZone_VCLuaSetWidth, mfCall, TypeInfo(Integer));
	DockTreeFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(DockTreeFuncs, 'BeginUpdate', @VCLua_DockTree_BeginUpdate);
	TLuaMethodInfo.Create(DockTreeFuncs, 'EndUpdate', @VCLua_DockTree_EndUpdate);
	TLuaMethodInfo.Create(DockTreeFuncs, 'AdjustDockRect', @VCLua_DockTree_AdjustDockRect);
	TLuaMethodInfo.Create(DockTreeFuncs, 'AdjustDockRect2', @VCLua_DockTree_AdjustDockRect2);
	TLuaMethodInfo.Create(DockTreeFuncs, 'GetControlBounds', @VCLua_DockTree_GetControlBounds);
	TLuaMethodInfo.Create(DockTreeFuncs, 'InsertControl', @VCLua_DockTree_InsertControl);
	TLuaMethodInfo.Create(DockTreeFuncs, 'LoadFromStream', @VCLua_DockTree_LoadFromStream);
	TLuaMethodInfo.Create(DockTreeFuncs, 'PositionDockRect', @VCLua_DockTree_PositionDockRect);
	TLuaMethodInfo.Create(DockTreeFuncs, 'PositionDockRect2', @VCLua_DockTree_PositionDockRect2);
	TLuaMethodInfo.Create(DockTreeFuncs, 'RemoveControl', @VCLua_DockTree_RemoveControl);
	TLuaMethodInfo.Create(DockTreeFuncs, 'SaveToStream', @VCLua_DockTree_SaveToStream);
	TLuaMethodInfo.Create(DockTreeFuncs, 'SetReplacingControl', @VCLua_DockTree_SetReplacingControl);
	TLuaMethodInfo.Create(DockTreeFuncs, 'ResetBounds', @VCLua_DockTree_ResetBounds);
	TLuaMethodInfo.Create(DockTreeFuncs, 'DumpLayout', @VCLua_DockTree_DumpLayout);
	TLuaMethodInfo.Create(DockTreeFuncs, 'DockSite', @VCLua_DockTree_VCLuaGetDockSite, mfCall);
	TLuaMethodInfo.Create(DockTreeFuncs, 'RootZone', @VCLua_DockTree_VCLuaGetRootZone, mfCall);
	DockTreeSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(DockTreeSets, 'DockSite', @VCLua_DockTree_VCLuaSetDockSite, mfCall, TypeInfo(TWinControl));
end.
