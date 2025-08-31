dot-config-fish
===============

My personal config for the Friendly Interactive Shell.

Symlink to ~/.config/fish

## Interesting functions 

### AUR package management

Most of these expect `$AUR_DIR` to be set, the location of a directory where AUR
package git repos will be cloned. `.local/share/aur` is a reasonable choice.

For more info about the AUR see: https://wiki.archlinux.org/index.php/Arch_User_Repository

* [`aurc`](functions/aurc.fish): Install a package from the AUR.
* [`aurs`](functions/aurs.fish): Search the AUR for a given string.
* [`aurup`](functions/aurup.fish): Update all installed AUR packages.
* [`aurl`](functions/aurl.fish): List all AUR packages installed on the system.
* [`aur-dir-clean`](functions/aur-dir-clean.fish): Remove orphaned AUR directories not corresponding to installed packages.
* [`aur-sync`](functions/aur-sync.fish): Downloads the latest AUR package list. Not currently used for anything 😅
* [`aur-disappeared`](functions/aur-disappeared.fish): Display a list of locally installed packages that have been removed from the AUR.

### Utility functions

* [`print-colors`](functions/print-colors.fish): Display a chart of terminal colors for testing color schemes.
* [`visualize-theme`](functions/visualize-theme.fish): Generate an HTML visualization of an Alacritty theme TOML file.
