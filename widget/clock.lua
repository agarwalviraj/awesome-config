local wibox = require('wibox')
local beautiful = require('beautiful')

local clock = wibox.widget.textclock('<span font="' .. beautiful.widget_font .. '">%d/%m   %H:%M</span>')
return clock
