function fish_greeting
	set greeting (time_appropriate_greeting)
    cowsay -f owl $greeting 2> /dev/null
    or echo $greeting
end
