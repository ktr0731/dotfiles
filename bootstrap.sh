#! /bin/sh

DOTPATH=~/.dotfiles
RIPOSITORY_URL="https://github.com/lycoris0731/dotfiles"

# clone repository
if had "git"
then
  git clone --recursive "$RIPOSITORY_URL" "$DOTPATH"

elif has "curl" || has "wget"
then
  tarball="$RIPOSITORY_URL"/archive/master.tar.gz

  if has "curl"
  then
    curl -L "$tarball"

  else
    wget -O - "$tarball"

  fi | tar xv -

  mv -f dotfiles-master "$DOTPATH"

else
  die "git, curl or wget is required"
fi

cd "$DOTPATH"
if [ $? -ne 0 ]
then
  die "cannot cd"
fi

# make synbolic links
for f in .??*
do
  [ "$f" = ".git" ] && continue

  ln -s "$HOME"/dotfiles-master/"$f" "$HOME"/"$f"
done
