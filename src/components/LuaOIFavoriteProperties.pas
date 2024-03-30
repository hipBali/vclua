(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaOIFavoriteProperties;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, OIFavoriteProperties;

procedure lua_push(L: Plua_State; const v: TOIFavoriteProperty; pti: PTypeInfo = nil); overload; inline;

type
    TLuaOIFavoriteProperty = class(TOIFavoriteProperty)
    end;
var
    OIFavoritePropertyFuncs: TLuaVmt;
    OIFavoritePropertySets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TOIRestrictedProperty; pti: PTypeInfo = nil); overload; inline;

type
    TLuaOIRestrictedProperty = class(TOIRestrictedProperty)
    end;
var
    OIRestrictedPropertyFuncs: TLuaVmt;
    OIRestrictedPropertySets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TOIFavoriteProperties; pti: PTypeInfo = nil); overload; inline;

type
    TLuaOIFavoriteProperties = class(TOIFavoriteProperties)
    end;
var
    OIFavoritePropertiesFuncs: TLuaVmt;
    OIFavoritePropertiesSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, LCLPlatformDef;

function VCLua_OIFavoriteProperty_Constrains(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperty:TLuaOIFavoriteProperty;
	AnItem:TOIFavoriteProperty;
	ret:boolean;
begin
	CheckArg(L, 2);
	lOIFavoriteProperty := TLuaOIFavoriteProperty(GetLuaObject(L, 1));
	luaL_check(L,2,@AnItem);
	try
		ret := lOIFavoriteProperty.Constrains(AnItem);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperty', 'Constrains', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperty_Compare(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperty:TLuaOIFavoriteProperty;
	AFavorite:TOIFavoriteProperty;
	ret:integer;
begin
	CheckArg(L, 2);
	lOIFavoriteProperty := TLuaOIFavoriteProperty(GetLuaObject(L, 1));
	luaL_check(L,2,@AFavorite);
	try
		ret := lOIFavoriteProperty.Compare(AFavorite);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperty', 'Compare', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperty_Assign(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperty:TLuaOIFavoriteProperty;
	Src:TOIFavoriteProperty;
begin
	CheckArg(L, 2);
	lOIFavoriteProperty := TLuaOIFavoriteProperty(GetLuaObject(L, 1));
	luaL_check(L,2,@Src);
	try
		lOIFavoriteProperty.Assign(Src);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperty', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperty_CreateCopy(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperty:TLuaOIFavoriteProperty;
	ret:TOIFavoriteProperty;
begin
	CheckArg(L, 1);
	lOIFavoriteProperty := TLuaOIFavoriteProperty(GetLuaObject(L, 1));
	try
		ret := lOIFavoriteProperty.CreateCopy();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperty', 'CreateCopy', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperty_DebugReportAsString(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperty:TLuaOIFavoriteProperty;
	ret:string;
begin
	CheckArg(L, 1);
	lOIFavoriteProperty := TLuaOIFavoriteProperty(GetLuaObject(L, 1));
	try
		ret := lOIFavoriteProperty.DebugReportAsString();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperty', 'DebugReportAsString', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIRestrictedProperty_VCLuaSetWidgetSets(L: Plua_State): Integer; cdecl;
var
	lOIRestrictedProperty:TLuaOIRestrictedProperty;
	val:TLCLPlatforms;
begin
	lOIRestrictedProperty := TLuaOIRestrictedProperty(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val,TypeInfo(TLCLPlatforms));
	try
		lOIRestrictedProperty.WidgetSets := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIRestrictedProperty', 'SetWidgetSets', E.ClassName, E.Message);
	end;
end;

function VCLua_OIRestrictedProperty_VCLuaGetWidgetSets(L: Plua_State): Integer; cdecl;
var
	lOIRestrictedProperty:TLuaOIRestrictedProperty;
	ret:TLCLPlatforms;
begin
	lOIRestrictedProperty := TLuaOIRestrictedProperty(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIRestrictedProperty.WidgetSets;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIRestrictedProperty', 'GetWidgetSets', E.ClassName, E.Message);
	end;
	lua_push(L,ret,TypeInfo(ret));
end;

function VCLua_OIFavoriteProperties_Clear(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
begin
	CheckArg(L, 1);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	try
		lOIFavoriteProperties.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_Assign(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	Src:TOIFavoriteProperties;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@Src);
	try
		lOIFavoriteProperties.Assign(Src);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'Assign', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_CreateCopy(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	ret:TOIFavoriteProperties;
begin
	CheckArg(L, 1);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	try
		ret := lOIFavoriteProperties.CreateCopy();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'CreateCopy', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperties_Contains(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	AnItem:TOIFavoriteProperty;
	ret:Boolean;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@AnItem);
	try
		ret := lOIFavoriteProperties.Contains(AnItem);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'Contains', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperties_Add(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	NewItem:TOIFavoriteProperty;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@NewItem);
	try
		lOIFavoriteProperties.Add(NewItem);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'Add', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_AddNew(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	NewItem:TOIFavoriteProperty;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@NewItem);
	try
		lOIFavoriteProperties.AddNew(NewItem);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'AddNew', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_Remove(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	AnItem:TOIFavoriteProperty;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@AnItem);
	try
		lOIFavoriteProperties.Remove(AnItem);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'Remove', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_DeleteConstraints(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	AnItem:TOIFavoriteProperty;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@AnItem);
	try
		lOIFavoriteProperties.DeleteConstraints(AnItem);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'DeleteConstraints', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_Sort(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
begin
	CheckArg(L, 1);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	try
		lOIFavoriteProperties.Sort();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'Sort', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_DeleteDoubles(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
begin
	CheckArg(L, 1);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	try
		lOIFavoriteProperties.DeleteDoubles();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'DeleteDoubles', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_IsEqual(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	TheFavorites:TOIFavoriteProperties;
	ret:boolean;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@TheFavorites);
	try
		ret := lOIFavoriteProperties.IsEqual(TheFavorites);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'IsEqual', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperties_WriteDebugReport(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
begin
	CheckArg(L, 1);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	try
		lOIFavoriteProperties.WriteDebugReport();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'WriteDebugReport', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_Items(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	Index:integer;
	ret:TOIFavoriteProperty;
begin
	CheckArg(L, 2);
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lOIFavoriteProperties.Items[Index];
		lua_push(L,ret);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'Items', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_VCLuaGetCount(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	ret:integer;
begin
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIFavoriteProperties.Count;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'GetCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperties_VCLuaSetModified(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	val:Boolean;
begin
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lOIFavoriteProperties.Modified := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'SetModified', E.ClassName, E.Message);
	end;
end;

function VCLua_OIFavoriteProperties_VCLuaGetModified(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	ret:Boolean;
begin
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIFavoriteProperties.Modified;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'GetModified', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperties_VCLuaGetSorted(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	ret:Boolean;
begin
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIFavoriteProperties.Sorted;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'GetSorted', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_OIFavoriteProperties_VCLuaGetDoublesDeleted(L: Plua_State): Integer; cdecl;
var
	lOIFavoriteProperties:TLuaOIFavoriteProperties;
	ret:boolean;
begin
	lOIFavoriteProperties := TLuaOIFavoriteProperties(GetLuaObjectUnsafe(L, 1));
	try
		ret := lOIFavoriteProperties.DoublesDeleted;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'OIFavoriteProperties', 'GetDoublesDeleted', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

procedure lua_push(L: Plua_State; const v: TOIFavoriteProperty; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TOIFavoriteProperty',v);
end;

procedure lua_push(L: Plua_State; const v: TOIRestrictedProperty; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TOIRestrictedProperty',v);
end;

procedure lua_push(L: Plua_State; const v: TOIFavoriteProperties; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TOIFavoriteProperties',v);
end;

begin
	OIFavoritePropertyFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(OIFavoritePropertyFuncs, 'Constrains', @VCLua_OIFavoriteProperty_Constrains);
	TLuaMethodInfo.Create(OIFavoritePropertyFuncs, 'Compare', @VCLua_OIFavoriteProperty_Compare);
	TLuaMethodInfo.Create(OIFavoritePropertyFuncs, 'Assign', @VCLua_OIFavoriteProperty_Assign);
	TLuaMethodInfo.Create(OIFavoritePropertyFuncs, 'CreateCopy', @VCLua_OIFavoriteProperty_CreateCopy);
	TLuaMethodInfo.Create(OIFavoritePropertyFuncs, 'DebugReportAsString', @VCLua_OIFavoriteProperty_DebugReportAsString);
	OIFavoritePropertySets := TLuaVmt.Create;
	
	OIRestrictedPropertyFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(OIRestrictedPropertyFuncs, 'WidgetSets', @VCLua_OIRestrictedProperty_VCLuaGetWidgetSets, mfCall);
	OIRestrictedPropertySets := TLuaVmt.Create;
	TLuaMethodInfo.Create(OIRestrictedPropertySets, 'WidgetSets', @VCLua_OIRestrictedProperty_VCLuaSetWidgetSets, mfCall, TypeInfo(TLCLPlatforms));
	OIFavoritePropertiesFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Clear', @VCLua_OIFavoriteProperties_Clear);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Assign', @VCLua_OIFavoriteProperties_Assign);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'CreateCopy', @VCLua_OIFavoriteProperties_CreateCopy);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Contains', @VCLua_OIFavoriteProperties_Contains);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Add', @VCLua_OIFavoriteProperties_Add);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'AddNew', @VCLua_OIFavoriteProperties_AddNew);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Remove', @VCLua_OIFavoriteProperties_Remove);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'DeleteConstraints', @VCLua_OIFavoriteProperties_DeleteConstraints);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Sort', @VCLua_OIFavoriteProperties_Sort);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'DeleteDoubles', @VCLua_OIFavoriteProperties_DeleteDoubles);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'IsEqual', @VCLua_OIFavoriteProperties_IsEqual);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'WriteDebugReport', @VCLua_OIFavoriteProperties_WriteDebugReport);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Items', @VCLua_OIFavoriteProperties_Items);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Count', @VCLua_OIFavoriteProperties_VCLuaGetCount, mfCall);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Modified', @VCLua_OIFavoriteProperties_VCLuaGetModified, mfCall);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'Sorted', @VCLua_OIFavoriteProperties_VCLuaGetSorted, mfCall);
	TLuaMethodInfo.Create(OIFavoritePropertiesFuncs, 'DoublesDeleted', @VCLua_OIFavoriteProperties_VCLuaGetDoublesDeleted, mfCall);
	OIFavoritePropertiesSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(OIFavoritePropertiesSets, 'Modified', @VCLua_OIFavoriteProperties_VCLuaSetModified, mfCall, TypeInfo(Boolean));
end.
