(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSplitter;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo;

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
    CustomSplitterFuncs: aoluaL_Reg;


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
	except
		on E: Exception do
			CallError(L, 'Splitter', 'AnchorSplitter', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Splitter', 'GetOtherResizeControl', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
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
	except
		on E: Exception do
			CallError(L, 'Splitter', 'MoveSplitter', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Splitter', 'SetSplitterPosition', E.ClassName, E.Message);
	end;
	Result := 0;
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
	except
		on E: Exception do
			CallError(L, 'Splitter', 'GetSplitterPosition', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
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
	SetLength(CustomSplitterFuncs, 5+1);
	CustomSplitterFuncs[0].name:='AnchorSplitter';
	CustomSplitterFuncs[0].func:=@VCLua_Splitter_AnchorSplitter;
	CustomSplitterFuncs[1].name:='GetOtherResizeControl';
	CustomSplitterFuncs[1].func:=@VCLua_Splitter_GetOtherResizeControl;
	CustomSplitterFuncs[2].name:='MoveSplitter';
	CustomSplitterFuncs[2].func:=@VCLua_Splitter_MoveSplitter;
	CustomSplitterFuncs[3].name:='SetSplitterPosition';
	CustomSplitterFuncs[3].func:=@VCLua_Splitter_SetSplitterPosition;
	CustomSplitterFuncs[4].name:='GetSplitterPosition';
	CustomSplitterFuncs[4].func:=@VCLua_Splitter_GetSplitterPosition;
	CustomSplitterFuncs[5].name:=nil;
	CustomSplitterFuncs[5].func:=nil;

end.
