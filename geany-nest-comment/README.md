# GeanyNestComment (BETA)

> For languages supporting C-Style comments: CSS, Lua, PHP

### NOTE

the comment will be made after writing some text after the colon

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
/*=====  End of Section comment block  ======*/
```

Simple Comment
cmt:Comment + `<Control><Shift>e`

```lua
-- Comment
```

Block Comment
cmt-block:Block Comment + <Control><Shift>e

```lua
--[[

	Block Comment

]]--
```

Todo Comment
cmt-todo:some fixes are still missing with the plugin + <Control><Shift>e

```lua
-- @TODO : some fixes are still missing with the plugin
```

Head Comment
cmt-head:Mypackage + <Control><Shift>e

```
--[[
 @package   Mypackage
 @filename  here the name of the file where I'm creating the snippet 
 @version   1.0
 @author    Díaz Urbaneja Víctor Eduardo Diex <diaz.victor@openmailbox.org>
 @date      11.07.2018 04:38:54 -04
]]--
```
