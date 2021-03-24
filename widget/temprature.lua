local wibox = require('wibox')
local watch = require('awful.widget.watch')
local beautiful = require('beautiful')

local temprature = wibox.widget.textbox()
temprature.font = beautiful.widget_font

watch('bash -c "sensors | awk \'/edge/ {print substr($0, 16) }\'"', 30, function(_, stdout)
    temprature.text = stdout
end)

return temprature
