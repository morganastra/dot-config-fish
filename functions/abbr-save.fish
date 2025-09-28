function abbr-save
    set abbr_save_file $__fish_config_dir/conf.d/abbrs.fish

    abbr | bat --file-name 'Current active `abbr`' --language fish
    echo
    echo (tput bold) '# diff to apply from ' $abbr_save_file (tput sgr0)
    echo
    abbr | diff $abbr_save_file -
    echo

    if read-confirm
        abbr > $abbr_save_file
    end
end
