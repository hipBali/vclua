-- file management
require "log"

local m={}

function m.load(fileName, mode)
  local file, errorString = io.open( fileName, mode or "r" )
  if not file then
	cLog( string.format("File open: %s ", errorString) ,"ERROR")
  else
      local contents = file:read( "*a" )
      io.close( file )
      return contents
  end
  return ""
end

function m.save(fileName, content, mode)
  local file, errorString = io.open( fileName, mode or "w" )
  if not file then
	  cLog( string.format("%s %s %s ", "saveLocalFile", tostring(filename), errorString) ,"ERROR")
	  return false
  else
      file:write( content )
      io.close( file )
  end
  file = nil
  return true
end

function m.copy(src, dst, blocksize)
	blocksize = blocksize or 1024*1024
	local sf, df, err
	local function bail(...)
		if sf then sf:close() end
		if df then df:close() end
		return ...
	end
	sf, err = io.open(src, "rb")
	if not sf then return bail(nil, err) end
	df, err = io.open(dst, "wb")
	if not df then return bail(nil, err) end
	while true do
		local ok, data
		data = sf:read(blocksize)
		if not data then break end
		ok, err = df:write(data)
		if not ok then return bail(nil, err) end
	end
	return bail(true)
end

function m.splitFilename(strFilename)
	-- Returns the Path, Filename, and Extension as 3 values
	if lfs.attributes(strFilename,"mode") == "directory" then
		local strPath = strFilename:gsub("[\\/]$","")
		return strPath.."\\","",""
	end
	strFilename = strFilename.."."
	return strFilename:match("^(.-)([^\\/]-%.([^\\/%.]-))%.?$")
end

return m