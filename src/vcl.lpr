library vcl;

{$TYPEINFO ON}
{$i vcldef.inc}

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
  {$IFDEF EXTENDED}
  LuaPropertyGrid in 'src/addons/LuaPropertyGrid.pas',
  LuaRichMemo in 'src/addons/LuaRichMemo.pas',
  LuaSynEdit in 'src/addons/LuaSynEdit.pas',
  LuaSynHighlighterAttributes in 'src/addons/LuaSynHighlighterAttributes.pas',
  {$ENDIF}

  {$i vcl.inc}
  

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
  {$IFDEF EXTENDED}
  lua_pushcfunction(L, @CreatePropertyGrid);
  lua_setfield(L, -2, 'PropertyGrid');
  lua_pushcfunction(L, @CreateSynEdit);
  lua_setfield(L, -2, 'SynEdit');
  lua_pushcfunction(L, @CreateSynHighlighterAttributes);
  lua_setfield(L, -2, 'SynHighlighterAttributes');
  lua_pushcfunction(L, @CreateRichMemo);
  lua_setfield(L, -2, 'RichMemo');
  {$ENDIF}

  lua_pushliteral (L, '_COPYRIGHT');
  lua_pushliteral (L, 'Copyright (C) 2006,2023 Hi-Project Ltd.');
  lua_settable (L, -3);
  lua_pushliteral (L, '_DESCRIPTION');
  lua_pushliteral (L, 'VCLua Visual Controls for LUA ('+ LUA_VERSION_MAJOR + '.' + LUA_VERSION_MINOR + ')' );
  lua_settable (L, -3);
  lua_pushliteral (L, '_NAME');
  lua_pushliteral (L, 'VCLua');
  lua_settable (L, -3);
  lua_pushliteral (L, '_VERSION');
  lua_pushliteral (L, '0.9.1');
  lua_settable (L, -3);

  result := 1;
end;

exports luaopen_vcl_core;

end.

