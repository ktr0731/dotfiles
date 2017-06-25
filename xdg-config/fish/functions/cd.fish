function cd
  if count $argv > /dev/null
    builtin cd $argv
  else
    z -l | awk '{ print $2 }' | fzy | read -l p

    if [ $status -ne 0 ]
      return $status
    end

    builtin cd $p
  end

  ls
  echo ''
end
