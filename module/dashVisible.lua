local beautiful = require('beautiful')
local wibox = require('wibox')

w = wibox{
    visible=false,
    ontop=true,
    width=1920/2,
    height=1080/2,
    x=0+1080/2,
    y=0+1080/4,
    bg=beautiful.accent.hue_500..79,
}

function dash_toggle()
    w.visible = not w.visible
end