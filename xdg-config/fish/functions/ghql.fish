function ghql
  ghq list -p | fzf | read -l p
  if [ $status -ne 0 ]
    return $status
  end

  cd $p
  ls
  echo ''
end
