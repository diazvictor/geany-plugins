--[[!
 @package   GeanyPluginsLua
 @filename  advanced-new-file/advanced-new-file.lua
 @version   2.3
 @author    Díaz Urbaneja Víctor Eduardo Diex <diaz.victor@openmailbox.org>
 @date      10.07.2018 23:49:31 -04
]]--

-- -------------------------------------------------------------
-- Variables
-- -------------------------------------------------------------

local file_path = geany.fileinfo().path
local dlg       = dialog.new("", {"_Acept", "Canc_el"})
local DS        = geany.dirsep

-- -------------------------------------------------------------
-- Functions
-- -------------------------------------------------------------

dlg:label("  Enter a path for a new folder")
dlg:text("input", nil, "")
acept, result = dlg:run()

-- I detect the operating system
local OS = nil

if (DS == "/") then
	OS = 'Unix'
elseif (DS == "\\") then
	OS = 'Windows'
end

-- Detects if the file exists
local function file_exist(file)
	--return (io.open(file, "r") == nil) and false or true
	local file_found = io.open(file, "r")
	if (file_found == nil) then
		return false
	end
	return true
end

-- I create the file
local function create_file()

	if (OS == 'Unix') then
		file = file_path..result.input -- everything I write into the input
	elseif (OS == 'Windows') then
		file = file_path..result.input:gsub('/','\\')
	end
	
	-- return true only if it is a file
	local function is_file(f)
		local dir 	= f:match("^.*/")
		if (OS == 'Windows') then
			dir = dir:gsub('/','\\')
		end
		return (f ~= dir)
	end
	
	-- I create the file
	if ( is_file(file) ) then
		-- there are three ways to create the files
		if (file_exist(file) == false) then
			-- First way, create file using a Unix Command
			--geany.launch('touch',file)
			
			-- Second way, create a file using the Lua functions
			-- local d = io.open(file,"w+") -- I create the file
			-- d:read('*all') --abro el file
			-- d:close() --cierro el file
			
			-- Third way, creating a file using Geany functions
			geany.newfile(file)
			geany.open(file) -- I open the file with geany.
			geany.save(file)
		else
			geany.message('The file exists')
		end
	end

end

-- I create the directory
local function create_dir()
	if result.input then
		local input = file_path..result.input
		dir         = input:match("^.*/") -- I'm just looking for what's behind the slash.
		if (OS == 'Unix') then
			geany.launch("mkdir", "-p", dir)
		elseif (OS == 'Windows') then
			dir = dir:gsub('/','\\')
			geany.launch("mkdir", dir)
		end
	end
end

if (acept == 1) then
	create_dir()
	create_file()
end
