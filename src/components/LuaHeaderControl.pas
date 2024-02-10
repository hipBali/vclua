(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaHeaderControl;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

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
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_HeaderControl_Click(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 1);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	lHeaderControl.Click();
	
	Result := 0;
end;

function VCLua_HeaderControl_DblClick(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 1);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	lHeaderControl.DblClick();
	
	Result := 0;
end;

function VCLua_HeaderControl_GetSectionAt(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
	P:TPoint;
	ret:Integer;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	P := lua_toTPoint(L,2);
	ret := lHeaderControl.GetSectionAt(P);
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_HeaderControl_Paint(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
begin
	CheckArg(L, 1);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	lHeaderControl.Paint();
	
	Result := 0;
end;

function VCLua_HeaderControl_PaintSection(L: Plua_State): Integer; cdecl;
var
	lHeaderControl:TLuaHeaderControl;
	Index:Integer;
begin
	CheckArg(L, 2);
	lHeaderControl := TLuaHeaderControl(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	lHeaderControl.PaintSection(Index);
	
	Result := 0;
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
	lHeaderControl.ChangeScale(M,D);
	
	Result := 0;
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
	SetLength(CustomHeaderControlFuncs, 6+1);
	CustomHeaderControlFuncs[0].name:='Click';
	CustomHeaderControlFuncs[0].func:=@VCLua_HeaderControl_Click;
	CustomHeaderControlFuncs[1].name:='DblClick';
	CustomHeaderControlFuncs[1].func:=@VCLua_HeaderControl_DblClick;
	CustomHeaderControlFuncs[2].name:='GetSectionAt';
	CustomHeaderControlFuncs[2].func:=@VCLua_HeaderControl_GetSectionAt;
	CustomHeaderControlFuncs[3].name:='Paint';
	CustomHeaderControlFuncs[3].func:=@VCLua_HeaderControl_Paint;
	CustomHeaderControlFuncs[4].name:='PaintSection';
	CustomHeaderControlFuncs[4].func:=@VCLua_HeaderControl_PaintSection;
	CustomHeaderControlFuncs[5].name:='ChangeScale';
	CustomHeaderControlFuncs[5].func:=@VCLua_HeaderControl_ChangeScale;
	CustomHeaderControlFuncs[6].name:=nil;
	CustomHeaderControlFuncs[6].func:=nil;

end.
