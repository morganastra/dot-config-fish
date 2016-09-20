function pwait
	while pidof $argv >/dev/null
        sleep 1
    end
end
