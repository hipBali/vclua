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
procedure MemoToTable(L:Plua_State; Index:Integer; Sender:TObject);

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
	MemoToTable(L,-1,v);
end;
procedure MemoToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TCustomMemo');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
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
	lMemo.LuaCtl := TVCLuaControl.Create(lMemo as TComponent,L,@MemoToTable);
	InitControl(L,lMemo,Name);
	MemoToTable(L, -1, lMemo);
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
