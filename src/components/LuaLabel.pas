(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaLabel;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, StdCtrls;

function CreateLabel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TLabel; pti: PTypeInfo = nil); overload; inline;

type
    TLuaLabel = class(TLabel)
    end;
var
    CustomLabelFuncs: TLuaVmt;
    CustomLabelSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

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
	luaL_check(L,2,@TheText);
	luaL_check(L,3,@MaxWidth);
	luaL_check(L,4,@MaxHeight);
	try
		ret := lLabel.CalcFittingFontHeight(TheText,MaxWidth,MaxHeight,FontHeight,NeededWidth,NeededHeight);
		Result := 4;
	except
		on E: Exception do
			CallError(L, 'Label', 'CalcFittingFontHeight', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	lua_push(L,FontHeight);
	lua_push(L,NeededWidth);
	lua_push(L,NeededHeight);
end;

function VCLua_Label_AdjustFontForOptimalFill(L: Plua_State): Integer; cdecl;
var
	lLabel:TLuaLabel;
	ret:Boolean;
begin
	CheckArg(L, 1);
	lLabel := TLuaLabel(GetLuaObject(L, 1));
	try
		ret := lLabel.AdjustFontForOptimalFill();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Label', 'AdjustFontForOptimalFill', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Label_Paint(L: Plua_State): Integer; cdecl;
var
	lLabel:TLuaLabel;
begin
	CheckArg(L, 1);
	lLabel := TLuaLabel(GetLuaObject(L, 1));
	try
		lLabel.Paint();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Label', 'Paint', E.ClassName, E.Message);
	end;
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
	try
	GetControlParents(L,TWinControl(Parent),Name);
	lLabel := TLuaLabel.Create(Parent);
	lLabel.Parent := TWinControl(Parent);
	CreateTableForKnownType(L,'TCustomLabel',lLabel);
	InitControl(L,lLabel,Name);
	Result := 1;
	except
		on E: Exception do
			CallError(L, 'VCL', 'Label', E.ClassName, E.Message);
	end;
end;

begin
	CustomLabelFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomLabelFuncs, 'CalcFittingFontHeight', @VCLua_Label_CalcFittingFontHeight);
	TLuaMethodInfo.Create(CustomLabelFuncs, 'AdjustFontForOptimalFill', @VCLua_Label_AdjustFontForOptimalFill);
	TLuaMethodInfo.Create(CustomLabelFuncs, 'Paint', @VCLua_Label_Paint);
	CustomLabelSets := TLuaVmt.Create;
	
end.
