if status is-interactive
    # Allows for nested directories
    set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
    set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path
end

set -gx GOPATH ~/go
