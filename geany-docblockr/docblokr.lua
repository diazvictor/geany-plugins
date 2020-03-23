--[[
 @package      GeanyPluginsLua
 @filename     geany-docblokr/docblokr.lua
 @version      2.0
 @author       Díaz Urbaneja Víctor Eduardo Diex (diazvictor) <victor.vector008@gmail.com>
 @contributor  Díaz  Víctor  aka  (Máster Vitronic) <vitronic2@gmail.com> <mastervitronic@vitronic.com.ve>
 @contributor  Telegram Marco Trosi @marcotrosi
 @date         23.03.2020 01:35:35 -04
]]--

local selection = geany.selection()
local value = " " .. selection:match("%s(%a+.%a+)").." [description]\n"

for k,v in selection:gsub(".*%(", ""):gmatch("(%w+)") do
	value = value .. string.format(" @param {[type]} %s [description]\n", k)
end

geany.selection("--[[\n".. value .." @return {[type]}\n]]--\n" .. selection)