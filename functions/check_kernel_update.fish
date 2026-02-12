function check_kernel_update
    set running_kernel (uname -r)
    set installed_kernel (pacman -Q linux | cut -d' ' -f2)

    if test "$running_kernel" != "$installed_kernel"
        echo "new kernel installed - please reboot!"
    end
end
