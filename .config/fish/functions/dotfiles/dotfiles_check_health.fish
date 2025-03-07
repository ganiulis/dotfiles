function dotfiles_check_health --description 'Dotfiles health check'
    set_color magenta
    echo ----------------------------------------------------------------------------------------------
    set_color normal
    echo 'Common command line tools'
    internal_check_for_cmd fish \
        'fish      (Friendly Interactive Shell)     ' \
        'fish      (Friendly Interactive Shell)     Visit https://fishshell.com' \
        -v
    internal_check_for_cmd nvim \
        'nvim      (Neovim text editor)             ' \
        'nvim      (Neovim text editor)             Visit https://neovim.io'

    echo
    echo 'Programming languages'
    internal_check_for_cmd go \
        'go        (Programming language)           ' \
        'go        (Programming language)           Visit https://go.dev' \
        version
    internal_check_for_cmd python3 \
        'python3   (Programming language)           ' \
        'python3   (Programming language)           Visit https://www.python.org/' \
        -V

    echo
    echo 'JavaScript dependencies'
    internal_check_for_cmd node \
        'node      (JavaScript runtime environment) ' \
        'node      (JavaScript runtime environment) Visit https://nodejs.org' \
        -v
    internal_check_for_cmd npm \
        'npm       (Node.js package manager)        ' \
        'npm       (Node.js package manager)        Visit https://www.npmjs.com' \
        -v

    echo
    echo 'DevOps command line tools'
    internal_check_for_cmd argocd \
        'argocd    (ArgoCD GitOps CLT)              ' \
        'argocd    (ArgoCD GitOps CLT)              Visit https://argoproj.github.io. Place it in ~/.local/bin'
    internal_check_for_cmd kubectl \
        'kubectl   (Kubernetes CLT)                 ' \
        'kubectl   (Kubernetes CLT)                 Visit https://kubernetes.io. Place it in ~/.local/bin'
    internal_check_for_cmd terraform \
        'terraform (Terraform CLT)                  ' \
        'terraform (Terraform CLT)                  Visit https://kubernetes.io. Place it in ~/.local/bin'

    echo
    echo 'Other tools'
    internal_check_against_cmd nano
    internal_check_against_cmd vim

    echo
    echo 'Configuration files'
    if test -e ~/.aws/config
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n 'AWS config                                 '
        set_color blue
        echo ~/.aws/config
        set_color normal
    else
        set_color red
        echo -n '     Error '
        set_color normal
        echo 'AWS config is missing'
    end

    if test -e ~/.aws/credentials
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n 'AWS credentials                            '
        set_color blue
        echo ~/.aws/credentials
        set_color normal
    else
        set_color red
        echo -n '     Error '
        set_color normal
        echo 'AWS credentials is missing'
    end

    if test -e ~/.gitconfig
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n 'git config                                 '
        set_color blue
        echo ~/.gitconfig
        set_color normal
    else
        set_color red
        echo -n '     Error '
        set_color normal
        echo 'git config is missing'
    end

    if test -e ~/.kube/config
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n 'kubeconfig                                 '
        set_color blue
        echo ~/.kube/config
        set_color normal
    else
        set_color red
        echo -n '     Error '
        set_color normal
        echo 'kubeconfig is missing'
    end

    set_color magenta
    echo ----------------------------------------------------------------------------------------------
    set_color normal
    echo 'What\'s next?'
    echo '	1. Check your Neovim configuration with `:checkhealth` and `:Lazy sync`'
    echo '	2. Install LSPs with `:MasonToolsInstall`'
end

function internal_check_for_cmd
    if type -q $argv[1]
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n $argv[2]
        set_color blue
        echo -n (which $argv[1])
        if count $argv[4] >/dev/null
            set_color -d blue
            echo -n ' ('($argv[1] $argv[4])')'
        end
        set_color normal
        echo
    else
        set_color red
        echo -n '     Error '
        set_color normal
        echo $argv[3]
    end
end

function internal_check_against_cmd
    if not type -q $argv[1]
        set_color green
        echo -n '   Missing '
        set_color normal
        echo $argv[1]'. Let\'s keep it that way'
    else
        set_color red
        echo -n '     Found '
        set_color normal
        echo -n $argv[1]' at '
        set_color blue
        echo -n (which $argv[1])
        set_color normal
        echo ' which should be removed'
    end
    set_color normal
end
