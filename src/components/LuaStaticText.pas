(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStaticText;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, TypInfo;

function CreateStaticText(L: Plua_State): Integer; cdecl;
function IsStaticText(L: Plua_State): Integer; cdecl;
function AsStaticText(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStaticText; pti: PTypeInfo = nil); overload; inline;

type
    TLuaStaticText = class(TStaticText)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomStaticTextFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;


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
	CreateTableForKnownType(L,'TCustomStaticText',v);
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
	lStaticText.LuaCtl := TVCLuaControl.Create(lStaticText as TComponent,L,nil,'TCustomStaticText');
	InitControl(L,lStaticText,Name);
	CreateTableForKnownType(L,'TCustomStaticText',lStaticText);
	Result := 1;
end;

begin
	SetLength(CustomStaticTextFuncs, 0+1);
	
	CustomStaticTextFuncs[0].name:=nil;
	CustomStaticTextFuncs[0].func:=nil;

end.
