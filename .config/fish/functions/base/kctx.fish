function kctx --wraps='kubectl config use-context' --description 'alias kctx=kubectl config use-context'
  kubectl config use-context $argv
        
end
