#### Use japanese ####
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

####  Load colors  ####
autoload colors
colors

#### Load vcs_info ####
autoload -Uz vcs_info

####  Load all completion  ####
fpath=($HOME/.zsh/completions $fpath)
autoload -U compinit && compinit

####  Key map  ####
bindkey -v                  # Use vi style key map

####  Shell options  ####
#---  Directory  ---#
setopt auto_cd              # When name only, interpreted as 'cd name'
setopt cdable_vars          # If dir not found, add '~/' to top
setopt pushd_ignore_dups    # Don't add if name duplicated
setopt auto_pushd           # Back to dires

#--- History ---#
setopt extended_history     # Save as extended format
setopt hist_ignore_dups     # Ignore duplicated history
setopt hist_ignore_space    # Ignore contains space to head
setopt hist_expand          # Expand history when comp
setopt share_history        # Share history between zsh

#--- Prompt ---#
setopt prompt_subst         # Deploy prompt var
setopt transient_rprompt    # When run command, delete rprompt
autoload -U promptinit
promptinit
autoload -Uz colors
colors

#--- Completion ---#
setopt no_beep              # Don't use beep

setopt always_last_prompt
setopt auto_name_dirs
setopt list_types
setopt sh_word_split auto_param_keys
setopt correct

####  History config  ####
export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=50000

####  Prompt config  ####
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '[%s %F{green}%b%f] '
zstyle ':vcs_info:*' actionformats '%s)-[* %F{green}%b%f(%F{red}%a%f)'
precmd () {
  LANG=en_US.UTF-8 vcs_info
  #LOADAVG=$(sysctl -n vm.loadavg | perl -anpe '$_=$F[1]')
}

PROMPT=$'${vcs_info_msg_0_}%6(~|\n%{${fg[white]}%}[%~]%{${reset_color}%}\n|)%(?.%{${fg[cyan]}%}.%{${fg[red]}%})%n%{${reset_color}%}@%(?.%{${fg[yellow]}%}.%{${fg[red]}%})%m%{${reset_color}%} %# '
RPROMPT="%6(~||%{${fg[white]}%}[%~]%{${reset_color}%}"

####  Aliases  ####
#---  Command  ---#
alias szshrc="source $HOME/.zshrc"
alias szshenv="source $HOME/.zshenv"

alias cdg='cd-gitroot'
alias trans='trans -t'

# Enable ls colors
if type gdircolors > /dev/null 2>&1; then
  eval $(gdircolors $HOME/.dircolors)
elif type dircolors > /dev/null 2>&1; then
  eval $(dircolors $HOME/.dircolors)
fi

if type xdg-open > /dev/null 2>&1; then
  alias open='xdg-open'
fi

if type gls > /dev/null 2>&1; then
  ls='gls'
else
  ls='ls'
fi

alias l=$ls' -F --color=always'
alias ls=$ls' -F --color=always'
alias la=$ls' -aF --color=always'
alias ll=$ls' -lF --color=always'
alias lla=$ls' -alF --color=always'

if type nvim > /dev/null 2>&1; then
  alias vi='nvim'
  alias viro='nvim -R'
elif type vim > /dev/null 2>&1; then
  alias vi='vim'
  alias viro='vim -R'
fi

alias sha1='openssl sha1'

alias pu=pushd
alias po=popd
alias dirs='dirs -v'

alias sl='sl -e'

alias less='less -R'
alias rm='rm -rf'

#--- Global aliases ---#
alias -g A=' | ag'
alias -g G=' | grep'
alias -g L=' | less'
alias -g H=' | head'
alias -g T=' | tail'
alias -g W=' | wc'

#---  Suffix   --#
alias -s py='python'
alias -s js='js'
alias -s php='php'
alias -s rb='ruby'

#---  Language  ---#
alias ja='LANG=ja_JP.eucJP XMODIFIERS=@im=kinput2'

####  Functions  ####
h () {history $* | less}
mdcd () {mkdir -p "$@" && cd "$*[-1]"}
mdpu () {mkdir -p "$@" && pushd "$*[-1]"}

# Dictionary command
function dic() {
  grep "$1" $HOME/utils/gene.txt -A 1 -wi --color
}

# Do ls when change current directory
chpwd () {
  ls
}

####  Binding keys  ####
bindkey -e

####  Completion  ####
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
autoload -U compinit && compinit

###  zplug  ###
if [ ! -e $HOME"/.zplug" ]; then
  git clone https://github.com/b4b4r07/zplug ~/.zplug
fi

source ~/.zplug/zplug

### enhancd ###
zplug "junegunn/fzf-bin", \
    as:command, \
    file:"fzf", \
    from:gh-r, \
    | zplug "b4b4r07/enhancd", of:enhancd.sh

### zsh-syntax-highlighting ###
zplug "zsh-users/zsh-syntax-highlighting", nice:10

### zsh-users/zsh-completions ###
zplug "zsh-users/zsh-completions"

### cd-gitroot
zplug "mollifier/cd-gitroot"

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

cat << STEINS_GATE
                                                              ............
           .|'''.|     .             ||                       ||'' ...'|||          .
           ||..  '   .||.    ....   ...  .. ...    ....    || |' .|||||.||   ....   .||.     ....
            ''|||.    ||   .|...||   ||   ||  ||  ||. '       |  ||||''''|  '' .||   ||    .|...||
          .     '||   ||   ||        ||   ||  ||  . '|..   || |. '||||  ||  .|' ||   ||    ||
          |'....|'    '|.'  '|...'  .||. .||. ||. |'..|'   |' ||.. ..'. ||  '|..'|'  '|.'   '|.
                                                          '  '''''''''''''"
 ============================================================================================================
                        There is no end though there is a start in space. -- Infinity.
         It has own power, it ruins, and it goes though there is a start also in the star. ---Finite.
                Only the person who was wisdom can read the most foolish one from the history.
The fish that lives in the sea doesn't know the world in the land. It also ruins and goes if they have wisdom.
            It is funnier that man exceeds the speed of light than fish start living in the land.
           It can be said that this is an final ultimatum from the god to the people who can fight.

STEINS_GATE
