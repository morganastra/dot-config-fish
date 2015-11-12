function mshuf
	mplayer -novideo (find $argv -type f | egrep -i '.*\.(flac|alac|aac|ogg|mp3|m4a)$' | sort -R)
end
