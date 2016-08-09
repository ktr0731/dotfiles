help: aa
	@echo "make all    -- Install all environment settings"
	@echo "make update -- Do update dotfiles by git repository"
	@echo "make link   -- Make symbolick links"

all: aa
	@./bin/init.sh

aa:
	@./bin/aa.sh

link:
	@./bin/mkln.sh

update: check
	@./bin/update.sh
