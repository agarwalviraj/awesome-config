#/bin/sh


cat /sys/class/power_supply/BAT0/capacity
cat /sys/class/power_supply/BAT0/status
acpi -i | head -n 1 |cut -d ' ' -f 5-
