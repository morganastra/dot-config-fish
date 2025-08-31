function aurup
    if not env | grep AUR_DIR > /dev/null
        echo "AUR_DIR not set"
        return 1
    end

    echo "Updating all AUR packages in $AUR_DIR"
    
    # Change to AUR directory
    pushd $AUR_DIR
    
    # Loop through all directories (AUR package repositories)
    for dir in */
        # Remove trailing slash
        set package (string replace -r '/$' '' $dir)
        
        echo "Updating $package..."
        pushd $package
        
        # Pull latest changes
        git pull
        
        # Rebuild and install only if needed
        makepkg -sri --needed --noconfirm
        
        popd
    end
    
    popd
end