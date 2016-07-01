
#! /bin/sh

DOTPATH=$HOME/dotfiles

echo "Make dotfile symbolic links."
for f in .??*
do
  # Exclude files
  if [ "$f" = ".git" ] || [ "$f" = ".gitignore" ] || [ "$f" = ".DS_Store" ];then
    continue
  fi

  ln -sf "$DOTPATH"/"$f" "$HOME"/"$f"
  if [ $? -eq 0 ]; then
    echo "    $f"
  fi
done
