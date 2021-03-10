--[[
 @package   GeanyPluginsLua
 @filename  advanced-new-file/advanced-new-file.lua
 @version   2.4
 @author    Díaz Urbaneja Víctor Eduardo Diex <victor.vector008@gmail.com>
 @date      09.03.2021 20:23:46 -04
]]--

--- Global variables in this file
local current_path = geany.dirname(geany.fileinfo().path)
local ds = geany.dirsep
local accept, result, get_os

--- Create the window
local dlg = dialog.new("", {"_Accept", "Canc_el"})
dlg:label("  Enter a path for a new folder")
dlg:text("input", "", "")
accept, result = dlg:run()
result.input = ("%s/%s"):format(current_path, result.input or "")

-- I detect the operating system
if (ds == "/") then
	get_os = "Unix"
elseif (ds == "\\") then
	get_os = "Windows"
	result.input:gsub("/","\\")
end

--- I split the file path
-- @param filename string: the complete path to the file
-- @return the file path and name or nil
local path_split = function (fullpath)
	local path = geany.dirname(fullpath)
	local filename = geany.basename(fullpath)
	local check = (geany.basename(path) ~= filename)
	if (not check) then
		return path
	end
	return path, filename
end

--- I create the file
-- @param name string: the file name
local create_file = function (name)
	if (not geany.fullpath(name)) then
		geany.newfile(name)
		geany.save(name)
	else
		geany.message("The file exists")
	end
end

--- I create the folder
-- @param path string: the folder path
local create_folder = function (path)
	if (get_os == "Unix") then
		geany.launch("mkdir", "-p", path)
	elseif (get_os == "Windows") then
		geany.launch("mkdir", path)
	end
end

local create = function (filename)
	local base, filename = path_split(filename)
	create_folder(base)
	if filename then
		local creation_path = ("%s/%s"):format(base, filename)
		create_file(creation_path)
	end
end

-- If you press the "Accept" button
if (accept == 1) then
	if (result.input) then
		create(result.input)
	end
end
