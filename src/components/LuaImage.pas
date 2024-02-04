(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaImage;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls, TypInfo;

function CreateImage(L: Plua_State): Integer; cdecl;
function IsImage(L: Plua_State): Integer; cdecl;
function AsImage(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TImage; pti: PTypeInfo = nil); overload; inline;
procedure ImageToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaImage = class(TImage)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses;

function VCLua_Image_DestRect(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TRect;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	ret := lImage.DestRect();
	lua_push(L,ret);
	
	Result := 1;
end;

function VCLua_Image_Invalidate(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	lImage.Invalidate();
	
	Result := 0;
end;

function IsImage(L: Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  Result := 1;
  lua_push(L, GetLuaObject(L, 1) is TImage);
end;
function AsImage(L: Plua_State): Integer; cdecl;
var o : TObject;
begin
  CheckArg(L, 1);
  Result := 1;
  o := GetLuaObject(L, 1);
  if o is TImage then
    lua_push(L, TImage(o))
  else
    lua_pushnil(L);
end;
procedure lua_push(L: Plua_State; const v: TImage; pti: PTypeInfo);
begin
	ImageToTable(L,-1,v);
end;
procedure ImageToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'DestRect', @VCLua_Image_DestRect);
	LuaSetTableFunction(L, Index, 'Invalidate', @VCLua_Image_Invalidate);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreateImage(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	Parent:TWinControl;
	Name:String;
begin
	GetControlParents(L,TWinControl(Parent),Name);
	lImage := TLuaImage.Create(Parent);
	lImage.Parent := TWinControl(Parent);
	lImage.LuaCtl := TVCLuaControl.Create(lImage as TComponent,L,@ImageToTable);
	InitControl(L,lImage,Name);
	ImageToTable(L, -1, lImage);
	Result := 1;
end;

end.
