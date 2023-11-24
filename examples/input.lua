-- ***************************************
-- VCLua input controls example
-- Copyright (C) 2006-2023 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.Application():Initialize()

local mainFrm = VCL.Form(nil,'mainFrm')

local Label1 = VCL.Label(mainFrm,'Label1')
local LuaPathEdit = VCL.Edit(mainFrm,'LuaPathEdit')
local Label2 = VCL.Label(mainFrm,'Label2')
local CPathEdit = VCL.Edit(mainFrm,'CPathEdit')
local Label3 = VCL.Label(mainFrm,'Label3')
local DirectoryEdit1 = VCL.DirectoryEdit(mainFrm,'DirectoryEdit1')
local Label4 = VCL.Label(mainFrm,'Label4')
local Memo1 = VCL.Memo(mainFrm,'Memo1')
local Label5 = VCL.Label(mainFrm,'Label5')
local CheckBox1 = VCL.CheckBox(mainFrm,'CheckBox1')
local Button1 = VCL.Button(mainFrm,'Button1')


mainFrm._ = {
	Caption='VCLua Input Controls example',
	Width=400,
	Height=300,
	position="poScreenCenter",
}
Label1._ = {
	Top=16,
	Width=71,
	Left=8,
	Caption='package.path',
	ParentColor=false,
	Height=15,
}
LuaPathEdit._ = {
	Top=16,
	Width=240,
	Text=';lua/?.lua',
	Left=112,
	TabOrder=0,
	Anchors='[akTop, akLeft, akRight]',
	Height=23,
}
Label2._ = {
	Top=48,
	Width=77,
	Left=8,
	Caption='package.cpath',
	ParentColor=false,
	Height=15,
}
CPathEdit._ = {
	Top=48,
	Width=240,
	Text=';lib/?.dll;lib/?.so',
	Left=112,
	TabOrder=1,
	Anchors='[akTop, akLeft, akRight]',
	Height=23,
}
Label3._ = {
	Top=80,
	Width=94,
	Left=8,
	Caption='Exclude folders',
	ParentColor=false,
	Height=15,
}
Memo1._ = {
	Top=80,
	Width=240,
	TabOrder=3,
	Left=112,
	Lines={'bin','lib',},
	Anchors='[akTop, akLeft, akRight]',
	Height=92,
}
Label4._ = {
	Top=180,
	Width=58,
	Left=8,
	Caption='Silent mode',
	ParentColor=false,
	Height=15,
}
CheckBox1._ = {
	Top=180,
	Width=20,
	Left=112,
	TabOrder=4,
	Height=19,
	Caption='',
}
Label5._ = {
	Top=208,
	Width=94,
	Left=8,
	Caption='Working directory',
	ParentColor=false,
	Height=15,
}
DirectoryEdit1._ = {
	MaxLength=0,
	ShowHidden=false,
	Anchors='[akTop, akLeft, akRight]',
	Height=23,
	Width=240,
	NumGlyphs=1,
	ButtonWidth=23,
	Left=112,
	TabOrder=2,
	Top=208,
	Text='No directory selected!'
}

Button1._ = {
	Top=248,
	Width=75,
	TabOrder=5,
	Left=277,
	Caption='Ok',
	Anchors='[akTop, akRight]',
	Height=25,
}

mainFrm:ShowModal()
