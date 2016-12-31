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

## bin			: Symlink bin
	$(MKDIR) $(INTO)/bin
.PHONY : install-bin
install-bin : bin/*
	for f in $^; do $(LN) $(FROM)/$$f $(INTO)/bin; done
