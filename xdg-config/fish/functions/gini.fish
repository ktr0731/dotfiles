# gini [--gh repo_name]
# gini does initial commit after initialize current directory
function gini
  touch README.md

  git init
  git add .
  git commit -m '[ADD] Initial commit'

  if count $argv > /dev/null
    switch $argv[1]
    case '--gh'
      if [ (count $argv) -eq 2 ]
        set REPO_NAME $argv[2]
      else
        set REPO_NAME (basename (pwd))
      end
      hub create -p $REPO_NAME
    case '*'
      echo 'Usage: dotc commit_msg --gh repo_name'
      return
    end
  end
end
