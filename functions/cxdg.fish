function cxdg --description 'cd to an XDG user directory'
    if test (count $argv) -ne 1
        echo "Usage: cxdg DIRECTORY" >&2
        return 2
    end

    set -l name (string upper -- $argv[1])
    set -l dir (path normalize -- (xdg-user-dir $name))

    if test "$dir" = (path normalize -- $HOME)
        echo "xdg directory $argv[1] not configured" >&2
        return 1
    end

    cd $dir
end

function __cxdg_configured_dirs --description 'List configured XDG user directories'
    for name in DESKTOP DOWNLOAD TEMPLATES PUBLICSHARE DOCUMENTS MUSIC PICTURES VIDEOS
        set -l dir (path normalize -- (xdg-user-dir $name))
        test "$dir" = (path normalize -- $HOME); and continue
        printf '%s\t%s\n' $name $dir
    end
end

complete -c cxdg -f -a '(__cxdg_configured_dirs)'
