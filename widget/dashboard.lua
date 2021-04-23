local awful = require('awful')
local beautiful = require('beautiful')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local wibox = require('wibox')
local TagList = require('widget.tag-list')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local theme = require "theme"
local table = awful.util.table or gears.table
local clickable_container = require('widget.material.clickable-container')



local custom_widget=wibox.widget {
    wibox.widget {
        wibox.widget {
            text = "bye",
            size = dpi(32),
            align  = 'center',
            valign = 'center',
            -- forced_width=dpi(32),
            forced_height=dpi(32),
            widget = wibox.widget.textbox
        },
        widget = clickable_container
    },
    visible = true,
    bg = beautiful.primary.hue_100,
    widget = wibox.container.background
}
custom_widget:buttons(table.join(awful.button({}, 1, function() _G.dash_toggle() end)))

return custom_widget