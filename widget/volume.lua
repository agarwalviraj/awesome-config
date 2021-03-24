local awful = require("awful")
local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')
local dpi = require('beautiful').xresources.apply_dpi
local watch = require('awful.widget.watch')
local beautiful = require('beautiful')

local volume_icon = wibox.widget.textbox()
volume_icon.font = beautiful.icon_font
volume_icon.valign = 'center'
local volume_widget = wibox.widget.textbox()
volume_widget.align = 'center'
volume_widget.valign = 'center'
volume_widget.font = beautiful.widget_font

local volume

function update_vol()
    awful.spawn.easy_async_with_shell("bash -c '$HOME/.config/awesome/scripts/getVol.sh'", function(stdout)
        volume=stdout
        awful.spawn.easy_async_with_shell("bash -c '$HOME/.config/awesome/scripts/getMute.sh'", function(muted)
            if string.sub(muted,0,1)=='y' then muted = true
            else muted= false
            end
            if not muted and (volume > '50' or volume == '100') then
                volume_icon.text = '墳 '
            elseif not muted and volume <= '50' and volume > '0' then
                volume_icon.text = '奔 '
            elseif muted then
                volume_icon.text = '婢 '
            elseif volume == '0' then
                volume_icon.text = '奄 '
            end
            volume_widget.text = tostring(volume)
        end)
        collectgarbage('collect')
    end)
    
end

watch('bash -c', 0.3, function(_, stdout)
    
    update_vol()
end)

return wibox.widget {
    wibox.widget{
        volume_icon,
        fg = beautiful.accent.hue_300,
        widget = wibox.container.background
    },
    volume_widget,
    spacing = dpi(2),
    layout = wibox.layout.fixed.horizontal
}
