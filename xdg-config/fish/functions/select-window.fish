function select-window
  if [ -z "$TMUX" ]
    echo 'this session is out of tmux'
    return 1
  end

  tmux list-window -F '#{window_id}: #{window_name}' | fzf | read -l p
  tmux select-window -t (echo $p | cut -d : -f 1)
end
