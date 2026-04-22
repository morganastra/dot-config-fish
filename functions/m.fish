function m
	if pgrep -x audacious >/dev/null
		audacious -e (findmusic $argv | sort)
	else
		mpv --no-video (findmusic $argv | sort)
	end
end
