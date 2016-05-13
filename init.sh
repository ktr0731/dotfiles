#! /bin/sh

DOTPATH=$HOME/dotfiles
REPOSITORY_URL="https://github.com/lycoris0731/dotfiles"

EXIST_GIT=0


which git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  EXIST_GIT=1
fi

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

# Make synbolic links
for f in .??*
do
  # Exclude files
  if [ "$f" = ".git" ] || [ "$f" = ".gitignore" ] || [ "$f" = ".DS_Store" ];then
    continue
  fi

  ln -sf "$DOTPATH"/"$f" "$HOME"/"$f"
done

which zsh > /dev/null 2>&1
if [ $? -eq 0 ]; then
  source $HOME/.zshrc
fi
