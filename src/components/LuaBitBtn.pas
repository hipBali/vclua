(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaBitBtn;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, Buttons, Controls, TypInfo;

function CreateBitBtn(L: Plua_State): Integer; cdecl;
function IsBitBtn(L: Plua_State): Integer; cdecl;
function AsBitBtn(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TBitBtn; pti: PTypeInfo = nil); overload; inline;

type
    TLuaBitBtn = class(TBitBtn)
        LuaCtl: TVCLuaControl;
    end;
var
    BitBtnFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils;


function IsBitBtn(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TBitBtn);
end;
function AsBitBtn(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TBitBtn then
    lua_push(L, TBitBtn(o))
  else
    lua_pushnil(L);
end;
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
	InitControl(L,lBitBtn,Name);
	CreateTableForKnownType(L,'TBitBtn',lBitBtn);
	Result := 1;
end;

begin
	SetLength(BitBtnFuncs, 0+1);
	
	BitBtnFuncs[0].name:=nil;
	BitBtnFuncs[0].func:=nil;

end.
