(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBoundLabel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateBoundLabel(L: Plua_State): Integer; cdecl;
function IsBoundLabel(L: Plua_State): Integer; cdecl;
function AsBoundLabel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBoundLabel; pti: PTypeInfo = nil); overload; inline;
procedure BoundLabelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBoundLabel = class(TBoundLabel)
        LuaCtl: TVCLuaControl;
    end;
var
    BoundLabelFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


function IsBoundLabel(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TBoundLabel);
end;
function AsBoundLabel(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TBoundLabel then
    lua_push(L, TBoundLabel(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TBoundLabel; pti: PTypeInfo);
begin
	BoundLabelToTable(L,-1,v);
end;
procedure BoundLabelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	lua_pushliteral(L,'vmt');
	luaL_getmetatable(L,'TBoundLabel');
	lua_pushliteral(L,'__index');
	lua_rawget(L,-2);
	lua_remove(L,-2);
	lua_rawset(L,-3);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateBoundLabel(L: Plua_State): Integer; cdecl;
var
	lBoundLabel:TLuaBoundLabel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBoundLabel := TLuaBoundLabel.Create(Parent);
	lBoundLabel.Parent := TWinControl(Parent);
	lBoundLabel.LuaCtl := TVCLuaControl.Create(lBoundLabel as TComponent,L,@BoundLabelToTable);
	InitControl(L,lBoundLabel,Name);
	BoundLabelToTable(L, -1, lBoundLabel);
	Result := 1;
end;

begin
	SetLength(BoundLabelFuncs, 0+1);
	
	BoundLabelFuncs[0].name:=nil;
	BoundLabelFuncs[0].func:=nil;

end.
