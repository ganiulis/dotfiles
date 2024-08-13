function ktx --wraps='kubectl config use-context' --description 'alias ktx=kubectl config use-context'
  kubectl config use-context $argv
end
