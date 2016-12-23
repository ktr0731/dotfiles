help: aa
	@echo "make all    -- Install all environment settings"
	@echo "make init   -- Initialize environment for use dotfiles"
	@echo "make update -- Do update dotfiles by git repository"
	@echo "make link   -- Make symbolick links"

all: aa update init links

aa:
	@./bin/aa

init:
	@./bin/init

links:
	@./bin/mkln

update:
	@./bin/update
