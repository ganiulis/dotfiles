function gca --wraps='git add . && git commit -m' --description 'alias gca=git add . && git commit -m'
  git add . && git commit -m $argv
        
end
