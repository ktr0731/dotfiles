#################################################
#
#   .zshenv
#   Created by T.A.
#
#################################################

limit coredumpsize 0

####  set command search path  ####
typeset -U path
path=($path /usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/))

####  set remote command env  ####
export RSYNC_RSH=ssh
export CVS_RSH=ssh

