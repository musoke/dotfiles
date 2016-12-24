# Location from which files will be linked
INTO = $(HOME)

## minimal		: Install minimal selection of dotfiles
.PHONY : minimal
minimal :

## all			: Install all dotfiles
.PHONY : all
all : \
	minimal

## help			: Show this message
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
