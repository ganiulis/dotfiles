function __dotfiles_check_cmd
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
        return
    end

    set_color red
    echo -n '     Error '
    set_color normal
    echo $argv[3]
end
