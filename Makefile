.PHONY: install home-dotfiles

PATHS := $(wildcard .*)
DIRS := $(patsubst %/.,%,$(wildcard $(addsuffix /.,$(PATHS))))
DOTFILES := $(filter-out $(DIRS),$(PATHS))
HOME_DOTFILES=$(addprefix ~/,$(DOTFILES))

install: home-dotfiles

home-dotfiles: $(HOME_DOTFILES)

~/.%:
	ln -s $(realpath $(notdir $@)) $@
