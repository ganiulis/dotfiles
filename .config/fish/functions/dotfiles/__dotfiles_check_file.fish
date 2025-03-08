function __dotfiles_check_file
    if test -e ~/$argv[1]
        set_color green
        echo -n '	OK '
        set_color normal
        echo -n $argv[2]
        set_color blue
        echo -n '        '
        echo ~/$argv[1]
        set_color normal
        return
    end

    set_color red
    echo -n '     Error '
    set_color normal
    echo -n $argv[2]
    echo -n 'Missing '
    echo -n ~
    echo /$argv[1]
    set_color normal
end
