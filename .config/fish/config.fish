# Allows for nested function/completion directories
if status is-interactive
    set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
    set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path
end

# Sets GOPATH env variable when go directory exists
if test -d ~/.local/go
    set -Ux GOPATH ~/.local/go
end

# Prints cow wisdom when possible
if type -q cowsay 
  and type -q fortune
  command fortune | cowsay
end
