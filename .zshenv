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

# The orginal version is saved in .zprofile.pysave
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
[[ -s $HOME/.npm/npm.sh ]] && . $HOME/.nvm/npm.sh

# python3
export PYENV_ROOT=$HOME/.pyenv

# Environment variables path
path=(
  $HOME/Library/Android/sdk/platform-tools(N-/)
  $HOME/Library/Android/sdk/tools(N-/)
  $HOME/bin(N-/)
  $PYENV_ROOT/bin(N-/)
  $path
)

PYTHONPATH=(
  $PYTHONPATH
  /usr/local/google_appengine(N-/)
  /usr/local/google_appengine/lib(N-/)
  /usr/local/google_appengine/lib/yaml/lib(N-/)
)

eval "$(pyenv init -)"

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
