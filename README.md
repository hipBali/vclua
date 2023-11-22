# vclua
Gui library for lua

Version 0.9.1

**Binary releases at sourceforge**

A [win32 lua 5.1] (https://sourceforge.net/projects/vclua/files/vclua-v0.9.1/vcl_core_dll_win32_lua51.zip/download).

B [x86_64-linux lua 5.1] (https://sourceforge.net/projects/vclua/files/vclua-v0.9.1/vcl_core_so_x86_64_linux_lua51.zip/download).



**Prepare source code**

go to the src-generator directory

```
cd vclua
cd src-generator 
```

replace lazarus source files (graphics.pp and comctrls.pp) with patched files in ***patch/lcl*** directory or use patch utility

```
sudo patch /usr/share/lazarus/2.2.6/lcl/graphics.pp patch/graphics.patch
sudo patch /usr/share/lazarus/2.2.6/lcl/comctrls.pp patch/comctrls.patch
```

configure fpc and lazarus source directories, edit ***lua_make/config.lua***

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



**Compile vclua library**

check the desired lua version at ***src/vcldef.inc*** file

```pascal
// Lua version 
{$Define LUA51}
```

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



**Install vclua library**

```shell
-- linux
sudo mkdir /usr/local/lib/lua/5.x/vcl
sudo cp clibs/vcl/libcore.so /usr/local/lib/lua/5.x/vcl/core.so
```



