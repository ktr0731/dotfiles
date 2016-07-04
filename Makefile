help:
	@echo "make all                          -- Install all environment settings"
	@echo "make update                       -- Do update dotfiles by git repository"
	@echo "make (nvim|zsh|ruby|python)       -- Install selected packages"
	@echo "make (nvim|zsh|ruby|python)-clean -- Clean selected packages"

all: aa nvim zsh ruby python
	@./bin/init.sh

aa:
	@./bin/util/aa.sh

zsh: ;

nvim:
	@./bin/nvim/init.sh

python:
	@./bin/python/init.sh

ruby:
	@./bin/ruby/init.sh

update:
	@./bin/update.sh

nvim-clean:
	@rm -rf $HOME/.cache/dein
