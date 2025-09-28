function findmusic
	find $argv -type f | grep -E -i '.*\.(flac|aiff|mp4|webm|mkv|alac|aac|ogg|mp3|m4a)$'
end
