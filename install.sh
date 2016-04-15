#!/bin/bash

ln -sfvb $(pwd)/.bashrc ~
ln -sfvb $(pwd)/.bash_aliases ~
ln -sfvb $(pwd)/.bash_ubuntu ~
ln -sfvb $(pwd)/.profile ~

ln -sfvb $(pwd)/.gitconfig ~
git config --global core.excludesfile $(echo ~/.gitignore_global)
ln -sfvb $(pwd)/.gitignore_global ~
ln -sfvb $(pwd)/git-completion.bash ~

ln -sfvb $(pwd)/.hgrc ~

ln -sfvb $(pwd)/.i3 ~/
ln -sfvb $(pwd)/.taskrc ~

ln -sfvb $(pwd)/.vimrc ~
ln -sfvb $(pwd)/.vim ~/

ln -sfvb $(pwd)/.tmux.conf ~

ln -sfvb $(pwd)/bin ~/
