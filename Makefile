all: aa nvim zsh
	@./bin/init.sh

aa:
	@./bin/util/aa.sh

zsh: ;

nvim:
	@./bin/nvim/init.sh

update:
	@./bin/update.sh
