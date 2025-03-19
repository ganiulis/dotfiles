# Allows for nested function/completion directories
if status is-interactive
    set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
    set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path
end

# Sets GOPATH if go directory is moved to local
if test -d ~/.local/go
    set -gx GOPATH ~/.local/go
end
