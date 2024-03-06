unit LuaVmt;

{$mode Delphi}{$T+}

interface

uses
  Lua, HashMap, TypInfo, SysUtils, Contnrs;

type
  TMethodFlag = (mfNone, mfCall);
  TLuaMethodInfo = class(TFPHashObject)
    public
      pf: lua_CFunction;
      mf: TMethodFlag;
      constructor Create(list:TFPHashObjectList; const name:shortstring; aPf: lua_CFunction; aMf: TMethodFlag = mfNone);
  end;
  TLuaVmt = THashList;
  PLuaVmt = ^TLuaVmt;
  TLuaVmts = THashMap<PLuaVmt>;

  TLuaVmtsHelper = class helper for TLuaVmts
    function GetVmt(pti: PTypeInfo):PLuaVmt;
  end;

function GetPropSets(L: Plua_State; index: Integer):PLuaVmt;
function HasMethod(const pvmt: PLuaVmt; const PropName:string; out mi: TLuaMethodInfo):Boolean;
procedure CallSetter(L: Plua_State; const mi: TLuaMethodInfo; objIndex, valIndex: Integer);

var
  vmts,propSets: TLuaVmts;

implementation

constructor TLuaMethodInfo.Create(list:TFPHashObjectList; const name:shortstring; aPf: lua_CFunction; aMf: TMethodFlag);
begin
  pf := aPf;
  mf := aMf;
  inherited Create(list, name);
end;

function TLuaVmtsHelper.GetVmt(pti: PTypeInfo):PLuaVmt;
var
  orig: PTypeInfo;
begin
  orig := pti;
  result := Self[pti^.Name];
  while (result = nil) and (GetTypeData(pti)^.ParentInfo <> nil) do begin
    pti := GetTypeData(pti)^.ParentInfo;
    result := Self[pti^.Name];
  end;
  if result <> nil then
     while orig <> pti do begin
       Self[orig^.Name] := result;
       orig := GetTypeData(orig)^.ParentInfo;
     end;
end;

function GetPropSets(L: Plua_State; index: Integer):PLuaVmt;
begin
  lua_pushliteral(L,'propSets');
  lua_rawget(L,index);
  result := lua_touserdata(L,-1);
  lua_pop(L,1);
end;

function HasMethod(const pvmt: PLuaVmt; const PropName:string; out mi: TLuaMethodInfo):Boolean;
begin
  if pvmt <> nil then begin
    mi := TLuaMethodInfo(pvmt^.Find(PropName));
    Result := Assigned(mi);
  end else
    Result := false;
end;

procedure CallSetter(L: Plua_State; const mi: TLuaMethodInfo; objIndex, valIndex: Integer);
begin
  lua_pushcfunction(L, mi.pf);
  assert(mi.mf = mfCall,'no mfCall on propSet');
  lua_pushvalue(L, objIndex);
  lua_pushvalue(L, valIndex);
  lua_call(L, 2, 0);
end;

begin
  vmts := TLuaVmts.Create;
  propSets := TLuaVmts.Create;
end.

