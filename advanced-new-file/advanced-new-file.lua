--[[!
 @package   GeanyPluginsLua
 @filename  advanced-new-file/advanced-new-file.lua
 @version   2.0
 @autor     Díaz Urbaneja Víctor Eduardo Diex <diaz.victor@openmailbox.org>
 @date      03.07.2018 02:33:31 -04
]]--

-- pulled from, https://stackoverflow.com/questions/295052/how-can-i-determine-the-os-of-the-system-from-within-a-lua-script#14425862
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

function get_os()
	local cmd = os.capture('uname')
	return cmd
end

local DS  = geany.dirsep
local OS  = get_os()

file_path = geany.fileinfo().path
buttons   = {"_Acept", "Canc_el"}
dlg       = dialog.new("", buttons)

dlg:label("   Enter a path for a new folder")
dlg:text("input", "","")

button, result = dlg:run()

if (button == 1) then
	if OS == 'Linux' or OS == 'Darwin' then
		local dir  = file_path..result.input:match('^.+/')
		local file = file_path..result.input
		-- Create Directory
		geany.launch("mkdir","-p",dir)
		if (dir ~= file)  then
			-- Create file
			-- @TODO : at the moment I can't create a single file, I must pass the path , example: css/style.css
			geany.launch("touch",file)
			-- Open file
			-- @TODO : I can open the file but sometimes it doesn't open it, then I'll arrange this
			-- geany.open(file)
		end
	elseif OS == 'Windows' then
		geany.message("Not Support yet")
		-- Create Directory
		-- geany.launch("mkdir",dir)
	else
		geany.message("This system is not supported yet\nif you dislike this you can contribute to the project")
	end
end
