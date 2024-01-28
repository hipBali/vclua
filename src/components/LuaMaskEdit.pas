(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaMaskEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, MaskEdit, Controls, TypInfo;

function CreateMaskEdit(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TMaskEdit; pti: PTypeInfo = nil); overload; inline;
procedure MaskEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaMaskEdit = class(TMaskEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TMaskEdit; pti: PTypeInfo);
begin
	MaskEditToTable(L,-1,v);
end;
procedure MaskEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateMaskEdit(L: Plua_State): Integer; cdecl;
var
	lMaskEdit:TLuaMaskEdit;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lMaskEdit := TLuaMaskEdit.Create(Parent);
	lMaskEdit.Parent := TWinControl(Parent);
	lMaskEdit.LuaCtl := TVCLuaControl.Create(lMaskEdit as TComponent,L,@MaskEditToTable);
	InitControl(L,lMaskEdit,Name);
	MaskEditToTable(L, -1, lMaskEdit);
	Result := 1;
end;

end.
