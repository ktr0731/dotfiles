#! /bin/sh

# make synbolic links
for f in .??*
do
  [ "$f" = ".git" ] && continue

  ln -s "$f" "$HOME"/"$f"
done
