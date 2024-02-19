(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCheckGroup;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo;

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
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_CheckGroup_FlipChildren(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	AllLevels:Boolean;
begin
	CheckArg(L, 2);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@AllLevels);
	try
		lCheckGroup.FlipChildren(AllLevels);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'FlipChildren', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_Rows(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	ret:integer;
begin
	CheckArg(L, 1);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	try
		ret := lCheckGroup.Rows();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Rows', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CheckGroup_Checked(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	Index:integer;
	ret:boolean;
begin
	CheckArg(L, 2, 3);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckGroup.Checked[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCheckGroup.Checked[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'Checked', E.ClassName, E.Message);
	end;
end;

function VCLua_CheckGroup_CheckEnabled(L: Plua_State): Integer; cdecl;
var
	lCheckGroup:TLuaCheckGroup;
	Index:integer;
	ret:boolean;
begin
	CheckArg(L, 2, 3);
	lCheckGroup := TLuaCheckGroup(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lCheckGroup.CheckEnabled[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCheckGroup.CheckEnabled[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'CheckGroup', 'CheckEnabled', E.ClassName, E.Message);
	end;
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
	SetLength(CustomCheckGroupFuncs, 4+1);
	CustomCheckGroupFuncs[0].name:='FlipChildren';
	CustomCheckGroupFuncs[0].func:=@VCLua_CheckGroup_FlipChildren;
	CustomCheckGroupFuncs[1].name:='Rows';
	CustomCheckGroupFuncs[1].func:=@VCLua_CheckGroup_Rows;
	CustomCheckGroupFuncs[2].name:='Checked';
	CustomCheckGroupFuncs[2].func:=@VCLua_CheckGroup_Checked;
	CustomCheckGroupFuncs[3].name:='CheckEnabled';
	CustomCheckGroupFuncs[3].func:=@VCLua_CheckGroup_CheckEnabled;
	CustomCheckGroupFuncs[4].name:=nil;
	CustomCheckGroupFuncs[4].func:=nil;

end.
