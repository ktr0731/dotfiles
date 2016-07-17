#! /bin/sh

_exit() {
  echo "$1"
  echo "Abort."
  exit 1
}

# Can do sudo
if ! sudo -l | grep '(ALL) ALL' 1>/dev/null 2>&1; then
  _exit 'You are not sudoers!'
fi

which git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  _exit 'Please install git.'
fi

