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

ln -sfvb $(pwd)/.i3/config ~/.i3/
ln -sfvb $(pwd)/.taskrc ~

ln -sfvb $(pwd)/.vim/ftplugin/tex.vim ~/.vim/ftplugin/tex.vim
ln -sfvb $(pwd)/.vim/spell/en.latin1.add ~/.vim/spell/en.latin1.add
ln -sfvb $(pwd)/.vim/spell/en.utf-8.add ~/.vim/spell/en.utf-8.add
ln -sfvb $(pwd)/.vimrc ~
ln -sfvb $(pwd)/.vim/bundle ~/.vim
ln -sfvb $(pwd)/.vim/autoload ~/.vim

ln -sfvb $(pwd)/.tmux.conf ~

ln -sfvb $(pwd)/bin/apod.sh ~/bin/
ln -sfvb $(pwd)/bin/os_release.sh ~/bin/
