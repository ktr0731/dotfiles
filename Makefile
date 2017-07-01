SHELL := /usr/local/bin/fish

.PHONY: help
help: aa
	@echo "make all    -- Install all environment settings"
	@echo "make init   -- Initialize environment for use dotfiles"
	@echo "make update -- Do update dotfiles by git repository"
	@echo "make link   -- Make symbolick links"

.PHONY: all
all: aa update init links

.PHONY: aa
aa:
	@./bin/aa

.PHONY: init
init:
	@./bin/init

.PHONY: fisher
fisher:
	@./bin/fisher

.PHONY: fish-deps 
fish-deps: fisher
	fisher up

.PHONY: links
links:
	@./bin/mkln

.PHONY: update
update:
	@./bin/update

.PHONY: clean
clean:
	@./bin/clean
