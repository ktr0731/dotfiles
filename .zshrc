#################################################
#
#   .zshrc
#   Created by T.A.
#
#################################################

####  history  ####
HISTSIZE=200
HISTFILE=~/.zhistory
SAVEHIST=180

####  prompt  ####
PROMPT='%m{%n}%% '
RPROMPT='[%~]'

####  shell options  ####
setopt auto_cd 
setopt auto_name_dirs
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys pushd_ignore_dups

####  aliases  ####
alias cp='cp -ip'
alias rm='rm -i'
alias mv='mv -i'
alias clear='clr'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -la'

alias pu=pushd
alias po=popd
alias dirs='dirs -v'

alias ja='LANG=ja_JP.eucJP XMODIFIERS=@im=kinput2'

####  functions  ####
h () {history $* | less}
mdcd () {mkdir -p "$@" && cd "$*[-1]"}
mdpu () {mkdir -p "$@" && pushd "$*[-1]"}

####  suffix  ####

####  binding keys  ####
bindkey -e

####  completion  ####
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
autoload -U compinit && compinit

