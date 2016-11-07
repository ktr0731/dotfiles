#! /bin/zsh

DOTPATH=$HOME/dotfiles

echo "\$DOTPATH : $DOTPATH"
echo "Created dotfile symbolic links."

#
# Zsh
#

for rcfile in "$DOTPATH"/zsh/*; do
  ln -sf "$rcfile" "$HOME/.${rcfile:t}"
  if [ $? -eq 0 ]; then
    print "    - $rcfile"
  fi
done
echo ""

#
# Prezto
#

# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done
