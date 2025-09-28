function mshuf
	mpv --no-video (find $argv -type f | grep -E -i '.*\.(flac|alac|aac|ogg|mp3|m4a)$' | sort -R)
end
