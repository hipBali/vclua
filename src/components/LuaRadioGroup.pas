(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRadioGroup;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateRadioGroup(L: Plua_State): Integer; cdecl;
function IsRadioGroup(L: Plua_State): Integer; cdecl;
function AsRadioGroup(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TRadioGroup; pti: PTypeInfo = nil); overload; inline;
procedure RadioGroupToTable(L:Plua_State; Index:Integer; Sender:TObject);

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
	AllLevels := lua_toboolean(L,2);
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
	RadioGroupToTable(L,-1,v);
end;
procedure RadioGroupToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomRadioGroup');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lRadioGroup.LuaCtl := TVCLuaControl.Create(lRadioGroup as TComponent,L,@RadioGroupToTable);
	InitControl(L,lRadioGroup,Name);
	RadioGroupToTable(L, -1, lRadioGroup);
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
