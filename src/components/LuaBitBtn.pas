(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitBtn;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Buttons;

function CreateBitBtn(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBitBtn; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBitBtn = class(TBitBtn)
        LuaCtl: TVCLuaControl;
    end;
var
    BitBtnFuncs: TLuaVmt;
    BitBtnSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, Classes, Controls;


procedure lua_push(L: Plua_State; const v: TBitBtn; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TBitBtn',v);
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
	lBitBtn.LuaCtl := TVCLuaControl.Create(lBitBtn as TComponent,L,nil,'TBitBtn');
	CreateTableForKnownType(L,'TBitBtn',lBitBtn);
	InitControl(L,lBitBtn,Name);
	Result := 1;
end;

begin
	BitBtnFuncs := TLuaVmt.Create;
	
	BitBtnSets := TLuaVmt.Create;
	
end.
