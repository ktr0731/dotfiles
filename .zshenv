#################################################
#
#   .zshenv
#   Created by T.A.
#
#################################################

limit coredumpsize 0

# use language
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#  set command search path
typeset -U path

#  set remote command env
export RSYNC_RSH=ssh
export CVS_RSH=ssh

# use vim
if type nvim > /dev/null 2>&1; then
  EDITOR='nvim'
elif type vim > /dev/null 2>&1; then
  EDITOR='vim'
else
  EDITOR='vi'
fi
