(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaLabel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateLabel(L: Plua_State): Integer; cdecl;
function IsLabel(L: Plua_State): Integer; cdecl;
function AsLabel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TLabel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaLabel = class(TLabel)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomLabelFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

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
	lua_push(L,ret);
	lua_push(L,FontHeight);
	lua_push(L,NeededWidth);
	lua_push(L,NeededHeight);
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
	lua_push(L,ret);
	
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
	lua_push(L,ret);
	
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

function IsLabel(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TLabel);
end;
function AsLabel(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TLabel then
    lua_push(L, TLabel(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TLabel; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomLabel',v);
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
	lLabel.LuaCtl := TVCLuaControl.Create(lLabel as TComponent,L,nil,'TCustomLabel');
	InitControl(L,lLabel,Name);
	CreateTableForKnownType(L,'TCustomLabel',lLabel);
	Result := 1;
end;

begin
	SetLength(CustomLabelFuncs, 5+1);
	CustomLabelFuncs[0].name:='CalcFittingFontHeight';
	CustomLabelFuncs[0].func:=@VCLua_Label_CalcFittingFontHeight;
	CustomLabelFuncs[1].name:='ColorIsStored';
	CustomLabelFuncs[1].func:=@VCLua_Label_ColorIsStored;
	CustomLabelFuncs[2].name:='AdjustFontForOptimalFill';
	CustomLabelFuncs[2].func:=@VCLua_Label_AdjustFontForOptimalFill;
	CustomLabelFuncs[3].name:='Paint';
	CustomLabelFuncs[3].func:=@VCLua_Label_Paint;
	CustomLabelFuncs[4].name:='SetBounds';
	CustomLabelFuncs[4].func:=@VCLua_Label_SetBounds;
	CustomLabelFuncs[5].name:=nil;
	CustomLabelFuncs[5].func:=nil;

end.
