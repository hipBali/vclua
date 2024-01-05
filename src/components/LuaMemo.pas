(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaMemo;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls;

function CreateMemo(L: Plua_State): Integer; cdecl;
procedure MemoToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaMemo = class(TMemo)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

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

procedure MemoToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Append', @VCLua_Memo_Append);
	LuaSetTableFunction(L, Index, 'ScrollBy', @VCLua_Memo_ScrollBy);
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
	lMemo.LuaCtl := TVCLuaControl.Create(TControl(lMemo),L,@MemoToTable);
	InitControl(L,lMemo,Name);
	MemoToTable(L, -1, lMemo);
	Result := 1;
end;

end.
