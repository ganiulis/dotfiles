function __dotfiles_sysupdate_darwin
    if not type -q pacman
        echo 'Missing brew. Visit https://brew.sh.'
        return
    end

    brew update
end
