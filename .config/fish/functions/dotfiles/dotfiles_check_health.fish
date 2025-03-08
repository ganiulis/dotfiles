function dotfiles_check_health --description 'Dotfiles health check'
    set_color magenta
    echo ----------------------------------------------------------------------------------------------
    set_color normal
    echo 'Fish shell dependencies'
    internal_check_for_cmd fish \
        'fish      (Friendly Interactive Shell)           ' \
        'fish      (Friendly Interactive Shell)     Visit https://fishshell.com' \
        -v
    internal_check_for_cmd fisher \
        'fisher    (Plugin manager for Fish)              ' \
        'fisher    (Plugin manager for Fish)        Visit https://github.com/jorgebucaran/fisher' \
        -v

    echo
    echo 'Common command line tools'
    internal_check_for_cmd nvim \
        'nvim      (Neovim text editor)                   ' \
        'nvim      (Neovim text editor)             Visit https://neovim.io'

    echo
    echo 'Programming languages and compilers'
    internal_check_for_cmd gcc \
        'gcc       (C compiler)                           ' \
        'gcc       (C compiler)                     Visit https://gcc.gnu.org'
    internal_check_for_cmd go \
        'go        (Programming language)                 ' \
        'go        (Programming language)           Visit https://go.dev' \
        version
    internal_check_for_cmd python3 \
        'python3   (Programming language)                 ' \
        'python3   (Programming language)           Visit https://www.python.org' \
        -V
    internal_check_for_cmd lua \
        'lua       (Programming language)                 ' \
        'lua       (Programming language)           Visit https://www.lua.org' \
        -v

    echo
    echo 'JavaScript dependencies'
    internal_check_for_cmd node \
        'node      (JavaScript runtime environment)       ' \
        'node      (JavaScript runtime environment) Visit https://nodejs.org' \
        -v
    internal_check_for_cmd npm \
        'npm       (Node.js package manager)              ' \
        'npm       (Node.js package manager)  Install via `nvm install latest`' \
        -v
    internal_check_for_cmd nvm \
        'nvm       (Node.js version manager)              ' \
        'nvm       (Node.js version manager)        Visit https://github.com/jorgebucaran/nvm.fish' \
        -v

    echo
    echo 'DevOps command line tools'
    internal_check_for_cmd argocd \
        'argocd    (ArgoCD GitOps CLT)                    ' \
        'argocd    (ArgoCD GitOps CLT)              Visit https://argoproj.github.io. Place it in ~/.local/bin'
    internal_check_for_cmd kubectl \
        'kubectl   (Kubernetes CLT)                       ' \
        'kubectl   (Kubernetes CLT)                 Visit https://kubernetes.io. Place it in ~/.local/bin'
    internal_check_for_cmd terraform \
        'terraform (Terraform CLT)                        ' \
        'terraform (Terraform CLT)                  Visit https://kubernetes.io. Place it in ~/.local/bin'

    echo
    echo 'Other tools'
    internal_check_against_cmd nano
    internal_check_against_cmd vim

    echo
    echo 'Configuration files'
    internal_check_file .aws/config \
        'AWS config                               '
    internal_check_file .aws/credentials \
        'AWS credentials                          '
    internal_check_file .gitconfig \
        'git config                               '
    internal_check_file .kube/config \
        'kubeconfig                               '

    set_color magenta
    echo ----------------------------------------------------------------------------------------------
    set_color normal
    echo 'What\'s next?'
    echo '	1. Check your Neovim configuration with `:checkhealth` and `:Lazy sync`'
    echo '	2. Install Neovim LSPs with `:MasonToolsInstall` if not done automatically'
end

function internal_check_for_cmd
    if type -q $argv[1]; or functions -q $argv[1]
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n $argv[2]
        set_color blue
        if functions -q $argv[1]
            echo -n 'Fish function'
        else
            echo -n (which $argv[1])
        end
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

function internal_check_file
    if test -e ~/$argv[1]
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n $argv[2]
        set_color blue
        echo -n '        '
        echo ~/$argv[1]
    else
        set_color red
        echo -n '     Error '
        set_color normal
        echo -n $argv[2]
        echo -n 'Missing '
        echo -n ~
        echo /$argv[1]
    end
    set_color normal
end
