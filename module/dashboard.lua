local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local apps = require('configuration.apps')
local dpi = require('beautiful').xresources.apply_dpi

-- Get screen geometry
local screen_geometry = awful.screen.focused().geometry

-- Create the widget
dashboard = wibox({
    x = screen_geometry.x,
    y = screen_geometry.y,
    visible = false,
    ontop = true,
    type = 'splash',
    bg = beautiful.primary.hue_900 .. '0',
    height = screen_geometry.height,
    width = screen_geometry.width,
})

local dashboard_grabber

function dashboard_hide()
    awful.keygrabber.stop(dashboard_grabber)
    dashboard.visible = false
end

function dashboard_show()
    dashboard_grabber = awful.keygrabber.run(
                            function(_, key, event)
            if event == 'release' then return end

            if key == 'Escape' or key == 'q' or key == 'x' or key == 'm' then
                dashboard_hide()
            end
        end)
    dashboard.visible = true
end

dashboard:setup{
    nil,
    {
        nil,
        nil,
        expand = 'none',
        layout = wibox.layout.align.horizontal
    },
    {nil, expand = 'none', layout = wibox.layout.align.horizontal},
    expand = 'none',
    layout = wibox.layout.align.vertical
}
