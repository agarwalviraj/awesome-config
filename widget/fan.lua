local wibox = require('wibox')
local beautiful = require('beautiful')
local watch = require('awful.widget.watch')

local memory = wibox.widget.textbox()
memory.font = beautiful.widget_font



watch('bash -c "sensors | grep fan"', 1, function(_, stdout)

    memory.text =string.sub(stdout, 14)
    collectgarbage('collect')
end)

return memory