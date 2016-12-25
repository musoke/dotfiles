# Location from which files will be linked
FROM = $(shell pwd)
# Location that will contain links
INTO = $(HOME)

MKDIR = mkdir -p
LN = ln -sfvb --suffix ~$(shell date +%Y-%m-%d-%H-%M-%S)

## minimal		: Install minimal selection of dotfiles
.PHONY : minimal
minimal : \
	bash \
	bin

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
.PHONY : bash
bash : \
	.bashrc \
	.bash_profile \
	.bash_aliases \
	.bash_functions \
	.bashrc_ubuntu \
	.profile

	for f in $^; do $(LN) $(FROM)/$$f $(INTO); done

## bin			: Symlink bin
.PHONY : bin
bin : bin/*
	$(MKDIR) $(INTO)/bin
	for f in $^; do $(LN) $(FROM)/$$f $(INTO)/bin; done
