alias vim='nvim'
alias g='git'

alias d='docker'
alias dcom='docker-compose'

alias la="ls -a"
alias ll="ls -l"
alias lla="ls -al"

alias l='less'

alias sha1='openssl sha1'

alias rm='rm -rf'
alias cp='cp -r'

alias strace='strace -fi'
alias ltrace='ltrace -fi'

alias tmpcd='tmp ls F cd'
alias tmprm='tmp ls F tmp rm'

alias it='itunes'

alias ghql='cd (ghq list -p | fzf)'

alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

alias gip='curl inet-ip.info'

alias ssh='sshrc'

alias make='mmake'

alias ctags=(brew --prefix)"/bin/ctags"

function cdg
  set p (git rev-parse --show-cdup)
  if [ $p = '' ]
    return
  end
  cd $p
end
