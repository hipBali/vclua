


# vclua
Gui library for lua

Version 0.9.1

Made with *Lazarus version 2.2.6*
___

**Binary releases at sourceforge**

***Lua 5.1***

[win32](https://sourceforge.net/projects/vclua/files/vclua-v0.9.1/vcl_core_dll_win32_lua51.zip/download).

[x86_64-linux](https://sourceforge.net/projects/vclua/files/vclua-v0.9.1/vcl_core_so_x86_64_linux_lua51.zip/download).

___
## Compiling vclua library
### Prepare source code

go to the src-generator directory

```
cd vclua
cd src-generator 
```
### Patch lazarus source code
replace lazarus source files (graphics.pp and comctrls.pp) with patched files in ***patch/lcl*** directory or use patch utility

```
sudo patch /usr/share/lazarus/2.2.6/lcl/graphics.pp patch/graphics.patch
sudo patch /usr/share/lazarus/2.2.6/lcl/comctrls.pp patch/comctrls.patch
```
### Add your components
If you want add new component source to the generated source codes (see src/components) you must use the source code parser/genarator tool. First configure the fpc and lazarus source directories, with editing the file ***lua_make/config.lua***

```lua
-- linux
local LAZPATH = "/usr/share/lazarus/2.2.6/"
local FPCSOURCE = "/usr/share/fpcsrc/3.2.2/"
```

```lua
-- windows
local LAZPATH = "/lazarus/"
local FPCSOURCE = "/lazarus/fpc/3.2.2/source/"
```

run the fpc source parser/generator tool

```
lua lua_make/import.lua
```

### Set Lua version
check the desired lua version at ***src/vcldef.inc*** file

```pascal
// Lua version 
{$Define LUA51}
```
### Compile source code
go to the vclua directory and run lazbuild 

```
cd vclua
```

```shell
-- linux
lazbuild -B vcl-linux.lpi
```

```shell
-- windows
lazbuild -B vcl.lpi
```
### Install library

```shell
-- linux
sudo mkdir /usr/local/lib/lua/5.x/vcl
sudo cp libcore.so /usr/local/lib/lua/5.x/vcl/core.so
```
```shell
-- windows
copy core.dll my_lua_libs/vcl/core.dll
```

## Documentation

[VCLua Class reference](https://github.com/hipBali/vclua/tree/initial-v1/vclua_ref.html)
