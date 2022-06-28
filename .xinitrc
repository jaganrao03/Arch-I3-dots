#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

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

export QT_QPA_PLATFORMTHEME=qt5ct & 
export QT_QPA_PLATFORMTHEME=xcb &
export QT_STYLE_OVERRIDE=kvantum &

xsetroot -name "🞼 $(expr $(cat /sys/class/backlight/intel_backlight/brightness) / 49)" &
xsetroot -name "奄 $(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')%" &

# Display Config
xrandr --output eDP --mode 1920x1200 &

# NetworkManager
nm-applet &

# Compositor
picom -f &

# Wallpaper 
nitrogen --restore &

# export DESKTOP_SESSION=plasma
# exec startplasma-x11
exec dwm
exec i3
