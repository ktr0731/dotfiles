#! /bin/sh

# Change directories name to English
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

yes | sudo apt update
yes | sudo apt upgrade

# Install
lib_packages="libgtk2.0-0:i386 libxxf86vm1:i386 libsm6:i386 lib32stdc++6 build-essential gcc-multilib"
ctf_packages="gdb binutils strace ltrace"

for package in $lib_packages; do
  sudo apt install "$package"
done

for package in $ctf_packages; do
  sudo apt install "$package"
done
