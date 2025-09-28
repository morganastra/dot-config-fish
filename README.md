dot-config-fish
===============

My personal config for the Friendly Interactive Shell.

To install, symlink to ~/.config/fish

## External commands required

* cowsay
* bat
* ripgrep (rg) 
* mpv
* qrencode
* fzf

## Interesting functions 

### AUR package management

Most of these expect `$AUR_DIR` to be set, the location of a directory where AUR
package git repos will be cloned. `.local/share/aur` is a reasonable choice.

* [`aurc`](functions/aurc.fish): Install a package from the AUR.
* [`aurs`](functions/aurs.fish): Search the AUR for a given string.
* [`aurup`](functions/aurup.fish): Update all installed AUR packages.
* [`aurl`](functions/aurl.fish): List all AUR packages installed on the system.
* [`aur-dir-clean`](functions/aur-dir-clean.fish): Remove orphaned AUR directories not corresponding to installed packages.
* [`aur-sync`](functions/aur-sync.fish): Downloads the latest AUR package list. Not currently used for anything 😅
* [`aur-disappeared`](functions/aur-disappeared.fish): Display a list of locally installed packages that have been removed from the AUR.

### Word Games

* [`isword`](functions/isword.fish): Find words matching a pattern

### Music playing

Meant to be used with a music library organized with directories for each album, with track numbers in filename. Uses `mpv`

* [`m`](functions/m.fish): Play album or directory
* [`mshuf`](functions/mshuf.fish): Play album or directory in shuffled order
* [`findmusic`](functions/findmusic.fish): Utility function to list music files in a directory (recursively)
* `mr` (abbr for `m (rdir)`): Play a random album 

### Color/theme functions

* [`print-colors`](functions/print-colors.fish): Display a chart of terminal colors for testing color schemes.
* [`visualize-theme`](functions/visualize-theme.fish): Generate an HTML visualization of an Alacritty theme TOML file.

### Shell/scripting utility functions

* [`a`](functions/a.fish): Use the best grep-replacement installed.
* [`abbr-save`](functions/abbr-save.fish): Interactively save contents of `abbr`. Assumes you want your abbrs in `conf.d/abbrs.fish`
* [`pwait`](functions/pwait.fish): Sleep until another process exits.
* [`rdir`](functions/rdir.fish): Select a random subdirectory.
* [`read-confirm`](functions/read-confirm.fish): Prompt user to confirm something.
