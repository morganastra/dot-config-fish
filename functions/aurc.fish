# Defined in - @ line 2
function aurc
	set ogdir (pwd)
    cd ~/sync/aur
    git clone "https://aur.archlinux.org/"$argv[1]".git"
    cd $argv[1]
    makepkg -si
    cd $ogdir
end
