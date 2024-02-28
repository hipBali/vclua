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

begin
  vmts := TLuaVmts.Create;
  propSets := TLuaVmts.Create;
end.

