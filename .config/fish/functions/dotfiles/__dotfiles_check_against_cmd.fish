function __dotfiles_check_against_cmd
    if not type -q $argv[1]
        set_color green
        echo -n '   Missing '
        set_color normal
        echo $argv[1]'. Let\'s keep it that way'
        set_color normal
        return
    end

    set_color red
    echo -n '     Found '
    set_color normal
    echo -n $argv[1]' at '
    set_color blue
    echo -n (which $argv[1])
    set_color normal
    echo ' which should be removed'
    set_color normal
end
