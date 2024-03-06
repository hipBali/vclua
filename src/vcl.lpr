library vcl;

{$TYPEINFO ON}{$H+}{$T+}

{$R *.res}

uses
  SysUtils,
  Interfaces,
  TypInfo,
  Lua in 'lua.pas',
  LuaHelper in 'LuaHelper.pas',
  LuaController in 'LuaController.pas',
  LuaProperties in 'LuaProperties.pas',
  LuaObject in 'LuaObject.pas',
  LuaProxy in 'LuaProxy.pas',
  LuaDialogs in 'LuaDialogs.pas',
  LuaStream in 'LuaStream.pas',
  LuaVmt,
  {$IFDEF PROPERTYGRID}
    LuaPropertyGrid in 'addons/LuaPropertyGrid.pas',
  {$ENDIF}
  {$IFDEF EXTENDED}
  LuaRichMemo in 'addons/LuaRichMemo.pas',
  LuaSynEdit in 'addons/LuaSynEdit.pas',
  LuaSynHighlighterAttributes in 'addons/LuaSynHighlighterAttributes.pas',
  {$ENDIF}

  {$i vcl.inc}
  
function luaopen_vcl_core(L: Plua_State): Integer; cdecl;
var res:string;
  pti,ptiCur: PTypeInfo;
  i,j:integer;
  cur,curSets:PLuaVmt;
begin
  // luaL_openlib is deprecated?
  {$IFNDEF LUA51}
     luaL_newlibtable(l, vcl_lib);
     luaL_setfuncs(l, vcl_lib, 0);
  {$ELSE}
     luaL_openlib(L, LUA_VCL_LIBNAME, @vcl_lib, 0);
  {$ENDIF}
  // extend library
  lua_pushcfunction(L, @LuaListProperties);
  lua_setfield(L, -2, 'ListProperties');
  lua_pushcfunction(L, @LuaListMethods);
  lua_setfield(L, -2, 'ListMethods');
  lua_pushcfunction(L, @LuaGetCallable);
  lua_setfield(L, -2, 'GetCallable');
  lua_pushcfunction(L, @CreateStream);
  lua_setfield(L, -2, 'Stream');
  lua_pushcfunction(L, @LuaShowMessage);
  lua_setfield(L, -2, 'ShowMessage');
  lua_pushcfunction(L, @LuaMessageDlg);
  lua_setfield(L, -2, 'MessageDlg');
  lua_pushcfunction(L, @tableToStringList);
  lua_setfield(L, -2, 'AsStringList');
  // UTF-8 CP
  lua_pushcfunction(L, @set_vclua_utf8_conv);
  lua_setfield(L, -2, 'setCPWin');
  {$IFDEF PROPERTYGRID}
  lua_pushcfunction(L, @CreatePropertyGrid);
  lua_setfield(L, -2, 'PropertyGrid');
  {$ENDIF}
  {$IFDEF EXTENDED}
  lua_pushcfunction(L, @CreateSynEdit);
  lua_setfield(L, -2, 'SynEdit');
  lua_pushcfunction(L, @CreateSynHighlighterAttributes);
  lua_setfield(L, -2, 'SynHighlighterAttributes');
  lua_pushcfunction(L, @CreateRichMemo);
  lua_setfield(L, -2, 'RichMemo');
  {$ENDIF}

  lua_pushliteral (L, '_COPYRIGHT');
  lua_pushliteral (L, 'Copyright (C) 2006,2024 Hi-Project Ltd.');
  lua_settable (L, -3);
  lua_pushliteral (L, '_DESCRIPTION');
  lua_pushliteral (L, 'VCLua Visual Controls for LUA ('+ LUA_VERSION_MAJOR + '.' + LUA_VERSION_MINOR + ')' );
  lua_settable (L, -3);
  lua_pushliteral (L, '_NAME');
  lua_pushliteral (L, 'VCLua');
  lua_settable (L, -3);
  lua_pushliteral (L, '_VERSION');
  lua_pushliteral (L, '0.9.2');
  lua_settable (L, -3);

  res := CheckOrderOfPushObject(metaPtis);
  if not res.IsEmpty then
     luaL_error(L, PChar(res));

  {$i init_map.inc}

  for i := High(metaPtis) downto 0 do begin
      pti := metaPtis[i];
      ptiCur := GetTypeData(pti)^.ParentInfo;
      cur := vmts[pti^.Name];
      curSets := propSets[pti^.Name];
      repeat
        pti := GetTypeData(pti)^.ParentInfo;
      until (pti = nil) or (vmts.Find(pti^.Name) <> nil);
      if pti <> nil then begin
         cur^.Merge(vmts[pti^.Name]^);
         curSets^.Merge(propSets[pti^.Name]^);
         vmts.GetVmt(ptiCur);
         propSets.GetVmt(ptiCur);
      end;
  end;

  result := 1;
end;

exports luaopen_vcl_core;

end.

