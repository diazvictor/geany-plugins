--[[
 @package   GeanyPluginsLua
 @filename  geany-docblokr/docblokr.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <diaz.victor@openmailbox.org>
 @date      11.07.2018 23:50:09 -04
]]--

function docblockr()
	local selection = geany.selection()
	local valor = selection:match("%s(%a+)")
	if ( selection:match("function") ~= nil) then
		if ( selection == valor ) then
			geany.selection("--[[\n [description of "..valor.."]\n]]--\n"..selection)
		elseif ( selection ~= valor ) then
			local valor = selection:match("%s(%a+.%a+)")
			geany.selection("--[[\n [description of "..valor.."]\n]]--\n"..selection)
		end
	else
		geany.message("sdss")
	end
end

if geany.fileinfo().ext == ".lua" then
	docblockr()
end
