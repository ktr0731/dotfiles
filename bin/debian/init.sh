#! /bin/sh

# Change directories name to English
# env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
#
# yes | sudo apt update
# yes | sudo apt upgrade

# Install
packages="strace ltrace"

for package in $packages; do
  echo $package
done
