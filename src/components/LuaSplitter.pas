(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSplitter;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateSplitter(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSplitter; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSplitter = class(TSplitter)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomSplitterFuncs: TLuaVmt;
    CustomSplitterSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls, LuaControl;

function VCLua_Splitter_AnchorSplitter(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	Kind:TAnchorKind;
	AControl:TControl;
begin
	CheckArg(L, 3);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@Kind,TypeInfo(TAnchorKind));
	luaL_check(L,3,@AControl);
	try
		lSplitter.AnchorSplitter(Kind,AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'AnchorSplitter', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_VCLuaSetResizeControl(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	val:TControl;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lSplitter.ResizeControl := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'ResizeControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_VCLuaGetResizeControl(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:TControl;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.ResizeControl;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'ResizeControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Splitter_GetOtherResizeControl(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:TControl;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.GetOtherResizeControl();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'GetOtherResizeControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Splitter_MoveSplitter(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	Offset:integer;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@Offset);
	try
		lSplitter.MoveSplitter(Offset);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'MoveSplitter', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_SetSplitterPosition(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	NewPosition:integer;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@NewPosition);
	try
		lSplitter.SetSplitterPosition(NewPosition);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'SetSplitterPosition', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_GetSplitterPosition(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:integer;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.GetSplitterPosition();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'GetSplitterPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Splitter_VCLuaSetAutoSnap(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	val:boolean;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lSplitter.AutoSnap := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'AutoSnap', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_VCLuaGetAutoSnap(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:boolean;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.AutoSnap;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'AutoSnap', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Splitter_VCLuaSetBeveled(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	val:boolean;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lSplitter.Beveled := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'Beveled', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_VCLuaGetBeveled(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:boolean;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.Beveled;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'Beveled', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Splitter_VCLuaSetMinSize(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	val:integer;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lSplitter.MinSize := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'MinSize', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_VCLuaGetMinSize(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:integer;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.MinSize;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'MinSize', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Splitter_VCLuaSetResizeAnchor(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	val:TAnchorKind;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TAnchorKind));
	try
		lSplitter.ResizeAnchor := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'ResizeAnchor', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_VCLuaGetResizeAnchor(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:TAnchorKind;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.ResizeAnchor;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'ResizeAnchor', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_Splitter_VCLuaSetResizeStyle(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	val:TResizeStyle;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TResizeStyle));
	try
		lSplitter.ResizeStyle := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'ResizeStyle', E.ClassName, E.Message);
	end;
end;

function VCLua_Splitter_VCLuaGetResizeStyle(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	ret:TResizeStyle;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	try
		ret := lSplitter.ResizeStyle;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Splitter', 'ResizeStyle', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

procedure lua_push(L: Plua_State; const v: TSplitter; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomSplitter',v);
end;
function CreateSplitter(L: Plua_State): Integer; cdecl;
var
	lSplitter:TLuaSplitter;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lSplitter := TLuaSplitter.Create(Parent);
	lSplitter.Parent := TWinControl(Parent);
	lSplitter.LuaCtl := TVCLuaControl.Create(lSplitter as TComponent,L,nil,'TCustomSplitter');
	InitControl(L,lSplitter,Name);
	CreateTableForKnownType(L,'TCustomSplitter',lSplitter);
	Result := 1;
end;

begin
	CustomSplitterFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'AnchorSplitter', @VCLua_Splitter_AnchorSplitter);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'ResizeControl', @VCLua_Splitter_VCLuaGetResizeControl, mfCall);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'GetOtherResizeControl', @VCLua_Splitter_GetOtherResizeControl);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'MoveSplitter', @VCLua_Splitter_MoveSplitter);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'SetSplitterPosition', @VCLua_Splitter_SetSplitterPosition);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'GetSplitterPosition', @VCLua_Splitter_GetSplitterPosition);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'AutoSnap', @VCLua_Splitter_VCLuaGetAutoSnap, mfCall);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'Beveled', @VCLua_Splitter_VCLuaGetBeveled, mfCall);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'MinSize', @VCLua_Splitter_VCLuaGetMinSize, mfCall);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'ResizeAnchor', @VCLua_Splitter_VCLuaGetResizeAnchor, mfCall);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'ResizeStyle', @VCLua_Splitter_VCLuaGetResizeStyle, mfCall);
	CustomSplitterSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomSplitterSets, 'ResizeControl', @VCLua_Splitter_VCLuaSetResizeControl, mfCall);
	TLuaMethodInfo.Create(CustomSplitterSets, 'AutoSnap', @VCLua_Splitter_VCLuaSetAutoSnap, mfCall);
	TLuaMethodInfo.Create(CustomSplitterSets, 'Beveled', @VCLua_Splitter_VCLuaSetBeveled, mfCall);
	TLuaMethodInfo.Create(CustomSplitterSets, 'MinSize', @VCLua_Splitter_VCLuaSetMinSize, mfCall);
	TLuaMethodInfo.Create(CustomSplitterSets, 'ResizeAnchor', @VCLua_Splitter_VCLuaSetResizeAnchor, mfCall);
	TLuaMethodInfo.Create(CustomSplitterSets, 'ResizeStyle', @VCLua_Splitter_VCLuaSetResizeStyle, mfCall);
end.
