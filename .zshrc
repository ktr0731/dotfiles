#################################################
#
#   .zshrc
#   Created by T.A.
#
#################################################

####  history config  ####
HISTSIZE=200
HISTFILE=~/.zhistory
SAVEHIST=180

####  prompt config  ####
PROMPT='%m{%n}%% '
RPROMPT='[%~]'

####  shell options  ####
#---  directory  ---#
setopt auto_cd              # When name only, interpreted as 'cd name'
setopt cdable_vars          # If dir not found, add '~/' to top
setopt pushd_ignore_dups    # Don't add if name duplicated

#--- history ---#
setopt extended_history     # Save as extended format
setopt hist_ignore_dups     # Ignore duplicated history
setopt hist_ignore_space    # Ignore contains space to head

setopt auto_name_dirs
setopt prompt_subst
setopt extended_glob list_types no_beep always_last_prompt
setopt sh_word_split auto_param_keys 

####  aliases  ####
alias cp='cp -ip'
alias rm='rm -i'
alias mv='mv -i'
alias clr='clear'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -la'

alias pu=pushd
alias po=popd
alias dirs='dirs -v'

#---  language  ---#
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

