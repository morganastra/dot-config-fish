function aur-disappeared
    comm -23 (pacman -Qqm | sort |psub) (curl -s https://aur.archlinux.org/packages.gz | gzip -cd | sort | psub)
end
