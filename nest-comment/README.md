# Nest Comment

> For languages supporting C-Style comments: HTML, CSS, PHP,LUA

### Requirements

[geanylua](https://github.com/geany/geany-plugins/tree/master/geanylua)

### License

GPL-3 <https://www.gnu.org/licenses/gpl-3.0.html>

### Note

the comment will be made after writing some text after the colon

you must select the snippet text

example, the color will indicate that the snippet is selected. `cmt-section:Example`

add a key combination
in my case `<Control><Shift>e`

Section

cmt-section:Section comment block + `<Control><Shift>e`

```lua
-- =============================================
-- =           Section comment block           =
-- =============================================



-- ======  End of Section comment block  =======
```

Section Header

cmt-section-header:Section comment block + `<Control><Shift>e`

```lua
-- =============================================
-- =           Section comment block           =
-- =============================================
```

Section Footer

cmt-section-footer:Section comment block + `<Control><Shift>e`

```lua
-- ======  End of Section comment block  ======
```

Simple Comment

cmt:Comment + `<Control><Shift>e`

```lua
-- Comment
```

Block Comment

cmt-block:Block Comment + `<Control><Shift>e`

```lua
--[[

	Block Comment

]]--
```

Todo Comment

cmt-todo:some fixes are still missing with the plugin + `<Control><Shift>e`

```lua
-- @TODO : some fixes are still missing with the plugin
```

Head Comment

cmt-head:Mypackage + `<Control><Shift>e`

```lua
--[[
 @package   Mypackage
 @filename  here the name of the file where I'm creating the snippet 
 @version   
 @author    here the name of the developer I have in Edit->Preferences->Template <here the email I have in Edit->Preferences->Template>
 @date      Here's the date and time he created the snippet.
]]--
```

