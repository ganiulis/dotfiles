function dotfiles_check_health --description 'Dotfiles health check'
    set -l my_system (uname)

    set_color magenta
    echo ----------------------------------------------------------------------------------------------

    if [ Darwin = $my_system ]
        set_color normal
        echo 'Mac dependencies'
        __dotfiles_check_cmd brew \
            'brew      (Homebrew package manager)             ' \
            'brew      (Homebrew package manager)       Visit https://brew.sh' \
            -v
    end

    set_color normal
    echo 'Fish shell dependencies'
    __dotfiles_check_cmd fish \
        'fish      (Friendly Interactive Shell)           ' \
        'fish      (Friendly Interactive Shell)     Visit https://fishshell.com' \
        -v
    __dotfiles_check_cmd fisher \
        'fisher    (Plugin manager for Fish)              ' \
        'fisher    (Plugin manager for Fish)        Visit https://github.com/jorgebucaran/fisher' \
        -v

    echo
    echo 'Common command line tools'
    __dotfiles_check_cmd nvim \
        'nvim      (Neovim text editor)                   ' \
        'nvim      (Neovim text editor)             Visit https://neovim.io'

    echo
    echo 'Programming languages and compilers'
    __dotfiles_check_cmd gcc \
        'gcc       (C compiler)                           ' \
        'gcc       (C compiler)                     Visit https://gcc.gnu.org'
    __dotfiles_check_cmd go \
        'go        (Programming language)                 ' \
        'go        (Programming language)           Visit https://go.dev' \
        version
    __dotfiles_check_cmd python3 \
        'python3   (Programming language)                 ' \
        'python3   (Programming language)           Visit https://www.python.org' \
        -V
    __dotfiles_check_cmd lua \
        'lua       (Programming language)                 ' \
        'lua       (Programming language)           Visit https://www.lua.org' \
        -v

    echo
    echo 'JavaScript dependencies'
    __dotfiles_check_cmd node \
        'node      (JavaScript runtime environment)       ' \
        'node      (JavaScript runtime environment) Visit https://nodejs.org' \
        -v
    __dotfiles_check_cmd npm \
        'npm       (Node.js package manager)              ' \
        'npm       (Node.js package manager)  Install via `nvm install latest`' \
        -v
    __dotfiles_check_cmd nvm \
        'nvm       (Node.js version manager)              ' \
        'nvm       (Node.js version manager)        Visit https://github.com/jorgebucaran/nvm.fish' \
        -v

    echo
    echo 'DevOps command line tools'
    __dotfiles_check_cmd argocd \
        'argocd    (ArgoCD GitOps CLT)                    ' \
        'argocd    (ArgoCD GitOps CLT)              Visit https://argoproj.github.io. Place it in ~/.local/bin'
    __dotfiles_check_cmd kubectl \
        'kubectl   (Kubernetes CLT)                       ' \
        'kubectl   (Kubernetes CLT)                 Visit https://kubernetes.io. Place it in ~/.local/bin'
    __dotfiles_check_cmd terraform \
        'terraform (Terraform CLT)                        ' \
        'terraform (Terraform CLT)                  Visit https://kubernetes.io. Place it in ~/.local/bin'

    echo
    echo 'Other tools'
    __dotfiles_check_against_cmd nano
    __dotfiles_check_against_cmd vim

    echo
    echo 'Configuration files'
    __dotfiles_check_file .aws/config \
        'AWS config                               '
    __dotfiles_check_file .aws/credentials \
        'AWS credentials                          '
    __dotfiles_check_file .gitconfig \
        'git config                               '
    __dotfiles_check_file .kube/config \
        'Kubernetes config                        '
    __dotfiles_check_file .ssh/config \
        'OpenSSH config                           '

    set_color magenta
    echo ----------------------------------------------------------------------------------------------
    set_color normal
    echo 'What\'s next?'
    echo '	1. Update your system with `dotfiles_sysupdate`'
    echo '	2. Update and install Neovim dependencies with `:Lazy sync`'
    echo '	3. Install Neovim LSPs and utilities with `:MasonToolsInstall` if not done automatically'
    echo '	4. Check Neovim configuration with `:checkhealth`'
end
