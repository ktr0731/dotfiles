set -x LANG 'en_US.UTF-8'
set -x LANGUAGE 'en'

set -x GOPATH ~/.ghq
set -x CARGO_HOME ~/.cargo
set -x PATH $GOPATH/bin $PATH
set -x PATH $CARGO_HOME/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH ~/google-cloud-sdk/bin $PATH
set -x MANPATH ~/google-cloud-sdk/help/man /usr/local/share/man /usr/share/man /opt/x11/share/man
if [ uname = 'SunOS' ]
  set -x PATH $HOME/usr/solaris/bin $PATH
end

set -x ITUNES_CLI_FUZZY_TOOL fzf

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
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

alias gip='curl inet-ip.info'

alias ssh='sshrc'

alias make='mmake'

alias ctags=(brew --prefix)'/bin/ctags'

# Load salias
source (salias __init__ | psub)

function ghql
  ghq list -p | fzf | read -l p
  if [ $status -ne 0 ]
    return $status
  end

  cd $p
  ls
  echo ''
end

function cdg
  set p (git rev-parse --show-cdup)
  if [ $p = '' ]
    return
  end
  cd $p
end

function fish_prompt
  set _status $status

  echo -n '❯❯❯'
  if [ $_status -eq 0 ]
    echo -n (set_color green)'❯ '(set_color normal)
  else
    echo -n (set_color red)'❯ '(set_color normal)
  end
end

function fish_right_prompt
  set -l branch (git branch 2>/dev/null | awk '{ print $2 }')
  echo -n (set_color green)$branch(set_color normal)
  echo -n (set_color 999)(prompt_pwd)(set_color normal)
end

function cd
  if count $argv > /dev/null
    builtin cd $argv
  else
    z -l | awk '{ print $2 }' | fzy | read -l p

    if [ $status -ne 0 ]
      return $status
    end

    builtin cd $p
  end

  ls
  echo ''
end

# gini [--gh repo_name]
# gini does initial commit after initialize current directory
function gini
  touch README.md

  git init
  git add .
  git commit -m '[ADD] Initial commit'

  if count $argv > /dev/null
    switch $argv[1]
    case '--gh'
      if [ (count $argv) -eq 2 ]
        set REPO_NAME $argv[2]
      else
        set REPO_NAME (basename (pwd))
      end
      hub create -p $REPO_NAME
    case '*'
      echo 'Usage: dotc commit_msg --gh repo_name'
      return
    end
  end
end
