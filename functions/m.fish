function m
    mplayer (find $argv -type f | egrep -i '.*\.(flac|alac|aac|ogg|mp3|m4a)$' | sort)
end
