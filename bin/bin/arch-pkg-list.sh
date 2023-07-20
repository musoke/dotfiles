#! /bin/bash

# Save lists of installed native and foreign (AUR) packages

DIR=~/Dropbox

pacman -Qqen > $DIR/pkglist-native.txt
pacman -Qqem > $DIR/pkglist-foreign.txt
