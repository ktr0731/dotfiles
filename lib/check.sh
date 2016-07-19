#! /bin/sh

# abort
#   Abort this script with message by status 1.
#   $message
abort() {
  echo "$1"
  echo "Abort."
  exit 1
}

# check_sudoers
#   Check I belong with sudoers. If I'm not sudoers, abort this script.
check_sudoers() {
  if ! sudo -v 1>/dev/null 2>&1; then
    abort 'You are not sudoers!'
  fi
}

# check_git
#   Check git. If git doesn't exists, abort this script.
# TODO: gitもスクリプトで入れるべき?
check_git() {
  if ! which git > /dev/null 2>&1; then
    abort 'Please install git!'
  fi
}

