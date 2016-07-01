#! /bin/sh

DOTPATH=$HOME/dotfiles

echo "Created synbolick link for nvim configulation files: $DOTPATH/.vim -> $HOME/.cache"
ln -sf $DOTPATH/.vim $HOME/.cache/
