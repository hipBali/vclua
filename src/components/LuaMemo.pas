(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMemo;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateMemo(L: Plua_State): Integer; cdecl;
function IsMemo(L: Plua_State): Integer; cdecl;
function AsMemo(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMemo; pti: PTypeInfo = nil); overload; inline;

type
    TLuaMemo = class(TMemo)
        LuaCtl: TVCLuaControl;
    end;
var
    CustomMemoFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Memo_Append(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	AValue:String;
begin
	CheckArg(L, 2);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	AValue := lua_toStringCP(L,2);
	lMemo.Append(AValue);
	
	Result := 0;
end;

function VCLua_Memo_ScrollBy(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	DeltaX:Integer;
	DeltaY:Integer;
begin
	CheckArg(L, 3);
	lMemo := TLuaMemo(GetLuaObject(L, 1));
	DeltaX := lua_tointeger(L,2);
	DeltaY := lua_tointeger(L,3);
	lMemo.ScrollBy(DeltaX,DeltaY);
	
	Result := 0;
end;

function IsMemo(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TMemo);
end;
function AsMemo(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TMemo then
    lua_push(L, TMemo(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TMemo; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCustomMemo',v);
end;
function CreateMemo(L: Plua_State): Integer; cdecl;
var
	lMemo:TLuaMemo;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMemo := TLuaMemo.Create(Parent);
	lMemo.Parent := TWinControl(Parent);
	lMemo.LuaCtl := TVCLuaControl.Create(lMemo as TComponent,L,nil,'TCustomMemo');
	InitControl(L,lMemo,Name);
	CreateTableForKnownType(L,'TCustomMemo',lMemo);
	Result := 1;
end;

begin
	SetLength(CustomMemoFuncs, 2+1);
	CustomMemoFuncs[0].name:='Append';
	CustomMemoFuncs[0].func:=@VCLua_Memo_Append;
	CustomMemoFuncs[1].name:='ScrollBy';
	CustomMemoFuncs[1].func:=@VCLua_Memo_ScrollBy;
	CustomMemoFuncs[2].name:=nil;
	CustomMemoFuncs[2].func:=nil;

end.
