(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCoolBar;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ComCtrls, Controls, TypInfo;

function CreateCoolBar(L: Plua_State): Integer; cdecl;
function IsCoolBar(L: Plua_State): Integer; cdecl;
function AsCoolBar(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCoolBar; pti: PTypeInfo = nil); overload; inline;
procedure CoolBarToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaCoolBar = class(TCoolBar)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomCoolBarFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_CoolBar_AutosizeBands(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	lCoolBar.AutosizeBands();
	
	Result := 0;
end;

function VCLua_CoolBar_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	lCoolBar.EndUpdate();
	
	Result := 0;
end;

function VCLua_CoolBar_Invalidate(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
begin
	CheckArg(L, 1);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	lCoolBar.Invalidate();
	
	Result := 0;
end;

function VCLua_CoolBar_InsertControl(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
	Index:integer;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	Index := lua_tointeger(L,3);
	lCoolBar.InsertControl(AControl,Index);
	
	Result := 0;
end;

function VCLua_CoolBar_MouseToBandPos(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	X:Integer;
	Y:Integer;
	ABand:Integer;
	AGrabber:Boolean;
begin
	CheckArg(L, 3);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	X := lua_tointeger(L,2);
	Y := lua_tointeger(L,3);
	lCoolBar.MouseToBandPos(X,Y,ABand,AGrabber);
	lua_push(L,ABand);
	lua_push(L,AGrabber);
	Result := 2;
end;

function VCLua_CoolBar_RemoveControl(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lCoolBar := TLuaCoolBar(GetLuaObject(L, 1));
	AControl := TControl(GetLuaObject(L,2));
	lCoolBar.RemoveControl(AControl);
	
	Result := 0;
end;

function IsCoolBar(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCoolBar);
end;
function AsCoolBar(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCoolBar then
    lua_push(L, TCoolBar(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCoolBar; pti: PTypeInfo);
begin
	CoolBarToTable(L,-1,v);
end;
procedure CoolBarToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomCoolBar');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateCoolBar(L: Plua_State): Integer; cdecl;
var
	lCoolBar:TLuaCoolBar;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCoolBar := TLuaCoolBar.Create(Parent);
	lCoolBar.Parent := TWinControl(Parent);
	lCoolBar.LuaCtl := TVCLuaControl.Create(lCoolBar as TComponent,L,@CoolBarToTable);
	InitControl(L,lCoolBar,Name);
	CoolBarToTable(L, -1, lCoolBar);
	Result := 1;
end;

begin
	SetLength(CustomCoolBarFuncs, 6+1);
	CustomCoolBarFuncs[0].name:='AutosizeBands';
	CustomCoolBarFuncs[0].func:=@VCLua_CoolBar_AutosizeBands;
	CustomCoolBarFuncs[1].name:='EndUpdate';
	CustomCoolBarFuncs[1].func:=@VCLua_CoolBar_EndUpdate;
	CustomCoolBarFuncs[2].name:='Invalidate';
	CustomCoolBarFuncs[2].func:=@VCLua_CoolBar_Invalidate;
	CustomCoolBarFuncs[3].name:='InsertControl';
	CustomCoolBarFuncs[3].func:=@VCLua_CoolBar_InsertControl;
	CustomCoolBarFuncs[4].name:='MouseToBandPos';
	CustomCoolBarFuncs[4].func:=@VCLua_CoolBar_MouseToBandPos;
	CustomCoolBarFuncs[5].name:='RemoveControl';
	CustomCoolBarFuncs[5].func:=@VCLua_CoolBar_RemoveControl;
	CustomCoolBarFuncs[6].name:=nil;
	CustomCoolBarFuncs[6].func:=nil;

end.
