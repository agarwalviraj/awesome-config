#/bin/sh
pactl list sinks | awk '/Mute/ {print substr($0,8) }'| head -n $(( $SINK + 6 )) | tail -n 1