-------------------------------------------------
-- Battery Widget for Awesome Window Manager
-- Shows the battery status using the ACPI tool
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/battery-widget
-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------
local awful = require('awful')
local watch = require('awful.widget.watch')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = require('beautiful').xresources.apply_dpi

-- acpi sample outputs
-- Battery 0: Discharging, 75%, 01:51:38 remaining
-- Battery 0: Charging, 53%, 00:57:43 until charged

local percentage = wibox.widget.textbox()
local battery_icon = wibox.widget.textbox()
battery_icon.font = beautiful.widget_font

local battery_popup = awful.tooltip({
    objects = {percentage},
    mode = 'outside',
    align = 'left',
    preferred_positions = {'right', 'left', 'top', 'bottom'}
})

function update_battery()
    awful.spawn.easy_async_with_shell("bash -c '$HOME/.config/awesome/scripts/getBatt.sh'", function(stdout)
    -- local battery_info = {}
    -- local capacities = {}
    -- for s in stdout:gmatch('[^\r\n]+') do
    --     local status, charge_str, time = string.match(s, '.+: (%a+), (%d?%d?%d)%%,?.*')
    --     if status ~= nil then
    --         table.insert(battery_info, {
    --             status = status,
    --             charge = tonumber(charge_str)
    --         })
    --     else
    --         local cap_str = string.match(s, '.+:.+last full capacity (%d+)')
    --         table.insert(capacities, tonumber(cap_str))
    --     end
    -- end

    -- local capacity = 0
    -- for _, cap in ipairs(capacities) do
    --     capacity = capacity + cap
    -- end

    -- local charge = 0
    -- local status
    -- for i, batt in ipairs(battery_info) do
    --     if batt.charge >= charge then
    --         status = batt.status -- use most charged battery status
    --        -- this is arbitrary, and maybe another metric should be used
    --     end

    --     charge = charge + batt.charge * capacities[i]
    -- end
    -- charge = charge / capacity

    -- battery_popup.text = string.gsub(stdout, '\n$', '')
    -- percentage.text = math.floor(charge)



    lines={}
    battery_popup.text=" "
    for s in stdout:gmatch("[^\r\n]+") do
        table.insert(lines, s)
    end
        battery_popup.text=tostring(lines[1]) .."\n".. lines[2]
        status =lines[2]
        charge=lines[1]
        percentage.text=charge .."%"
        if status == 'Charging' then
            battery_icon.text = ' '
            if math.floor(charge) <= 20 then
                battery_icon.text = ' '
            elseif math.floor(charge) <= 30 then
                battery_icon.text = ' '
            elseif math.floor(charge) <= 40 then
                battery_icon.text = ' '
            elseif math.floor(charge) <= 60 then
                battery_icon.text = ' '
            elseif math.floor(charge) <= 80 then
                battery_icon.text = ' '
            elseif math.floor(charge) <= 90 then
                battery_icon.text = ' '
            elseif math.floor(charge) <= 100 then
                battery_icon.text = ' '
            end
        elseif status == 'Full' then
            battery_icon.text = ''
        else
            if math.floor(charge) <= 10 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 20 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 30 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 40 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 50 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 60 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 60 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 80 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 90 then
                battery_icon.text = ''
            elseif math.floor(charge) <= 100 then
                battery_icon.text = ''
            end
        end
        collectgarbage('collect')
    end)
end

watch('bash -c', 0.3, function(_, stdout)
    update_battery()
end)


return wibox.widget {
    wibox.widget{
        battery_icon,
        fg = beautiful.accent.hue_300,
        widget = wibox.container.background
    },
    percentage,
    spacing = dpi(2),
    layout = wibox.layout.fixed.horizontal
}
