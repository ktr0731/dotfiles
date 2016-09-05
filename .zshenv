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

PYENV_ROOT=$HOME/.pyenv
RBENV_ROOT=$HOME/.rbenv

# Environment variables path
path=(
  $PYENV_ROOT/bin(N-/)
  $RBENV_ROOT/bin(N-/)
  $HOME/Library/Android/sdk/platform-tools(N-/)
  $HOME/Library/Android/sdk/tools(N-/)
  $HOME/bin(N-/)
  ./node_modules/.bin(N-/)
  $path
)

PYTHONPATH=(
  $PYTHONPATH
  /usr/local/google_appengine(N-/)
  /usr/local/google_appengine/lib(N-/)
  /usr/local/google_appengine/lib/yaml/lib(N-/)
)

if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

#  set remote command env
export RSYNC_RSH=ssh
export CVS_RSH=ssh

# Go path
export GOPATH=~/.go

# use vi
EDITOR='vi'
