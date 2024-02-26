(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaRadioGroup;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo, LuaVmt;

function CreateRadioGroup(L: Plua_State): Integer; cdecl;
function IsRadioGroup(L: Plua_State): Integer; cdecl;
function AsRadioGroup(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TRadioGroup; pti: PTypeInfo = nil); overload; inline;

type
    TLuaRadioGroup = class(TRadioGroup)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomRadioGroupFuncs: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_RadioGroup_CanModify(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:boolean;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.CanModify();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'CanModify', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_RadioGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@AllLevels);
	try
		lRadioGroup.FlipChildren(AllLevels);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'FlipChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_RadioGroup_Rows(L: Plua_State): Integer; cdecl;
var
	lRadioGroup:TLuaRadioGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lRadioGroup := TLuaRadioGroup(GetLuaObject(L, 1));
	try
		ret := lRadioGroup.Rows();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'RadioGroup', 'Rows', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	CustomRadioGroupFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'CanModify', @VCLua_RadioGroup_CanModify);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'FlipChildren', @VCLua_RadioGroup_FlipChildren);
	TLuaMethodInfo.Create(CustomRadioGroupFuncs, 'Rows', @VCLua_RadioGroup_Rows);
end.
