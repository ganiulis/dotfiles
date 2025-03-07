function dotfiles_check_health --description 'Dotfiles health check'
    echo ----------------------------------------------------------------------------------------------
    echo 'Critical user tools'
    internal_check_for_cmd fish \
        'fish      (Shell) found at                          ' \
        'fish      (Shell) is missing. How??? Visit https://fishshell.com' \
        -v
    internal_check_for_cmd nvim \
        'nvim      (Neovim) found at                         ' \
        'nvim      (Neovim) is missing. Visit https://neovim.io'

    echo
    echo 'Programming languages'
    internal_check_for_cmd go \
        'go        (Programming language) found at           ' \
        'go        (Programming language) is missing. Visit https://go.dev' \
        version
    internal_check_for_cmd node \
        'node      (JavaScript runtime environment) found at ' \
        'node      (JavaScript runtime environment) is missing. Visit https://nodejs.org' \
        -v

    echo
    echo 'Package managers'
    internal_check_for_cmd npm \
        'npm       (Node package manager) found at           ' \
        'npm       (Node package manager) is missing. Visit https://www.npmjs.com' \
        -v

    echo
    echo 'DevOps toolkit'
    internal_check_for_cmd argocd \
        'argocd    (ArgoCD) found at                         ' \
        'argocd    (ArgoCD) is missing. Visit https://argoproj.github.io. Place it in ~/.local/bin'
    internal_check_for_cmd kubectl \
        'kubectl   (Kubernetes CLI) found at                 ' \
        'kubectl   (Kubernetes CLI) is missing. Visit https://kubernetes.io. Place it in ~/.local/bin'
    internal_check_for_cmd terraform \
        'terraform (Terraform CLI) found at                  ' \
        'terraform (Terraform CLI) is missing. Visit https://kubernetes.io. Place it in ~/.local/bin'

    echo
    echo 'Other tools'
    internal_check_against_cmd nano
    internal_check_against_cmd vim

    echo ----------------------------------------------------------------------------------------------
    set_color blue
    echo 'What\'s next?'
    set_color normal
    echo '	Check your Neovim configuration with \':checkhealth\' and \':Lazy sync\''
end

function internal_check_for_cmd
    if type -q $argv[1]
        set_color green
        echo -n '	'$argv[2](which $argv[1])
        if count $argv[4] >/dev/null
            echo -n ' ('($argv[1] $argv[4])')'
        end
        echo
    else
        set_color red
        echo '	'$argv[3]
    end
    set_color normal
end

function internal_check_against_cmd
    if not type -q $argv[1]
        set_color green
        echo '	'$argv[1]' is missing. Let\'s keep it that way'
    else
        set_color red
        echo '	'$argv[1]' found at'(which $argv[1])' which should be removed'
    end
    set_color normal
end
