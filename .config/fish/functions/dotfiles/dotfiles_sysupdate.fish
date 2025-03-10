function dotfiles_sysupdate --description 'Update your system'
    set -l my_system (uname)

    if [ Linux = $my_system ]
        echo "$my_system found, starting updates"
        __dotfiles_sysupdate_linux
        return
    end

    if [ Darwin = $my_system ]
        echo "macOS found, starting updates"
        __dotfiles_sysupdate_darwin
        return
    end

    echo "$my_system is currently not supported"
end
