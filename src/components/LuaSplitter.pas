(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSplitter;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateSplitter(L: Plua_State): Integer; cdecl;
function IsSplitter(L: Plua_State): Integer; cdecl;
function AsSplitter(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TSplitter; pti: PTypeInfo = nil); overload; inline;

type
    TLuaSplitter = class(TSplitter)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomSplitterFuncs: TLuaVmt;


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

function IsSplitter(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TSplitter);
end;
function AsSplitter(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TSplitter then
    lua_push(L, TSplitter(o))
  else
    lua_pushnil(L);
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
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'GetOtherResizeControl', @VCLua_Splitter_GetOtherResizeControl);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'MoveSplitter', @VCLua_Splitter_MoveSplitter);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'SetSplitterPosition', @VCLua_Splitter_SetSplitterPosition);
	TLuaMethodInfo.Create(CustomSplitterFuncs, 'GetSplitterPosition', @VCLua_Splitter_GetSplitterPosition);
end.
