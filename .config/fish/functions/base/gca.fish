function gca --wraps='git add . && git commit -m' --description 'git commit -am'
  git add . && git commit -m $argv
end
