function fish_prompt
    echo -s (set_color $fish_color_user) (whoami) " " (set_color $fish_color_cwd) (prompt_pwd) (set_color $fish_color_status) (fish_git_prompt) " " (set_color $fish_color_normal)"> "
end

function fish_right_prompt
    echo -s (set_color $fish_color_param) (__kube_prompt) " " (set_color $fish_color_normal) (date +%T)
end
