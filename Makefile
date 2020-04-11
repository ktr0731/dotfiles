SHELL := /bin/bash

.PHONY: help
help: aa
	@echo "make all    -- Install all environment settings"
	@echo "make init   -- Initialize environment for use dotfiles"
	@echo "make links  -- Make symbolick links"

.PHONY: all
all: aa init links

.PHONY: aa
aa:
	@./bin/aa

.PHONY: init
init:
	@./bin/init

.PHONY: links
links:
	@./bin/mkln

.PHONY: clean
clean:
	@./bin/clean
