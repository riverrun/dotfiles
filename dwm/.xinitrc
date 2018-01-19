#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# merge in defaults and keymaps
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Background
feh --bg-scale $HOME/build/dwm_linux-wallpaper-1280x800.jpg &

# Statusbar loop
while true; do
    BAT_STATUS=$(awk -F "=" '/STATUS/ {status=$2} \
        /CHARGE_NOW/ {rem=$2} \
        END { printf("%3.0f%% %s", rem/52000, status) }' \
        /sys/class/power_supply/BAT1/uevent)
    DATE=$(date +"%a %d %b %Y %H:%M")

    xsetroot -name "$BAT_STATUS | $DATE"
    sleep 1m
done &

# Caps lock / control tap to escape
xcape -e 'Caps_Lock=Escape;Control_L=Escape' &

exec dwm
