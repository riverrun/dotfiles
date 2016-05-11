#!/bin/sh

# Make sure xinitrc files are sourced
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Set up xcape -- tap escape, hold control
setxkbmap -option ctrl:nocaps
xcape -e 'Caps_Lock=Escape;Control_L=Escape'

xrdb -merge ~/.Xresources

exec i3
