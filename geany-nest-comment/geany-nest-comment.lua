--[[!
 @package   GeanyPluginsLua
 @filename  geany-nest-comment/nest-comment.lua
 @version   1.0
 @autor     Díaz Urbaneja Víctor Eduardo Diex <diaz.victor@openmailbox.org>
 @date      06.07.2018 15:43:13 -04
]]--

-- -------------------------------------------------------------
-- Variables/Tablas
-- -------------------------------------------------------------

cmt = {}

template = {
	author   = geany.appinfo().template.developer,
	mail     = geany.appinfo().template.mail,
	version  = geany.appinfo().template.version,
	filename = geany.basename(geany.filename()),
	datetime = os.date("%d.%m.%Y %H:%M:%S %Z")
}

local selection = geany.selection()
local extencion = geany.fileinfo().ext

-- -------------------------------------------------------------
-- Funciones
-- -------------------------------------------------------------

function comment()
	if (selection ~= "") then
		local valor     = string.match(selection,':.*'):gsub(":","")
		-- @TODO : luego estare usando esta variable
		local argumento = string.match(selection,'^.*:')
		
		if selection == "cmt-block:"..valor then
			cmt.multiline = geany.fileinfo().opener.."\n\n\t_val_\n\n"..geany.fileinfo().closer
			geany.selection(cmt.multiline:gsub("_val_", valor))
		end
		
		if extencion == ".lua" then
			if selection == "cmt-simple:"..valor  or selection == "cmt:"..valor then
				cmt.simple = "-- _val_"
				geany.selection(cmt.simple:gsub("_val_", valor))
			elseif selection == "cmt-section:"..valor then
				-- cmt.section = "\n-- -------------------------------------------------------------\n-- _val_\n-- -------------------------------------------------------------\n\n-- End of _val_ --------------------------------\n"
				cmt.section = "-- ===============================================\n-- =                    _val_                    =\n-- ===============================================\n\n-- ===============  End of _val_  ================"
				geany.selection(cmt.section:gsub("_val_", valor))
			elseif selection == "cmt-section-header:"..valor then
				-- cmt.header = "\n-- -------------------------------------------------------------\n-- _val_\n-- -------------------------------------------------------------\n"
				cmt.header = "-- ===============================================\n-- =                    _val_                    =\n-- ===============================================\n"
				geany.selection(cmt.header:gsub("_val_", valor))
			elseif selection == "cmt-section-footer:"..valor then
				-- cmt.footer = "\n-- End of _val_ --------------------------------\n"
				cmt.footer = "-- ===============  End of _val_  ================"
				geany.selection(cmt.footer:gsub("_val_", valor))
			elseif selection == "cmt-todo:"..valor then
				cmt.todo = "-- @TODO : _val_"
				geany.selection(cmt.todo:gsub("_val_", valor))
			elseif selection == "cmt-head:"..valor then
				cmt.head = "--[[\n @package   _val_\n @filename  "..template.filename.."\n @version   "..template.version.."\n @author    "..template.author.." <"..template.mail..">".."\n @date      "..template.datetime.."\n]]--"
				geany.selection(cmt.head:gsub("_val_", valor))
			end
		end

		if extencion == ".css" then
			if selection == "cmt-simple:"..valor then
				cmt.simple = "/** _val_ **/"
				geany.selection(cmt.simple:gsub("_val_", valor))
			elseif selection == "cmt-long:"..valor then
				cmt.long = "/*\n * _val_\n */"
				geany.selection(cmt.long:gsub("_val_", valor))
			elseif selection == "cmt-section:"..valor then
				cmt.section = "/*==============================================\n=                  _val_                  =\n==============================================*/\n\n/*============ End of _val_ =============*/"
				geany.selection(cmt.section:gsub("_val_", valor))
			end
		end
		
		if extencion == ".html" then
			if selection == "cmt-simple:"..valor then
				cmt.simple = "<!-- _val_ -->"
				geany.selection(cmt.simple:gsub("_val_", valor))
			elseif selection == "cmt-section:"..valor then
				cmt.section = "<!--==============================================\n=                  _val_                  =\n==============================================-->\n\n<!--============ End of _val_ ============-->"
				geany.selection(cmt.section:gsub("_val_", valor))
			end
		end
	else
		geany.status("snippet false")
	end
end

comment()
