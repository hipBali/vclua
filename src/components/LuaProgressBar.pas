(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaProgressBar;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ComCtrls;

function CreateProgressBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TProgressBar; pti: PTypeInfo = nil); overload; inline;

type
    TLuaProgressBar = class(TProgressBar)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomProgressBarFuncs: TLuaVmt;
    CustomProgressBarSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

function VCLua_ProgressBar_StepIt(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		lProgressBar.StepIt();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'StepIt', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_StepBy(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	Delta:Integer;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@Delta);
	try
		lProgressBar.StepBy(Delta);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'StepBy', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaSetMax(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lProgressBar.Max := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Max', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetMax(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.Max;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Max', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ProgressBar_VCLuaSetMin(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lProgressBar.Min := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Min', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetMin(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.Min;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Min', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ProgressBar_VCLuaSetOrientation(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:TProgressBarOrientation;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TProgressBarOrientation));
	try
		lProgressBar.Orientation := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Orientation', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetOrientation(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:TProgressBarOrientation;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.Orientation;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Orientation', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ProgressBar_VCLuaSetPosition(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lProgressBar.Position := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Position', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetPosition(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.Position;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Position', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ProgressBar_VCLuaSetSmooth(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:boolean;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lProgressBar.Smooth := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Smooth', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetSmooth(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:boolean;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.Smooth;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Smooth', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ProgressBar_VCLuaSetStep(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:Integer;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lProgressBar.Step := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Step', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetStep(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:Integer;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.Step;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Step', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_ProgressBar_VCLuaSetStyle(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:TProgressBarStyle;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val,TypeInfo(TProgressBarStyle));
	try
		lProgressBar.Style := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Style', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetStyle(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:TProgressBarStyle;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.Style;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'Style', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_ProgressBar_VCLuaSetBarShowText(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	val:boolean;
begin
	CheckArg(L, 2);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	luaL_check(L,2,@val);
	try
		lProgressBar.BarShowText := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'BarShowText', E.ClassName, E.Message);
	end;
end;

function VCLua_ProgressBar_VCLuaGetBarShowText(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	ret:boolean;
begin
	CheckArg(L, 1);
	lProgressBar := TLuaProgressBar(GetLuaObject(L, 1));
	try
		ret := lProgressBar.BarShowText;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'ProgressBar', 'BarShowText', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TProgressBar; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomProgressBar',v);
end;
function CreateProgressBar(L: Plua_State): Integer; cdecl;
var
	lProgressBar:TLuaProgressBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lProgressBar := TLuaProgressBar.Create(Parent);
	lProgressBar.Parent := TWinControl(Parent);
	lProgressBar.LuaCtl := TVCLuaControl.Create(lProgressBar as TComponent,L,nil,'TCustomProgressBar');
	InitControl(L,lProgressBar,Name);
	CreateTableForKnownType(L,'TCustomProgressBar',lProgressBar);
	Result := 1;
end;

begin
	CustomProgressBarFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'StepIt', @VCLua_ProgressBar_StepIt);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'StepBy', @VCLua_ProgressBar_StepBy);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'Max', @VCLua_ProgressBar_VCLuaGetMax, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'Min', @VCLua_ProgressBar_VCLuaGetMin, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'Orientation', @VCLua_ProgressBar_VCLuaGetOrientation, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'Position', @VCLua_ProgressBar_VCLuaGetPosition, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'Smooth', @VCLua_ProgressBar_VCLuaGetSmooth, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'Step', @VCLua_ProgressBar_VCLuaGetStep, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'Style', @VCLua_ProgressBar_VCLuaGetStyle, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarFuncs, 'BarShowText', @VCLua_ProgressBar_VCLuaGetBarShowText, mfCall);
	CustomProgressBarSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomProgressBarSets, 'Max', @VCLua_ProgressBar_VCLuaSetMax, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarSets, 'Min', @VCLua_ProgressBar_VCLuaSetMin, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarSets, 'Orientation', @VCLua_ProgressBar_VCLuaSetOrientation, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarSets, 'Position', @VCLua_ProgressBar_VCLuaSetPosition, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarSets, 'Smooth', @VCLua_ProgressBar_VCLuaSetSmooth, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarSets, 'Step', @VCLua_ProgressBar_VCLuaSetStep, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarSets, 'Style', @VCLua_ProgressBar_VCLuaSetStyle, mfCall);
	TLuaMethodInfo.Create(CustomProgressBarSets, 'BarShowText', @VCLua_ProgressBar_VCLuaSetBarShowText, mfCall);
end.
