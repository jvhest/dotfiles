#!/bin/sh

# if [ -f "${XDG_CONFIG_HOME:-$HOME}/x11/xprofile" ]; then
# 	. "${XDG_CONFIG_HOME:-$HOME}/x11/xprofile"
# else
# 	. "$HOME"/.xprofile
# fi

slstatus &

# update Xresources at startup
# xrdb -load ~/.config/X11/Xresources

# setup monitors the way I like them.
# xrandr --output HDMI-1 --mode 1920x1080 --output HDMI-2 --mode 1920x1080 --right-of HDMI-1 &

# setup redshift
redshift -l 50.87:4.30 -t 6500:4500 -b 1.0:0.8 -m randr &

# polkit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# restore current wallpaper
feh --bg-scale "$(cat "${XDG_CACHE_HOME}/wall" )" &

# compositor
picom --animations -b &

# sxhkd
# (re)load sxhkd for keybinds
if hash sxhkd >/dev/null 2>&1; then
	pkill sxhkd
	sleep 0.5
	sxhkd -c "$HOME/.config/suckless/sxhkd/sxhkdrc" &
fi

# Notifications
dunst &

# start emacs daemon
#/usr/bin/emacs --daemon &

# lock screen when suspended
#xss-lock -- slock &

# status-bar for dwm
# "$HOME"/.local/scripts/dwm_bar &

# loop
while true; do
  dwm >/dev/null 2>&1
done

# exec dwm
