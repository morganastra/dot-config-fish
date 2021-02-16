# Defined in - @ line 2
function aurc
    if ! env | grep AUR_DIR > /dev/null
        "AUR_DIR not set"
        return 1
    end

    set -l workdir $AUR_DIR/$argv[1]
    mkdir -p $workdir
    pushd $workdir

    git clone "https://aur.archlinux.org/"$argv[1]".git" $workdir
      or git pull

    makepkg -sri

    popd
end
