#! /bin/sh

DOTPATH=$HOME/dotfiles

cd $DOTPATH

which git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  git pull
fi

source $HOME/.zshrc
source $HOME/.zshenv
