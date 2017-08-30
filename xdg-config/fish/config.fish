set -x LANG 'en_US.UTF-8'
set -x LANGUAGE 'en'

set -x EDITOR nvim

set -x GOPATH ~/.ghq
set -x CARGO_HOME ~/.cargo
set -x PATH $GOPATH/bin $PATH
set -x PATH $CARGO_HOME/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH ~/google-cloud-sdk/bin $PATH
set -x PATH ~/.pyenv/bin $PATH
set -x PATH ~/.rbenv/shims $PATH
set -x MANPATH ~/google-cloud-sdk/help/man /usr/local/share/man /usr/share/man /opt/x11/share/man
if [ uname = 'SunOS' ]
  set -x PATH $HOME/usr/solaris/bin $PATH
end

set -x ITUNES_CLI_FUZZY_TOOL fzf

set -x LESS "-m -M -i -R"

eval (direnv hook fish)

alias vim='nvim'
alias v=vim
alias g='git'

alias d='docker'
alias dcom='docker-compose'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

alias l='less'

alias sha1='openssl sha1'

alias rm='rm -rf'
alias cp='cp -r'

alias strace='strace -fi'
alias ltrace='ltrace -fi'

alias tmpcd='tmp ls F cd'
alias tmprm='tmp ls F tmp rm'

alias it='itunes'

alias gl=ghql

alias fishrc='vim ~/.config/fish/config.fish'
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/.zshrc'

alias gip='curl inet-ip.info'

alias ssh='sshrc'

alias make='mmake'

alias ctags=(brew --prefix)'/bin/ctags'

# Load salias
source (salias __init__ | psub)

# pyenv
pyenv init - | source

rbenv init - | source
