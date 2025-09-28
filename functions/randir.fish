function randir --description 'Select a random subdirectory'
    set -l dirs (find . -maxdepth 1 -type d ! -path . -printf '%f\n')
    test (count $dirs) -eq 0 && return 1
    random choice $dirs
end
