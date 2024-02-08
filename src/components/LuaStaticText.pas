(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStaticText;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateStaticText(L: Plua_State): Integer; cdecl;
function IsStaticText(L: Plua_State): Integer; cdecl;
function AsStaticText(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStaticText; pti: PTypeInfo = nil); overload; inline;
procedure StaticTextToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStaticText = class(TStaticText)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomStaticTextFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsStaticText(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TStaticText);
end;
function AsStaticText(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TStaticText then
    lua_push(L, TStaticText(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TStaticText; pti: PTypeInfo);
begin
	StaticTextToTable(L,-1,v);
end;
procedure StaticTextToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomStaticText');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateStaticText(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lStaticText := TLuaStaticText.Create(Parent);
	lStaticText.Parent := TWinControl(Parent);
	lStaticText.LuaCtl := TVCLuaControl.Create(lStaticText as TComponent,L,@StaticTextToTable);
	InitControl(L,lStaticText,Name);
	StaticTextToTable(L, -1, lStaticText);
	Result := 1;
end;

begin
	SetLength(CustomStaticTextFuncs, 0+1);
	
	CustomStaticTextFuncs[0].name:=nil;
	CustomStaticTextFuncs[0].func:=nil;

end.
