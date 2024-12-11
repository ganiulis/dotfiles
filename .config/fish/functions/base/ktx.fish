function ktx --wraps='kubectl config use-context' --description 'kubectl config use-context'
  kubectl config use-context $argv
end
