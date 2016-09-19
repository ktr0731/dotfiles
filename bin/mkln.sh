#! /bin/sh

DOTPATH=$HOME/dotfiles

echo "\$DOTPATH : $DOTPATH"
echo "Created dotfile symbolic links."
for f in .??*
do
  # Exclude files
  if [ $f = ".git" ] || [ $f = ".gitignore" ] || [ $f = ".DS_Store" ] || [ $f = ".dircolors" ] || [ $f = ".eslintrc.json" ];then
    continue
  fi

  ln -sf "$DOTPATH"/"$f" "$HOME"/"$f"
  if [ $? -eq 0 ]; then
    printf "    %-25s -> %s\n" "\$DOTPATH/$f" "\$HOME/$f"
  fi
done
echo ""
