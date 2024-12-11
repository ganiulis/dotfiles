function kd --wraps='kubectl describe' --description 'kubectl describe'
  kubectl describe $argv
end
