## VCLua programming

### Component syntax
```
my_component = VCL[componentName]([parent [,name [,properties]])()
```
where

 - parent is the parent component of the component
 - name is the the stored component name (string)
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
bottomPanel._ = {
	Align='alBottom',
	Height=40,
}
-- set single property
bottomPanel.Caption=string.format('%s v%s', VCL._NAME, VCL._VERSION),
```
Properties can set as table or as single property.
The component's property can be retrieved as table value:
``` lua
print(statusPanel.visible) 
```
***common methods***
 - Free 
 - SetFocus
 -  Refresh
 - BeginUpdateBounds
 - EndUpdateBounds
 - BeginUpdate
 - EndUpdate

### Creating application
***Basics***
First of all load and initialize VCL library
``` lua
VCL = require "vcl.core"
VCL.Application():Initialize()
```
Create and display your form
``` lua
local myForm= VCL.Form(nil,'myForm',{
	Caption='My test form',
	Width=640,
	Height=480,
	Position="poScreenCenter",
})
myForm:ShowModal()
```

### Set automatic codepage conversion
``` lua
VCL = require "vcl.core"
VCL.Application():Initialize()
VCL.setCPWin(true)
```

### Events
All available events of a component represented as On*EventName* proprety. The basic events of a control is the event named 'NotifyEvent',
``` lua
Component.OnNotifyEvent = function (sender) ... end
```
where the sender parameter is the component which is fires the event.

***NotifyEvent***
 - OnActivate
 - OnChange
 - OnChangeBounds
 - OnClick
 - OnCloseUp
 - OnCreate 
 - OnDblClick
 - OnDeactivate
 - OnDestroy
 - OnEditButtonClick
 - OnEnter
 - OnExecute
 - OnExit
 - OnFind
 - OnHide
 - OnIdleTimer
 - OnMaximize
 - OnMinimize
 - OnMouseEnter
 - OnMouseExit
 - OnPaint
 - OnReplace
 - OnResize
 - OnShow
 - OnTimer
 - OnUpdate
 - OnWindowStateChange
 ```
 parameter: Sender
 ```
 ***CloseEvent***
 - OnClose
 ```
 parameters: Sender
 return: Action
 ```
 ***CloseQueryEvent***
 - OnCloseQuery
 ```
 parameters: Sender
 return: CanClose
 ```
***KeyEvent***
 - OnKeyUp
 - OnKeyDown
 ```
 parameters: Sender, Key, ShiftState
 return: Key
 ```
***MouseEvent***
 - OnMouseUp
 - OnMouseDown
 ```
 parameters: Sender, Button, Shift, X, Y
 ```
***MouseMoveEvent***
 - OnMouseMove
 ```
 parameters: Sender, Shift, X, Y
 ```
***MouseWheelEvent***
 - OnMouseWheel
 - OnMouseWheelDown
 - OnMouseWheelUp
 ```
 parameters: Sender, TShiftState, MousePosm
 return: Handled
 ```
 
 ***Other events***
 *Drag and Drop*
 ```
OnDragDrop(Sender, Source, X, Y)
OnDragOver(Sender, Source, X, Y)
 ```
 *Docking*
 ```
OnDockDrop(Sender,Source, X, Y)
OnDockOver(Sender, Source, X, Y)
Allow = OnUnDock(Sender, Client, NewTarget)
DockObject = OnStartDock(Sender, DockObject)
OnEndDock(Sender,Target, X, Y)
 ```
 *FileDrop*
 ```
 OnDropFiles(Sender, FileNames)
```
*StringGrid related*
```
OnButtonClick(Sender, aCol, aRow)
OnHeaderClick(Sender, IsColumn, Index)
Canselect = OnSelectCell(Sender, ACol, ARow)
OnDrawCell(Sender, ACol, ARow, Rect, GridDrawState)
Value = OnGetEditText(Sender, ACol, ARow, Value)
Value = OnGetEditMask(Sender, ACol, ARow, Value)
Value = OnSetEditText(Sender, ACol, ARow, Value)
OnColumnMoved(Sender, FromIndex, ToIndex)
OnRowMoved(Sender,FromIndex, ToIndex)
OnTopLeftChanged(Sender)
```
For more details check the components class reference:
[VCLua Class reference]

***example***
``` lua
-- Allow/disallow form closing
myForm.OnCloseQuery = function()
	return VCL.MessageDlg("Are you sure?,"mtConfirmation",{"mbYes","mbNo"})=="mrYes"
end
```
