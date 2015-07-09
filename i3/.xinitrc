# Make sure xinitrc files are sourced
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Set up xcape -- tap escape, hold control
xcape -e 'Caps_Lock=Escape;Control_L=Escape;Shift_L=Escape'

# Set up screens
if [ `xrandr | grep -c ' connected '` -eq 2 ]; then
    if [ `xrandr | grep VGA1 | grep -c ' connected '` -eq 1 ]; then
        xrandr --output LVDS1 --auto --primary --output VGA1 --auto --left-of LVDS1
    fi
    if [ `xrandr | grep DVI1 | grep -c ' connected '` -eq 1 ]; then
        xrandr --output LVDS1 --auto --primary --output DVI1 --auto --left-of LVDS1
    fi
else
    xrandr --output LVDS1 --auto --primary --output VGA1 --off --output DVI1 --off
fi

xrdb -merge ~/.Xresources

exec i3
