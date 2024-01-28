(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaEditButton;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, EditBtn, Controls, TypInfo;

function CreateEditButton(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TEditButton; pti: PTypeInfo = nil); overload; inline;
procedure EditButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaEditButton = class(TEditButton)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TEditButton; pti: PTypeInfo);
begin
	EditButtonToTable(L,-1,v);
end;
procedure EditButtonToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateEditButton(L: Plua_State): Integer; cdecl;
var
	lEditButton:TLuaEditButton;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lEditButton := TLuaEditButton.Create(Parent);
	lEditButton.Parent := TWinControl(Parent);
	lEditButton.LuaCtl := TVCLuaControl.Create(lEditButton as TComponent,L,@EditButtonToTable);
	InitControl(L,lEditButton,Name);
	EditButtonToTable(L, -1, lEditButton);
	Result := 1;
end;

end.
