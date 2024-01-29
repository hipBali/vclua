library vcl;

{$TYPEINFO ON}

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

function luaopen_vcl_core(L: Plua_State): Integer; cdecl;
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

  {$IFNDEF LUA51}
  luaL_newlib(l, is_funcs);
  {$ELSE}
  lua_createtable(L, 0, High(is_funcs));
  luaL_register(L, nil, PluaL_Reg(is_funcs));
  {$ENDIF}
  lua_setfield(L, -2, 'is');

  {$IFNDEF LUA51}
  luaL_newlib(l, as_funcs);
  {$ELSE}
  lua_createtable(L, 0, High(as_funcs));
  luaL_register(L, nil, PluaL_Reg(as_funcs));
  {$ENDIF}
  lua_setfield(L, -2, 'as');

  result := 1;
end;

exports luaopen_vcl_core;

end.

