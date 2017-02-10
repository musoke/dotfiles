#
# ~/.bash_profile
#

## Source ~/.profile if it exists
# This is where my PATH and some other variables are set
if [ -r ~/.profile ]; then . ~/.profile; fi

## Source bashrc if the shell if interactive
# Sets bash aliases, etc.
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac


# Autostart X at login to vt1 and vt2
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
