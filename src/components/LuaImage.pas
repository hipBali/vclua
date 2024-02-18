(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaImage;	

{$MODE Delphi}{$T+}

interface

Uses Classes, Lua, LuaController, ExtCtrls, TypInfo;

function CreateImage(L: Plua_State): Integer; cdecl;
function IsImage(L: Plua_State): Integer; cdecl;
function AsImage(L: Plua_State): Integer; cdecl;
procedure lua_push(L: Plua_State; const v: TImage; pti: PTypeInfo = nil); overload; inline;

type
    TLuaImage = class(TImage)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;
var
    CustomImageFuncs: aoluaL_Reg;


implementation
Uses LuaProperties, LuaProxy, LuaObject, LuaHelper, LCLClasses, SysUtils, Controls;

function VCLua_Image_DestRect(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
	ret:TRect;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		ret := lImage.DestRect();
	except
		on E: Exception do
			CallError(L, 'Image', 'DestRect', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
	Result := 1;
end;

function VCLua_Image_Invalidate(L: Plua_State): Integer; cdecl;
var
	lImage:TLuaImage;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	try
		lImage.Invalidate();
	except
		on E: Exception do
			CallError(L, 'Image', 'Invalidate', E.ClassName, E.Message);
	end;
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
	CreateTableForKnownType(L,'TCustomImage',v);
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
	lImage.LuaCtl := TVCLuaControl.Create(lImage as TComponent,L,nil,'TCustomImage');
	InitControl(L,lImage,Name);
	CreateTableForKnownType(L,'TCustomImage',lImage);
	Result := 1;
end;

begin
	SetLength(CustomImageFuncs, 2+1);
	CustomImageFuncs[0].name:='DestRect';
	CustomImageFuncs[0].func:=@VCLua_Image_DestRect;
	CustomImageFuncs[1].name:='Invalidate';
	CustomImageFuncs[1].func:=@VCLua_Image_Invalidate;
	CustomImageFuncs[2].name:=nil;
	CustomImageFuncs[2].func:=nil;

end.
