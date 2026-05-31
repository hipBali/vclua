# vclua
Gui library for lua

Version 1.0.0

Made with *Lazarus version 3.2-4.6*
___

**Binary releases at sourceforge (win32, win64, linux)**

***Lua 5.1-5.4 and Luajit***

[vclua binaries](https://sourceforge.net/projects/vclua/files/) or from [vt-form](https://github.com/hipBali/vclua-tools) distributives (only Luajit/5.4)

---
## Free Pascal -> Lua generator

### Supported features

#### Types

Automatic inference from source files:
1. basic types
1. enums, sets, chars are represented as Lua strings, also TShortCut if possible
1. dynamic arrays are represented as Lua arrays
1. event procedures (to set/get properties)
1. type aliases

Configurable [list](source-generator/lua_make/config.lua) of LCL and other classes
1. supported classes with constructors with 0 or 1 parameters
1. if the class isn't in that list, only its published properties are supported
1. additional functions can be added
1. global variables can be exported for use in Lua
1. the object pointer is stored in the field `Handle`
1. rule of thumb: LCL class `T<name>` would be available as `<name>` in Lua
1. `Strings` can be set as a Lua array of strings
1. `Collection` can be set as a Lua array of `CollectionItem` or a Lua array of tables of properties of those items

Records: `TPoint`, `TRect`, `TSize`, `TTextStyle`
* record fields can be of any casing when passing from Lua to Free Pascal
* to set `TPoint`, `TRect`, `TSize` values in Free Pascal one needs to pass all of the fields in Lua
* to set `TTextStyle` one can pass any subset of fields, rest will be `Default`ed

Unsupported types:
1. records not explicitly mentioned
1. event functions
1. procedural types for method parameters
1. class references
1. `object` variables
1. [list](source-generator/exclude/VarTypes)

#### Language features

1. published properties (any casing is supported)
1. public properties
1. public and protected event procedures
1. public variables
1. array properties
1. functions and procedures, also class functions and procedures
1. overloaded methods are implemented with numeric suffix
1. each method with `var` parameters is provided twice to be called either without those parameters (since they are used as `out`), or with them (for `TCustomDrawGrid.DefaultDrawCell`, `TCustomListBox.MeasureItem`, ...)
1. optional parameters
1. inheritance (everything generated for the class is available for instances of class descendants)
1. manual typechecking (`is`)
1. exceptions are transformed into Lua errors
1. within class declaration: non-nested `{$ifdef` and `{$ifndef` with possible `{$else`

Unsupported class methods are specified in [exclude](source-generator/exclude). `Reference` property and enumerators are not supported. 

### Documentation
[Examples](examples)
These examples also serve as tests

[Tips, tricks and tools](https://github.com/hipBali/vclua-tools)
Tools in that repo can serve as complicated examples of using VCLua.

[Programming](docs/README.md)

[Class reference](docs/vclua_ref.html)

___
## Compiling vclua library
### Prepare source code

```shell
cd vclua/source-generator
```

For Windows version you'll need to apply the patch to avoid errors like [this](https://forum.lazarus.freepascal.org/index.php/topic,24135.msg144898.html)

Just replace original file with the provided [file](source-generator/patch/lcl/interfaces/win32/win32object.inc) or do in Git Bash:
```shell
patch --binary /f/Work/Dev/lazarus2/lcl/interfaces/win32/win32object.inc patch/win32object.inc.patch
```

### Add your components
If you want to add new component source to the generated source codes (see src/components) you must use the source code parser/generator tool. First configure the fpc and lazarus source directories, with editing the file ***lua_make/config.lua***

```lua
-- linux
local LAZPATH = "/usr/share/lazarus/3.2/"
local FPCSOURCE = "/usr/share/fpcsrc/3.2.2/"
```

```lua
-- windows
local LAZPATH = "f:/Work/Dev/lazarus3/"
local FPCSOURCE = LAZPATH.."fpc/3.2.2/source/"
```

run the fpc source parser/generator tool

```
lua lua_make/import.lua true false EnabledDefinesWin64
```

### Set Lua version
check and set the desired lua version at the ***vcl.lpi*** file

```xml
<CustomOptions Value="-dLUA54"/>
```
or if you want use with LuaJit then set the compiler directive to
```xml
<CustomOptions Value="-dLUA51
-dLUAJIT"/>
```
### Compile source code
open the project in Lazarus and do Run - Clean up and build, or
go to the vclua directory and run lazbuild 

```shell
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

### If added components won't compile

Check and update the following files: [VarTypes](source-generator/exclude/VarTypes), component exclude file inside `source-generator/exclude`, [classdef.lua](source-generator/lua_make/classdef.lua), [LuaProxy.pas](src/LuaProxy.pas)

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

`vcl` folder should end up inside one of the `package.cpath` folders

### Maybe create docs

```
lua lua_make/import.lua true true EnabledDefinesWin64
```
This uses the installed library to get published properties.



## VCLua Form Editor

VCLua now includes a lightweight visual form editor for building LCL/VCL-style forms directly in Lua.

The editor source is located under:

```text
examples/vclua/editor
```

The VCLua library must be available either in the Lua module path or in the local vcl directory.

The editor is started with:

```bash
cd examples
lua5.4 form_editor.lua
```

The editor uses a separate toolbox window and a real editable form window. The toolbox contains the component tree, component palette and property editor, while the edited form is a normal standalone VCLua form.

### Main features

* Visual form editing with a component tree
* Component palette with categorized controls
* Property editing through `TIPropertyGrid`
* Drag/resize support on the edited form
* Grid display and snap-to-grid support
* Tree order based component creation order
* Automatic `TabOrder` handling
* Copy / cut / paste / duplicate / delete
* Container support, for example `Panel` and `GroupBox`
* `Items` / `Lines` support for controls such as `RadioGroup`, `ComboBox`, `ListBox` and `Memo`
* Save/load using `.vclform` designer files
* Lua module export
* JSON export

### File types

The editor uses three different file types:

```text
*.vclform   Designer source file
*.lua       Generated VCLua runtime module
*.json      Optional JSON export
```

The `.vclform` file is the editable designer format. It stores the form model, component tree, property values, collections and designer options.

Lua export generates a reusable runtime module. The generated file is intended to be overwritten when the design changes, so application logic and event handlers should be kept in a separate file.

Example usage of an exported form:

```lua
local VCL = require "vcl.core"
local myform = require "myform"

local ui = myform.create(nil)

ui.Button1.OnClick = function(sender)
  ui.Label1.Caption = "Clicked"
end

ui.Form1:ShowModal()
```

### Export style

Generated Lua code uses the VCLua property table syntax:

```lua
Button1._ = {
  Caption = "Button1",
  Left = 24,
  Top = 24,
  Width = 90,
  Height = 28,
}
```

Nested properties are exported as nested Lua tables:

```lua
Label1._ = {
  Font = {
    Size = 12,
    Color = "clBlue",
  },
}
```

String collections are exported as Lua arrays:

```lua
RadioGroup1._ = {
  Items = {
    "Option A",
    "Option B",
    "Option C",
  },
}
```

The exported module returns a table containing all named controls:

```lua
ui.Form1
ui.Button1
ui.Edit1
ui.byName.Button1
```

This keeps generated layout code separate from hand-written event and application logic.

