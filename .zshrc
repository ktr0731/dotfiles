#環境変数
export LANG=ja_JP.UTF-8

#色をつける
autoload -Uz compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

typeset -U path
path=(~/bin /other/things/in/path $path)

setopt HIST_IGNORE_DUPS

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# Prompt
PROMPT="[%F{9}%n%f@%F{cyan}%m%f] \$ " 

##### ALIASES #####
alias rm='rmtrash'
alias ssh='ssh -X'
alias vi='vim'

#ファイル管理
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias clr='clear'
alias ls='ls -CF'
alias la='ls -aCF'
alias ll='ls -lCF'
alias l='ls -CF'

