all: aa nvim zsh
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
