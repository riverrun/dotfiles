#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
#battery=/sys/class/power_supply/BAT1/uevent

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

# Statusbar loop
while true; do
   xsetroot -name "$( date +"%a %d %b %Y %H:%M" )"
   sleep 1m
done &

# Caps lock / control tap to escape
xcape -e 'Control_L=Escape' &

exec dwm
