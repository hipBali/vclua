(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaSplitter;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, LuaControl;

function CreateSplitter(L: Plua_State): Integer; cdecl;
procedure SplitterToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaSplitter = class(TSplitter)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Splitter_AnchorSplitter(L: Plua_State): Integer; cdecl;
var 
	lSplitter:TLuaSplitter;
	Kind:TAnchorKind;
	AControl:TControl;
begin
	CheckArg(L, 3);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	Kind := TAnchorKind(GetLuaObject(L,2));
	AControl := TControl(GetLuaObject(L,3));
	lSplitter.AnchorSplitter(Kind,AControl);
	
	Result := 0;
end;

function VCLua_Splitter_GetOtherResizeControl(L: Plua_State): Integer; cdecl;
var 
	lSplitter:TLuaSplitter;
	ret:TControl;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	ret := lSplitter.GetOtherResizeControl();
	lua_pushlightuserdata(L,ret);
	
	Result := 1;
end;

function VCLua_Splitter_MoveSplitter(L: Plua_State): Integer; cdecl;
var 
	lSplitter:TLuaSplitter;
	Offset:integer;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	Offset := lua_tointeger(L,2);
	lSplitter.MoveSplitter(Offset);
	
	Result := 0;
end;

function VCLua_Splitter_SetSplitterPosition(L: Plua_State): Integer; cdecl;
var 
	lSplitter:TLuaSplitter;
	NewPosition:integer;
begin
	CheckArg(L, 2);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	NewPosition := lua_tointeger(L,2);
	lSplitter.SetSplitterPosition(NewPosition);
	
	Result := 0;
end;

function VCLua_Splitter_GetSplitterPosition(L: Plua_State): Integer; cdecl;
var 
	lSplitter:TLuaSplitter;
	ret:integer;
begin
	CheckArg(L, 1);
	lSplitter := TLuaSplitter(GetLuaObject(L, 1));
	ret := lSplitter.GetSplitterPosition();
	lua_pushinteger(L,ret);
	
	Result := 1;
end;

procedure SplitterToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'AnchorSplitter', @VCLua_Splitter_AnchorSplitter);
	LuaSetTableFunction(L, Index, 'GetOtherResizeControl', @VCLua_Splitter_GetOtherResizeControl);
	LuaSetTableFunction(L, Index, 'MoveSplitter', @VCLua_Splitter_MoveSplitter);
	LuaSetTableFunction(L, Index, 'SetSplitterPosition', @VCLua_Splitter_SetSplitterPosition);
	LuaSetTableFunction(L, Index, 'GetSplitterPosition', @VCLua_Splitter_GetSplitterPosition);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lSplitter.LuaCtl := TVCLuaControl.Create(lSplitter as TComponent,L,@SplitterToTable);
	InitControl(L,lSplitter,Name);
	SplitterToTable(L, -1, lSplitter);
	Result := 1;
end;

end.
