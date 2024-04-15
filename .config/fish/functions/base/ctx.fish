function ctx --wraps='kubectl config use-context' --description 'alias ctx=kubectl config use-context'
  kubectl config use-context $argv
end
