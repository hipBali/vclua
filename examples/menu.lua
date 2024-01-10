-- ***************************************
-- VCLua menu example
-- Copyright (C) 2006-2023 Hi-Project Ltd.
-- ***************************************
VCL = require "vcl.core"
VCL.Application():Initialize()

-- VCL.ActionList loader
function VCL.loadAction(self, t)
	local list = self
	for n,prop in pairs(t) do
		local a = VCL.Action()
		a._= prop
		list[prop.name] = a
	end
end

-- VCL.Menu loader
function VCL.loadMenu(self,t,mId)
	for mi,mt in pairs(t) do
		local props = {}
		for k,v in pairs(mt) do
			if k ~= "submenu" then
				props[k] = v
			end
		end
		if mId then
			self.Items:Find(mId):Add(VCL.MenuItem(self,props))
		else
			self.Items:Add(VCL.MenuItem(self,props))
		end
		if mt.submenu then
			VCL.loadMenu(self,mt.submenu,props.caption)
		end
	end
end

local function menuClick(Sender)
	VCL.ShowMessage(Sender.name)
end

local frmMain = VCL.Form( nil, 'mainForm',
	{
		Caption='VCLua Menu example',
		Width=640,
		Height=480,
		Position="poScreenCenter",
		Font = {
			Height = -19,
            Name = "Courier New",
			Pitch = "fpFixed",
		}
	}
)
local toolImages = VCL.ImageList(frmMain, 'toolImages', { Height=16, Width=16 })
local mainActions = VCL.ActionList(frmMain)
mainActions.Images = toolImages
VCL.loadAction(mainActions, {
	{name="fileNew", caption="New project", shortcut="Ctrl+N", imageIndex=0, onexecute=menuClick },
	{name="fileOpen", caption="Open project", shortcut="Ctrl+O", imageIndex=1, onexecute=menuClick },
	{name="fileSave", caption="Save project", shortcut="Ctrl+S", imageIndex=2, onexecute=menuClick },
	{name="fileSaveAs", caption="Save project as ...", imageIndex=3, onexecute=menuClick },		
	{name="fileQuit", caption="Exit", shortcut="Ctrl+Q", imageIndex=5, onexecute=function() frmMain:Close() end},			

	{name="fileExport", caption="Export ...", shortcut="Ctrl+E", imageIndex=4, onexecute=menuClick},
	{name="frmPreview", caption="Form preview", shortcut="Ctrl+P",  onexecute=menuClick},
	{name="toolImageConvert",  caption="Image converter", onexecute=menuClick},
	{name="toolScriptEditor",  caption="Lua script editor", onexecute=menuClick},
	
	{name="appRun", caption="Run", shortcut="F9",  onexecute=menuClick},
	{name="appDebug", caption="Debug", shortcut="F8",  onexecute=menuClick},
			
	{name="aAbout", caption="About", shortcut="", imageIndex=7, onexecute=function() 
		VCL.ShowMessage(string.format('%s v%s', VCL._NAME, VCL._VERSION))
	end},

})
local mainMenu = VCL.MainMenu(frmMain, "mmmainmenu")
mainMenu.Images = toolImages
mainMenu.showhint=true
VCL.loadMenu(mainMenu, {
	{caption="&File",   
		submenu={
			{action=mainActions["fileNew"]},	
			{caption="-",},	
			{action=mainActions["fileOpen"]},					
			{action=mainActions["fileSave"]},
			{caption="-",},					
			{action=mainActions["fileSaveAs"]},		
			{caption="-",},
			{action=mainActions["fileQuit"]}  
		}
	},
	{caption="&Tools",   
		submenu={
			{action=mainActions["fileExport"]},
			{caption="-",},	
			{action=mainActions["frmPreview"]},	
			{caption="-",},
			{action=mainActions["toolImageConvert"]},	
			{action=mainActions["toolScriptEditor"]},
		}
	},
	{caption="&Run",   
		submenu={
			{action=mainActions["appRun"]},	
			{caption="-",},	
			{action=mainActions["appDebug"]},	
		}
	},
	{caption="&Help", RightJustify=true, 
		submenu =  {
			{action=mainActions["aAbout"]},
		}
	}
})
local imageSrc = {
-- 16x16 BITMAPS
New = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFF00BB6A346BBA6530BCBB6631EDBA6630F7BA6630F7BA6630F7BA6530F7BA652FF7B9652EF7B9652EF7B9642EF7B9642EEFB7622CBDB7622E63FFFFFF00FFFFFF00BC6933DEF8F1EAF2F7ECDFFDF6EBDEFFF6EADEFFF6EADCFFF6EADCFFFAF3EBFFFAF3EBFFFAF2EAFFFCF7F3FFFCF8F4FDFEFEFDF0B7602AD5FFFFFF00FFFFFF00BF7138F5F5EBDFFEFDBF68FFFCBD67FFFBBE65FFFCBE64FFFCBE64FFFCBD62FFFBBD63FFFBBC61FFFCBE60FFFCBC62FFFDFBF8FDB9642DF3FFFFFF00FFFFFF00C1783CF7F7EDE3FFFDC26EFFFFD8A0FFFFD79EFFFFD69BFFFFD798FFFFD696FFFFD695FFFFD594FFFFD493FFFBBE65FFFBF7F4FFBB6731F7FFFFFF00FFFFFF00C47C40F7F7F0E6FFF8B455FFF7B456FFF7B554FFF8B453FFF8B253FFF7B352FFF7B352FFF7B251FFF7B24FFFF7B24FFFFCF9F5FFBF6F36F7FFFFFF00FFFFFF00C58042F7F8F1E8FFFEE5D5FFFDE5D3FFFDE5D3FFFCE5D3FFFCE5D3FFFCE4D1FFFCE2CEFFFCE2CCFFFBE0C9FFFBE1C8FFFDFAF7FFC1763BF7FFFFFF00FFFFFF00C58245F7F8F2EBFFFEE7D6FFFDE7D6FFFDE7D6FFFDE7D6FFFDE6D5FFFDE5D3FFFCE4D1FFFCE2CDFFFBE1CBFFFBE1C9FFFBF7F2FFC57C3FF7FFFFFF00FFFFFF00C68447F7F9F3ECFFFEE8D6FFFEE8D7FFFDE7D6FFFDE7D6FFFDE7D5FFFDE5D3FFFBE4D0FFFBE3CCFFFADFC7FFFADFC6FFFAF2EAFFC68042F7FFFFFF00FFFFFF00C68849F7F9F4EDFFFEE8D8FFFEE8D8FFFEE8D7FFFEE7D6FFFDE5D3FFFCE4D1FFFBE1CCFFFAE0C7FFF9DDC3FFF8DCC2FFFAF4EDFFC68245F7FFFFFF00FFFFFF00C6884AF7F9F4EFFFFEE7D7FFFDE7D6FFFDE7D5FFFDE6D4FFFCE6D2FFFBE1CCFFFADFC7FFF8DCC2FFF6DABDFFF6D8BBFFFAF4EFFFC68346F7FFFFFF00FFFFFF00C6894BF7F9F4F0FFFCE6D3FFFCE6D4FFFDE7D3FFFCE4D1FFFBE3CDFFFAE0C8FFF8DCC2FFF5D6BBFFF3D4B5FFF1D2B3FFF8F4F0FFC48246F7FFFFFF00FFFFFF00C6894BF7F9F5F1FFFCE3CFFFFBE4D0FFFCE4CFFFFCE3CDFFFAE1CAFFF9DDC4FFF6D9BCFFF4E9DFFFF7F2ECFFFBF7F3FFF5EFE9FFC27E45FBFFFFFF00FFFFFF00C6894CF6F9F5F1FFFCE3CDFFFBE3CEFFFBE3CDFFFBE2CBFFF9E0C8FFF8DCC2FFF5D6BAFFFDFBF8FFFCE6CDFFFAE5C9FFE2B684FFBF7942A6FFFFFF00FFFFFF00C5884BEAFAF6F2FCFAE0C7FFFBE1C9FFFBE2C9FFFBE0C8FFF9DFC5FFF8DBC1FFF4D6B8FFFFFBF8FFF6D8B4FFE1B07DFFDB9264F6B46B3E07FFFFFF00FFFFFF00C48549C3F7F2ECECF8F4EEFCF8F4EDFFF8F3EDFFF8F3EDFFF8F3EDFFF8F2ECFFF7F2ECFFF2E6D7FFE2B27DFFDB9465F5B3683B07FFFFFF00FFFFFF00FFFFFF00C17D4460C88B4DBBC88C4FEEC88C4FF6C88C4FF7C88C4FF7C88D4FF7C98C4FF7C78B4FF7C5894BD4C4763B91B3683C06FFFFFF00FFFFFF00FFFFFF00]],
Open = [[36040000424D360400000000000036000000280000001000000010000000010020000000000000040000640000006400000000000000000000002C86D8D12D88D8F72D87D8F72D88D8F72D88D8F72D88D8F72D88D8F72D88D8F72D88D8F72D88D8F72D88D8F72D87D8F72D88D8F72C86D8D1FFFFFF00FFFFFF00338ED9FBDCF0FAFF98E1F6FF95E0F6FF92DFF6FF8EDEF5FF89DCF5FF85DAF4FF80D9F4FF7AD7F3FF74D5F3FF70D3F2FFC2EAF8FF3594DAFFFFFFFF00FFFFFF003594DAF7EFFAFEFF93E5F8FF8FE4F8FF89E3F8FF82E1F7FF7ADFF7FF71DEF6FF67DBF5FF5BD8F4FF4DD4F3FF40D1F2FFCAF2FBFF3594DAFFFFFFFF00FFFFFF00369ADAF8F2FAFDFF94E6F8FF92E5F8FF90E5F8FF8BE3F8FF86E2F7FF7FE1F7FF77DEF6FF6CDCF6FF5ED9F4FF4FD5F3FFCCF2FBFF3594DAFFFFFFFF00FFFFFF0036A1DAF9F6FCFEFF94E5F8FF93E5F8FF93E5F8FF91E5F8FF93DBE9FF93D7E3FF93D2DCFF90CED7FF8CC8CFFF86C1C6FFC9D8D6FF3594DAFFC57444E8CA7F53F137A6DAFAFEFFFFFFF8FDFFFFF6FDFFFFF5FCFFFFF3FCFEFF9AE4F4FF9AE6F7FF9BE6F6FF9DE5F5FF9EE5F5FF9FE5F4FFDAF3F8FF3594DAFFFDF4EEFFCA8054F935ABDAFAE8F6FBFF70BCE7FF55AAE2FF4DA5E0FF91C9EBFFFAF3EFFFFDFEFDFFFFFDFCFFFFFDFCFFFEFDFCFFFEFCFBFFFEFEFDFF3594DAFFEFF2E8FFCE8156FF36AADAF2F1FAFDFF94DEF5FF93DCF4FF64BCE9FF3594DAFF3594DAFF3594DAFF3594DAFF3594DAFF3594DAFF3594DAFF3594DAFF3594DAFFFBF6EFFFCC8355FE35AFDAF0F7FCFEFF8EE4F8FF91DEF5FF9FE0F5FFACE1F6FFCA8452FFFFF7F1FFFFE9D9FFFFEADBFFFFE9D9FFFFE7D7FFFFE5D2FFFFE2CBFFFFF7F1FFCB8555FE36B3DAF8FDFEFEFFFEFFFFFFFEFEFFFFFDFEFFFFFEFFFFFFE4BA91FFFFF7F0FFFFE7D5FFFDE7D6FFFDE6D4FFFCE4D0FFFBE3CBFFFADCC2FFFEF3E8FFCC8656FE34B4D9D05EC2E1FA60C3E2FA60C3E2FA60C3E2FA5FC3E2FAE4BB91FFFFF7F2FFFEE7D5FFFEE7D5FFFDE5D1FFFAE0CAFFF9DEC4FFF7D9BCFFFDF2E7FFCC8757FEFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4BB92FFFEF7F1FFFCE5D2FFFCE4D1FFFBE2CCFFF9DDC4FFF6D7BBFFF3D1AFFFFAEFE4FFCC8758FEFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4BB92FFFEF6F0FFFCE2CDFFFCE3CDFFFADFC8FFF7D9BCFFF5E9DDFFFAF3EBFFFBF8F3FFCA8353FEFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4BB93FFFEF5EDFFFCDEC5FFFBE0C7FFF9DCC2FFF5D3B4FFFEF9F3FFFAE2C4FFECC193FFC37D4893FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E5BE96FFFFFFFEFFFDF3E9FFFDF3EAFFFCF2E8FFFAEFE3FFFAF2E7FFEABB88FFCF8555B3B4693D0CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAC39DFFE6BF96FFE4BB92FFE4BB92FFD1A06CF5D09E6DF6CC965FDAC479427EB2673C09FFFFFF00]],
Save = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000BA6A368FB96935B5B86935EEB76835FFB56835FFB46734FFB26634FFB06533FFAE6433FFAC6332FFAA6232FFA96132FFA86031FFA76031FEA66031F1A86131C4BA6A35DEEBC6ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7CFFC79879FFA76031EDBA6B37FEEDCAB3FFE0A27AFFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FFFDF9F6FFCA8D65FFC99B7CFFA76031FEBB6C38FFEECCB6FFE1A27AFFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9068FFCC9E81FFA86132FFBB6B38FFEFCEB8FFE1A279FFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FFFDF9F6FFCF936AFFCEA384FFAA6132FFBA6A36FFEFD0BBFFE2A27AFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFD3966DFFD2A78AFFAB6232FFBB6A36FFF0D2BEFFE2A37AFFE2A37AFFE1A37AFFE2A37BFFE1A37BFFE0A178FFDE9F77FFDD9F76FFDC9D74FFD99B72FFD89971FFD69970FFD5AB8EFFAD6333FFBB6A36FFF2D5C2FFE3A37AFFE3A37AFFE2A37BFFE2A37BFFE2A47BFFE1A279FFE0A178FFDEA077FFDE9E75FFDC9D74FFDA9B73FFD99B73FFDAB095FFAF6433FFBB6A36FFF2D8C5FFE3A47BFFE3A37AFFE3A47AFFE2A47BFFE2A37BFFE1A37BFFE1A279FFDFA077FFDE9F76FFDD9E74FFDB9C72FFDC9D74FFDDB59AFFB16534FFBB6B36FFF4D9C7FFE6A67DFFC88C64FFC98D65FFC98E67FFCB926CFFCB926DFFCA9069FFC88C65FFC88C64FFC88C64FFC88C64FFDA9C74FFE1BA9FFFB36634FFBB6B36FEF4DCC9FFE7A77DFFF9ECE1FFF9ECE1FFF9EDE3FFFCF4EEFFFDFAF7FFFDF7F3FFFAEDE5FFF7E7DBFFF7E5D9FFF6E5D8FFDEA077FFE4BEA4FFB46734FFBC6B36FAF5DDCCFFE7A87EFFFAF0E8FFFAF0E8FFC98D66FFFAF0E9FFFDF8F3FFFEFAF8FFFCF4EFFFF9E9DFFFF7E7DBFFF7E5D9FFE0A278FFE7C2A9FFB66835FFBC6B36F0F6DFD0FFE8A87EFFFCF6F1FFFCF6F1FFC88C64FFFAF1E9FFFBF4EEFFFDFAF7FFFDF9F6FFFAF0E8FFF8E8DDFFF7E6DBFFE1A37AFFEFD5C3FFB76935FEBC6B36D8F6DFD1FFE9AA80FFFEFAF6FFFDFAF6FFC88C64FFFBF3EEFFFBF1EAFFFCF6F2FFFEFBF8FFFCF6F1FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFBB703EF8BC6B369BF6E0D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9F6FFFDFAF7FFFBF1EBFFF8E9DFFEECD0BDFBC9895EECB5693563BC6B3671BC6B3690BC6B36CCBC6B36EEBC6B36FABB6B36FEBB6B36FFBB6A36FFBB6A36FFBC6C39FFBD6E3BFFBB6D3AFFBB6B38EFBB703ECBB6693554FFFFFF00]],
SaveAs = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000D8AB8EFFCD9570FFBD7342FFB76835FFB56835FFB46734FFB26634FFB06533FFAE6433FFAC6332FFAA6232FFA96132FFA86031FFA76132FFAB693CFFBC8661FFC37D4FFFEBC6ADFFEAC5ADFFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFFEFBF8FFC89A7CFFC79879FFAD6B40FFBA6C38FFEDCAB3FFE0A27AFFFEFAF7FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FF62C088FFFDF9F6FFCA8D65FFC99B7CFFA76132FFBB6C38FFEECCB6FFE1A27AFFFEFAF7FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFBFDCC2FFFDF9F6FFCD9068FFCC9E81FFA86132FFBB6B38FFEFCEB8FFE1A279FFFEFAF7FF62C088FF62C088FFCEF7FFFF292929FF525252FFCEF7FFFF62C088FF62C088FFFDF9F6FFCF936AFFCEA384FFAA6132FFBA6A36FFEFD0BBFFE2A27AFFFEFBF8FFCEF7FFFFCEF7FFFFCEF7FFFFCEF7FFFFCEF7FFFFCEF7FFFFCEF7FFFFCEF7FFFFFEFBF8FFD3966DFFD2A78AFFAB6232FFBB6A36FFF0D2BEFFE2A37AFFE2A37AFFCEF7FFFFCEF7FFFFCEF7FFFF292929FF525252FFCEF7FFFFCEF7FFFFCEF7FFFFD89971FFD69970FFD5AB8EFFAD6333FFBB6A36FFF2D5C2FFE3A37AFFD0F2FAFFCEF7FFFFCEF7FFFFCEF7FFFF525252FF292929FF849CA5FFCEF7FFFFCEF7FFFFD2F7FEFFD99B73FFDAB095FFAF6433FFBB6A36FFF2D8C5FFE3A47BFFB5EEFEFFB5EFFFFFB5EFFFFFB5EFFFFFB5EFFFFF525252FF292929FF525252FFB5EFFFFFB5EFFEFFDC9D74FFDDB59AFFB16534FFBB6B36FFF4D9C7FFE6A67DFFBAECFAFFB5EFFFFF292929FF525252FFB5EFFFFFB5EFFFFF292929FF292929FFB5EFFFFFBAEFFDFFDA9C74FFE1BA9FFFB36634FFBB6C37FFF4DCC9FFE7A77DFFC9E6F0FFB5EFFFFF292929FF292929FFB5EFFFFF849CA5FF292929FF292929FFB5EFFFFFC9EFF9FFDEA077FFE4BEA4FFB46734FFBD6E3AFFF5DDCCFFE7A87EFFFAF0E8FFB5EFFFFF849CA5FF292929FF292929FF292929FF292929FF849CA5FFB5EFFFFFF7E5D9FFE0A278FFE7C2A9FFB66835FFC07442FFF6DFD0FFE8A87EFFFCF6F1FFC6F2F6FF94F7FFFF94F7FFFF94F7FFFF94F7FFFF94F7FFFF94F7FFFFB8E4E8FFF7E6DBFFE1A37AFFEFD5C3FFB76A36FFC68255FFF6DFD1FFE9AA80FFFEFAF6FFFDFAF6FFDAF1F3FFAFF4FAFF99F6FEFF99F6FEFFAFF4FAFFDAF1F3FFF9ECE2FFF8E7DBFFEED0BAFFECD0BDFFBD7443FFD6A585FFF6E0D1FFF7E0D1FFFEFBF8FFFEFBF7FFFDF9F6FFFCF5F0FFFAF0EAFFFBF2EDFFFDF9F6FFFDFAF7FFFBF1EBFFF8E9DFFFECD1BEFFCD926AFFE2C5B1FFE1BDA6FFD9AB8DFFC9895EFFC07543FFBD6E3AFFBB6C37FFBB6B36FFBB6A36FFBB6A36FFBC6C39FFBD6E3BFFBB6D3AFFBF7444FFC98D65FFE7CEBCFF00000000]],
Quit = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001D639B1619609839145D9562105A92880D5890A4135C92FC0C578FED999999FF717171FF545454FF515151FF4F4F4FFF4C4C4CFF4A4A4AFF474747FF454545FF25679DFF3274A8FF3D7CAFFF4784B5FF4E8ABAFF3E7EADFF0C578FEAFFFFFF00FFFFFF00585858FFA2A2A2FFA2A2A2FFA3A3A3FFA4A4A4FFA4A4A4FFA5A5A5FF2F6FA5FF78ABD2FF78ABD3FF73A7D1FF69A0CDFF407FAEFF0F5991EAFFFFFF00FFFFFF005C5C5CFFA1A1A1FF3C7340FFA0A1A1FFA3A3A3FFA3A3A3FFA4A4A4FF3674AAFF7DAFD4FF5B9AC9FF5495C7FF5896C8FF4180AEFF135C94EAFFFFFF00FFFFFF00606060FFA0A0A0FF3D7641FF367139FFA2A2A2FFA2A2A2FFA3A3A3FF3D79B0FF82B3D7FF629FCCFF5A9AC9FF5E9BCAFF4381AFFF196098EA37823EFF347E3BFF317937FF2E7534FF499150FF468F4CFF39733DFFA1A1A1FFA2A2A2FF457EB4FF88B7D9FF67A3CFFF619ECCFF639FCCFF4583B1FF1F649CEA3B8742FF89CB92FF84C88DFF80C688FF7BC383FF77C17FFF478F4DFF3B743FFFA1A1A1FF4C84BAFF8DBBDBFF6EA8D1FF66A6D1FF5FB4DFFF4785B1FF2569A1EA3E8B46FF8FCE99FF7DC687FF78C381FF73C07CFF74C07CFF79C281FF49904FFF547F57FF5489BFFF94BFDDFF75ADD4FF63B8E1FF4BD4FFFF428BB8FF2C6EA6EA41904AFF94D29FFF91D09AFF8DCD96FF89CB92FF84C88DFF519858FF417C46FF9F9F9FFF5A8EC4FF98C3E0FF7CB3D7FF74AFD6FF5EC4EDFF4B88B3FF3473ABEA44944DFF42914BFF3F8D48FF3D8945FF5DA465FF5AA061FF45834BFF9E9E9EFF9E9E9EFF6092C9FF9EC7E2FF83B8DAFF7DB4D7FF7EB3D7FF4F89B4FF3B79B1EAFFFFFF00FFFFFF00777777FF9A9A9AFF3D8A45FF498A4FFF9C9C9CFF9D9D9DFF9D9D9DFF6696CCFFA2CBE3FF89BDDCFF83B9DAFF84B9DAFF518BB5FF437EB6EAFFFFFF00FFFFFF007A7A7AFF999999FF529159FF999A99FF9B9B9BFF9C9C9CFF9C9C9CFF6C9AD0FFA7CEE5FF8FC1DFFF89BDDCFF8BBDDCFF538DB6FF4B84BCEAFFFFFF00FFFFFF007D7D7DFF999999FF999999FF9A9A9AFF9A9A9AFF9B9B9BFF9B9B9BFF6F9DD3FFAAD1E7FFABD1E7FF98C7E1FF91C2DEFF568FB7FF5289C1EAFFFFFF00FFFFFF00808080FF7E7E7EFF7C7C7CFF7A7A7AFF777777FF757575FF727272FF719ED4FF6F9ED6FF87B2DCFFABD3E8FFA9D0E6FF5890B8FF598EC6EAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00709ED6DB6D9CD4FF85B1DAFF5A91B9FF6093CBEAFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D9CD4896A9AD2FB6697CFEE]],
Help = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD744423AC72417DAA703FDBA86D3CF3A76B3AF3A56937DBA468357DA3663323FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B57E5153B37C4EE6D7BBA3FFE9DACAFFECE0D1FFECE0D1FFE8D8C8FFD3B59CFFA76C3AE6A66A3853FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD895F53BB875BF4E7D5C4FFE5D2BFFFC9A685FFB88E67FFB68A65FFC5A180FFE0CCBAFFE3D0BEFFAB7040F4A96E3D53FFFFFF00FFFFFF00FFFFFF00C6956D22C3926AE5EAD8C9FFE3CDBAFFC0946BFFBA8C62FFCFB094FFCFB094FFB7895FFFB28761FFDAC0AAFFE4D1C0FFAE7546E5AD734322FFFFFF00FFFFFF00CC9E787EE4CCB9FFEAD6C5FFC79971FFBF9066FFBF9066FFF7F1ECFFF6F0EAFFB7895FFFB7895FFFB58963FFE2CEBBFFD9BDA6FFB27B4D7EFFFFFF00FFFFFF00D3A784DBEFE1D3FFD9B595FFC7986CFFC39569FFC19367FFBF9066FFBF9066FFBB8B63FFB98A63FFB88A62FFCBA786FFEADCCCFFB88357DBFFFFFF00FFFFFF00D9B08FF6F2E4D9FFD1A57AFFC5996BFFC4976AFFC49669FFFAF6F2FFF3EAE1FFC2956DFFBE8F65FFBE8F64FFC0956DFFEFE3D5FFBF8C61F6FFFFFF00FFFFFF00E0B999F6F2E5DAFFD1A67EFFCC9D71FFC79A6CFFC5986BFFE2CCB6FFF8F3EEFFF6EEE8FFD9BDA1FFC29468FFC59B71FFF0E2D6FFC5956CF6FFFFFF00FFFFFF00E6C1A3DBF3E5D9FFDFBB9EFFCFA075FFCD9E72FFF5EBE3FFE4CBB4FFE7D3BFFFFBF8F6FFE5D3BFFFC4986BFFD6B491FFEEE0D2FFCC9E78DBFFFFFF00FFFFFF00EBC9AD7EF4E3D4FFEFDCCDFFD5A87EFFD0A077FFFBF8F5FFFCF8F5FFFCF8F5FFFBF8F5FFD1A881FFCFA47BFFEAD5C3FFEAD4C2FFD2A7837EFFFFFF00FFFFFF00F1D0B522EFCEB3E5F6E9DDFFECD8C6FFD7AC81FFDCBB9AFFF6ECE3FFF5ECE2FFE4C8AEFFD2A77BFFE6CEBAFFF1E2D5FFDBB391E5D9B08E22FFFFFF00FFFFFF00FFFFFF00F4D4BB53F2D2B8F4F7EADFFFEEDED0FFE3C1A7FFD8AE89FFD7AC86FFDDBB9CFFEBD6C7FFF3E6D9FFE3BE9FF4E1BB9C53FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6D8BF53F5D6BDE6F9E9DCFFF6E8DDFFF3E5DAFFF3E5DAFFF5E7DCFFF5E4D6FFEBC8ACE6E9C6A953FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DBC423F8DAC27DF7D8C0DBF6D7BEF3F4D5BCF3F3D3B9DBF1D1B77DF0CFB423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00]],
About = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00975435239453347D925234DB8A5034F3884F34F3895035DB8950357D84503623FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F563453995534E6B28057FFD5B793FFDBC3A6FFDAC3A6FFD2B490FFAB7A52FF864F34E688503553FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A76234539F5533F4CBA77DFFD8BB9FFFC39C77FFB68A62FFB48660FFBE9672FFD1B397FFC5A377FF844F35F489503553FFFFFF00FFFFFF00FFFFFF00AF703522AB6935E5CFAA81FFDABCA2FFBE9166FFBA8C62FFB7895FFFB3845EFFB1835DFFB0835CFFCDAA8DFFC6A579FF895034E589503522FFFFFF00FFFFFF00B878357EBF915EFFE0C2A8FFC5966CFFC29169FFE1CBB8FFFEFDFCFFFFFFFEFFEADCD0FFB4855EFFB3855EFFD4B599FFAE7B56FF8F51357EFFFFFF00FFFFFF00BC7E35DBDBBC9CFFD5AD89FFC7986CFFC39569FFC19367FFEDDFD3FFFAF7F4FFBB8B63FFB98A63FFB88A62FFC59D78FFD2B893FF905135DBFFFFFF00FFFFFF00BF7E35F6E3C7AFFFD0A276FFC5996BFFC4976AFFC49669FFEEE0D4FFFBF7F4FFBF9066FFBE8F65FFBE8F64FFBE9269FFDFC6AAFF925034F6FFFFFF00FFFFFF00C5853BF6E4C9B0FFD0A37AFFCC9D71FFC79A6CFFC5986BFFFFFFFFFFFFFFFEFFC39669FFC19468FFC29468FFC3986DFFDFC5ABFF955334F6FFFFFF00FFFFFF00CB8E41DBE0BC9FFFDBB393FFCFA075FFCD9E72FFCB9C71FFDDBFA3FFDDBFA2FFC5996BFFC5996BFFC4986BFFD1AB85FFD8BA97FF9E5635DBFFFFFF00FFFFFF00CE91477ECD9C68FFE7CBB4FFD4A57AFFD0A077FFCF9E74FFFBF8F5FFFBF8F5FFCB9E71FFCB9D71FFCDA177FFDFC0A5FFB98A5BFFA45C347EFFFFFF00FFFFFF00D2934C22CE8E47E5D9B28CFFE6CAB3FFD6A97DFFD1A579FFE2C4A8FFE1C3A8FFD0A276FFD1A477FFDDBDA2FFD0AC85FFAB6635E5A9653522FFFFFF00FFFFFF00FFFFFF00D4964D53CF8D47F4D9B28CFFE6CDB8FFE0BA9DFFD7AB85FFD6A982FFD9B391FFE1C2ABFFD4AE86FFB16B35F4B16F3553FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6974F53D19149E6D0A06AFFE0BFA0FFE3C5AEFFE3C5AEFFDFBC9FFFC89762FFBD7D35E6BC7E3553FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8985223D4964D7DD2924CDBCD8C45F3CB8B41F3C98B40DBC78B407DC5873D23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00]],
Info = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00975435239453347D925234DB8A5034F3884F34F3895035DB8950357D84503623FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F563453995534E6B28057FFD5B793FFDBC3A6FFDAC3A6FFD2B490FFAB7A52FF864F34E688503553FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A76234539F5533F4CBA77DFFD8BB9FFFC39C77FFB68A62FFB48660FFBE9672FFD1B397FFC5A377FF844F35F489503553FFFFFF00FFFFFF00FFFFFF00AF703522AB6935E5CFAA81FFDABCA2FFBE9166FFBA8C62FFB7895FFFB3845EFFB1835DFFB0835CFFCDAA8DFFC6A579FF895034E589503522FFFFFF00FFFFFF00B878357EBF915EFFE0C2A8FFC5966CFFC29169FFE1CBB8FFFEFDFCFFFFFFFEFFEADCD0FFB4855EFFB3855EFFD4B599FFAE7B56FF8F51357EFFFFFF00FFFFFF00BC7E35DBDBBC9CFFD5AD89FFC7986CFFC39569FFC19367FFEDDFD3FFFAF7F4FFBB8B63FFB98A63FFB88A62FFC59D78FFD2B893FF905135DBFFFFFF00FFFFFF00BF7E35F6E3C7AFFFD0A276FFC5996BFFC4976AFFC49669FFEEE0D4FFFBF7F4FFBF9066FFBE8F65FFBE8F64FFBE9269FFDFC6AAFF925034F6FFFFFF00FFFFFF00C5853BF6E4C9B0FFD0A37AFFCC9D71FFC79A6CFFC5986BFFFFFFFFFFFFFFFEFFC39669FFC19468FFC29468FFC3986DFFDFC5ABFF955334F6FFFFFF00FFFFFF00CB8E41DBE0BC9FFFDBB393FFCFA075FFCD9E72FFCB9C71FFDDBFA3FFDDBFA2FFC5996BFFC5996BFFC4986BFFD1AB85FFD8BA97FF9E5635DBFFFFFF00FFFFFF00CE91477ECD9C68FFE7CBB4FFD4A57AFFD0A077FFCF9E74FFFBF8F5FFFBF8F5FFCB9E71FFCB9D71FFCDA177FFDFC0A5FFB98A5BFFA45C347EFFFFFF00FFFFFF00D2934C22CE8E47E5D9B28CFFE6CAB3FFD6A97DFFD1A579FFE2C4A8FFE1C3A8FFD0A276FFD1A477FFDDBDA2FFD0AC85FFAB6635E5A9653522FFFFFF00FFFFFF00FFFFFF00D4964D53CF8D47F4D9B28CFFE6CDB8FFE0BA9DFFD7AB85FFD6A982FFD9B391FFE1C2ABFFD4AE86FFB16B35F4B16F3553FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6974F53D19149E6D0A06AFFE0BFA0FFE3C5AEFFE3C5AEFFDFBC9FFFC89762FFBD7D35E6BC7E3553FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8985223D4964D7DD2924CDBCD8C45F3CB8B41F3C98B40DBC78B407DC5873D23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00]],
QMark = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AD744423AC72417DAA703FDBA86D3CF3A76B3AF3A56937DBA468357DA3663323FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B57E5153B37C4EE6D7BBA3FFE9DACAFFECE0D1FFECE0D1FFE8D8C8FFD3B59CFFA76C3AE6A66A3853FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BD895F53BB875BF4E7D5C4FFE5D2BFFFC9A685FFB88E67FFB68A65FFC5A180FFE0CCBAFFE3D0BEFFAB7040F4A96E3D53FFFFFF00FFFFFF00FFFFFF00C6956D22C3926AE5EAD8C9FFE3CDBAFFC0946BFFBA8C62FFCFB094FFCFB094FFB7895FFFB28761FFDAC0AAFFE4D1C0FFAE7546E5AD734322FFFFFF00FFFFFF00CC9E787EE4CCB9FFEAD6C5FFC79971FFBF9066FFBF9066FFF7F1ECFFF6F0EAFFB7895FFFB7895FFFB58963FFE2CEBBFFD9BDA6FFB27B4D7EFFFFFF00FFFFFF00D3A784DBEFE1D3FFD9B595FFC7986CFFC39569FFC19367FFBF9066FFBF9066FFBB8B63FFB98A63FFB88A62FFCBA786FFEADCCCFFB88357DBFFFFFF00FFFFFF00D9B08FF6F2E4D9FFD1A57AFFC5996BFFC4976AFFC49669FFFAF6F2FFF3EAE1FFC2956DFFBE8F65FFBE8F64FFC0956DFFEFE3D5FFBF8C61F6FFFFFF00FFFFFF00E0B999F6F2E5DAFFD1A67EFFCC9D71FFC79A6CFFC5986BFFE2CCB6FFF8F3EEFFF6EEE8FFD9BDA1FFC29468FFC59B71FFF0E2D6FFC5956CF6FFFFFF00FFFFFF00E6C1A3DBF3E5D9FFDFBB9EFFCFA075FFCD9E72FFF5EBE3FFE4CBB4FFE7D3BFFFFBF8F6FFE5D3BFFFC4986BFFD6B491FFEEE0D2FFCC9E78DBFFFFFF00FFFFFF00EBC9AD7EF4E3D4FFEFDCCDFFD5A87EFFD0A077FFFBF8F5FFFCF8F5FFFCF8F5FFFBF8F5FFD1A881FFCFA47BFFEAD5C3FFEAD4C2FFD2A7837EFFFFFF00FFFFFF00F1D0B522EFCEB3E5F6E9DDFFECD8C6FFD7AC81FFDCBB9AFFF6ECE3FFF5ECE2FFE4C8AEFFD2A77BFFE6CEBAFFF1E2D5FFDBB391E5D9B08E22FFFFFF00FFFFFF00FFFFFF00F4D4BB53F2D2B8F4F7EADFFFEEDED0FFE3C1A7FFD8AE89FFD7AC86FFDDBB9CFFEBD6C7FFF3E6D9FFE3BE9FF4E1BB9C53FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6D8BF53F5D6BDE6F9E9DCFFF6E8DDFFF3E5DAFFF3E5DAFFF5E7DCFFF5E4D6FFEBC8ACE6E9C6A953FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9DBC423F8DAC27DF7D8C0DBF6D7BEF3F4D5BCF3F3D3B9DBF1D1B77DF0CFB423FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00]],
LUA = [[36040000424D36040000000000003600000028000000100000001000000001002000000000000004000064000000640000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFF7F7F7FFF7F7F7FF808080FF800000FF800000FFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FF800000FF808080FFFFFFFFFFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FF800000FF800000FF800000FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FF800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFF7F7F7FFF7F7F7FF808080FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF800000FF808080FFC0C0C0FF800000FF800000FFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF800000FF800000FF800000FF800000FF808080FFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FF800000FF800000FF800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FF800000FF800000FFC0C0C0FF]],
} 

local function setupImages()
	local img	
	local str
	local add = function(t,b)
		img = VCL.Image()	
		str = VCL.Stream()
		-- skip first 8 bytes
		local memStr,size = str.LoadFromHex(b:sub(9))
		img.picture.bitmap:LoadFromStream(memStr,size) 	
		memStr:Free()
		local toolImg = t:Add(img.picture.bitmap,nil)
		str:Free()
		img:Free()
		return toolImg
	end
	-- Adding tool images	
	add(toolImages,imageSrc.New)
	add(toolImages,imageSrc.Open)
	add(toolImages,imageSrc.Save)
	add(toolImages,imageSrc.SaveAs)
	add(toolImages,imageSrc.LUA)
	add(toolImages,imageSrc.Quit)
	add(toolImages,imageSrc.Help)
	add(toolImages,imageSrc.About)
end 

setupImages()
frmMain:ShowModal()

