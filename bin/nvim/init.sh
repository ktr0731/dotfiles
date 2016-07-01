#! /bin/sh

DOTPATH=$HOME/dotfiles

echo "Created synbolick link for nvim configulation files:"
echo "    $DOTPATH/.vim -> $HOME/.cache"
echo ""

ln -sf $DOTPATH/.vim $HOME/.cache/
