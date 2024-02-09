library vcl;

{$TYPEINFO ON}{$H+}

{$R *.res}

uses
  // patched sources -----------
  Graphics,
  // ---------------------------
  Classes,
  SysUtils,
  Interfaces,
  InterfaceBase,
  Forms,
  Controls,
  Dialogs,
  runtimetypeinfocontrols,
  TypInfo,
  FGL,
  Lua in 'lua.pas',
  LuaHelper in 'LuaHelper.pas',
  LuaController in 'LuaController.pas',
  LuaProperties in 'LuaProperties.pas',
  LuaObject in 'LuaObject.pas',
  LuaProxy in 'LuaProxy.pas',
  LuaDialogs in 'LuaDialogs.pas',
  LuaStream in 'LuaStream.pas',
  {$IFDEF PROPERTYGRID}
    LuaPropertyGrid in 'addons/LuaPropertyGrid.pas',
  {$ENDIF}
  {$IFDEF EXTENDED}
  LuaRichMemo in 'addons/LuaRichMemo.pas',
  LuaSynEdit in 'addons/LuaSynEdit.pas',
  LuaSynHighlighterAttributes in 'addons/LuaSynHighlighterAttributes.pas',
  {$ENDIF}

  {$i vcl.inc}
  
  is_funcs : array of lual_reg = (
  {$i is_funcs.inc}
  (name:nil;func:nil)
  );
  as_funcs : array of lual_reg = (
  {$i as_funcs.inc}
  (name:nil;func:nil)
  );

type Map = specialize TFPGMap<string, aoluaL_Reg>;
function luaopen_vcl_core(L: Plua_State): Integer; cdecl;
var res:string;
  pti: PTypeInfo;
  i,j:integer;
  funcs,funcsSorted:Map;
begin
  // luaL_openlib is deprecated?
  {$IFNDEF LUA51}
     luaL_newlibtable(l, @vcl_lib);
     luaL_setfuncs(l, @vcl_lib, 0);
  {$ELSE}
     luaL_openlib(L, LUA_VCL_LIBNAME, @vcl_lib, 0);
  {$ENDIF}
  // extend library
  lua_pushcfunction(L, @LuaListProperties);
  lua_setfield(L, -2, 'ListProperties');
  lua_pushcfunction(L, @CreateStream);
  lua_setfield(L, -2, 'Stream');
  lua_pushcfunction(L, @LuaShowMessage);
  lua_setfield(L, -2, 'ShowMessage');
  lua_pushcfunction(L, @LuaMessageDlg);
  lua_setfield(L, -2, 'MessageDlg');
  lua_pushcfunction(L, @lua_setArrayProperty);
  lua_setfield(L, -2, 'setArray');
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

  luaL_newlib(L, is_funcs);
  lua_setfield(L, -2, 'is');

  luaL_newlib(L, as_funcs);
  lua_setfield(L, -2, 'as');

  res := CheckOrderOfPushObject(metaPtis);
  if not res.IsEmpty then
     luaL_error(L, PChar(res));

  funcs := Map.Create;
  {$i init_map.inc}

  funcsSorted:=Map.Create;
  funcsSorted.Assign(funcs);
  funcsSorted.OnKeyCompare:=@CompareText;
  funcsSorted.Sorted := true;

  for i := High(metaPtis) downto 0 do begin
      pti := metaPtis[i];
      if funcs.Keys[i] <> pti^.Name then
         luaL_error(L, PChar(format('Meta generator bug at %d: %s<>%s, check order of both init_map and meta_srcs', [i, funcs.Keys[i], pti^.Name])));
      luaL_newmetatable(L,PChar(string(pti^.Name)));
      {$IFDEF LUA51}
      lua_pushliteral(L,'__name');
      lua_pushstring(L,pti^.Name);
      lua_rawset(L,-3);
      {$ENDIF}
      lua_pushliteral(L,'__index');
      luaL_newlib(L, funcs.Data[i]);
      repeat
        pti := GetTypeData(pti)^.ParentInfo;
      until (pti = nil) or (funcsSorted.Find(pti^.Name, j));
      if pti <> nil then begin
         if luaL_newmetatable(L,PChar(string((pti^.Name)))) = 1 then
            luaL_error(L, PChar(format('Meta generator bug at %d %p, shouldn''t create metatable here but did, check CheckOrderOfPushObject(metaPtis) call', [i, pti])));
         lua_setmetatable(L,-2);
      end;
      lua_rawset(L,-3);
      lua_pop(L,1);
  end;

  result := 1;
end;

exports luaopen_vcl_core;

end.

