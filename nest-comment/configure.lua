--[[--
 @package   Geany plugins lua
 @filename  nest-comment/configure.lua
 @version   3.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      03.08.2020 14:00:48
]]

local ds = geany.dirsep
local config_dir = geany.appinfo().scriptdir .. ds .. 'support' .. ds .. 'nest-comment' .. ds

local sample = [[return {
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

local file_exist = function (file)
	local file_found = io.open(file, "r")
	if (file_found == nil) then
		return false
	end
	return true
end
local fileconf = config_dir .. 'config.lua'

if geany.fullpath(fileconf) then
	geany.open(fileconf)
else
	if file_exist(config_dir) == false then
		os.execute('mkdir -p ' .. config_dir)
	end
	geany.newfile(fileconf)
	geany.open(fileconf)
	geany.text(sample)
	geany.save(fileconf)
end
