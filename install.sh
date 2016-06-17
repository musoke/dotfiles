#!/bin/bash

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bashrc ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bash_aliases ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bash_functions ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bash_ubuntu ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.profile ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.gitconfig ~
git config --global core.excludesfile $(echo ~/.gitignore_global)
git update-index --assume-unchanged .gitconfig
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.gitignore_global ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/git-completion.bash ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.hgrc ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.i3 ~/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.taskrc ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.Xresources ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.vimrc ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.vim ~/

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.tmux.conf ~

mkdir -p ~/bin/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/bin ~/

mkdir -p ~/.config/zathura
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/zathura/zathurarc ~/.config/zathura/

mkdir -p ~/.config/ranger/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/ranger/rc.conf ~/.config/ranger/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/ranger/commands.py ~/.config/ranger/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/ranger/rifle.conf ~/.config/ranger/

mkdir -p ~/.config/task/rc/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/task/rc/solarized-dark-256.theme ~/.config/task/rc/

mkdir -p ~/.config/newsbeuter/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/newsbeuter/config ~/.config/newsbeuter/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/newsbeuter/urls ~/.config/newsbeuter/
