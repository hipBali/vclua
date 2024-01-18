(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaImage;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, ExtCtrls, Controls;

function CreateImage(L: Plua_State): Integer; cdecl;
procedure ImageToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaImage = class(TImage)
	  LuaCtl: TVCLuaControl;
	  published
	    property Canvas;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Image_DestRect(L: Plua_State): Integer; cdecl;
var 
	lImage:TLuaImage;
	ret:TRect;
begin
	CheckArg(L, 1);
	lImage := TLuaImage(GetLuaObject(L, 1));
	ret := lImage.DestRect();
	lua_pushTRect(L,ret);
	
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

procedure ImageToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
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
	lImage.LuaCtl := TVCLuaControl.Create(TControl(lImage),L,@ImageToTable);
	InitControl(L,lImage,Name);
	ImageToTable(L, -1, lImage);
	Result := 1;
end;

end.
