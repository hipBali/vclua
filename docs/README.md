## VCLua programming

### Component syntax
``` lua
my_component = VCL[componentName]([parent [,name [,properties]])
```
where

 - parent is the parent component of the component
 - name is the stored component name (string)
 - properties describes components attributes (table)

***example:***
``` lua
-- create complete component in one step
local myForm= VCL.Form(nil,'myForm',{
	Caption='My test form',
	Width=640,
	Height=480,
	Position="poScreenCenter",
})
local statusPanel = VCL.Panel(myForm,'statusPanel')
-- set properties from table
statusPanel._ = {
	Align='alBottom',
	Height=40,
}
-- set single property
statusPanel.Caption=string.format('%s v%s', VCL._NAME, VCL._VERSION),
```
Properties can be set as a table or as a single property. Setting as a table is done in undetermined order as is usual in Lua.
The component's property can be retrieved as a table value:
``` lua
print(statusPanel.visible)
```
***common methods***
 - `Free`
	``` lua	
	p:Free()
	p = nil
	```
 - `is`
	``` lua	
	if type(p) == "table" and p.Handle and p:is('TComponent') then ... end
	```
 - `Handle` field contains object pointer as Lua light userdata. This shadows `Handle` properties of some LCL classes like `TFont`. To access this property you can use [`GetCallable`](#additional-functions)

### Creating application

First of all load and initialize VCL library
``` lua
VCL = require "vcl.core"
VCL.Application():Initialize()
-- or VCL.TheApplication():Initialize()
```

Create your form
``` lua
local myForm = VCL.Form(nil,'myForm',{
	Caption='My test form',
	Width=640,
	Height=480,
	Position="poScreenCenter",
})
```

Set needed events
``` lua
-- Allow/disallow form closing
myForm.OnCloseQuery = function()
	return VCL.MessageDlg("Are you sure?,"mtConfirmation",{"mbYes","mbNo"})=="mrYes"
end
```

Display your form
``` lua
myForm:ShowModal()
```

To create a form using the GUI, please consider using [vt-form](https://github.com/hipBali/vclua-tools)

### Class reference

For each supported class this reference lists all the generated methods for that class only, but these methods are also available for that class descendants. For what these methods do and what these descendants are please consult LCL documentation (for later versions available online [here](https://lazarus-ccr.sourceforge.io/docs/) and [here](https://dsiders.gitlab.io/lazdocsnext)).
Only the casing from this reference is supported for generated calls (for properties that only matters if they are not published).
[Class reference](vclua_ref.html)

### Additional functions

* `ColorToIdent`

   frontend to the [LCL function](https://lazarus-ccr.sourceforge.io/docs/lcl/graphics/colortoident.html), returns either a string or `nil`
* `MessageDlg`

   frontend to the first overload of the [LCL function](https://lazarus-ccr.sourceforge.io/docs/lcl/dialogs/messagedlg.html)
* `ShowMessage`

   see [here](https://lazarus-ccr.sourceforge.io/docs/lcl/dialogs/showmessage.html)
* `AsStringList`

   `VCL.AsStringList({'one','bla'})` creates a `StringList` with that content
   but if you only need to pass that as parameter of to an owning property, just pass the table, a temporary will be created and destroyed at the end of the call, not creating a leak
* RTTI grids created using VCLua will support `TAnchorSide` editing, and `Control` field will provide choices for the parent and siblings. It's a poor man's alternative for the anchor editor
* `UTF8`

   frontend to [WinCPToUTF8](https://dsiders.gitlab.io/lazdocsnext/lazutils/lazutf8/wincptoutf8.html)
* `WinCP`

   frontend to [UTF8ToWinCP](https://dsiders.gitlab.io/lazdocsnext/lazutils/lazutf8/utf8towincp.html)

Some classes have additional methods implemented in [funcdef.lua](../source-generator/lua_make/funcdef.lua)

The following functions provide access to error callbacks
- `SetErrorReporter`
> [!IMPORTANT]
> by default global `print` is used
- `GetErrorReporter`
- `SetCallbackErrorFunction`
> [!IMPORTANT]
> by default callback error function checks if the error doesn't contain `VCLua Error` or `LCL Error` substrings (to avoid duplicate reporting) and calls error reporter
- `GetCallbackErrorFunction`

The following functions expect the first argument to be a VCLua object or a string with a Free Pascal classname
 - `ListMethods`
   - returns Lua hash table with generated methods available for the type gotten from the first argument
   - for generated properties/public variables, listed method is a getter
   - `VCL.ListMethods(vclo,true)` modified vclo table inplace and returns it. After this `vclo:<method>(...)` calls are slightly faster but property access becomes a call syntactically
 - `ListProperties(vclo[,unpublished])`
   - returns Lua hash table with properties of type gotten from `vclo`
   - if 2nd param is `false` or `nil`, returned are published properties with types
   - otherwise returned are gettable unpublished non-array properties with type 'Unknown'
 - `GetCallable(vclo,name[,settable,[published]])`
   - for type gotten from `vclo` returns the callable for `name`, for use in tight loops
   - see [bench.lua](../examples/bench.lua)
   - some param combinations are unsupported

### Error handling

**TLDR**

The following is done automatically when the lib is loaded
```lua
VCL.SetErrorReporter(print)
```

Easy way for GUI reporting (at risk of infinite error loop)
```lua
VCL.SetErrorReporter(VCL.ShowMessage)
```

To cover all potential issues use this (if you are ***NOT*** using multiple Lua states, e.g. writing a plugin for some host)
```lua
VCL = require "vcl.core"
local app = VCL.TheApplication()
app:Initialize()
local function printError(s) print(s..'\n'..debug.traceback(nil,2)) end
app.OnException = function(Sender,E)
  printError('unhandled exception '..E:ToString())
  -- somehow mark forms for closing or call mainForm:Close() and pray
end
app.OnCircularException = function(Sender,E) print('halting') end
VCL.SetErrorReporter(printError)
```

and maybe this if you need to close the form as fast as possible before it hangs
```lua
VCL.SetCallbackErrorFunction(function(s)
  if not (s:match('VCLua Error') or s:match('LCL Error')) then printError(s) end
  mainForm:Close()
end)
```

---

Error handling is a complicated topic since two infrastructures are involved (Lua and Free Pascal). And maybe more, if your Lua script is a plugin for a host application. Error handling in VCLua is only partly customizable via error callbacks. An error callback is a Lua function receiving a string representing an error. It is called using `lua_pcall` and results are ignored.

> [!CAUTION]
> If an error or an exception propagates unhandled through multiple layers of Lua, Free Pascal, C++, etc. code, Lua environment may no longer be in a completely Ok state, so the best thing you can do when you finally catch the error is to shut down Lua VM gracefully. Lua may have been compiled as C++ which would make Lua errors external exceptions to FPC. If it's compiled as C error propagation won't call Free Pascal destructors while stack is unwound. Read [this](https://sol2.readthedocs.io/en/latest/errors.html#catch-and-crash) for more details. Please also consult LCL docs on how LCL handles exceptions.

Let's consider the following typical scenarios.

#### VCLua errors

These happen inside VCLua, mostly when trying to pass incorrect types to/from Lua. They are reported using a callback set with `SetErrorReporter` (by default - printed to console) and then a Lua error is raised with `luaL_error`. The error string will contain `VCLua Error` substring.

#### Exceptions in FPC, LCL, etc. code

If caught inside VCLua they are treated like VCLua errors but with an `LCL Error` substring.

#### Lua errors inside LCL event handlers

The above Lua errors would propagate through both Lua and Free Pascal stacks. A Lua error can be handled in either your Lua code or inside VCLua. In your Lua code you may consider using `pcall` on `TCustomForm.ShowModal`, `TApplication.ProcessMessages` and other Free Pascal calls. For LCL event handlers VCLua uses `lua_pcall` itself, reports the error using a callback set with `SetCallbackErrorFunction` and doesn't propagate the error. That means one doesn't really need any `pcall`s inside the event handler. If the event handler returns values of incorrect types such errors are reported the same way.

Consider the following (wrong) example
```lua
VCL.SetErrorReporter(VCL.ShowMessage)
mainForm = VCL.Form(nil, "mainForm")
grid = VCL.StringGrid(mainForm,"grid")
grid.OnPrepareCanvas = function(o, aCol, aRow, aState)
  local c = colors[aRow]
  if aRow == 1 then
    o.Canvas.Brush.Color = c ~ 0x1F1F1F
  else
    o.Canvas.Brush.Color = c
  end
end
mainForm:ShowModal()
```

If `colors` is `nil` there will be errors inside `OnPrepareCanvas` callback: either `VCLua Error` when a `nil` value is assigned to `Color`, or a usual Lua error about bit operations with `nil` arguments. Since the error reporting is set to create a messagebox, ***another repaint of the grid would start leading to the same errors*** (infinite loop). If error reporting isn't set, or if `VCL.SetErrorReporter(print)` is used, there would be no infinite loop and the grid will be operable. All Lua errors inside LCL event handlers are reported but not propagated, otherwise a circular exception may happen.

#### Uncaught exceptions

Care was taken to transform all `Exception`s into Lua errors. But additional functions may be written without a try block and access violations (AV) might still happen due to implementation of callbacks (see [below](#implementation-details)). Uncaught exceptions (including some AV) can be trapped in `VCL.TheApplication().OnException`. Notice it's `TheApplication()`, not `Application()`, so a global variable is used. `VCL.TheApplication().OnCircularException` is available too but if the execution reaches it LCL will halt the whole program (not just your Lua script). To avoid it make sure your `OnException` never raises. Best thing you can do there is to schedule all the forms for closing and schedule a graceful stop for all Lua states which used VCLua in this process.

Also note that if you have multiple Lua states using VCLua, only one state will install `OnException`-type handler successfully. If an exception bubbles out of another state, the data from the Exception object might point to that state so using it would be unsafe.

### Implementation details

Passing of callbacks from Lua to Free Pascal is complicated. A temporary object with a Lua reference is created and the only place it is stored is the callback itself. So measures should be taken to avoid leaks and crashes. The only time when this object is freed is when the property is reset to another callback or to `nil`. When the class instance is `Assign`ed to another, the callbacks are copied as is, no duplicate Lua references are created. So resetting the property on one instance will free the temporary object from both instances leading to a crash. Another way to manifest this bug is to set an event handler on a global variable from two scripts running in the same process (as plugins). The first script will set the handler alright, the second script will try to destroy the Lua reference from the Lua state of the first script, and that leads to AV. Also note that Lua reference creation/destruction isn't threadsafe so make sure you are not setting/removing event handlers concurrently.
So:
> [!IMPORTANT]
> 1. To prevent leaks set event properties to `nil` before freeing the object
> 1. To avoid crashes set event properties to `nil` before `Assign`ing objects, and reset them after `Assign`
> 1. To avoid crashes when using global LCL variables like [Application](https://dsiders.gitlab.io/lazdocsnext/lcl/forms/application.html) and [Screen](https://dsiders.gitlab.io/lazdocsnext/lcl/forms/screen.html) set their event handlers only from one Lua state and always set them to `nil` before exiting that state
> 1. Avoid setting/removing event handlers from different threads of one Lua state, even for different objects and properties

---
Passing in the other direction (from Free Pascal to Lua, as when one reads an event property) can only return callbacks which were previously set from Lua. `nil` is returned for callbacks set inside LCL, e.g. on creating the object (for example, `TCollectionPropertyEditorForm.CollectionListBox.OnClick`)

---

An idea on how to extend support for passing callbacks e.g. as parameters to methods like `Add<EventName>Handler`, read comment in [LuaProxy](../src/LuaProxy.pas)

---

Calling `VCL[comp](parent,name,props)` does the following:
1. Creates an object with `parent` as first constructor parameter
1. Sets `Parent` property if configured
1. Sets `Name` property. If `name` is empty, a random name is provided; `Caption` property is automatically set by LCL as well
1. Sets properties from `props` table

---

If order of classes in config doesn't match inheritance order, compiled library would not load in Lua providing an error about offending pair of classes