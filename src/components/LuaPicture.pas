(*
Generated with Lua-fpc parser/generator
(C) 2018-2023 Hi-Project Ltd.
*)
unit LuaPicture;	

interface

Uses Classes, Lua, LuaController, Graphics;

function CreatePicture(L: Plua_State): Integer; cdecl;
procedure PictureToTable(L:Plua_State; Index:Integer; Sender:TObject);

type
    TLuaPicture = class(TPicture)
		public
			L:Plua_State;
    end;


implementation
Uses LuaProperties, TypInfo, LuaProxy, LuaObject, LuaHelper, LCLClasses; 

function VCLua_Picture_Clear(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
begin
	CheckArg(L, 1);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	lPicture.Clear();
	
	Result := 0;
end;

function VCLua_Picture_LoadFromFile(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
	Filename:string;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	Filename := lua_toStringCP(L,2);
	lPicture.LoadFromFile(Filename);
	
	Result := 0;
end;

function VCLua_Picture_LoadFromStream(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lPicture.LoadFromStream(Stream);
	
	Result := 0;
end;

function VCLua_Picture_LoadFromStreamWithFileExt(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
	Stream:TStream;
	FileExt:string;
begin
	CheckArg(L, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	FileExt := lua_toStringCP(L,3);
	lPicture.LoadFromStreamWithFileExt(Stream,FileExt);
	
	Result := 0;
end;

function VCLua_Picture_SaveToFile(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
	Filename:string;
	FileExt:string;
begin
	CheckArg(L, -1);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	Filename := lua_toStringCP(L,2);
	FileExt := luaL_optstring(L,3,'');
	lPicture.SaveToFile(Filename,FileExt);
	
	Result := 0;
end;

function VCLua_Picture_SaveToStream(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
	Stream:TStream;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	lPicture.SaveToStream(Stream);
	
	Result := 0;
end;

function VCLua_Picture_SaveToStreamWithFileExt(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
	Stream:TStream;
	FileExt:string;
begin
	CheckArg(L, 3);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	Stream := TStream(GetLuaObject(L,2));
	FileExt := lua_toStringCP(L,3);
	lPicture.SaveToStreamWithFileExt(Stream,FileExt);
	
	Result := 0;
end;

function VCLua_Picture_Assign(L: Plua_State): Integer; cdecl;
var 
	lPicture:TLuaPicture;
	Source:TPersistent;
begin
	CheckArg(L, 2);
	lPicture := TLuaPicture(GetLuaObject(L, 1));
	Source := TPersistent(GetLuaObject(L,2));
	lPicture.Assign(Source);
	
	Result := 0;
end;

procedure PictureToTable(L:Plua_State; Index:Integer; Sender:TObject);
begin
	SetDefaultMethods(L,Index,Sender);
	LuaSetTableFunction(L, Index, 'Clear', @VCLua_Picture_Clear);
	LuaSetTableFunction(L, Index, 'LoadFromFile', @VCLua_Picture_LoadFromFile);
	LuaSetTableFunction(L, Index, 'LoadFromStream', @VCLua_Picture_LoadFromStream);
	LuaSetTableFunction(L, Index, 'LoadFromStreamWithFileExt', @VCLua_Picture_LoadFromStreamWithFileExt);
	LuaSetTableFunction(L, Index, 'SaveToFile', @VCLua_Picture_SaveToFile);
	LuaSetTableFunction(L, Index, 'SaveToStream', @VCLua_Picture_SaveToStream);
	LuaSetTableFunction(L, Index, 'SaveToStreamWithFileExt', @VCLua_Picture_SaveToStreamWithFileExt);
	LuaSetTableFunction(L, Index, 'Assign', @VCLua_Picture_Assign);
	LuaSetMetaFunction(L, index, '__index', @LuaGetProperty);
	LuaSetMetaFunction(L, index, '__newindex', @LuaSetProperty);
end;
function CreatePicture(L: Plua_State): Integer; cdecl;
var
	lPicture:TLuaPicture;
begin
	lPicture := TLuaPicture.Create;
	PictureToTable(L, -1, lPicture);
	Result := 1;
end;
end.
