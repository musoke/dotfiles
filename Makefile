# Location from which files will be linked
FROM = $(shell pwd)
# Location that will contain links
INTO = $(HOME)

LN = ln -sfvb --suffix ~$(shell date +%Y-%m-%d-%H-%M-%S)

## minimal		: Install minimal selection of dotfiles
.PHONY : minimal
minimal : \
	bash

## all			: Install all dotfiles
.PHONY : all
all : \
	minimal

## help			: Show this message
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

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
