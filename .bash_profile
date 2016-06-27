#
# ~/.bash_profile
#

# Source .bashrc if it exists
[[ -f ~/.bashrc ]] && . ~/.bashrc


# Autostart X at login to vt1 and vt2
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
