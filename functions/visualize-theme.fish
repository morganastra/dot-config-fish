function visualize-theme
    # "Parse" TOML using grep and cut and build an HTML document with echo in a fish function???
    # Your scientists were so preoccupied with whether or not they could, they didn’t stop to think if they should
    if test (count $argv) -ne 1
        echo "Usage: visualize-theme <theme-file.toml>"
        return 1
    end

    set theme_file $argv[1]
    
    if not test -f $theme_file
        echo "Error: File '$theme_file' not found"
        return 1
    end

    # Extract theme name from file name
    set theme_name (basename $theme_file .toml)
    
    # HTML file path
    set html_file (mktemp -p /tmp $theme_name.XXXXX.html)

    # Extract background and foreground properly
    set background (grep "background" $theme_file | head -1 | cut -d "'" -f 2)
    set foreground (grep "foreground" $theme_file | head -1 | cut -d "'" -f 2)

    # Start building the HTML content
    echo "<!DOCTYPE html>" > $html_file
    echo "<html>" >> $html_file
    echo "<head>" >> $html_file
    echo "    <title>Alacritty Theme: $theme_name</title>" >> $html_file
    echo "    <style>" >> $html_file
    echo "        body { font-family: 'Fira Code', 'source-code-pro', monospace; background-color: $background; color: $foreground; }" >> $html_file
    echo "        .color-swatch { display: inline-block; width: 120px; height: 40px; text-align: left; line-height: 40px; vertical-align: middle; font-size: 12px; font-family: inherit; }" >> $html_file
    echo "        .color-table { border-collapse: collapse; width: 100%; }" >> $html_file
    echo "        .color-table td, .color-table th { border: none; text-align: left; }" >> $html_file
    echo "        .color-table tr:nth-child(even) { background-color: transparent; }" >> $html_file
    echo "        h1, h2, h3 { color: $foreground; font-family: inherit; }" >> $html_file
    echo "        h2 { margin-top: 30px; }" >> $html_file
    echo "        .colors-container { display: flex; }" >> $html_file
    echo "        .colors-column { flex: 1; margin: 0 10px; }" >> $html_file
    echo "    </style>" >> $html_file
    echo "</head>" >> $html_file
    echo "<body>" >> $html_file
    echo "<h1>Alacritty Theme: $theme_name</h1>" >> $html_file

    # Parse the TOML file and extract colors
    # Normal and Bright colors side by side
    echo "<h2>Terminal Colors</h2>" >> $html_file
    echo "<div class='colors-container'>" >> $html_file
    
    # Normal colors column
    echo "<div class='colors-column'>" >> $html_file
    echo "<h3>Normal Colors</h3>" >> $html_file
    echo "<table class='color-table'>" >> $html_file
    echo "    <tr><th>Color</th><th>Hex</th><th>FG Sample</th><th>BG Sample</th></tr>" >> $html_file
    
    set colors black red green yellow blue magenta cyan white
    for color in $colors
        # Extract normal colors from the [colors.normal] section
        set hex (sed -n '/\[colors.normal\]/,/\[.*bright.*\]/p' $theme_file | grep "$color =" | cut -d "'" -f 2)
        
        if test -n "$hex"
            echo "    <tr>" >> $html_file
            echo "        <td>$color</td>" >> $html_file
            echo "        <td>$hex</td>" >> $html_file
            echo "        <td><div class='color-swatch' style='background-color: $background; color: $hex;'>Text</div></td>" >> $html_file
            echo "        <td><div class='color-swatch' style='background-color: $hex; color: $foreground;'>Text</div></td>" >> $html_file
            echo "    </tr>" >> $html_file
        end
    end
    echo "</table>" >> $html_file
    echo "</div>" >> $html_file
    
    # Bright colors column
    echo "<div class='colors-column'>" >> $html_file
    echo "<h3>Bright Colors</h3>" >> $html_file
    echo "<table class='color-table'>" >> $html_file
    echo "    <tr><th>Color</th><th>Hex</th><th>FG Sample</th><th>BG Sample</th></tr>" >> $html_file
    
    for color in $colors
        # Extract bright colors from the [colors.bright] section
        set hex (sed -n '/\[colors.bright\]/,/^$/p' $theme_file | grep "$color =" | cut -d "'" -f 2)
        # Handle the case where [colors.bright] is the last section
        if test -z "$hex"
            set hex (sed -n '/\[colors.bright\]/,$p' $theme_file | grep "$color =" | cut -d "'" -f 2)
        end
        
        if test -n "$hex"
            echo "    <tr>" >> $html_file
            echo "        <td>$color</td>" >> $html_file
            echo "        <td>$hex</td>" >> $html_file
            echo "        <td><div class='color-swatch' style='background-color: $background; color: $hex;'>Text</div></td>" >> $html_file
            echo "        <td><div class='color-swatch' style='background-color: $hex; color: $foreground;'>Text</div></td>" >> $html_file
            echo "    </tr>" >> $html_file
        end
    end
    echo "</table>" >> $html_file
    echo "</div>" >> $html_file
    
    echo "</div>" >> $html_file

    # Close HTML
    echo "</body>" >> $html_file
    echo "</html>" >> $html_file

    echo "HTML visualization written to $html_file"
    
    # Open in browser
    if command -v xdg-open > /dev/null
        xdg-open $html_file
    else if command -v open > /dev/null
        open $html_file
    else
        echo "Open $html_file in your browser to view the theme visualization"
    end
end
