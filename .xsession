#!/bin/bash

# initialize terminal
[ -f ~/.profile ] && . "$HOME"/.profile

# setup monitors the way I like them.
xrandr -s 1920x1080 &   

# restore current wallpaper
nitrogen --restore      

# start dunst notification daemon
#dunst &                 

# launch picom (formerly compton) to get transparency working
picom &                 

# provides extended privileges to applications.
#lxpolkit &              

# status-bar for dwm
#slstatus &
~/.config/suckless/scripts/dwm_bar.sh &

# Finally, we start a window manager.  We want quitting the
# window manager to end the session, so this command does not
# have an ampersand on the end:
dwm
# And when dwm quits, we reach the end of this script and the session ends.
