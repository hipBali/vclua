-- ***************************************
-- VCLua canvas example
-- Copyright (C) 2006-2023 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.Application():Initialize()

local mainFrm = VCL.Form(nil,'mainForm',{
	Caption='VCLua Canvas example',
	Width=640,
	Height=480,
	Position="poScreenCenter",
})
mainFrm.Canvas.OnChange = function(o) print("ch") end
local function onPaint(sender)
	local Canvas = sender.Canvas
	Canvas.Brush.Color = 0x22DD44 -- set to 'clNon' to see error
	Canvas.Brush.Style = 'bsSolid'
	Canvas:Rectangle(100,50,160,110)
	-- test for handling of rare types like Single and Word
	Canvas:AngleArc(100,100,20,120.5,130.6)
	-- test for passing arrays and records
	Canvas:Polyline2({{x=0,y=0},{x=100,y=50},{x=50,y=100},{x=0,y=0}})
end

mainFrm.OnPaint = onPaint

mainFrm:ShowModal()
