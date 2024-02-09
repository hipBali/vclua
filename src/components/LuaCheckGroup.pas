(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckGroup;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateCheckGroup(L: Plua_State): Integer; cdecl;
function IsCheckGroup(L: Plua_State): Integer; cdecl;
function AsCheckGroup(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TCheckGroup; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCheckGroup = class(TCheckGroup)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomCheckGroupFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_CheckGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	AllLevels := lua_toboolean(L,2);
	lCheckGroup.FlipChildren(AllLevels);
	
	Result := 0;
end;

function VCLua_CheckGroup_Rows(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	ret := lCheckGroup.Rows();
	lua_push(L,ret);
	
	Result := 1;
end;

function IsCheckGroup(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TCheckGroup);
end;
function AsCheckGroup(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TCheckGroup then
    lua_push(L, TCheckGroup(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TCheckGroup; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomCheckGroup',v);
end;
function CreateCheckGroup(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lCheckGroup := TLuaCheckGroup.Create(Parent);
	lCheckGroup.Parent := TWinControl(Parent);
	lCheckGroup.LuaCtl := TVCLuaControl.Create(lCheckGroup as TComponent,L,nil,'TCustomCheckGroup');
	InitControl(L,lCheckGroup,Name);
	CreateTableForKnownType(L,'TCustomCheckGroup',lCheckGroup);
	Result := 1;
end;

begin
	SetLength(CustomCheckGroupFuncs, 2+1);
	CustomCheckGroupFuncs[0].name:='FlipChildren';
	CustomCheckGroupFuncs[0].func:=@VCLua_CheckGroup_FlipChildren;
	CustomCheckGroupFuncs[1].name:='Rows';
	CustomCheckGroupFuncs[1].func:=@VCLua_CheckGroup_Rows;
	CustomCheckGroupFuncs[2].name:=nil;
	CustomCheckGroupFuncs[2].func:=nil;

end.
