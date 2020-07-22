--[[--
 @package   Geany plugins lua
 @filename  configure.lua
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      22.07.2020 18:01:50 -04
]]

local ds = geany.dirsep
local config_dir = geany.appinfo().configdir .. ds .. 'plugins' .. ds .. 'geany-nest-comment' .. ds
filename = config_dir .. 'config.lua'

sample = [[
return {
	['.css'] = {
		['cmt'] = ('/** %s **/'):format(value),
		['cmt-long'] = ('/**\n * %s\n */'):format(value),
		['cmt-section'] = ('/* ============================================== */\n/* = %s = */\n/* ============================================== */\n\n/* =================  End of %s  ================== */'):format(value,value),
		['cmt-section-header'] = ('/* =============================================== */\n/* = %s = */\n/* =============================================== */\n'):format(value),
		['cmt-section-footer'] = ('/* ================  End of %s  ================= */'):format(value),
		['cmt-subsection'] = ('/*-------------------------------------------------------------*/\n/* %s */\n/*-------------------------------------------------------------*/\n\n/* End of %s -------------------------------------------------*/\n'):format(value,value),
		['cmt-subsection-header'] = ('/*-------------------------------------------------------------*/\n/* %s */\n/*-------------------------------------------------------------*/'):format(value),
		['cmt-subsection-header'] = ('/* End of %s -------------------------------------------------*/'):format(value),
		['cmt-todo'] = ('/**\n * @TODO: %s\n */'):format(value),
		['cmt-head'] = ('/**!\n * @package   %s\n * @filename  %s\n * @version   %s\n * @author    %s <%s>\n * @date      %s\n */'):format(value,file_name,template.version,template.author,template.mail,template.datetime)
	},
	['.js'] = {
		['cmt'] = ('/** %s **/'):format(value),
		['cmt-long'] = ('/**\n * %s\n */'):format(value),
		['cmt-section'] = ('/* =============================================== */\n/* = %s = */\n/* =============================================== */\n\n/* ================  End of %s  ================= */'):format(value,value),
		['cmt-section-header'] = ('/* =============================================== */\n/* = %s = */\n/* =============================================== */\n'):format(value),
		['cmt-section-footer'] = ('/* ================  End of %s  ================= */'):format(value),
		['cmt-subsection'] = ('/*-------------------------------------------------------------*/\n/* %s */\n/*-------------------------------------------------------------*/\n\n/* End of %s -------------------------------------------------*/\n'):format(value,value),
		['cmt-subsection-header'] = ('/*-------------------------------------------------------------*/\n/* %s */\n/*-------------------------------------------------------------*/'):format(value),
		['cmt-subsection-header'] = ('/* End of %s -------------------------------------------------*/'):format(value),
		['cmt-todo'] = ('/**\n * @TODO: %s\n */'):format(value),
		['cmt-head'] = ('/**!\n * @package   %s\n * @filename  %s\n * @version   %s\n * @author    %s <%s>\n * @date      %s\n */'):format(value,file_name,template.version,template.author,template.mail,template.datetime)
	},
	['.html'] = {
		['cmt'] = ('<!-- %s -->'):format(value),
		['cmt-long'] = ('<!--\n\n\t%s\n\n-->'):format(value),
		['cmt-section'] = ('<!-- =============================================== -->\n<!-- = %s = -->\n<!-- =============================================== -->\n\n<!-- ================== End of %s ================== -->'):format(value,value),
		['cmt-section-header'] = ('<!-- =============================================== -->\n<!-- = %s = -->\n<!-- =============================================== -->'):format(value),
		['cmt-section-footer'] = ('<!-- ================== End of %s ================== -->'):format(value),
		['cmt-subsection'] = ('<!-- ----------------------------------------------- -->\n<!-- - %s - -->\n<!-- ----------------------------------------------- -->\n\n<!-- ------------------ End of %s ------------------ -->'):format(value,value),
		['cmt-subsection-header'] = ('<!-- ----------------------------------------------- -->\n<!-- - %s - -->\n<!-- ----------------------------------------------- -->'):format(value),
		['cmt-subsection-footer'] = ('<!-- ------------------ End of %s ------------------ -->'):format(value),
		['cmt-todo'] = ('<!-- @TODO: %s -->'):format(value),
		['cmt-head'] = ('<!--\n @package   %s\n @filename  %s\n @version   %s\n @author    %s <%s>\n @date      %s\n -->'):format(value,file_name,template.version,template.author,template.mail,template.datetime)
	}
}
]]

if geany.fullpath(filename) then
	geany.open(filename)
else
	geany.newfile(filename)
	geany.open(filename)
	geany.text(sample)
	geany.save(filename)
end
