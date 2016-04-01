#! /bin/sh

DOTPATH=~/.dotfiles
RIPOSITORY_URL="https://github.com/lycoris0731/dotfiles"

ROOT=$(cd $(dirname $0);pwd)

# clone repository
which git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  git clone --recursive "$RIPOSITORY_URL" "$DOTPATH"

else
  echo "Please install git!"
  exit 1
fi

# make synbolic links
for f in .??*
do
  [ "$f" = ".git" ] && continue

  ln -sf "$ROOT"/dotfiles-master/"$f" "$HOME"/"$f"
done
