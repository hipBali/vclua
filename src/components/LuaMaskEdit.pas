(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaMaskEdit;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, MaskEdit, Controls;

function CreateMaskEdit(L: Plua_State): Integer; cdecl;
procedure MaskEditToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaMaskEdit = class(TMaskEdit)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 


procedure MaskEditToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
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
	lMaskEdit.LuaCtl := TVCLuaControl.Create(TControl(lMaskEdit),L,@MaskEditToTable);
	InitControl(L,lMaskEdit,Name);
	MaskEditToTable(L, -1, lMaskEdit);
	Result := 1;
end;

end.
