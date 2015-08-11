#################################################
#
#   .zshrc
#   Created by T.A.
#
#################################################

####  load colors  ####
autoload colors
colors

####  load all completion  ####
autoload -U compinit
compinit

####  key map  ####
bindkey -v                  # Use vi style key map

####  shell options  ####
#---  directory  ---#
setopt auto_cd              # When name only, interpreted as 'cd name'
setopt cdable_vars          # If dir not found, add '~/' to top
setopt pushd_ignore_dups    # Don't add if name duplicated

#--- history ---#
setopt extended_history     # Save as extended format
setopt hist_ignore_dups     # Ignore duplicated history
setopt hist_ignore_space    # Ignore contains space to head

#--- prompt ---#
setopt prompt_subst         # Deploy prompt var
setopt transient_rprompt    # When run command, delete rprompt

#--- completion ---#
setopt no_beep              # Don't use beep

setopt always_last_prompt   #
setopt auto_name_dirs
setopt extended_glob list_types
setopt sh_word_split auto_param_keys 

####  history config  ####
HISTSIZE=200
HISTFILE=~/.zhistory
SAVEHIST=180

####  prompt config  ####
PROMPT=$'%6(~|\n%{${fg[white]}%}[%~]%{${reset_color}%}\n|)%(?.%{${fg[cyan]}%}.%{${fg[red]}%})%n%{${reset_color}%}@%(?.%{${fg[yellow]}%}.%{${fg[red]}%})%m%{${reset_color}%} %# '

RPROMPT="%6(~||%{${fg[white]}%}[%~]%{${reset_color}%}"

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

