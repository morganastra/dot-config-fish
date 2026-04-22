function mshuf
	if pgrep -x audacious >/dev/null
		audacious -e (findmusic $argv | sort -R)
	else
		mpv --no-video (findmusic $argv | sort -R)
	end
end
