function aurl
    if not env | grep AUR_DIR > /dev/null
        echo "AUR_DIR not set"
        return 1
    end

    echo "AUR packages installed on this system:"
    echo "====================================="
    
    # Change to AUR directory
    pushd $AUR_DIR > /dev/null
    
    set installed_count 0
    set orphaned_count 0
    
    # Loop through all directories (AUR package repositories)
    for dir in */
        # Remove trailing slash
        set package (string replace -r '/$' '' $dir)
        
        # Check if package is installed
        if pacman -Q $package > /dev/null 2>&1
            # Get version info
            pacman -Q $package
            set installed_count (math $installed_count + 1)
        else
            echo "$package (not installed)"
            set orphaned_count (math $orphaned_count + 1)
        end
    end
    
    popd > /dev/null
    
    echo ""
    echo "Summary: $installed_count installed packages, $orphaned_count orphaned repositories"
end