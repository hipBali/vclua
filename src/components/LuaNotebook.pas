(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaNotebook;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo;

function CreateNotebook(L: Plua_State): Integer; cdecl;
function IsNotebook(L: Plua_State): Integer; cdecl;
function AsNotebook(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TNotebook; pti: PTypeInfo = nil); overload; inline;

type
    TLuaNotebook = class(TNotebook)
        LuaCtl: TVCLuaControl;
    end;
var
    NotebookFuncs: aoluaL_Reg;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Controls;

function VCLua_Notebook_ShowControl(L: Plua_State): Integer; cdecl;
var
	lNotebook:TLuaNotebook;
	AControl:TControl;
begin
	CheckArg(L, 2);
	lNotebook := TLuaNotebook(GetLuaObject(L, 1));
	luaL_check(L,2,@AControl);
	try
		lNotebook.ShowControl(AControl);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Notebook', 'ShowControl', E.ClassName, E.Message);
	end;
end;

function VCLua_Notebook_IndexOf(L: Plua_State): Integer; cdecl;
var
	lNotebook:TLuaNotebook;
	APage:TPage;
	ret:integer;
begin
	CheckArg(L, 2);
	lNotebook := TLuaNotebook(GetLuaObject(L, 1));
	luaL_check(L,2,@APage);
	try
		ret := lNotebook.IndexOf(APage);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Notebook', 'IndexOf', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Notebook_Page(L: Plua_State): Integer; cdecl;
var
	lNotebook:TLuaNotebook;
	Index:Integer;
	ret:TPage;
begin
	CheckArg(L, 2);
	lNotebook := TLuaNotebook(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lNotebook.Page[Index];
		lua_push(L,ret,TypeInfo(ret));
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Notebook', 'Page', E.ClassName, E.Message);
	end;
end;

function IsNotebook(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TNotebook);
end;
function AsNotebook(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TNotebook then
    lua_push(L, TNotebook(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TNotebook; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TNotebook',v);
end;
function CreateNotebook(L: Plua_State): Integer; cdecl;
var
	lNotebook:TLuaNotebook;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lNotebook := TLuaNotebook.Create(Parent);
	lNotebook.Parent := TWinControl(Parent);
	lNotebook.LuaCtl := TVCLuaControl.Create(lNotebook as TComponent,L,nil,'TNotebook');
	InitControl(L,lNotebook,Name);
	CreateTableForKnownType(L,'TNotebook',lNotebook);
	Result := 1;
end;

begin
	SetLength(NotebookFuncs, 3+1);
	NotebookFuncs[0].name:='ShowControl';
	NotebookFuncs[0].func:=@VCLua_Notebook_ShowControl;
	NotebookFuncs[1].name:='IndexOf';
	NotebookFuncs[1].func:=@VCLua_Notebook_IndexOf;
	NotebookFuncs[2].name:='Page';
	NotebookFuncs[2].func:=@VCLua_Notebook_Page;
	NotebookFuncs[3].name:=nil;
	NotebookFuncs[3].func:=nil;

end.
