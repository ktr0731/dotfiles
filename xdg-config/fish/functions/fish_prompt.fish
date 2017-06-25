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
  echo -n (set_color 999)(prompt_pwd)(set_color normal)' '
  echo -n (set_color bryellow)$branch(set_color normal)
end
