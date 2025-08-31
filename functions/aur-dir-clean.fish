function aur-dir-clean
    if not env | grep AUR_DIR > /dev/null
        echo "AUR_DIR not set"
        return 1
    end

    echo "Cleaning orphaned AUR directories in $AUR_DIR"
    echo "=========================================="
    
    # Change to AUR directory
    pushd $AUR_DIR > /dev/null
    
    set orphaned_count 0
    
    # Loop through all directories (AUR package repositories)
    for dir in */
        # Remove trailing slash
        set package (string replace -r '/$' '' $dir)
        
        # Check if package is NOT installed
        if not pacman -Q $package > /dev/null 2>&1
            echo "Removing orphaned directory: $package"
            rm -rf "$dir"
            set orphaned_count (math $orphaned_count + 1)
        end
    end
    
    popd > /dev/null
    
    echo ""
    echo "Removed $orphaned_count orphaned directories."
end