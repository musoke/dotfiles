# Location from which files will be linked
FROM = $(shell pwd)
# Location that will contain links
INTO = $(HOME)

# Command to create empty directories
MKDIR = mkdir -p

# Command to create symlinks
LN = ln -sfvb --suffix ~$(shell date +%Y-%m-%d-%H-%M-%S)

# Command to backup non-symlinks
BAK = [ ! -e $(1) ] || [ -h $(1) ] || mv -f $(1) $(1).bak$(shell date +%Y-%m-%d-%H-%M-%S)

## minimal		: Install minimal selection of dotfiles
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
	install-mail \
	install-mercurial \
	install-readline \
	install-task \
	install-xdg \
	install-xresources \

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
	.bash_aliases \
	.bash_functions \
	.bashrc_ubuntu \
	.profile

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

## install-bin		: Symlink bin
.PHONY : install-bin
install-bin : bin/*
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
	.git-completion.bash \

	# Configure this git repo
	git config --local include.path $(FROM)/.gitconfig_local

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

## install-beets		: Symlink config and generate bash completion
.PHONY : install-beets
install-beets : \
	.config/beets/* \

	# Link config
	if hash beet; then beet completion > $(HOME)/.beets-completion.bash; fi

	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-gnupg
install-gnupg : \
	.gnupg/*[^~] \

	-$(MKDIR) $(INTO)/.gnupg
	for f in $^; do \
		$(call BAK, $(INTO)/$$f); \
		$(LN) $(FROM)/$$f $(INTO)/$$f; \
	done

.PHONY : install-mail
install-mail : \
	install-mutt \
	install-mutt-accounts \
	install-msmtp \

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

## install-mutt		: Symlink config, create dirs, install config for deps
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

.PHONY : install-readline
install-readline : \
	.inputrc \

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
