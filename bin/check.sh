#! /bin/sh

_exit() {
  echo "$1"
  echo "Abort."
  exit 1
}

# Can do sudo
if ! sudo -v 1>/dev/null 2>&1; then
  _exit 'You are not sudoers!'
fi

if ! which git > /dev/null 2>&1; then
  _exit 'Please install git.'
fi

