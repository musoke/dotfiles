#!/bin/bash

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bashrc ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bash_profile ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bash_aliases ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bash_functions ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.bashrc_ubuntu ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.profile ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.inputrc ~

git config --local include.path ../.gitconfig_local
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/git/.gitconfig ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/git/.gitignore_global ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.git-completion.bash ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.hgrc ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/i3 ~/.config/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/i3status ~/.config/

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.taskrc ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.Xresources ~

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.vimrc ~
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.vim ~/

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.tmux.conf ~

mkdir -p ~/bin/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/bin ~/

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/user-dirs.dirs ~/.config/

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

mkdir -p ~/.config/mpd/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/mpd/mpd.conf ~/.config/mpd/

mkdir -p ~/.config/beets/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/beets/config.yaml ~/.config/beets/
if hash beet; then
    beet completion > ~/.beets-completion.bash
fi

mkdir -p ~/.config/ncmpcpp/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/ncmpcpp/config ~/.config/ncmpcpp/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/ncmpcpp/bindings ~/.config/ncmpcpp/

mkdir -p ~/.config/vimfx/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/vimfx/config.js ~/.config/vimfx/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/vimfx/frame.js ~/.config/vimfx/

mkdir -p ~/.ipython/profile_default/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.ipython/profile_default/ipython_config.py ~/.ipython/profile_default/

mkdir -p ~/.jupyter/custom/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.jupyter/custom/custom.js ~/.jupyter/custom/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.jupyter/custom/custom.css ~/.jupyter/custom/

mkdir -p ~/.mutt/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.mutt/muttrc ~/.mutt/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.mutt/mutt-colors-solarized/mutt-colors-solarized-dark-16.muttrc ~/.mutt/mutt-colors-solarized-dark-16.muttrc

mkdir -p ~/.mutt/accounts
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.mutt/accounts/test ~/.mutt/accounts
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.mutt/accounts/personal ~/.mutt/accounts
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.mutt/accounts/public ~/.mutt/accounts
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.mutt/accounts/work ~/.mutt/accounts

mkdir -p ~/.config/offlineimap
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.config/offlineimap/config ~/.config/offlineimap
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.mutt/offlineimap.py ~/.mutt/

ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.msmtprc ~/

mkdir -p ~/.gnupg/
ln -sfvb --suffix ~$(date +%Y-%m-%d-%H-%M-%S) $(pwd)/.gnupg/gpg.conf ~/.gnupg/
