(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaHeaderControl;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateHeaderControl(L: Plua_State): Integer; cdecl;
function IsHeaderControl(L: Plua_State): Integer; cdecl;
function AsHeaderControl(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: THeaderControl; pti: PTypeInfo = nil); overload; inline;
procedure HeaderControlToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaHeaderControl = class(THeaderControl)
        LuaCtl: TVCLuaControl;
    end;


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
	lua_pushinteger(L,ret);
	
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
	Index := lua_tointeger(L,2);
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
	M := lua_tointeger(L,2);
	D := lua_tointeger(L,3);
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
	HeaderControlToTable(L,-1,v);
end;
procedure HeaderControlToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Click', @VCLua_HeaderControl_Click);
	LuaSetTableFunction(L, Index, 'DblClick', @VCLua_HeaderControl_DblClick);
	LuaSetTableFunction(L, Index, 'GetSectionAt', @VCLua_HeaderControl_GetSectionAt);
	LuaSetTableFunction(L, Index, 'Paint', @VCLua_HeaderControl_Paint);
	LuaSetTableFunction(L, Index, 'PaintSection', @VCLua_HeaderControl_PaintSection);
	LuaSetTableFunction(L, Index, 'ChangeScale', @VCLua_HeaderControl_ChangeScale);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lHeaderControl.LuaCtl := TVCLuaControl.Create(lHeaderControl as TComponent,L,@HeaderControlToTable);
	InitControl(L,lHeaderControl,Name);
	HeaderControlToTable(L, -1, lHeaderControl);
	Result := 1;
end;

end.
