# Location from which files will be linked
FROM = $(shell pwd)
# Location that will contain links
INTO = $(HOME)

MKDIR = mkdir -p
LN = ln -sfvb --suffix ~$(shell date +%Y-%m-%d-%H-%M-%S)
BAK = [ ! -e $(1) ] || [ -h $(1) ] || mv -f $(1) $(1).bak$(shell date +%Y-%m-%d-%H-%M-%S)

## minimal		: Install minimal selection of dotfiles
.PHONY : minimal
minimal : \
	install-bash \
	install-bin \
	install-git \

## all			: Install all dotfiles
.PHONY : all
all : \
	minimal

## help			: Show this message
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## update			: Pull latest changes from git
.PHONY : update
update :
	git pull --rebase

## bash			: Symlink bash files
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
