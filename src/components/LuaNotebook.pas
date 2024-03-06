(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaNotebook;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, ExtCtrls;

function CreateNotebook(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TNotebook; pti: PTypeInfo = nil); overload; inline;

type
    TLuaNotebook = class(TNotebook)
        LuaCtl: TVCLuaControl;
    end;
var
    NotebookFuncs: TLuaVmt;
    NotebookSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;

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

function VCLua_Notebook_VCLuaGetPageCount(L: Plua_State): Integer; cdecl;
var
	lNotebook:TLuaNotebook;
	ret:integer;
begin
	CheckArg(L, 1);
	lNotebook := TLuaNotebook(GetLuaObject(L, 1));
	try
		ret := lNotebook.PageCount;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Notebook', 'PageCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
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
	CreateTableForKnownType(L,'TNotebook',lNotebook);
	InitControl(L,lNotebook,Name);
	Result := 1;
end;

begin
	NotebookFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(NotebookFuncs, 'ShowControl', @VCLua_Notebook_ShowControl);
	TLuaMethodInfo.Create(NotebookFuncs, 'IndexOf', @VCLua_Notebook_IndexOf);
	TLuaMethodInfo.Create(NotebookFuncs, 'Page', @VCLua_Notebook_Page);
	TLuaMethodInfo.Create(NotebookFuncs, 'PageCount', @VCLua_Notebook_VCLuaGetPageCount, mfCall);
	NotebookSets := TLuaVmt.Create;
	
end.
