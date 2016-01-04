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
