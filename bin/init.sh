#! /bin/sh

DOTPATH=$HOME/dotfiles
REPOSITORY_URL="https://github.com/lycoris0731/dotfiles"

EXIST_GIT=0
if [ ! -e $DOTPATH ]; then
  # Clone repository
  if [ $EXIST_GIT -eq 1 ]; then
    git clone --recursive "$REPOSITORY_URL" "$DOTPATH"
    cd $DOTPATH

  else
    echo "Please install git!"
    exit 1
  fi
fi

# Create synbolic links
./bin/mkln.sh

