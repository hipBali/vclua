(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaLabel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateLabel(L: Plua_State): Integer; cdecl;
procedure LabelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaLabel = class(TLabel)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Label_CalcFittingFontHeight(L: Plua_State): Integer; cdecl;
var 
	lLabel:TLuaLabel;
	TheText:string;
	MaxWidth:Integer;
	MaxHeight:Integer;
	FontHeight:Integer;
	NeededWidth:Integer;
	NeededHeight:Integer;
	ret:Boolean;
begin
	CheckArg(L, 4);
	lLabel := TLuaLabel(GetLuaObject(L, 1));
	TheText := lua_toStringCP(L,2);
	MaxWidth := lua_tointeger(L,3);
	MaxHeight := lua_tointeger(L,4);
	ret := lLabel.CalcFittingFontHeight(TheText,MaxWidth,MaxHeight,FontHeight,NeededWidth,NeededHeight);
	lua_pushboolean(L,ret);
	lua_pushinteger(L,FontHeight);	
lua_pushinteger(L,NeededWidth);	
lua_pushinteger(L,NeededHeight);
	Result := 4;
end;

function VCLua_Label_ColorIsStored(L: Plua_State): Integer; cdecl;
var 
	lLabel:TLuaLabel;
	ret:boolean;
begin
	CheckArg(L, 1);
	lLabel := TLuaLabel(GetLuaObject(L, 1));
	ret := lLabel.ColorIsStored();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Label_AdjustFontForOptimalFill(L: Plua_State): Integer; cdecl;
var 
	lLabel:TLuaLabel;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lLabel := TLuaLabel(GetLuaObject(L, 1));
	ret := lLabel.AdjustFontForOptimalFill();
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Label_Paint(L: Plua_State): Integer; cdecl;
var 
	lLabel:TLuaLabel;
begin
	CheckArg(L, 1);
	lLabel := TLuaLabel(GetLuaObject(L, 1));
	lLabel.Paint();
	
	Result := 0;
end;

function VCLua_Label_SetBounds(L: Plua_State): Integer; cdecl;
var 
	lLabel:TLuaLabel;
	aLeft:integer;
	aTop:integer;
	aWidth:integer;
	aHeight:integer;
begin
	CheckArg(L, 5);
	lLabel := TLuaLabel(GetLuaObject(L, 1));
	aLeft := lua_tointeger(L,2);
	aTop := lua_tointeger(L,3);
	aWidth := lua_tointeger(L,4);
	aHeight := lua_tointeger(L,5);
	lLabel.SetBounds(aLeft,aTop,aWidth,aHeight);
	
	Result := 0;
end;

procedure LabelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'CalcFittingFontHeight', @VCLua_Label_CalcFittingFontHeight);
	LuaSetTableFunction(L, Index, 'ColorIsStored', @VCLua_Label_ColorIsStored);
	LuaSetTableFunction(L, Index, 'AdjustFontForOptimalFill', @VCLua_Label_AdjustFontForOptimalFill);
	LuaSetTableFunction(L, Index, 'Paint', @VCLua_Label_Paint);
	LuaSetTableFunction(L, Index, 'SetBounds', @VCLua_Label_SetBounds);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateLabel(L: Plua_State): Integer; cdecl;
var
	lLabel:TLuaLabel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lLabel := TLuaLabel.Create(Parent);
	lLabel.Parent := TWinControl(Parent);
	lLabel.LuaCtl := TVCLuaControl.Create(TControl(lLabel),L,@LabelToTable);
	InitControl(L,lLabel,Name);
	LabelToTable(L, -1, lLabel);
	Result := 1;
end;

end.
