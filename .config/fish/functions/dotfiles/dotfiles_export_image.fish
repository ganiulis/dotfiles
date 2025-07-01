function dotfiles_export_image -d 'Build and export an image'
    if not count $argv >/dev/null
        echo 'Missing argument'
        return
    end

    set -f image $argv[1]

    docker run -t --name img_export $image ls /
    docker export img_export >$image.tar
    docker rm img_export
end
