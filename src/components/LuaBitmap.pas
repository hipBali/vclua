(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaBitmap;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType;

procedure BitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaBitmap = class(TBitmap)
		public
			L:Plua_State;   
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaHelper, LCLClasses; 

function VCLua_Bitmap_GetResourceType(L: Plua_State): Integer; cdecl;
var 
	lBitmap:TLuaBitmap;
	ret:TResourceType;
begin
	CheckArg(L, 1);
	lBitmap := TLuaBitmap(GetLuaObject(L, 1));
	ret := lBitmap.GetResourceType();
	lua_pushstring(L,PChar(ret));
	
	Result := 1;
end;

function VCLua_Bitmap_LoadFromStream(L: Plua_State): Integer; cdecl;
var 
	lBitmap:TLuaBitmap;
	AStream:TStream;
	ASize:Cardinal;
begin
	CheckArg(L, 3);
	lBitmap := TLuaBitmap(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	ASize := lua_tointeger(L,3);
	lBitmap.LoadFromStream(AStream,ASize);
	
	Result := 0;
end;

procedure BitmapToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'GetResourceType', @VCLua_Bitmap_GetResourceType);
	LuaSetTableFunction(L, Index, 'LoadFromStream', @VCLua_Bitmap_LoadFromStream);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
