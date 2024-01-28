(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaStaticText;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, StdCtrls, Controls, TypInfo;

function CreateStaticText(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TStaticText; pti: PTypeInfo = nil); overload; inline;
procedure StaticTextToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaStaticText = class(TStaticText)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TStaticText; pti: PTypeInfo);
begin
	StaticTextToTable(L,-1,v);
end;
procedure StaticTextToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateStaticText(L: Plua_State): Integer; cdecl;
var
	lStaticText:TLuaStaticText;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lStaticText := TLuaStaticText.Create(Parent);
	lStaticText.Parent := TWinControl(Parent);
	lStaticText.LuaCtl := TVCLuaControl.Create(lStaticText as TComponent,L,@StaticTextToTable);
	InitControl(L,lStaticText,Name);
	StaticTextToTable(L, -1, lStaticText);
	Result := 1;
end;

end.
