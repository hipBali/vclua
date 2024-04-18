unit LuaObject;

{$mode Delphi}{$T+}

interface

uses
  Classes,
  TypInfo,
  LuaVmt,
  Contnrs,
  LuaHelper,
  LuaProperties,
  Lua,
  {$i luaobject_uses.inc};

type
  aopti = array of PTypeInfo;
  PObject = ^TObject;
  OnNilCheckProc = procedure(L: Plua_State; i: Integer; v: PObject; pti: PTypeInfo; ler: TLuaErrorReport);

var
  metaPtis: aopti;
  apiPtis: TFPHashList;

function tableToStringList(L : Plua_State): Integer; cdecl;
procedure luaL_checkStringList(L: Plua_State; i: Integer; v: PObject; pti: PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
function luaL_checkStringList(L: Plua_State; Index: Integer; ler: TLuaErrorReport = lerLuaError):TStringList; overload;
function luaL_checkOrFromTable(L: Plua_State; i: Integer; v: PObject; proc: OnNilCheckProc; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError):Boolean; inline;
procedure luaL_check(L: Plua_State; i: Integer; v: PObject; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError); overload; inline;
procedure lua_push(L: Plua_State; const v: TObject; pti: PTypeInfo);overload;
procedure lua_pushobject(L: Plua_State; index: Integer; Comp:TObject);

function CheckOrderOfPushObject(ptis: aopti):string;

// getters -- e.g. StringGrid
procedure lua_pushItems(L: Plua_State; ItemOwner:TCollection);
procedure lua_pushCells(L: Plua_State; ItemOwner:TPersistent);

implementation

uses
  LuaProxy, LuaController;

function Ancestry(pti:PTypeInfo):TStringList;
begin
     Result := TStringList.Create;
     while (pti <> nil) and (pti^.Kind = tkClass) do begin
       Result.Add(pti^.Name);
       pti := GetTypeData(pti)^.ParentInfo;
     end;
end;

function CheckOrderOfPushObject(ptis: aopti):string;
var
  sl : array of TStringList;
  i,j:Integer;
begin
  SetLength(sl, Length(ptis));
  for i := 0 to High(sl) do begin
    sl[i] := ancestry(ptis[i]);
    sl[i].Sort;
  end;
  for i := 0 to High(sl) do
    for j := i + 1 to High(sl) do
      if sl[j].IndexOf(ptis[i]^.Name) >= 0 then begin
        Result:=format('%s precedes %s and hence can''t be pushed to stack properly', [ptis[i]^.Name, ptis[j]^.Name]);
        Exit;
      end;
end;

function GetPti(pti : PTypeInfo = nil):PTypeInfo;
begin
  if pti <> nil then Result := pti
  else Result := TypeInfo(TObject);
end;

procedure LuaTypeError(L: Plua_State; i: Integer; v: PObject; pti: PTypeInfo; ler: TLuaErrorReport = lerLuaError); overload;
begin
  LuaTypeError(L, i, GetPti(pti), ler);
end;

function luaL_checkOrFromTable(L: Plua_State; i: Integer; v: PObject; proc: OnNilCheckProc; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError):Boolean;
begin
  Result := False;
  i := LuaAbsIndex(L, i);
  if lua_isnil(L, i) then begin
    v^ := nil;
    Exit;
  end;
  if not lua_istable(L, i) then
     LuaTypeError(L, i, GetPti(pti), ler);
  v^ := GetLuaObjectUnsafe(L, i);
  if v^ = nil then begin
    Result := True;
    proc(L, i, v, pti, ler);
  end;
  lua_pop(L, 1);
end;

procedure luaL_check(L: Plua_State; i: Integer; v: PObject; pti : PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
begin
  luaL_checkOrFromTable(L, i, v, @LuaTypeError, pti, ler);
end;

procedure lua_push(L: Plua_State; const v: TObject; pti: PTypeInfo);
begin
  // we are here because there were no more specialized lua_push'es
  lua_pushobject(L, -1, v);
end;

// CreateTableForUnknownType?
procedure lua_pushobject(L: Plua_State; index: Integer; Comp:TObject);
var cName: String = '';
begin
  if Comp = nil then begin
    lua_pushnil(L);
    exit
  end;
  if vmts.GetVmt(Comp.ClassInfo) <> nil then begin
     cName := Comp.ClassName;
     propSets.GetVmt(Comp.ClassInfo);
  end;
  CreateTableForKnownType(L, cName, Comp);
end;

procedure lua_pushItems(L: Plua_State; ItemOwner:TCollection);
var i,top:Integer;
begin
    lua_newtable(L);
    top := lua_gettop(L);
    for i:=0 to ItemOwner.Count-1 do begin
      lua_pushinteger(L, i + 1 );
      lua_pushobject(L, -1, ItemOwner.Items[i]);
      lua_settable(L, top);
    end;
    if ItemOwner.Count=0 then
       lua_settable(L, top);
end;

procedure lua_pushCells(L: Plua_State; ItemOwner:TPersistent);
var i,j,top,ttop:Integer;
    Grid: TStringGrid;
begin
    Grid := TStringGrid(ItemOwner);
    lua_newtable(L);
    for i:=0 to Grid.ColCount-1 do begin
        top := lua_gettop(L);
        lua_pushinteger(L,i+1);
        lua_newtable(L);
        for j:=0 to Grid.RowCount-1 do begin
           lua_pushinteger(L, j+1);
           lua_pushstring(L, PChar(Grid.Cells[i, j]));
           lua_settable(L, -3);
        end;
        lua_settable(L, top);
    end;
end;

function tableToStringList(L : Plua_State): Integer; cdecl;
begin
  CheckArg(L, 1);
  lua_push(L, luaL_checkStringList(L, 1));
  result := 1;
end;

procedure luaL_checkStringList(L: Plua_State; i: Integer; v: PObject; pti: PTypeInfo = nil; ler: TLuaErrorReport = lerLuaError);
begin
  v^ := TObject(luaL_checkStringList(L, i, ler));
end;

function luaL_checkStringList(L: Plua_State; Index: Integer; ler: TLuaErrorReport = lerLuaError):TStringList;
var
  aos:array of string;
begin
  index := LuaAbsIndex(L, index);
  // TODO: add ler: TLuaErrorReport = lerLuaError to generics and test if it compiles, but no reason for it yet
  TTrait<string>.luaL_checkArray(L, index, @aos);
  Result := TStringList.Create;
  Result.SetStrings(aos);
end;

var
  i: Integer;
begin
  metaPtis := aopti.Create(
  {$i meta_srcs.inc}
  );
  apiPtis := TFPHashList.Create;
  for i := 0 to High(metaPtis) do
    apiPtis.Add(metaPtis[i]^.Name, metaPtis[i]);
  {$i api_srcs.inc}
end.

