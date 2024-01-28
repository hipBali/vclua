(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitBtn;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Buttons, Controls, TypInfo;

function CreateBitBtn(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBitBtn; pti: PTypeInfo = nil); overload; inline;
procedure BitBtnToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBitBtn = class(TBitBtn)
        LuaCtl: TVCLuaControl;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;


procedure lua_push(L: Plua_State; const v: TBitBtn; pti: PTypeInfo);
begin
	BitBtnToTable(L,-1,v);
end;
procedure BitBtnToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateBitBtn(L: Plua_State): Integer; cdecl;
var
	lBitBtn:TLuaBitBtn;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lBitBtn := TLuaBitBtn.Create(Parent);
	lBitBtn.Parent := TWinControl(Parent);
	lBitBtn.LuaCtl := TVCLuaControl.Create(lBitBtn as TComponent,L,@BitBtnToTable);
	InitControl(L,lBitBtn,Name);
	BitBtnToTable(L, -1, lBitBtn);
	Result := 1;
end;

end.
