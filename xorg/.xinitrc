#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# KDE Stuff from garuda, will be removed when I move to main arch
# export DESKTOP_SESSION=plasma
# exec startplasma-x11

export DESKTOP_SESSION=bspwm
#exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) bspwm
exec dbus-launch bspwm
