function aurw
    if not count $argv > /dev/null
        echo "Usage: aurw <package-name>"
        return 1
    end

    set -l pkg $argv[1]

    if curl -sf "https://aur.archlinux.org/rpc/?v=5&type=info&arg[]=$pkg" | jq -e '.resultcount == 1' > /dev/null
        open "https://aur.archlinux.org/packages/$pkg"
    else
        open "https://aur.archlinux.org/packages/?K=$pkg"
    end
end
