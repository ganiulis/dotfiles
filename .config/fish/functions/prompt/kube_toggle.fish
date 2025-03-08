function kube_toggle -a toggle
    if test "$toggle" = on
        if not type -q kubectl
            echo 'kubectl not found'
            return
        end

        if not type -q python3
            echo 'python3 not found'
            return
        end

        set -U __kube_ps_enabled 1
        return
    end

    if test "$toggle" = off
        set -U __kube_ps_enabled 0
        return
    end
end
