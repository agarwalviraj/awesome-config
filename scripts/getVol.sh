#/bin/sh

pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 6 )) | tail -n 1 |sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
