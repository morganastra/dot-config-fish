# Defined in /tmp/fish.H7bcNn/aur-sync.fish @ line 2
function aur-sync
    if ! env | grep AUR_DIR > /dev/null
        "AUR_DIR not set"
        return 1
    end

    curl --progress-bar https://aur.archlinux.org/packages.gz | gunzip > $AUR_DIR/packages
end
