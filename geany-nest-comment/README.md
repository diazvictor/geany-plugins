# GeanyNestComment (BETA)

> For languages supporting C-Style comments: CSS, Lua, PHP

### NOTE

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

<<<<<<< HEAD
cmt-block:Block Comment + `<Control><Shift>e`
=======
cmt-block:Block Comment + <Control><Shift>e
>>>>>>> 9ba705d41c2f6df4eb72334890d29bf641e42b89

```lua
--[[

	Block Comment

]]--
```

Todo Comment

<<<<<<< HEAD
cmt-todo:some fixes are still missing with the plugin + `<Control><Shift>e`
=======
cmt-todo:some fixes are still missing with the plugin + <Control><Shift>e
>>>>>>> 9ba705d41c2f6df4eb72334890d29bf641e42b89

```lua
-- @TODO : some fixes are still missing with the plugin
```

Head Comment
<<<<<<< HEAD
=======

cmt-head:Mypackage + <Control><Shift>e
>>>>>>> 9ba705d41c2f6df4eb72334890d29bf641e42b89

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
