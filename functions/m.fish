function m
	mplayer -novideo (find $argv -type f | egrep -i '.*\.(flac|aiff|mp4|webm|mkv|alac|aac|ogg|mp3|m4a)$' | sort)
end
