local wibox = require('wibox')
local watch = require('awful.widget.watch')
local beautiful = require('beautiful')

local storage = wibox.widget.textbox()
storage.font = beautiful.widget_font

watch('bash -c "df -h $HOME | awk \'/[0-9]/ {print $2-$3}\'"', 60, function(_, stdout)
    local a = tostring(stdout)
    storage.text = (a .. 'GB')
end)

return storage
