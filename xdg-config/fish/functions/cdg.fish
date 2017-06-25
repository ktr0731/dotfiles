function cdg
  set p (git rev-parse --show-cdup)
  if [ $p = '' ]
    return
  end
  cd $p
end
