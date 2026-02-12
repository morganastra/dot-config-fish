function check_kernel_update
    set running_kernel (uname -r | sed 's/-/./g')
    set installed_kernel (pacman -Q linux | cut -d' ' -f2 | sed 's/-/./g') 

    if test "$running_kernel" != "$installed_kernel"
        echo "new kernel installed - please reboot!"
    end
end
