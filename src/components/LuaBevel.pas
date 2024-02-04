(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBevel;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateBevel(L: Plua_State): Integer; cdecl;
function IsBevel(L: Plua_State): Integer; cdecl;
function AsBevel(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBevel; pti: PTypeInfo = nil); overload; inline;
procedure BevelToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBevel = class(TBevel)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Bevel_Assign(L: Plua_State): Integer; cdecl;
var
	lBevel:TLuaBevel;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lBevel := TLuaBevel(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lBevel.Assign(Source);
	
	Result := 0;
end;

function IsBevel(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TBevel);
end;
function AsBevel(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TBevel then
    lua_push(L, TBevel(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TBevel; pti: PTypeInfo);
begin
	BevelToTable(L,-1,v);
end;
procedure BevelToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Bevel_Assign);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateBevel(L: Plua_State): Integer; cdecl;
var
	lBevel:TLuaBevel;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBevel := TLuaBevel.Create(Parent);
	lBevel.Parent := TWinControl(Parent);
	lBevel.LuaCtl := TVCLuaControl.Create(lBevel as TComponent,L,@BevelToTable);
	InitControl(L,lBevel,Name);
	BevelToTable(L, -1, lBevel);
	Result := 1;
end;

end.
