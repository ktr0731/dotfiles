# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/ktr/.config/nvim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/ktr/.config/nvim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/ktr/.config/nvim/plugged/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/ktr/.config/nvim/plugged/fzf/shell/key-bindings.bash"
