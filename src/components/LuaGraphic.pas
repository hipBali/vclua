(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaGraphic;	

{$MODE Delphi}

interface

Uses Classes, Lua, LuaController, Graphics, LCLType;

procedure GraphicToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaGraphic = class(TGraphic)
    public
      L:Plua_State;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Graphic_Assign(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	ASource:TPersistent;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ASource := TPersistent(GetLuaObject(L,2));
	lGraphic.Assign(ASource);
	
	Result := 0;
end;

function VCLua_Graphic_Clear(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	lGraphic.Clear();
	
	Result := 0;
end;

function VCLua_Graphic_Equals(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	Obj:TObject;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Obj := TObject(GetLuaObject(L,2));
	ret := lGraphic.Equals(Obj);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Graphic_LazarusResourceTypeValid(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	AResourceType:string;
	ret:boolean;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	AResourceType := lua_toStringCP(L,2);
	ret := lGraphic.LazarusResourceTypeValid(AResourceType);
	lua_pushboolean(L,ret);
	
	Result := 1;
end;

function VCLua_Graphic_LoadFromFile(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	Filename:string;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Filename := lua_toStringCP(L,2);
	lGraphic.LoadFromFile(Filename);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromStream(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lGraphic.LoadFromStream(Stream);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromMimeStream(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	AStream:TStream;
	AMimeType:string;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	AStream := TStream(GetLuaObject(L,2));
	AMimeType := lua_toStringCP(L,3);
	lGraphic.LoadFromMimeStream(AStream,AMimeType);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromLazarusResource(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	ResName:String;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ResName := lua_toStringCP(L,2);
	lGraphic.LoadFromLazarusResource(ResName);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromResourceName(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	Instance:THandle;
	ResName:String;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Instance := THandle(lua_tointeger(L,2));
	ResName := lua_toStringCP(L,3);
	lGraphic.LoadFromResourceName(Instance,ResName);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromResourceID(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	Instance:THandle;
	ResID:PtrInt;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Instance := THandle(lua_tointeger(L,2));
	ResID := lua_tointeger(L,3);
	lGraphic.LoadFromResourceID(Instance,ResID);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromClipboardFormat(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	FormatID := TClipboardFormat(GetLuaObject(L,2));
	lGraphic.LoadFromClipboardFormat(FormatID);
	
	Result := 0;
end;

function VCLua_Graphic_LoadFromClipboardFormatID(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	ClipboardType:TClipboardType;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ClipboardType := TClipboardType(GetLuaObject(L,2));
	FormatID := TClipboardFormat(GetLuaObject(L,3));
	lGraphic.LoadFromClipboardFormatID(ClipboardType,FormatID);
	
	Result := 0;
end;

function VCLua_Graphic_SaveToFile(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	Filename:string;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Filename := lua_toStringCP(L,2);
	lGraphic.SaveToFile(Filename);
	
	Result := 0;
end;

function VCLua_Graphic_SaveToStream(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lGraphic.SaveToStream(Stream);
	
	Result := 0;
end;

function VCLua_Graphic_SaveToClipboardFormat(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	FormatID := TClipboardFormat(GetLuaObject(L,2));
	lGraphic.SaveToClipboardFormat(FormatID);
	
	Result := 0;
end;

function VCLua_Graphic_SaveToClipboardFormatID(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	ClipboardType:TClipboardType;
	FormatID:TClipboardFormat;
begin
	CheckArg(L, 3);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ClipboardType := TClipboardType(GetLuaObject(L,2));
	FormatID := TClipboardFormat(GetLuaObject(L,3));
	lGraphic.SaveToClipboardFormatID(ClipboardType,FormatID);
	
	Result := 0;
end;

function VCLua_Graphic_GetSupportedSourceMimeTypes(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	List:TStrings;
begin
	CheckArg(L, 2);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	List := TStrings(GetLuaObject(L,2));
	lGraphic.GetSupportedSourceMimeTypes(List);
	
	Result := 0;
end;

function VCLua_Graphic_GetResourceType(L: Plua_State): Integer; cdecl;
var 
	lGraphic:TLuaGraphic;
	ret:TResourceType;
begin
	CheckArg(L, 1);
	lGraphic := TLuaGraphic(GetLuaObject(L, 1));
	ret := lGraphic.GetResourceType();
	lua_pushstring(L,PChar(ret));
	
	Result := 1;
end;

procedure GraphicToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	if Sender = nil then begin
		lua_pushnil(L);
		Exit;
	end;
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Graphic_Assign);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_Graphic_Clear);
	LuaSetTableFunction(L, Index, 'Equals', @VCLua_Graphic_Equals);
	LuaSetTableFunction(L, Index, 'LazarusResourceTypeValid', @VCLua_Graphic_LazarusResourceTypeValid);
	LuaSetTableFunction(L, Index, 'LoadFromFile', @VCLua_Graphic_LoadFromFile);
	LuaSetTableFunction(L, Index, 'LoadFromStream', @VCLua_Graphic_LoadFromStream);
	LuaSetTableFunction(L, Index, 'LoadFromMimeStream', @VCLua_Graphic_LoadFromMimeStream);
	LuaSetTableFunction(L, Index, 'LoadFromLazarusResource', @VCLua_Graphic_LoadFromLazarusResource);
	LuaSetTableFunction(L, Index, 'LoadFromResourceName', @VCLua_Graphic_LoadFromResourceName);
	LuaSetTableFunction(L, Index, 'LoadFromResourceID', @VCLua_Graphic_LoadFromResourceID);
	LuaSetTableFunction(L, Index, 'LoadFromClipboardFormat', @VCLua_Graphic_LoadFromClipboardFormat);
	LuaSetTableFunction(L, Index, 'LoadFromClipboardFormatID', @VCLua_Graphic_LoadFromClipboardFormatID);
	LuaSetTableFunction(L, Index, 'SaveToFile', @VCLua_Graphic_SaveToFile);
	LuaSetTableFunction(L, Index, 'SaveToStream', @VCLua_Graphic_SaveToStream);
	LuaSetTableFunction(L, Index, 'SaveToClipboardFormat', @VCLua_Graphic_SaveToClipboardFormat);
	LuaSetTableFunction(L, Index, 'SaveToClipboardFormatID', @VCLua_Graphic_SaveToClipboardFormatID);
	LuaSetTableFunction(L, Index, 'GetSupportedSourceMimeTypes', @VCLua_Graphic_GetSupportedSourceMimeTypes);
	LuaSetTableFunction(L, Index, 'GetResourceType', @VCLua_Graphic_GetResourceType);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;

end.
