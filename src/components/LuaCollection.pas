(*
Generated with Lua-fpc parser/generator
(C) 2018-2024 Hi-Project Ltd.
*)
unit LuaCollection;	

{$MODE Delphi}{$T+}

interface

Uses Lua, LuaController, TypInfo, LuaVmt, Classes;

procedure lua_push(L: Plua_State; const v: TCollectionItem; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCollectionItem = class(TCollectionItem)
    end;
var
    CollectionItemFuncs: TLuaVmt;
    CollectionItemSets: TLuaVmt;

procedure lua_push(L: Plua_State; const v: TCollection; pti: PTypeInfo = nil); overload; inline;

type
    TLuaCollection = class(TCollection)
    end;
var
    CollectionFuncs: TLuaVmt;
    CollectionSets: TLuaVmt;


implementation
Uses LuaProxy, LuaObject, LuaHelper, SysUtils, LuaPersistent;

function VCLua_CollectionItem_VCLuaSetCollection(L: Plua_State): Integer; cdecl;
var
	lCollectionItem:TLuaCollectionItem;
	val:TCollection;
begin
	lCollectionItem := TLuaCollectionItem(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionItem.Collection := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionItem', 'SetCollection', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionItem_VCLuaGetCollection(L: Plua_State): Integer; cdecl;
var
	lCollectionItem:TLuaCollectionItem;
	ret:TCollection;
begin
	lCollectionItem := TLuaCollectionItem(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionItem.Collection;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionItem', 'GetCollection', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionItem_VCLuaGetID(L: Plua_State): Integer; cdecl;
var
	lCollectionItem:TLuaCollectionItem;
	ret:Integer;
begin
	lCollectionItem := TLuaCollectionItem(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionItem.ID;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionItem', 'GetID', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionItem_VCLuaSetIndex(L: Plua_State): Integer; cdecl;
var
	lCollectionItem:TLuaCollectionItem;
	val:Integer;
begin
	lCollectionItem := TLuaCollectionItem(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionItem.Index := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionItem', 'SetIndex', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionItem_VCLuaGetIndex(L: Plua_State): Integer; cdecl;
var
	lCollectionItem:TLuaCollectionItem;
	ret:Integer;
begin
	lCollectionItem := TLuaCollectionItem(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionItem.Index;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionItem', 'GetIndex', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_CollectionItem_VCLuaSetDisplayName(L: Plua_State): Integer; cdecl;
var
	lCollectionItem:TLuaCollectionItem;
	val:string;
begin
	lCollectionItem := TLuaCollectionItem(GetLuaObjectUnsafe(L, 1));
	luaL_check(L,2,@val);
	try
		lCollectionItem.DisplayName := val;
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'CollectionItem', 'SetDisplayName', E.ClassName, E.Message);
	end;
end;

function VCLua_CollectionItem_VCLuaGetDisplayName(L: Plua_State): Integer; cdecl;
var
	lCollectionItem:TLuaCollectionItem;
	ret:string;
begin
	lCollectionItem := TLuaCollectionItem(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollectionItem.DisplayName;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'CollectionItem', 'GetDisplayName', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Collection_Owner(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	ret:TPersistent;
begin
	CheckArg(L, 1);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	try
		ret := lCollection.Owner();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Owner', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Collection_Add(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	ret:TCollectionItem;
begin
	CheckArg(L, 1);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	try
		ret := lCollection.Add();
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Add', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Collection_BeginUpdate(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
begin
	CheckArg(L, 1);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	try
		lCollection.BeginUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Collection', 'BeginUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_Collection_Clear(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
begin
	CheckArg(L, 1);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	try
		lCollection.Clear();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Clear', E.ClassName, E.Message);
	end;
end;

function VCLua_Collection_EndUpdate(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
begin
	CheckArg(L, 1);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	try
		lCollection.EndUpdate();
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Collection', 'EndUpdate', E.ClassName, E.Message);
	end;
end;

function VCLua_Collection_Delete(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	Index:Integer;
begin
	CheckArg(L, 2);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		lCollection.Delete(Index);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Delete', E.ClassName, E.Message);
	end;
end;

function VCLua_Collection_Insert(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	Index:Integer;
	ret:TCollectionItem;
begin
	CheckArg(L, 2);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	luaL_check(L,2,@Index);
	try
		ret := lCollection.Insert(Index);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Insert', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Collection_FindItemID(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	ID:Integer;
	ret:TCollectionItem;
begin
	CheckArg(L, 2);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	luaL_check(L,2,@ID);
	try
		ret := lCollection.FindItemID(ID);
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Collection', 'FindItemID', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Collection_Exchange(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	Index1:integer;
	index2:integer;
begin
	CheckArg(L, 3);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	luaL_check(L,2,@Index1);
	luaL_check(L,3,@index2);
	try
		lCollection.Exchange(Index1,index2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Exchange', E.ClassName, E.Message);
	end;
end;

function VCLua_Collection_Move(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	Index1:integer;
	index2:integer;
begin
	CheckArg(L, 3);
	lCollection := TLuaCollection(GetLuaObject(L, 1));
	luaL_check(L,2,@Index1);
	luaL_check(L,3,@index2);
	try
		lCollection.Move(Index1,index2);
		Result := 0;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Move', E.ClassName, E.Message);
	end;
end;

function VCLua_Collection_VCLuaGetCount(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	ret:Integer;
begin
	lCollection := TLuaCollection(GetLuaObjectUnsafe(L, 1));
	try
		ret := lCollection.Count;
		Result := 1;
	except
		on E: Exception do
			CallError(L, 'Collection', 'GetCount', E.ClassName, E.Message);
	end;
	lua_push(L,ret);
end;

function VCLua_Collection_Items(L: Plua_State): Integer; cdecl;
var
	lCollection:TLuaCollection;
	Index:Integer;
	ret:TCollectionItem;
begin
	CheckArg(L, 2, 3);
	lCollection := TLuaCollection(CheckLuaObjectPop(L, 1));
	luaL_check(L,2,@Index);
	try
		if lua_isnone(L, 3) then begin
			ret := lCollection.Items[Index];
			lua_push(L,ret);
			Result := 1;
		end else begin
			luaL_check(L,3,@ret);
			lCollection.Items[Index] := ret;
			Result := 0;
		end;
	except
		on E: Exception do
			CallError(L, 'Collection', 'Items', E.ClassName, E.Message);
	end;
end;

procedure lua_push(L: Plua_State; const v: TCollectionItem; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCollectionItem',v);
end;

procedure lua_push(L: Plua_State; const v: TCollection; pti: PTypeInfo);
begin
	CreateTableForKnownType(L,'TCollection',v);
end;

begin
	CollectionItemFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CollectionItemFuncs, 'Collection', @VCLua_CollectionItem_VCLuaGetCollection, mfCall);
	TLuaMethodInfo.Create(CollectionItemFuncs, 'ID', @VCLua_CollectionItem_VCLuaGetID, mfCall);
	TLuaMethodInfo.Create(CollectionItemFuncs, 'Index', @VCLua_CollectionItem_VCLuaGetIndex, mfCall);
	TLuaMethodInfo.Create(CollectionItemFuncs, 'DisplayName', @VCLua_CollectionItem_VCLuaGetDisplayName, mfCall);
	CollectionItemSets := TLuaVmt.Create;
	TLuaMethodInfo.Create(CollectionItemSets, 'Collection', @VCLua_CollectionItem_VCLuaSetCollection, mfCall, TypeInfo(TCollection));
	TLuaMethodInfo.Create(CollectionItemSets, 'Index', @VCLua_CollectionItem_VCLuaSetIndex, mfCall, TypeInfo(Integer));
	TLuaMethodInfo.Create(CollectionItemSets, 'DisplayName', @VCLua_CollectionItem_VCLuaSetDisplayName, mfCall, TypeInfo(string));
	CollectionFuncs := TLuaVmt.Create;
	TLuaMethodInfo.Create(CollectionFuncs, 'Owner', @VCLua_Collection_Owner);
	TLuaMethodInfo.Create(CollectionFuncs, 'Add', @VCLua_Collection_Add);
	TLuaMethodInfo.Create(CollectionFuncs, 'BeginUpdate', @VCLua_Collection_BeginUpdate);
	TLuaMethodInfo.Create(CollectionFuncs, 'Clear', @VCLua_Collection_Clear);
	TLuaMethodInfo.Create(CollectionFuncs, 'EndUpdate', @VCLua_Collection_EndUpdate);
	TLuaMethodInfo.Create(CollectionFuncs, 'Delete', @VCLua_Collection_Delete);
	TLuaMethodInfo.Create(CollectionFuncs, 'Insert', @VCLua_Collection_Insert);
	TLuaMethodInfo.Create(CollectionFuncs, 'FindItemID', @VCLua_Collection_FindItemID);
	TLuaMethodInfo.Create(CollectionFuncs, 'Exchange', @VCLua_Collection_Exchange);
	TLuaMethodInfo.Create(CollectionFuncs, 'Move', @VCLua_Collection_Move);
	TLuaMethodInfo.Create(CollectionFuncs, 'Count', @VCLua_Collection_VCLuaGetCount, mfCall);
	TLuaMethodInfo.Create(CollectionFuncs, 'Items', @VCLua_Collection_Items);
	CollectionSets := TLuaVmt.Create;
	
end.
