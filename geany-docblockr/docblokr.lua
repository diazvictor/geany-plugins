--[[
 @package   GeanyPluginsLua
 @filename  geany-docblokr/docblokr.lua
 @version   2.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      23.03.2020 01:35:35 -04
]]--

local name = geany.selection()
local var = " "..name:match("%s(%a+.%a+)").." [description]\n"

for k,v in name:gsub(".*%(", ""):gmatch("(%w+)") do
	var = var .. string.format(" @param {[type]} %s [description]\n", k)
end

geany.selection("--[[\n"..var.." @return {[type]}\n]]--\n"..name)