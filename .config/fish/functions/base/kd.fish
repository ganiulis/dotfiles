function kd --wraps='kubectl describe' --description 'alias kd=kubectl describe'
  kubectl describe $argv
end
