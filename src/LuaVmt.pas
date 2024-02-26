unit LuaVmt;

{$mode Delphi}{$T+}

interface

uses
  Lua, HashMap, TypInfo, SysUtils, Contnrs;

type
  TLuaMethodInfo = class(TFPHashObject)
    public
      pf: lua_CFunction;
      constructor Create(list:TFPHashObjectList; const name:shortstring; aPf: lua_CFunction);
  end;
  TLuaVmt = THashList;
  PLuaVmt = ^TLuaVmt;
  TLuaVmts = THashMap<PLuaVmt>;

  TLuaVmtsHelper = class helper for TLuaVmts
    function GetVmt(pti: PTypeInfo):PLuaVmt;
  end;

var
  vmts: TLuaVmts;

implementation

constructor TLuaMethodInfo.Create(list:TFPHashObjectList; const name:shortstring; aPf: lua_CFunction);
begin
  pf := aPf;
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
end.

