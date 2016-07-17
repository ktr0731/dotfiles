help:
	@echo "make all                          -- Install all environment settings"
	@echo "make update                       -- Do update dotfiles by git repository"
	@echo "make (nvim|zsh|ruby|python)       -- Install selected packages"
	@echo "make (nvim|zsh|ruby|python)-clean -- Clean selected packages"

all: aa check nvim zsh ruby python
	@./bin/init.sh

aa:
	@./bin/util/aa.sh

check:
	@./bin/check.sh

zsh: check

nvim: check
	@./bin/nvim/init.sh

python: check
	@./bin/python/init.sh

ruby: check
	@./bin/ruby/init.sh

update: check
	@./bin/update.sh

nvim-clean: check
	@rm -rf $HOME/.cache/dein
