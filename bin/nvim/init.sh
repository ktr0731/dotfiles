#! /bin/sh

DOTPATH=$HOME/dotfiles

echo '$DOTPATH: '$DOTPATH
echo "Created synbolick link for nvim configulation files:"
echo '    $DOTPATH/.vim -> $HOME/.cache/nvim'
echo ""

ln -sf $DOTPATH/.vimrc $HOME/dotfiles/.vim/init.vim
