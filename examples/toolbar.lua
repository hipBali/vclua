VCL = require "vcl.core"
VCL.TheApplication():Initialize()
VCL.SetErrorReporter(print)

local frm = VCL.Form(nil,'ToolbarEx')

local file_exists = function (fileName)
  local file = io.open( fileName, "r" )
  if file then io.close( file ) return true end
end

local add_img = function(imgList, fName)
	if not file_exists(fName) then 
		print(string.format("Image file '%s' not found!", fName))
		-- comment this to see exception later
		return -1 
	end
	-- Picture can load several formats, not just one
	Picture = VCL.Picture()
	Picture:LoadFromFile(fName)
	-- class functions work when supplied with the object (note ':')
	print(Picture.Graphic:GetFileExtensions())
	-- ImageList needs a CustomBitmap descendant
	local SrcBmp = VCL.Bitmap()
	-- This converts the format (png->bmp)
	-- Bitmap has no method named 'Assign', but CustomBitmap has it
	SrcBmp:Assign(Picture.Graphic)
	local idx = imgList:Add(SrcBmp, nil)
	SrcBmp:Free()
	Picture:Free()
	local destBmp = VCL.Bitmap()
	-- test for passing optional enum, try removing 2nd param
	-- also this always saves 16x16 since it's default size for ImageList
	imgList:GetFullBitmap(destBmp, 'gdeDisabled')
	destBmp:SaveToFile('cancel.bmp')
	return idx
end

local tbar = VCL.ToolBar(frm, "tbar", {Align="alTop", ShowCaptions=true, Images = VCL.ImageList() })
local idx = add_img(tbar.Images,'cancel.png')
print("Image index is:",idx)

local bSave = VCL.ToolButton(tbar,'b1',{Caption="Save",AutoSize=true, Style="tbsButton", Left = tbar.Left})
VCL.ToolButton(tbar,'s1',{Style="tbsDivider", Left = tbar.Left})
local bCancel = VCL.ToolButton(tbar,'b2',{ImageIndex=0, AutoSize=true, Style="tbsButton", Left = tbar.Left, Caption=""})
-- test return of variable parameters
local a,b,c = bCancel:GetCurrentIcon()
print(a.classname, b, c)

frm:ShowModal()