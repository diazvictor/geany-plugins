--[[--
 @package   Geany plugins lua
 @filename  nest-comment/geany-nest-comment.lua
 @version   2.7
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      22.07.2020 18:29:52 -04
]]

local ds = geany.dirsep
local config_dir = geany.appinfo().configdir .. ds .. 'plugins' .. ds .. 'geany-nest-comment' .. ds
package.path = config_dir .. '?.lua;' .. package.path

geany.wordchars = "_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789:- "
template = {
	author   = geany.appinfo().template.developer,
	mail     = geany.appinfo().template.mail,
	version  = geany.appinfo().template.version,
	datetime = os.date("%d.%m.%Y %H:%M:%S %Z")
}
file_ext = geany.fileinfo().ext
file_name = geany.basename(geany.filename())

selection = geany.word()
if selection ~= '' and selection ~= nil then
	param, value = string.match(selection,'(.+):(.+)')
	if not value then
		return
	end
else
	return
end

config = require 'config'

local comment = function (data)
	local data = data or {}
	for ext, actions in pairs(data) do
		if (file_ext == ext) then
			for action, result in pairs(actions) do
				valid = ('%s:%s'):format(action, value)
				if geany.word() == valid then
					a, b = geany.find(valid, 0, geany.length(), {"wholeword","matchcase"})
					if (a) then
						geany.select(a, b)
						geany.selection('')
					end
					geany.selection(result)
				end
			end
		end
	end
end

comment(config)
