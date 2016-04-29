#!/bin/bash

ln -sfvb $(pwd)/.bashrc ~
ln -sfvb $(pwd)/.bash_aliases ~
ln -sfvb $(pwd)/.bash_ubuntu ~
ln -sfvb $(pwd)/.profile ~

ln -sfvb $(pwd)/.gitconfig ~
git config --global core.excludesfile $(echo ~/.gitignore_global)
git update-index --assume-unchanged .gitconfig
ln -sfvb $(pwd)/.gitignore_global ~
ln -sfvb $(pwd)/git-completion.bash ~

ln -sfvb $(pwd)/.hgrc ~

ln -sfvb $(pwd)/.i3 ~/
ln -sfvb $(pwd)/.taskrc ~
ln -sfvb $(pwd)/.Xresources ~

ln -sfvb $(pwd)/.vimrc ~
ln -sfvb $(pwd)/.vim ~/

ln -sfvb $(pwd)/.tmux.conf ~

ln -sfvb $(pwd)/bin ~/

ln -sfvb $(pwd)/.config/zathura/zathurarc ~/.config/zathura/

ln -sfvb $(pwd)/.config/ranger/rc.conf ~/.config/ranger/
ln -sfvb $(pwd)/.config/ranger/commands.py ~/.config/ranger/
ln -sfvb $(pwd)/.config/ranger/rifle.conf ~/.config/ranger/

ln -sfvb $(pwd)/.config/task/rc/solarized-dark-256.theme ~/.config/task/rc/
