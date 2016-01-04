#################################################
#
#   .zshrc
#   Created by T.A.
#
#################################################

#### use japanese ####
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

####  load colors  ####
autoload colors
colors

#### load vcs_info ####
autoload -Uz vcs_info

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
setopt auto_pushd           # Back to dires

#--- history ---#
setopt extended_history     # Save as extended format
setopt hist_ignore_dups     # Ignore duplicated history
setopt hist_ignore_space    # Ignore contains space to head
setopt hist_expand          # Expand history when comp
setopt share_history        # Share history between zsh

#--- prompt ---#
setopt prompt_subst         # Deploy prompt var
setopt transient_rprompt    # When run command, delete rprompt
autoload -U promptinit
promptinit
autoload -Uz colors
colors
#--- completion ---#
setopt no_beep              # Don't use beep

setopt always_last_prompt   #
setopt auto_name_dirs
setopt list_types
setopt sh_word_split auto_param_keys
setopt correct

####  history config  ####
export HISTFILE=~/.zhistory
export HISTSIZE=1000
export SAVEHIST=10000

####  prompt config  ####
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '[%s %F{green}%b%f] '
zstyle ':vcs_info:*' actionformats '%s)-[* %F{green}%b%f(%F{red}%a%f)'
precmd () {
  LANG=en_US.UTF-8 vcs_info
  LOADAVG=$(sysctl -n vm.loadavg | perl -anpe '$_=$F[1]')
}

PROMPT=$'${vcs_info_msg_0_}%6(~|\n%{${fg[white]}%}[%~]%{${reset_color}%}\n|)%(?.%{${fg[cyan]}%}.%{${fg[red]}%})%n%{${reset_color}%}@%(?.%{${fg[yellow]}%}.%{${fg[red]}%})%m%{${reset_color}%} %# '
RPROMPT="%6(~||%{${fg[white]}%}[%~]%{${reset_color}%}"

####  aliases  ####
alias rm='rm -i'
alias mv='mv -i'
alias clr='clear'
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -la'

alias pu=pushd
alias po=popd
alias dirs='dirs -v'

alias vi='vim'

alias sl='sl -e'


#---  language  ---#
alias ja='LANG=ja_JP.eucJP XMODIFIERS=@im=kinput2'

####  functions  ####
h () {history $* | less}
mdcd () {mkdir -p "$@" && cd "$*[-1]"}
mdpu () {mkdir -p "$@" && pushd "$*[-1]"}

# dic
function dic() {
  grep "$1" $HOME/utils/gene.txt -A 1 -wi --color
}

####  suffix  ####

####  binding keys  ####
bindkey -e

####  completion  ####
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
autoload -U compinit && compinit

###  zplug  ###
source ~/.zplug/zplug

### enhancd ###
zplug "junegunn/fzf-bin", \
    as:command, \
    file:"fzf", \
    from:gh-r, \
    | zplug "b4b4r07/enhancd", of:enhancd.sh

# check コマンドで未インストール項目があるかどうか verbose にチェックし
# false のとき（つまり未インストール項目がある）y/N プロンプトで
# インストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

print '\nTime waits for no one.'
print '             ↑'
print '             ( ﾟД ﾟ)ハァ?\n'
