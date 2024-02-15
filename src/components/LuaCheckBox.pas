(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckBox;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateCheckBox(L: Plua_State): Integer; cdecl;
function IsCheckBox(L: Plua_State): Integer; cdecl;
function AsCheckBox(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCheckBox; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCheckBox = class(TCheckBox)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCheckBoxFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;


function IsCheckBox(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCheckBox);
end;
function AsCheckBox(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCheckBox then
    lua_push(L, TCheckBox(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCheckBox; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCheckBox',v);
end;
function CreateCheckBox(L: Plua_State): Integer; cdecl;
var
	lCheckBox:TLuaCheckBox;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckBox := TLuaCheckBox.Create(Parent);
	lCheckBox.Parent := TWinControl(Parent);
	lCheckBox.LuaCtl := TVCLuaControl.Create(lCheckBox as TComponent,L,nil,'TCustomCheckBox');
	InitControl(L,lCheckBox,Name);
	CreateTableForKnownType(L,'TCustomCheckBox',lCheckBox);
	Result := 1;
end;

begin
	SetLength(CustomCheckBoxFuncs, 0+1);
	
	CustomCheckBoxFuncs[0].name:=nil;
	CustomCheckBoxFuncs[0].func:=nil;

end.
