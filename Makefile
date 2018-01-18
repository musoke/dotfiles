## This Makefile installs my dotfiles.
## By default, only a minimal selection is installed. The `all` target installs all.
##

# Location from which files will be linked
FROM = $(shell pwd)
# Location that will contain links
INTO = $(HOME)

# Command to create empty directories
MKDIR = mkdir -p

# Command to create symlinks
# Flags:
#   s: symbolic
#   v: verbose
#   b: backup
#   n: no-dereference: treat LINK_NAME as a normal file if it is a symlink to a
#      directory. This is needed to avoid recursions in the backups created.
LN = ln -svbn --suffix ~$(shell date +%Y-%m-%d-%H-%M-%S)

# Command to backup non-symlinks
BAK = [ ! -e $(1) ] || [ -h $(1) ] || mv -f $(1) $(1).bak-$(shell date +%Y-%m-%d-%H-%M-%S)

## minimal		: Install minimal selection of dotfiles: bash, bin, git, tmux, vim
.PHONY : minimal
minimal : \
	install-bash \
	install-bin \
	install-git \
	install-tmux \
	install-vim \

## all			: Install all dotfiles
.PHONY : all
all : \
	minimal \
	install-beets \
	install-gnupg \
	install-i3 \
	install-ipython \
	install-jupyter \
	install-mail \
	install-mercurial \
	install-mpd \
	install-ncmpcpp \
	install-newsbeuter \
	install-pam-environment \
	install-ranger \
	install-readline \
	install-rofi \
	install-task \
	install-vimfx \
	install-xdg \
	install-xresources \
	install-zathura \
	completion-beets \
	completion-pandoc \
	completion-rustup \

## help			: Show this message
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## update			: Pull latest changes from git
.PHONY : update
update :
	git pull --rebase

## install-bash		: Symlink bash config
.PHONY : install-bash
install-bash : \
	.bashrc \
	.bash_profile \
	.bashrc_ubuntu \
	.bashrc.d \
	.profile

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

# bash_completion	: create dir for bash completions
.PHONY : bash_completion
bash_completion :
	$(MKDIR) $(INTO)/.bash_completion.d

## completions		: generate_completions
.PHONY : completions
completions : \
	completion-beets \
	completion-pandoc \
	completion-rustup \

## install-bin		: Symlink bin
.PHONY : install-bin
install-bin : bin/*[^~]

	-$(MKDIR) $(INTO)/bin
	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

## install-vim		: Symlink vim config
.PHONY : install-vim
install-vim : \
	.vimrc \
	.vim \

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

## install-git		: Configure local repo and symlink config
.PHONY : install-git
install-git : \
	.gitconfig \
	.gitignore_global \
	.bash_completion.d/git.bash-completion \

	# Configure this git repo
	git config --local include.path $(FROM)/.gitconfig_local

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

## install-beets		: Symlink config and generate bash completion
.PHONY : install-beets
install-beets : \
	.config/beets/*[^~] \
	completion-beets \

	# Link config
	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : completion-beets
completion-beets : \
	bash_completion

	if hash beet; then beet completion > $(HOME)/.bash_completion.d/beets.bash-completion; fi

.PHONY : install-gnupg
install-gnupg : \
	.gnupg/*[^~] \

	-$(MKDIR) $(INTO)/.gnupg
	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-ipython
install-ipython : \
	.ipython/profile_default/*[^~] \

	-$(MKDIR) $(INTO)/.ipython/profile_default
	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-jupyter
install-jupyter : \
	install-jupyter-custom \
	install-jupyter-nbextensions \

.PHONY : install-jupyter-custom
install-jupyter-custom : \
	.jupyter/custom/*[^~] \

	-$(MKDIR) $(INTO)/.jupyter/custom
	-$(MKDIR) $(INTO)/.jupyter/nbextensions

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-jupyter-nbextensions
install-jupyter-nbextensions : \
	.local/share/jupyter/nbextensions/*[^~] \

	-$(MKDIR) $(INTO)/.local/share/jupyter/nbextensions

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done


## install-mail		: Symlink config for email toolchain
.PHONY : install-mail
install-mail : \
	install-mutt \
	install-mutt-accounts \
	install-msmtp \
	install-offlineimap \

.PHONY : install-mercurial
install-mercurial : \
	.hgrc \

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-msmtp
install-msmtp : \
	.msmtprc \

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-mutt
install-mutt : \
	.mutt/muttrc \
	.mutt/mailcap \
	.mutt/mutt-colors-solarized-dark-16.muttrc \

	-$(MKDIR) $(INTO)/.mutt

	touch $(INTO)/.mutt/alias
	touch $(INTO)/.mutt/muttrc.mailboxes

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-mutt-accounts
install-mutt-accounts : \
	.mutt/accounts/*[^~] \

	-$(MKDIR) $(INTO)/.mutt/accounts

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-pam-environment
install-pam-environment : \
	.pam_environment \

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-project_init
install-project_init : \
	.pi.toml

	-$(MKDIR) $(INTO)/.pi_templates

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-readline
install-readline : \
	.inputrc \

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-rofi
install-rofi : \
	.config/rofi/*[^~] \

	-$(MKDIR) $(INTO)/.config/rofi

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-task
install-task : \
	.taskrc \
	.config/task/rc/*[^~] \

	-$(MKDIR) $(INTO)/.config/task/rc

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-tmux
install-tmux : \
	.tmux.conf \

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-xdg
install-xdg : \
	.config/user-dirs.dirs \

	-$(MKDIR) $(INTO)/.config

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-xresources
install-xresources : \
	.Xresources \

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

# These only need files in an xdg-config-dir

.PHONY : install-i3
install-i3 : \
	.config/i3/*[^~] \

	-$(MKDIR) $(INTO)/.config/i3

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-newsbeuter
install-newsbeuter : \
	.config/newsbeuter/*[^~] \

	-$(MKDIR) $(INTO)/.config/newsbeuter

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-mpd
install-mpd : \
	.config/mpd/*[^~] \

	-$(MKDIR) $(INTO)/.config/mpd

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-ncmpcpp
install-ncmpcpp : \
	.config/ncmpcpp/*[^~] \

	-$(MKDIR) $(INTO)/.config/ncmpcpp

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-offlineimap
install-offlineimap : \
	.config/offlineimap/*[^~] \

	-$(MKDIR) $(INTO)/.config/offlineimap

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : completion-pandoc
completion-pandoc : \
	bash_completion

	if hash pandoc; then pandoc --bash-completion > ~/.bash_completion.d/pandoc-completion.bash; fi

.PHONY : install-ranger
install-ranger : \
	.config/ranger/*[^~] \

	-$(MKDIR) $(INTO)/.config/ranger

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-vimfx
install-vimfx : \
	.config/vimfx/*[^~] \

	-$(MKDIR) $(INTO)/.config/vimfx

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-zathura
install-zathura : \
	.config/zathura/*[^~] \

	-$(MKDIR) $(INTO)/.config/zathura

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : completion-rustup
completion-rustup : \
	bash_completion

	if hash rustup; then rustup completions bash > ~/.bash_completion.d/rustup-completion.bash; fi
