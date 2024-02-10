(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRadioGroup;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateRadioGroup(L: Plua_State): Integer; cdecl;
function IsRadioGroup(L: Plua_State): Integer; cdecl;
function AsRadioGroup(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TRadioGroup; pti: PTypeInfo = nil); overload; inline;

type
    TLuaRadioGroup = class(TRadioGroup)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomRadioGroupFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_RadioGroup_CanModify(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	ret := lRadioGroup.CanModify();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_RadioGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@AllLevels);
	lRadioGroup.FlipChildren(AllLevels);
	
	Result := 0;
end;

function VCLua_RadioGroup_Rows(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	ret := lRadioGroup.Rows();
	lua_push(L,ret);
	
	Result := 1;
end;

function IsRadioGroup(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TRadioGroup);
end;
function AsRadioGroup(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TRadioGroup then
    lua_push(L, TRadioGroup(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TRadioGroup; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomRadioGroup',v);
end;
function CreateRadioGroup(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lRadioGroup := TLuaRadioGroup.Create(Parent);
	lRadioGroup.Parent := TWinControl(Parent);
	lRadioGroup.LuaCtl := TVCLuaControl.Create(lRadioGroup as TComponent,L,nil,'TCustomRadioGroup');
	InitControl(L,lRadioGroup,Name);
	CreateTableForKnownType(L,'TCustomRadioGroup',lRadioGroup);
	Result := 1;
end;

begin
	SetLength(CustomRadioGroupFuncs, 3+1);
	CustomRadioGroupFuncs[0].name:='CanModify';
	CustomRadioGroupFuncs[0].func:=@VCLua_RadioGroup_CanModify;
	CustomRadioGroupFuncs[1].name:='FlipChildren';
	CustomRadioGroupFuncs[1].func:=@VCLua_RadioGroup_FlipChildren;
	CustomRadioGroupFuncs[2].name:='Rows';
	CustomRadioGroupFuncs[2].func:=@VCLua_RadioGroup_Rows;
	CustomRadioGroupFuncs[3].name:=nil;
	CustomRadioGroupFuncs[3].func:=nil;

end.
