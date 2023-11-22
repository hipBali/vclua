function string:split(sep)
   local sep, fields = sep or ":", {}
   local pattern = string.format("([^%s]+)", sep)
   self:gsub(pattern, function(c) fields[#fields+1] = c end)
   return fields
end

function string:trim()
 local s = self
 local from = s:match"^%s*()"
 return from > #s and "" or s:match(".*%S", from)
end

function table:sortByKey()
	local t = self
	local tkeys = {}
	for k in pairs(t) do table.insert(tkeys, k) end
	table.sort(tkeys)
	return tkeys
end