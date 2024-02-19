(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaHeaderControl;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, TypInfo;

function CreateHeaderControl(L: Plua_State): Integer; cdecl;
function IsHeaderControl(L: Plua_State): Integer; cdecl;
function AsHeaderControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: THeaderControl; pti: PTypeInfo = nil); overload; inline;

type
    TLuaHeaderControl = class(THeaderControl)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomHeaderControlFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

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

function IsHeaderControl(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is THeaderControl);
end;
function AsHeaderControl(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is THeaderControl then
    lua_push(L, THeaderControl(o))
  else
    lua_pushnil(L);
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
	InitControl(L,lHeaderControl,Name);
	CreateTableForKnownType(L,'TCustomHeaderControl',lHeaderControl);
	Result := 1;
end;

begin
	SetLength(CustomHeaderControlFuncs, 7+1);
	CustomHeaderControlFuncs[0].name:='SectionFromOriginalIndex';
	CustomHeaderControlFuncs[0].func:=@VCLua_HeaderControl_SectionFromOriginalIndex;
	CustomHeaderControlFuncs[1].name:='Click';
	CustomHeaderControlFuncs[1].func:=@VCLua_HeaderControl_Click;
	CustomHeaderControlFuncs[2].name:='DblClick';
	CustomHeaderControlFuncs[2].func:=@VCLua_HeaderControl_DblClick;
	CustomHeaderControlFuncs[3].name:='GetSectionAt';
	CustomHeaderControlFuncs[3].func:=@VCLua_HeaderControl_GetSectionAt;
	CustomHeaderControlFuncs[4].name:='Paint';
	CustomHeaderControlFuncs[4].func:=@VCLua_HeaderControl_Paint;
	CustomHeaderControlFuncs[5].name:='PaintSection';
	CustomHeaderControlFuncs[5].func:=@VCLua_HeaderControl_PaintSection;
	CustomHeaderControlFuncs[6].name:='ChangeScale';
	CustomHeaderControlFuncs[6].func:=@VCLua_HeaderControl_ChangeScale;
	CustomHeaderControlFuncs[7].name:=nil;
	CustomHeaderControlFuncs[7].func:=nil;

end.
