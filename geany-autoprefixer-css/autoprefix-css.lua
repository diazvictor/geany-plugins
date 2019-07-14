--[[!
 @package   Geany plugins lua
 @filename  geany-autoprefixer-css/autoprefix-css.lua
 @version   2.5
 @autor     Díaz Urbaneja Víctor Eduardo Diex <diaz.victor@openmailbox.org>
 @date      27.06.2018 17:43:13 -04
]]--

-- the comments were written inc
-- I create the table containing the properties of css

conf = {
	".html",
	".css",
	".less",
	".sass",
	".php"
}

prefix = {
	-- Animation
	{"animation:","-webkit-animation:_val_-moz-animation:_val_-ms-animation:_val_-o-animation:_val_"},
	{"animation-name:","-webkit-animation-name:_val_-moz-animation-name:_val_-o-animation-name:_val_"},
	{"animation-delay:","-webkit-animation-delay:_val_-moz-animation-delay:_val_-o-animation-delay:_val_"},
	{"animation-duration:","-webkit-animation-duration:_val_-moz-animation-duration:_val_-o-animation-duration:_val_"},
	{"animation-fill-mode:","-webkit-animation-fill-mode:_val_-moz-animation-fill-mode:_val_-o-animation-fill-mode:_val_"},
	{"animation-play-state:","-webkit-animation-play-state:_val_-moz-animation-play-state:_val_-o-animation-play-state:_val_"},
	{"animation-iteration-count:","-webkit-animation-iteration-count:_val_-moz-animation-iteration-count:_val_-o-animation-iteration-count:_val_"},
	{"animation-timing-function:","-webkit-animation-timing-function:_val_-moz-animation-timing-function:_val_-o-animation-timing-function:_val_"},

	-- CSS Color Module Level 3
	{"opacity:","-moz-opacity:_val_"},

	-- CSS Backgrounds and Borders Module Level 3

	{"border-radius:","-webkit-border-radius:_val_-moz-border-radius:_val_"},
	{"border-top-left-radius:","-webkit-border-top-left-radius:_val_"},
	{"border-top-right-radius:","-webkit-border-top-right-radius:_val_"},
	{"border-bottom-left-radius:","-webkit-border-bottom-left-radius:_val_"},
	{"border-bottom-right-radius:","-webkit-border-bottom-right-radius:_val_"},

	{"box-shadow:","-webkit-box-shadow:_val_-moz-box-shadow:_val_"},

	-- CSS Multi-column Layout Module
	{"columns: ","-webkit-columns:_val_-moz-columns:_val_"},

	-- CSS Images Module Level 3
	{"background-image:","-moz-background-image:_val_"},
	{"background-clip:","-webkit-background-clip:_val_"},
	{"border-image:","-webkit-border-image:_val_-moz-border-image:_val_-o-border-image:_val_"},
	{"background-size:","-webkit-background-size:_val_-moz-background-size:_val_-o-background-size:_val_"},
	{"border-image-slice:","-webkit-border-image-slice:_val_-moz-border-image-slice:_val_-o-border-image-slice:_val_"},

	-- CSS Flexible Box Layout Module
	{"display:",""},

	-- CSS Text Decoration Module Level 3

	-- CSS Fonts Module Level 3

	{"transition:","-webkit-transition:_val_-o-transition:_val_"},

	-- CSS basic box model
	{"box-sizing:","-webkit-box-sizing:_val_-moz-box-sizing:_val_"}
}

function autoprefixer() -- I create the function autoprefixer
	local seleccion = geany.selection() -- I save this function in the selected variable

	if seleccion ~= "" then -- if the selection equals true then I execute the corresponding code
		-- @TODO : There may be a better way to do this
		local valor = string.match(seleccion,':.*'):gsub(':',''):gsub(';','') -- I escape the selected text to return the value of the css property to me
		local propiedad = string.match(seleccion,'^.*:') -- I escape the selected text to return only what is behind the :
		for i,v in pairs(prefix) do -- I'll take a look at the prefix board.
			if v[1] == propiedad then -- if index 1 equals property css then
				local value = v[2]:gsub('_val_', valor ..";\n") -- replace the word _val_ with the value of the property css and the escape
				geany.selection( value.. v[1] .. valor ..";\n" ) -- and return the prefix css
				break
			elseif seleccion == "display: flex;" or seleccion == "display:flex;" then
				geany.selection("display: -webkit-box;\ndisplay: -webkit-flex;\ndisplay: -ms-flexbox;\ndisplay: flex;")
				break
			elseif seleccion == "cursor: grab;" or seleccion == "cursor:grab;" then
				geany.selection("display: -webkit-grab;\n\ndisplay: -moz-grab;\ndisplay: grab;")
				break
			end -- end of condition
		end -- loop end
	else
		geany.status("you must select a css property that requires a prefix")
	end -- end of condition
end

extension = geany.fileinfo().ext -- The file extension, including the dot, e.g. ".DLL" or ".txt"

-- if (extension == '.css') or (extension == '.less') or (extension == '.sass') or (extension == '.html') or (extension == '.php') then -- if the extension equals
	-- autoprefixer()
-- else -- if false
	-- geany.status("this plugin does not work in this file has to be .css, .less, .sass o .html") -- I execute this message
-- end

for k,v in ipairs(conf) do
	if (extension == v) then
		autoprefixer()
		break
	else
		geany.status("this plugin does not work in this file has to be .css, .less, .sass o .html") -- I execute this message
	end
end
