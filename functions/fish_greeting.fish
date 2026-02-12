function fish_greeting
	  set greeting (time_appropriate_greeting)
    set kernel_update (check_kernel_update)
    cowsay -f owl $greeting \n $kernel_update 2> /dev/null
    or echo $greeting
end
